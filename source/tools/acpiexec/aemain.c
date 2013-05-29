/******************************************************************************
 *
 * Module Name: aemain - Main routine for the AcpiExec utility
 *
 *****************************************************************************/

/*
 * Copyright (C) 2000 - 2013, Intel Corp.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions, and the following disclaimer,
 *    without modification.
 * 2. Redistributions in binary form must reproduce at minimum a disclaimer
 *    substantially similar to the "NO WARRANTY" disclaimer below
 *    ("Disclaimer") and any redistribution must be conditioned upon
 *    including a substantially similar Disclaimer requirement for further
 *    binary redistribution.
 * 3. Neither the names of the above-listed copyright holders nor the names
 *    of any contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * Alternatively, this software may be distributed under the terms of the
 * GNU General Public License ("GPL") version 2 as published by the Free
 * Software Foundation.
 *
 * NO WARRANTY
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGES.
 */

#include "aecommon.h"

#define _COMPONENT          ACPI_TOOLS
        ACPI_MODULE_NAME    ("aemain")


/* Local prototypes */

static int
AeDoOptions (
    int                     argc,
    char                    **argv);

static ACPI_STATUS
AcpiDbRunBatchMode (
    void);

static char *
FlStrdup (
    char                    *String);

static char **
AsDoWildcard (
    char                    *DirectoryPathname,
    char                    *FileSpecifier);


#define AE_BUFFER_SIZE              1024
#define ASL_MAX_FILES               256

/* Execution modes */

#define AE_MODE_COMMAND_LOOP        0   /* Normal command execution loop */
#define AE_MODE_BATCH_MULTIPLE      1   /* -b option to execute a command line */
#define AE_MODE_BATCH_SINGLE        2   /* -m option to execute a single control method */


/* Globals */

UINT8                       AcpiGbl_RegionFillValue = 0;
BOOLEAN                     AcpiGbl_IgnoreErrors = FALSE;
BOOLEAN                     AcpiGbl_DbOpt_NoRegionSupport = FALSE;
BOOLEAN                     AcpiGbl_DebugTimeout = FALSE;
UINT8                       AcpiGbl_UseHwReducedFadt = FALSE;
BOOLEAN                     AcpiGbl_DoInterfaceTests = FALSE;
static UINT8                AcpiGbl_ExecutionMode = AE_MODE_COMMAND_LOOP;
static char                 BatchBuffer[AE_BUFFER_SIZE];    /* Batch command buffer */
static char                 *FileList[ASL_MAX_FILES];
static AE_TABLE_DESC        *AeTableListHead = NULL;

#define AE_SUPPORTED_OPTIONS        "?b:d:e:f:ghm^orv:x:"


/******************************************************************************
 *
 * FUNCTION:    usage
 *
 * PARAMETERS:  None
 *
 * RETURN:      None
 *
 * DESCRIPTION: Print a usage message
 *
 *****************************************************************************/

static void
usage (
    void)
{

    ACPI_USAGE_HEADER ("acpiexec [options] AMLfile1 AMLfile2 ...");

    ACPI_OPTION ("-b \"CommandLine\"",  "Batch mode command line execution (cmd1;cmd2;...)");
    ACPI_OPTION ("-h -?",               "Display this help message");
    ACPI_OPTION ("-m [Method]",         "Batch mode method execution. Default=MAIN");
    printf ("\n");

    ACPI_OPTION ("-da",                 "Disable method abort on error");
    ACPI_OPTION ("-di",                 "Disable execution of STA/INI methods during init");
    ACPI_OPTION ("-do",                 "Disable Operation Region address simulation");
    ACPI_OPTION ("-dr",                 "Disable repair of method return values");
    ACPI_OPTION ("-dt",                 "Disable allocation tracking (performance)");
    printf ("\n");

    ACPI_OPTION ("-ef",                 "Enable display of final memory statistics");
    ACPI_OPTION ("-ei",                 "Enable additional tests for ACPICA interfaces");
    ACPI_OPTION ("-em",                 "Enable Interpreter Serialized Mode");
    ACPI_OPTION ("-es",                 "Enable Interpreter Slack Mode");
    ACPI_OPTION ("-et",                 "Enable debug semaphore timeout");
    printf ("\n");

    ACPI_OPTION ("-f <Value>",          "Operation Region initialization fill value");
    ACPI_OPTION ("-r",                  "Use hardware-reduced FADT V5");
    ACPI_OPTION ("-vi",                 "Verbose initialization output");
    ACPI_OPTION ("-vr",                 "Verbose region handler output");
    ACPI_OPTION ("-x <DebugLevel>",     "Debug output level");
}


/******************************************************************************
 *
 * FUNCTION:    AeDoOptions
 *
 * PARAMETERS:  argc/argv           - Standard argc/argv
 *
 * RETURN:      Status
 *
 * DESCRIPTION: Command line option processing
 *
 *****************************************************************************/

static int
AeDoOptions (
    int                     argc,
    char                    **argv)
{
    int                     j;


    while ((j = AcpiGetopt (argc, argv, AE_SUPPORTED_OPTIONS)) != EOF) switch (j)
    {
    case 'b':

        if (strlen (AcpiGbl_Optarg) > (AE_BUFFER_SIZE -1))
        {
            printf ("**** The length of command line (%u) exceeded maximum (%u)\n",
                (UINT32) strlen (AcpiGbl_Optarg), (AE_BUFFER_SIZE -1));
            return (-1);
        }
        AcpiGbl_ExecutionMode = AE_MODE_BATCH_MULTIPLE;
        strcpy (BatchBuffer, AcpiGbl_Optarg);
        break;

    case 'd':

        switch (AcpiGbl_Optarg[0])
        {
        case 'a':

            AcpiGbl_IgnoreErrors = TRUE;
            break;

        case 'i':

            AcpiGbl_DbOpt_ini_methods = FALSE;
            break;

        case 'o':

            AcpiGbl_DbOpt_NoRegionSupport = TRUE;
            break;

        case 'r':
            
            AcpiGbl_DisableAutoRepair = TRUE;
            break;

        case 't':
            
            #ifdef ACPI_DBG_TRACK_ALLOCATIONS
                AcpiGbl_DisableMemTracking = TRUE;
            #endif
            break;

        default:
            
            printf ("Unknown option: -d%s\n", AcpiGbl_Optarg);
            return (-1);
        }
        break;

    case 'e':

        switch (AcpiGbl_Optarg[0])
        {
        case 'f':

            #ifdef ACPI_DBG_TRACK_ALLOCATIONS
                AcpiGbl_DisplayFinalMemStats = TRUE;
            #endif
            break;

        case 'i':

            AcpiGbl_DoInterfaceTests = TRUE;
            break;

        case 'm':

            AcpiGbl_AllMethodsSerialized = TRUE;
            printf ("Enabling AML Interpreter serialized mode\n");
            break;

        case 's':

            AcpiGbl_EnableInterpreterSlack = TRUE;
            printf ("Enabling AML Interpreter slack mode\n");
            break;

        case 't':

            AcpiGbl_DebugTimeout = TRUE;
            break;

        default:

            printf ("Unknown option: -e%s\n", AcpiGbl_Optarg);
            return (-1);
        }
        break;

    case 'f':

        AcpiGbl_RegionFillValue = (UINT8) strtoul (AcpiGbl_Optarg, NULL, 0);
        break;

    case 'g':

        AcpiGbl_DbOpt_tables = TRUE;
        AcpiGbl_DbFilename = NULL;
        break;

    case 'h':
    case '?':

        usage();
        return (0);

    case 'm':

        AcpiGbl_ExecutionMode = AE_MODE_BATCH_SINGLE;
        switch (AcpiGbl_Optarg[0])
        {
        case '^':

            strcpy (BatchBuffer, "MAIN");
            break;

        default:

            strcpy (BatchBuffer, AcpiGbl_Optarg);
            break;
        }
        break;

    case 'o':

        AcpiGbl_DbOpt_disasm = TRUE;
        AcpiGbl_DbOpt_stats = TRUE;
        break;

    case 'r':

        AcpiGbl_UseHwReducedFadt = TRUE;
        printf ("Using ACPI 5.0 Hardware Reduced Mode via version 5 FADT\n");
        break;

    case 'v':

        switch (AcpiGbl_Optarg[0])
        {
        case 'i':

            AcpiDbgLevel |= ACPI_LV_INIT_NAMES;
            break;

        case 'r':

            AcpiGbl_DisplayRegionAccess = TRUE;
            break;

        default:

            printf ("Unknown option: -v%s\n", AcpiGbl_Optarg);
            return (-1);
        }
        break;

    case 'x':

        AcpiDbgLevel = strtoul (AcpiGbl_Optarg, NULL, 0);
        AcpiGbl_DbConsoleDebugLevel = AcpiDbgLevel;
        printf ("Debug Level: 0x%8.8X\n", AcpiDbgLevel);
        break;

    default:
        
        usage();
        return (-1);
    }

    return (0);
}


/******************************************************************************
 *
 * FUNCTION:    main
 *
 * PARAMETERS:  argc, argv
 *
 * RETURN:      Status
 *
 * DESCRIPTION: Main routine for AcpiExec utility
 *
 *****************************************************************************/

int ACPI_SYSTEM_XFACE
main (
    int                     argc,
    char                    **argv)
{
    ACPI_STATUS             Status;
    UINT32                  InitFlags;
    ACPI_TABLE_HEADER       *Table = NULL;
    UINT32                  TableCount;
    AE_TABLE_DESC           *TableDesc;
    char                    **WildcardList;
    char                    *Filename;
    char                    *Directory;
    char                    *FullPathname;


    ACPI_DEBUG_INITIALIZE (); /* For debug version only */

    printf (ACPI_COMMON_SIGNON ("AML Execution/Debug Utility"));
    if (argc < 2)
    {
        usage ();
        return (0);
    }

    signal (SIGINT, AeCtrlCHandler);

    /* Init globals */

    AcpiDbgLevel = ACPI_NORMAL_DEFAULT;
    AcpiDbgLayer = 0xFFFFFFFF;

    /* Init ACPI and start debugger thread */

    Status = AcpiInitializeSubsystem ();
    AE_CHECK_OK (AcpiInitializeSubsystem, Status);
    if (ACPI_FAILURE (Status))
    {
        return (-1);
    }

    /* Get the command line options */

    if (AeDoOptions (argc, argv))
    {
        return (-1);
    }

    /* The remaining arguments are filenames for ACPI tables */

    if (argv[AcpiGbl_Optind])
    {
        AcpiGbl_DbOpt_tables = TRUE;
        TableCount = 0;

        /* Get each of the ACPI table files on the command line */

        while (argv[AcpiGbl_Optind])
        {
            /* Split incoming path into a directory/filename combo */

            Status = FlSplitInputPathname (argv[AcpiGbl_Optind],
                &Directory, &Filename);
            if (ACPI_FAILURE (Status))
            {
                return (-1);
            }

            /* Expand wildcards (Windows only) */

            WildcardList = AsDoWildcard (Directory, Filename);
            if (!WildcardList)
            {
                return (-1);
            }

            while (*WildcardList)
            {
                FullPathname = AcpiOsAllocate (
                    strlen (Directory) + strlen (*WildcardList) + 1);

                /* Construct a full path to the file */

                strcpy (FullPathname, Directory);
                strcat (FullPathname, *WildcardList);

                /* Get one table */

                Status = AcpiDbReadTableFromFile (FullPathname, &Table);
                if (ACPI_FAILURE (Status))
                {
                    printf ("**** Could not get input table %s, %s\n",
                        FullPathname, AcpiFormatException (Status));
                    goto EnterDebugger;
                }

                AcpiOsFree (FullPathname);
                AcpiOsFree (*WildcardList);
                *WildcardList = NULL;
                WildcardList++;

                /* Ignore non-AML tables, we can't use them. Except for an FADT */

                if (!ACPI_COMPARE_NAME (Table->Signature, ACPI_SIG_FADT) &&
                    !AcpiUtIsAmlTable (Table))
                {
                    ACPI_WARNING ((AE_INFO,
                        "Table %4.4s is not an AML table, ignoring",
                        Table->Signature));
                    AcpiOsFree (Table);
                    continue;
                }

                /* Allocate and link a table descriptor */

                TableDesc = AcpiOsAllocate (sizeof (AE_TABLE_DESC));
                TableDesc->Table = Table;
                TableDesc->Next = AeTableListHead;
                AeTableListHead = TableDesc;

                TableCount++;
            }

            AcpiGbl_Optind++;
        }

        /* Build a local RSDT with all tables and let ACPICA process the RSDT */

        Status = AeBuildLocalTables (TableCount, AeTableListHead);
        if (ACPI_FAILURE (Status))
        {
            return (-1);
        }

        Status = AeInstallTables ();
        if (ACPI_FAILURE (Status))
        {
            printf ("**** Could not load ACPI tables, %s\n",
                AcpiFormatException (Status));
            goto EnterDebugger;
        }

        /*
         * Install most of the handlers.
         * Override some default region handlers, especially SystemMemory
         */
        Status = AeInstallEarlyHandlers ();
        if (ACPI_FAILURE (Status))
        {
            goto EnterDebugger;
        }

        /* Setup initialization flags for ACPICA */

        InitFlags = (ACPI_NO_HANDLER_INIT | ACPI_NO_ACPI_ENABLE);
        if (!AcpiGbl_DbOpt_ini_methods)
        {
            InitFlags |= (ACPI_NO_DEVICE_INIT | ACPI_NO_OBJECT_INIT);
        }

        /*
         * Main initialization for ACPICA subsystem
         * TBD: Need a way to call this after the ACPI table "LOAD" command
         */
        Status = AcpiEnableSubsystem (InitFlags);
        if (ACPI_FAILURE (Status))
        {
            printf ("**** Could not EnableSubsystem, %s\n",
                AcpiFormatException (Status));
            goto EnterDebugger;
        }

        /*
         * Install handlers for "device driver" space IDs (EC,SMBus, etc.)
         * and fixed event handlers
         */
        AeInstallLateHandlers ();

        /* Finish the ACPICA initialization */

        Status = AcpiInitializeObjects (InitFlags);
        if (ACPI_FAILURE (Status))
        {
            printf ("**** Could not InitializeObjects, %s\n",
                AcpiFormatException (Status));
            goto EnterDebugger;
        }

        AeMiscellaneousTests ();
    }

EnterDebugger:

    /* Exit if error above and we are in one of the batch modes */

    if (ACPI_FAILURE (Status) && (AcpiGbl_ExecutionMode > 0))
    {
        return (-1);
    }

    /* Run a batch command or enter the command loop */

    switch (AcpiGbl_ExecutionMode)
    {
    default:
    case AE_MODE_COMMAND_LOOP:

        AcpiDbUserCommands (ACPI_DEBUGGER_COMMAND_PROMPT, NULL);
        break;

    case AE_MODE_BATCH_MULTIPLE:

        AcpiDbRunBatchMode ();
        break;

    case AE_MODE_BATCH_SINGLE:

        AcpiDbExecute (BatchBuffer, NULL, NULL, EX_NO_SINGLE_STEP);
        break;
    }

    return (0);
}


/******************************************************************************
 *
 * FUNCTION:    AcpiDbRunBatchMode
 *
 * PARAMETERS:  BatchCommandLine    - A semicolon separated list of commands
 *                                    to be executed.
 *                                    Use only commas to separate elements of
 *                                    particular command.
 * RETURN:      Status
 *
 * DESCRIPTION: For each command of list separated by ';' prepare the command
 *              buffer and pass it to AcpiDbCommandDispatch.
 *
 *****************************************************************************/

static ACPI_STATUS
AcpiDbRunBatchMode (
    void)
{
    ACPI_STATUS             Status;
    char                    *Ptr = BatchBuffer;
    char                    *Cmd = Ptr;
    UINT8                   Run = 0;


    AcpiGbl_MethodExecuting = FALSE;
    AcpiGbl_StepToNextCall = FALSE;

    while (*Ptr)
    {
        if (*Ptr == ',')
        {
            /* Convert commas to spaces */
            *Ptr = ' ';
        }
        else if (*Ptr == ';')
        {
            *Ptr = '\0';
            Run = 1;
        }

        Ptr++;

        if (Run || (*Ptr == '\0'))
        {
            (void) AcpiDbCommandDispatch (Cmd, NULL, NULL);
            Run = 0;
            Cmd = Ptr;
        }
    }

    Status = AcpiTerminate ();
    return (Status);
}


/******************************************************************************
 *
 * FUNCTION:    FlStrdup
 *
 * DESCRIPTION: Local strdup function
 *
 *****************************************************************************/

static char *
FlStrdup (
    char                    *String)
{
    char                    *NewString;


    NewString = AcpiOsAllocate (strlen (String) + 1);
    if (!NewString)
    {
        return (NULL);
    }

    strcpy (NewString, String);
    return (NewString);
}


/******************************************************************************
 *
 * FUNCTION:    FlSplitInputPathname
 *
 * PARAMETERS:  InputFilename       - The user-specified ASL source file to be
 *                                    compiled
 *              OutDirectoryPath    - Where the directory path prefix is
 *                                    returned
 *              OutFilename         - Where the filename part is returned
 *
 * RETURN:      Status
 *
 * DESCRIPTION: Split the input path into a directory and filename part
 *              1) Directory part used to open include files
 *              2) Filename part used to generate output filenames
 *
 *****************************************************************************/

ACPI_STATUS
FlSplitInputPathname (
    char                    *InputPath,
    char                    **OutDirectoryPath,
    char                    **OutFilename)
{
    char                    *Substring;
    char                    *DirectoryPath;
    char                    *Filename;


    *OutDirectoryPath = NULL;
    *OutFilename = NULL;

    if (!InputPath)
    {
        return (AE_OK);
    }

    /* Get the path to the input filename's directory */

    DirectoryPath = FlStrdup (InputPath);
    if (!DirectoryPath)
    {
        return (AE_NO_MEMORY);
    }

    /* Convert backslashes to slashes in the entire path */

    UtConvertBackslashes (DirectoryPath);

    /* Backup to last slash or colon */

    Substring = strrchr (DirectoryPath, '/');
    if (!Substring)
    {
        Substring = strrchr (DirectoryPath, ':');
    }

    /* Extract the simple filename */

    if (!Substring)
    {
        DirectoryPath[0] = 0;
        Filename = FlStrdup (InputPath);
    }
    else
    {
        Filename = FlStrdup (Substring + 1);
        *(Substring + 1) = 0;
    }

    if (!Filename)
    {
        return (AE_NO_MEMORY);
    }

    *OutDirectoryPath = DirectoryPath;
    *OutFilename = Filename;
    return (AE_OK);
}


/******************************************************************************
 *
 * FUNCTION:    AsDoWildcard
 *
 * PARAMETERS:  DirectoryPathname   - Path to parent directory
 *              FileSpecifier       - the wildcard specification (*.c, etc.)
 *
 * RETURN:      Pointer to a list of filenames
 *
 * DESCRIPTION: Process files via wildcards. This function is for the Windows
 *              case only.
 *
 *****************************************************************************/

static char **
AsDoWildcard (
    char                    *DirectoryPathname,
    char                    *FileSpecifier)
{
#ifdef WIN32
    void                    *DirInfo;
    char                    *Filename;
    int                     FileCount;


    FileCount = 0;

    /* Open parent directory */

    DirInfo = AcpiOsOpenDirectory (DirectoryPathname, FileSpecifier,
        REQUEST_FILE_ONLY);
    if (!DirInfo)
    {
        /* Either the directory or file does not exist */

        printf ("File or directory \"%s%s\" does not exist\n",
            DirectoryPathname, FileSpecifier);
        return (NULL);
    }

    /* Process each file that matches the wildcard specification */

    while ((Filename = AcpiOsGetNextFilename (DirInfo)))
    {
        /* Add the filename to the file list */

        FileList[FileCount] = AcpiOsAllocate (strlen (Filename) + 1);
        strcpy (FileList[FileCount], Filename);
        FileCount++;

        if (FileCount >= ASL_MAX_FILES)
        {
            printf ("Max files reached\n");
            FileList[0] = NULL;
            return (FileList);
        }
    }

    /* Cleanup */

    AcpiOsCloseDirectory (DirInfo);
    FileList[FileCount] = NULL;
    return (FileList);

#else
    if (!FileSpecifier)
    {
        return (NULL);
    }

    /*
     * Linux/Unix cases - Wildcards are expanded by the shell automatically.
     * Just return the filename in a null terminated list
     */
    FileList[0] = AcpiOsAllocate (strlen (FileSpecifier) + 1);
    strcpy (FileList[0], FileSpecifier);
    FileList[1] = NULL;

    return (FileList);
#endif
}
