/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20171215 (32-bit version)
 * Copyright (c) 2000 - 2017 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of grammar.xxx, Thu Jan 04 09:03:38 2018
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0002192B (137515)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x1D **** Incorrect checksum, should be 0x4E
 *     OEM ID           "Intel"
 *     OEM Table ID     "GRMTEST"
 *     OEM Revision     0x20090511 (537462033)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20171215 (538382869)
 */
/*
 * Some or all of this work - Copyright (c) 2006 - 2017, Intel Corp.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * Neither the name of Intel Corporation nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/* */
/* */
/* Grammar.asl - Minimally excercises most ASL constructs */
/* */
/* NOTE -- use: iasl -f -of grammar.asl to compile */
/* */
/*         This 1) Ignores errors (checks compiler error handling) */
/*              2) Disables constant folding */
/* */
/* */
/*******************************************************************************
 Compilation should look like this:
 C:\acpica\tests\misc>iasl -f -of grammar.asl
 Intel ACPI Component Architecture
 ASL Optimizing Compiler version 20090422 [Apr 22 2009]
 Copyright (C) 2000 - 2009 Intel Corporation
 Supports ACPI Specification Revision 3.0a
 grammar.asl   187:     Name (_NPK, Package (8)
 Warning  1098 -                 ^ Unknown reserved name (_NPK)
 grammar.asl   510:     NAME (ESC1, "abcdefg\x00hijklmn")
 Warning  1042 -                                ^ Invalid Hex/Octal Escape - Non-ASCII or NULL
 grammar.asl   511:     NAME (ESC2, "abcdefg\000hijklmn")
 Warning  1042 -                                ^ Invalid Hex/Octal Escape - Non-ASCII or NULL
 grammar.asl   601:     Method (RCIV, 1)
 Warning  1087 -                   ^ Not all control paths return a value (RCIV)
 grammar.asl   608:         RCIV (Subtract (Arg0, 1))
 Remark   5073 -               ^ Recursive method call (RCIV)
 grammar.asl   937:     Method (_ERR, 2)
 Warning  1077 -                   ^ Reserved method has too few arguments (_ERR requires 3)
 grammar.asl  1377:         Store (0x1234567887654321, QWD2)
 Warning  1032 -                                    ^ 64-bit integer in 32-bit table, truncating
 grammar.asl  1379:         if (LNotEqual (Local0, 0x1234567887654321))
 Warning  1032 -         64-bit integer in 32-bit table, truncating ^
 grammar.asl  1459:         SizeOf (BUFO)
 Warning  1105 -                       ^ Result is not used, operator has no effect
 grammar.asl  1485:         Acquire (MTX2, 1)
 Warning  1104 -                           ^ Possible operator timeout is ignored
 grammar.asl  1633:         Add (Local0, Local1)
 Warning  1105 -                      ^ Result is not used, operator has no effect
 grammar.asl  1804:     Method (COND)
 Warning  1087 -                   ^ Not all control paths return a value (COND)
 grammar.asl  6010:             Name (_HID, "*PNP0A06")
 Error    4001 -                                     ^ String must be entirely alphanumeric (*PNP0A06)
 grammar.asl  6461:             Name (_CRS, Buffer(26)  {"\_SB_.PCI2._CRS..........."})
 Warning  1038 -        Invalid or unknown escape sequence ^
 grammar.asl  6800:                 And (Local0, 1, Local0) //  Local0 &= 1
 Error    4050 -                              ^ Method local variable is not initialized (Local0)
 grammar.asl  6886:             Name (_HID, "*PNP0C0A")     //  Control Method Battey ID
 Error    4001 -                                     ^ String must be entirely alphanumeric (*PNP0C0A)
 ASL Input:  grammar.asl - 10254 lines, 322162 bytes, 4810 keywords
 AML Output: grammar.aml - 43392 bytes, 669 named objects, 4141 executable opcodes
 Compilation complete. 3 Errors, 12 Warnings, 1 Remarks, 1101 Optimizations
 ***************************************************************************************************/
DefinitionBlock ("", "DSDT", 1, "Intel", "GRMTEST", 0x20090511)
{
    External (\ABCD, UnknownObj)
    /* Device with _STA and _INI */

    Device (A1)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Return (Zero)
        }
    }

    /* Device with no _STA, has _INI */

    Device (A2)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Return (Zero)
        }
    }

    /* Device with _STA, no _INI */

    Device (A3)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }

    /* Device with _STA and _INI, but not present */

    Device (A4)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (Zero)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Return (Zero)
        }
    }

    /* Resource descriptors */

    Device (IRES)
    {
        Name (PRT0, ResourceTemplate ()
        {
            IRQ (Edge, ActiveHigh, Exclusive, )
                {3,4,5,6,7,9,10,11,14,15}
            StartDependentFn (0x01, 0x01)
            {
                IRQNoFlags ()
                    {0,1,2}
            }
            EndDependentFn ()
        })
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Debug = "_CRS:"
            Debug = PRT0 /* \IRES.PRT0 */
            Return (PRT0) /* \IRES.PRT0 */
        }

        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
        {
            Debug = "_SRS:"
            Debug = Arg0
            Return (Zero)
        }
    }

    Name (_NPK, Package (0x04)
    {
        0x1111, 
        0x2222, 
        0x3333, 
        0x4444
    })
    Device (RES)
    {
        Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
        {
            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                Zero, 
                Zero
            }
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            Name (PRT0, ResourceTemplate ()
            {
                WordBusNumber (ResourceConsumer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0xFFF2,             // Range Minimum
                    0xFFF3,             // Range Maximum
                    0x0032,             // Translation Offset
                    0x0002,             // Length
                    ,, _Y00)
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                WordSpace (0xC3, ResourceConsumer, PosDecode, MinFixed, MaxFixed, 0xA5,
                    0x0000,             // Granularity
                    0xA000,             // Range Minimum
                    0xBFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x2000,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CFF,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00028000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordSpace (0xC3, ResourceConsumer, PosDecode, MinFixed, MaxFixed, 0xA5,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00028000,         // Length
                    ,, )
                QWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    0x44, "This is a ResouceSource string", , TypeStatic, DenseTranslation)
                QWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    ,, , TypeStatic, DenseTranslation)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000100000, // Range Minimum
                    0x00000000FFDFFFFF, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x00000000FFD00000, // Length
                    ,, , AddressRangeMemory, TypeStatic)
                QWordSpace (0xC3, ResourceConsumer, PosDecode, MinFixed, MaxFixed, 0xA5,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    ,, )
                ExtendedIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    0x0000000000000000, // Type-Specific Attributes
                    , TypeStatic, DenseTranslation)
                ExtendedMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000100000, // Range Minimum
                    0x00000000FFDFFFFF, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x00000000FFD00000, // Length
                    0x0000000000000000, // Type-Specific Attributes
                    , AddressRangeMemory, TypeStatic)
                ExtendedSpace (0xC3, ResourceProducer, PosDecode, MinFixed, MaxFixed, 0xA3,
                    0x0000000000000000, // Granularity
                    0x0000000000100000, // Range Minimum
                    0x00000000FFDFFFFF, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x00000000FFD00000, // Length
                    0x0000000000000000, // Type-Specific Attributes
                    )
                IO (Decode16,
                    0x0010,             // Range Minimum
                    0x0020,             // Range Maximum
                    0x01,               // Alignment
                    0x10,               // Length
                    )
                IO (Decode16,
                    0x0090,             // Range Minimum
                    0x00A0,             // Range Maximum
                    0x01,               // Alignment
                    0x10,               // Length
                    )
                FixedIO (
                    0x0061,             // Address
                    0x01,               // Length
                    )
                IRQNoFlags ()
                    {2}
                DMA (Compatibility, BusMaster, Transfer8_16, )
                    {4}
                DMA (Compatibility, BusMaster, Transfer8, )
                    {2,5,7}
                Memory32Fixed (ReadWrite,
                    0x00100000,         // Address Base
                    0x00000000,         // Address Length
                    )
                Memory32Fixed (ReadOnly,
                    0xFFFE0000,         // Address Base
                    0x00020000,         // Address Length
                    )
                Memory32 (ReadOnly,
                    0x00020000,         // Range Minimum
                    0xFFFE0000,         // Range Maximum
                    0x00000004,         // Alignment
                    0x00000200,         // Length
                    )
                Memory24 (ReadOnly,
                    0x1111,             // Range Minimum
                    0x2222,             // Range Maximum
                    0x0004,             // Alignment
                    0x0200,             // Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, 0x0E, "\\_SB_.TEST", )
                {
                    0x00000E01,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, 0x06, "xxxx", )
                {
                    0x00000601,
                    0x00000003,
                    0x00000002,
                    0x00000001,
                }
                Interrupt (ResourceProducer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0xFFFF0000,
                    0x00000003,
                    0x00000002,
                    0x00000001,
                    0x00000005,
                    0x00000007,
                    0x00000009,
                }
                VendorShort ()      // Length = 0x03
                {
                     0x01, 0x02, 0x03                                 // ...
                }
                VendorLong  ()      // Length = 0x09
                {
                    /* 0000 */  0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,  // ........
                    /* 0008 */  0x09                                             // .
                }
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000000000B2, // Address
                    ,_Y01)
                Register (SystemMemory, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000000000B2, // Address
                    ,)
                StartDependentFnNoPri ()
                {
                    IRQNoFlags ()
                        {0,1,2}
                    IRQ (Level, ActiveLow, Shared, )
                        {3,4,5,6,7,9,10,11,14,15}
                }
                EndDependentFn ()
            })
            CreateWordField (PRT0, \RES._CRS._Y00._MIN, BMIN)  // _MIN: Minimum Base Address
            CreateByteField (PRT0, \RES._CRS._Y01._ASZ, RSIZ)  // _ASZ: Access Size
            BMIN = 0x03
            Return (PRT0) /* \RES_._CRS.PRT0 */
        }

        Method (_PRS, 0, Serialized)  // _PRS: Possible Resource Settings
        {
            Name (BUF0, ResourceTemplate ()
            {
                StartDependentFn (0x01, 0x02)
                {
                    IO (Decode16,
                        0x03D8,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {4}
                }
                StartDependentFn (0x02, 0x01)
                {
                    IO (Decode16,
                        0x03D8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {4}
                }
                StartDependentFn (0x00, 0x02)
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3}
                }
                StartDependentFn (0x00, 0x02)
                {
                    IO (Decode16,
                        0x02D8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3}
                }
                StartDependentFn (0x02, 0x00)
                {
                    IO (Decode16,
                        0x0100,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {1,3,4,5,6,7,8,10,11,12,13,14,15}
                }
                EndDependentFn ()
            })
            Return (BUF0) /* \RES_._PRS.BUF0 */
        }

        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
        {
            Return (Zero)
        }
    }

    Name (\_S0, Package (0x04)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        0x00, 
        0x00
    })
    /* Examine this table header (DSDT) */
    /*
     DataTableRegion (HDR, "DSDT", "", "")
     Field (HDR, AnyAcc, NoLock, Preserve)
     {
     SIG,  32,
     LENG, 32,
     REV,  8,
     SUM,  8,
     OID,  48,
     OTID, 64,
     OREV, 32,
     CID,  32,
     CREV, 32
     }
     Method (SIZE)
     {
     If (LLess (REV, 2))
     {
     Store ("32-bit table", Debug)
     }
     else
     {
     Store ("64-bit table", Debug)
     }
     Return (0)
     }
     */
    Name (SIZE, 0x00)
    /* Custom operation region */

    OperationRegion (MYOP, 0x80, 0xFD60, 0x06)
    Field (MYOP, ByteAcc, NoLock, Preserve)
    {
        MFLD,   8
    }

    Method (TCOP, 0, Serialized)
    {
        Name (_STR, Unicode ("test"))  // _STR: Description String
        MFLD = 0x04
        Local0 = MFLD /* \MFLD */
    }

    Name (ERRS, 0x00)
    /* Warning should be issued for premature string termination */

    Name (ESC1, "abcdefghijklmn")
    Name (ESC2, "abcdefghijklmn")
    Name (ESC3, "abc\a\bdef\f\n\r\t\v\x03ffff\x1A")
    Name (CRSA, ResourceTemplate ()
    {
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0019,             // Range Minimum
            0x001D,             // Range Maximum
            0x0000,             // Translation Offset
            0x0005,             // Length
            ,, )
        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, NonISAOnlyRanges,
            0x0000,             // Granularity
            0xC000,             // Range Minimum
            0xCFFF,             // Range Maximum
            0x0000,             // Translation Offset
            0x1000,             // Length
            ,, , TypeStatic, DenseTranslation)
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0xD8000000,         // Range Minimum
            0xDBFFFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x04000000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
    })
    Name (CRSB, ResourceTemplate ()
    {
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0xD8000000,         // Range Minimum
            0xDBFFFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x04000000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
    })
    Name (CRSC, ResourceTemplate ()
    {
        VendorShort ()      // Length = 0x03
        {
             0x01, 0x02, 0x03                                 // ...
        }
    })
    Name (CRSD, ResourceTemplate ()
    {
        VendorLong  ()      // Length = 0x09
        {
            /* 0000 */  0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,  // ........
            /* 0008 */  0x09                                             // .
        }
    })
    Name (CRSE, ResourceTemplate ()
    {
        IRQNoFlags ()
            {3,4,10,11}
        IRQNoFlags ()
            {3,4,10,11}
    })
    Name (CRSR, Buffer ((SizeOf (CRSA) + SizeOf (CRSB))){})
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (CRSR) /* \CRSR */
    }

    /* */
    /* Unnamed scope */
    /* */
    Scope (\)
    {
        Name (BXXX, 0xFFFFFFFF)
    }

    Name (LANS, 0x00)
    PowerResource (LANP, 0x01, 0x0000)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (((LANS & 0x30) == 0x30))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
            If (!_STA ())
            {
                LANS = 0x30
            }
        }

        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            If (_STA ())
            {
                LANS = 0x00
            }
        }
    }

    /* Can a method define another method? */
    /**********************************
     Method (TASK, 2, SERIALIZED)
     {
     Sleep (100)
     Method (TAS2)
     {
     Sleep (100)
     }
     TAS2()
     Return
     }
     ************************************/
    /* A recursive method */
    Method (RCIV, 1, NotSerialized)
    {
        Debug = Arg0
        If ((Arg0 == 0x00))
        {
            Return (Zero)
        }

        RCIV ((Arg0 - 0x01))
    }

    Method (RTOP, 0, NotSerialized)
    {
        RCIV (0x64)
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0xFFFFFFFF, 0x00){}
    }

    Name (B1TP, 0xFFFFFFFF)
    Name (B2TP, 0xFFFFFFFF)
    Name (ADPS, 0xFFFFFFFF)
    Name (B1PS, 0xFFFFFFFF)
    Name (B1RS, 0xFFFFFFFF)
    Name (B1CS, 0xFFFFFFFF)
    Name (B2PS, 0xFFFFFFFF)
    Name (B2RS, 0xFFFFFFFF)
    Name (B2CS, 0xFFFFFFFF)
    Name (B1DC, 0x0BB8)
    Name (B2DC, 0x0A28)
    Name (B1LF, 0x0BB8)
    Name (B2LF, 0x0A28)
    Name (BPIF, 0x00)
    Name (PBLL, 0x00)
    Name (RBIF, Package (0x0D)
    {
        0x01, 
        0x0898, 
        0x0898, 
        0x01, 
        0x2A30, 
        0x00, 
        0x00, 
        0x01, 
        0x01, 
        "CA54200-5003/5", 
        "1", 
        "LION", 
        "Fujitsu"
    })
    Method (SMWE, 4, NotSerialized)
    {
        Return (Ones)
    }

    Method (SMRE, 4, NotSerialized)
    {
        Return (Ones)
    }

    /*
     Method(RDBT,0,Serialized){
     If(LNot(SMWE(0x09,0x15,1,1))){
     Store(0x18,Local2)
     }
     }
     */
    Scope (_SB)
    {
        Name (SBUF, Buffer (0x80){})
        CreateBitField (SBUF, 0x03, BITY)
        CreateByteField (SBUF, 0x01, BYTY)
        CreateWordField (SBUF, 0x02, WRDZ)
        CreateDWordField (SBUF, 0x04, DWDZ)
        CreateQWordField (SBUF, 0x08, QWDZ)
        CreateField (SBUF, 0x80, 0x0C, FLDZ)
        CreateField (SBUF, 0x94, 0x60, FLDY)
        CreateField (SBUF, 0x94, 0x60, \_SB.FLDW)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            CreateField (\_SB.SBUF, 0x94, 0x60, FLDV)
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
            Name (_ADR, 0x00)  // _ADR: Address
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (PRT0, ResourceTemplate ()/* PRT0 */          /*Minimum bus number suported under this bridge. */
                {
                    WordBusNumber (ResourceConsumer, MinFixed, MaxFixed, SubDecode,
                        0x0000,             // Granularity
                        0xFFF1,             // Range Minimum
                        0xFFF2,             // Range Maximum
                        0x0032,             // Translation Offset
                        0x0002,             // Length
                        ,, _Y02)
                })
                CreateWordField (PRT0, \_SB.PCI0._CRS._Y02._MIN, BMIN)  // _MIN: Minimum Base Address
                BMIN = 0x03
                Return (PRT0) /* \_SB_.PCI0._CRS.PRT0 */
            } /* _CRS */

            Method (_SRS, 0, NotSerialized)  // _SRS: Set Resource Settings
            {
                Return (Zero)
            }

            Device (EIO)
            {
                OperationRegion (FJIO, SystemIO, 0xFD60, 0x06)
                Field (FJIO, ByteAcc, NoLock, Preserve)
                {
                    GIDX,   8, 
                    GDTA,   8, 
                    PIDX,   8, 
                    PDTA,   8, 
                    SIDX,   8, 
                    SDTA,   8
                }

                IndexField (GIDX, GDTA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                        ,   5, 
                    VGAS,   2, 
                    Offset (0x04), 
                        ,   4, 
                    DCKE,   1, 
                    Offset (0x05), 
                        ,   6, 
                    ACPW,   1, 
                    Offset (0x0A), 
                    B1P,    1, 
                    B2P,    1, 
                    B1C,    1, 
                    B2C,    1, 
                    B1ER,   1, 
                    B2ER,   1, 
                    Offset (0x0B), 
                    B1CP,   8, 
                    B2CP,   8, 
                    BCP,    8, 
                    B1VH,   8, 
                    B1VL,   8, 
                    B2VH,   8, 
                    B2VL,   8, 
                    B1TM,   8, 
                    B2TM,   8, 
                    B1CH,   8, 
                    B1CL,   8, 
                    B2CH,   8, 
                    B2CL,   8
                }
            }
        }
    }

    Method (RDBT, 3, Serialized)
    {
        Local1 = 0x1FFF
        If (Arg0)
        {
            Local1 = 0x2FFF
        }

        Local2 = 0x18
        If (Arg1)
        {
            Local2 = 0x10
        }

        If (!SMRE (0x09, 0x15, 0x01, RefOf (Local0)))
        {
            If (!SMWE (0x08, 0x14, 0x01, Local1))
            {
                If (!SMRE (0x09, 0x17, Local2, RefOf (Local3)))
                {
                    Arg2 = Local1
                }
            }

            Local0 |= 0x0FFF
            SMWE (0x08, 0x14, 0x01, Local0)
        }
    }

    Method (MKWD, 2, NotSerialized)
    {
        If ((Arg1 & 0x80))
        {
            Local0 = (0xFFFF0000 | Arg0)
            Local0 |= (Arg1 << 0x08)
            Local0 = (Zero - Local0)
        }
        Else
        {
            Local0 = Arg0
            Local0 |= (Arg1 << 0x08)
        }

        Return (Local0)
    }

    Device (CMB1)
    {
        Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
        Name (_UID, 0x01)  // _UID: Unique ID
        Alias (\_SB.PCI0.EIO.B1P, \_SB.PCI0.XXXX)
        Alias (\_SB.PCI0.EIO.B1P, B1P)
        Alias (\_SB.PCI0.EIO.B1C, B1C)
        Alias (\_SB.PCI0.EIO.B1CH, B1CH)
        Alias (\_SB.PCI0.EIO.B1CL, B1CL)
        Alias (\_SB.PCI0.EIO.B1VH, B1VH)
        Alias (\_SB.PCI0.EIO.B1VL, B1VL)
        Alias (\_SB.PCI0.EIO.B1CP, B1CP)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            B1PS = B1P /* \CMB1.B1P_ */
            B1RS = B1CP /* \CMB1.B1CP */
            B1CS = B1C /* \CMB1.B1C_ */
        }

        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
        {
            RDBT (Zero, Zero, RefOf (B1DC))
            RDBT (Zero, One, RefOf (B1LF))
            RBIF [0x01] = B1DC /* \B1DC */
            RBIF [0x02] = B1LF /* \B1LF */
            RBIF [0x09] = "CA54200-5003/5"
            RBIF [0x0A] = "1"
            Return (RBIF) /* \RBIF */
        }

        Method (_BST, 0, Serialized)  // _BST: Battery Status
        {
            _INI ()
            Local0 = Zero
            If ((B1P && !B1C))
            {
                Local0 |= 0x01
            }

            If ((B1P && B1C))
            {
                Local0 |= 0x02
            }

            If ((B1CP <= 0x01))
            {
                Local0 |= 0x04
            }

            Local1 = MKWD (B1CL, B1CH)
            Store ((((B1CP * B1LF) + 0x63) / 0x64), Local2)
            Local3 = MKWD (B1VL, B1VH)
            Name (STAT, Package (0x04){})
            STAT [0x00] = Local0
            STAT [0x01] = Local1
            STAT [0x02] = Local2
            STAT [0x03] = Local3
            If (!BPIF)
            {
                /*                    \_SB.PCI0.EIO.EC0.IECT() */
                /*                    \_SB.PCI0.EIO.EC0.SECT() */
                BPIF = One
            }

            Return (STAT) /* \CMB1._BST.STAT */
        }
    }

    Device (DEV1)
    {
    }

    Scope (\_TZ)
    {
        ThermalZone (TZ1)
        {
            Name (_PSL, Package (0x01)  // _PSL: Passive List
            {
                \_PR.CPU0
            })
        }
    }

    Method (TZ2, 0, Serialized)
    {
        Name (_PSL, Package (0x01)  // _PSL: Passive List
        {
            \_PR.CPU0
        })
        Return (_PSL) /* \TZ2_._PSL */
    }

    ThermalZone (THM1)
    {
    }

    Method (NOTI, 0, NotSerialized)
    {
        Notify (\DEV1, 0x00) // Bus Check
        Notify (\THM1, 0x00) // Bus Check
        Notify (\_PR.CPU0, 0x00) // Bus Check
    }

    Method (_ERR, 3, NotSerialized)
    {
        ERRS++
        Debug = "Run-time exception:"
        Debug = Arg0
        Debug = Arg1
        Return (0x00)          /* Map error to AE_OK */
    }

    Method (DIV0, 0, NotSerialized)
    {
        Local0 = 0x01
        Local1 = 0x00
        Divide (Local0, Local1, Local3)
        Debug = "DIV0 - noabort"
    }

    Method (ERR, 2, NotSerialized)
    {
        Local0 = ToDecimalString (Arg1)
        If ((Arg0 == 0x00))
        {
            Debug = Concatenate (Concatenate ("+*+*+*+* MTHD_ERROR at line ", Local0), ": Results not equal!")
        }

        If ((Arg0 == 0x01))
        {
            Debug = Concatenate (Concatenate ("+*+*+*+* MTHD_ERROR at line ", Local0), ": Numeric result is incorrect!")
        }

        If ((Arg0 == 0x02))
        {
            Debug = Concatenate (Concatenate ("+*+*+*+* MTHD_ERROR at line ", Local0), ": Operand was clobbered!")
        }

        Notify (DEV1, Arg0)
        ERRS++
    }

    Method (R226, 2, NotSerialized)
    {
    }

    Method (R225, 2, NotSerialized)
    {
        R226 (Arg0, Arg1)
    }

    Method (R224, 2, NotSerialized)
    {
        R225 (Arg1, Arg0)
    }

    Method (R223, 2, NotSerialized)
    {
        R224 (Arg0, Arg1)
    }

    Method (R222, 2, NotSerialized)
    {
        R223 (Arg1, Arg0)
    }

    Method (R111, 0, NotSerialized)
    {
        Local0 = 0x01010101
        R222 (0xABAB, Local0)
        Local1 = Local0
    }

    Method (MAIN, 0, NotSerialized)
    {
        /*      SIZE() */

        Local0 = NUM1 ()
        \CMB1._BST ()
        RDBT (0x01, 0x02, 0x03)
        OBJ1 (0x01)
        OBJ2 (0x02)
        CHEK ()
        RETZ ()
        BITZ ()
        LOGS ()
        REFS ()
        COND ()
        TZ2 ()
        /* */
        /* iPCO tests added */
        /* */
        Local0 = \IFEL.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x040D)
            Return (Local0)
        }

        Local0 = \NOSV.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0414)
            Return (Local0)
        }

        Local0 = \IDXF.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x041B)
            Return (Local0)
        }

        Local0 = \_SB.NSTL.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0422)
            Return (Local0)
        }

        Local0 = \RTBF.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0429)
            Return (Local0)
        }

        Local0 = \_SB.RTLV.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0430)
            Return (Local0)
        }

        Local0 = \_SB.RETP.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0437)
            Return (Local0)
        }

        Local0 = \WHLR.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x043E)
            Return (Local0)
        }

        Local0 = \ANDO.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0445)
            Return (Local0)
        }

        Local0 = \BRKP.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x044C)
            Return (Local0)
        }

        Local0 = \ADSU.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0453)
            Return (Local0)
        }

        Local0 = \INDC.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x045A)
            Return (Local0)
        }

        Local0 = \LOPS.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0461)
            Return (Local0)
        }

        Local0 = \FDSO.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0468)
            Return (Local0)
        }

        Local0 = \MLDV.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x046F)
            Return (Local0)
        }

        Local0 = \NBIT.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0476)
            Return (Local0)
        }

        Local0 = \SHFT.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x047D)
            Return (Local0)
        }

        Local0 = \XORD.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0484)
            Return (Local0)
        }

        Local0 = \CRBF.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x048B)
            Return (Local0)
        }

        Local0 = \IDX4.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0492)
            Return (Local0)
        }

        Local0 = \EVNT.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x0499)
            Return (Local0)
        }

        Local0 = \SZLV.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04A0)
            Return (Local0)
        }

        Local0 = \_SB.BYTF.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04A7)
            Return (Local0)
        }

        Local0 = \DWDF.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04AE)
            Return (Local0)
        }

        Local0 = \DVAX.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04B5)
            Return (Local0)
        }

        Local0 = \IDX6.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04BC)
            Return (Local0)
        }

        Local0 = \IDX5.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04C3)
            Return (Local0)
        }

        Local0 = \_SB.IDX0.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04CA)
            Return (Local0)
        }

        Local0 = \_SB.IDX3.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04D1)
            Return (Local0)
        }

        Local0 = \IDX7.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04D8)
            Return (Local0)
        }

        Local0 = \MTCH.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04DF)
            Return (Local0)
        }

        Local0 = \WHLB.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04E6)
            Return (Local0)
        }

        Local0 = \_SB.IDX2.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04ED)
            Return (Local0)
        }

        Local0 = \SIZO.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04F4)
            Return (Local0)
        }

        Local0 = \_SB.SMIS.TEST ()
        If ((Local0 > 0x00))
        {
            ERR (0x01, 0x04FB)
            Return (Local0)
        }

        If ((ERRS > 0x00))
        {
            Debug = "****** There were errors during the execution of the test ******"
        }

        /* Flush all notifies */

        Sleep (0xFA)
        /* */
        /* Last Test */
        /* */
        Return (0x00) /* Success */
    }

    Method (OBJ1, 1, Serialized)
    {
        Local0 = 0x03
        Name (BUFR, Buffer (Local0){})
        Name (BUF1, Buffer (0x04)
        {
             0x01, 0x02, 0x03, 0x04                           // ....
        })
        Name (BUF2, Buffer (0x04){})
        BUF2 = BUF1 /* \OBJ1.BUF1 */
        Mutex (MTX1, 0x04)
        Alias (MTX1, MTX2)
    }

    Mutex (MTXT, 0x00)
    Mutex (MTXX, 0x00)
    /*
     * Field Creation
     */
    Method (FLDS, 0, Serialized)
    {
        Debug = "++++++++ Creating BufferFields"
        Name (BUF2, Buffer (0x80){})
        CreateBitField (BUF2, 0x03, BIT2)
        CreateByteField (BUF2, 0x01, BYT2)
        CreateWordField (BUF2, 0x02, WRD2)
        CreateDWordField (BUF2, 0x04, DWD2)
        CreateQWordField (BUF2, 0x08, QWD2)
        CreateField (BUF2, 0x80, 0x0C, FLD2)
        CreateField (BUF2, 0x94, 0x60, FLD3)
        BIT2 = 0x01
        Local0 = BIT2 /* \FLDS.BIT2 */
        If ((Local0 != 0x01))
        {
            ERR (0x01, 0x0537)
        }
        Else
        {
            Local0 = DerefOf (BUF2 [0x00])
            If ((Local0 != 0x08))
            {
                ERR (0x01, 0x053E)
            }
            Else
            {
                Debug = "++++++++ Bit BufferField I/O PASS"
            }
        }

        BYT2 = 0x1A
        Local0 = BYT2 /* \FLDS.BYT2 */
        If ((Local0 != 0x1A))
        {
            ERR (0x01, 0x054A)
        }
        Else
        {
            Debug = "++++++++ Byte BufferField I/O PASS"
        }

        WRD2 = 0x1234
        Local0 = WRD2 /* \FLDS.WRD2 */
        If ((Local0 != 0x1234))
        {
            ERR (0x01, 0x0555)
        }
        Else
        {
            Debug = "++++++++ Word BufferField I/O PASS"
        }

        FLD2 = 0x0123
        Local0 = FLD2 /* \FLDS.FLD2 */
        If ((Local0 != 0x0123))
        {
            ERR (0x01, 0x0560)
        }
        Else
        {
            Debug = "++++++++ 12-bit BufferField I/O PASS"
        }

        DWD2 = 0x12345678
        Local0 = DWD2 /* \FLDS.DWD2 */
        If ((Local0 != 0x12345678))
        {
            ERR (0x01, 0x056B)
        }
        Else
        {
            Debug = "++++++++ Dword BufferField I/O PASS"
        }

        QWD2 = 0x1234567887654321
        Local0 = QWD2 /* \FLDS.QWD2 */
        If ((Local0 != 0x1234567887654321))
        {
            ERR (0x01, 0x0576)
        }
        Else
        {
            Debug = "++++++++ Qword BufferField I/O PASS"
        }
    }

    /* Field execution */

    Method (FLDX, 0, Serialized)
    {
        Field (\_SB.MEM.SMEM, AnyAcc, NoLock, Preserve)
        {
            /*  Field:  SMEM overlay using 32-bit field elements */

            SMD0, /*  32-bits */   32, 
            SMD1,     /*  32-bits */   32, 
            SMD2,     /*  32-bits */   32, 
            SMD3,  /*  32-bits */   32
        }   /*  Field:  SMEM overlay using 32-bit field elements */

        Field (\_SB.MEM.SMEM, AnyAcc, NoLock, Preserve)
        {
            /*  Field:  SMEM overlay using greater than 32-bit field elements */

            SME0, /*  larger than an integer (32 or 64) */   69, 
            SME1,  /*  larger than an integer */   97
        }   /*  Field:  SMEM overlay using greater than 32-bit field elements */
    }

    Method (MTX, 0, NotSerialized)
    {
        /* Test "Force release" of mutex on method exit */

        Acquire (MTXT, 0xFFFF)
        Acquire (MTXX, 0xFFFF)
        Debug = "++++++++ Acquiring Mutex MTX2"
        Acquire (_GL, 0xFFFF)
        Debug = "++++++++ Releasing Mutex MTX2"
        Release (_GL)
    }

    Method (OBJ2, 1, Serialized)
    {
        Debug = "++++++++ Creating Buffer BUFO"
        Name (BUFO, Buffer (0x20){})
        Debug = "++++++++ Creating OpRegion OPR2"
        OperationRegion (OPR2, SystemMemory, Arg0, 0x0100)
        Debug = "++++++++ Creating Field(s) in OpRegion OPR2"
        Field (OPR2, ByteAcc, NoLock, Preserve)
        {
            IDX2,   8, 
            DAT2,   8, 
            BNK2,   4
        }

        Debug = "++++++++ Creating BankField BNK2 in OpRegion OPR2"
        /* */
        /* mcw 3/20/00 - changed FET0, 4, FET1, 3 to FET0, 1, FET1, 1 */
        /* */
        BankField (OPR2, BNK2, 0x00, ByteAcc, NoLock, Preserve)
        {
            FET0,   4, 
            FET1,   3
        }

        Debug = "++++++++ Creating IndexField"
        IndexField (IDX2, DAT2, ByteAcc, NoLock, Preserve)
        {
            FET2,   4, 
            FET3,   3
        }

        Debug = "++++++++ SizeOf (BUFO)"
        SizeOf (BUFO)
        Debug = "++++++++ Store (SizeOf (BUFO), Local0)"
        Local0 = SizeOf (BUFO)
        Debug = "++++++++ Concatenate (\"abd\", \"def\", Local0)"
        Concatenate ("abd", "def", Local0)
        Debug = Local0
        Debug = "++++++++ Concatenate (\"abd\", 0x7B, Local0)"
        Concatenate ("abd", 0x7B, Local0)
        Debug = Local0
        Debug = "++++++++ Creating Event EVT2"
        Event (EVT2)
        Debug = "++++++++ Creating Mutex MTX2"
        Mutex (MTX2, 0x00)
        Debug = "++++++++ Creating Alias MTXA to MTX2"
        Alias (MTX2, MTXA)
        Debug = "++++++++ Acquiring Mutex MTX2"
        Acquire (MTX2, 0xFFFF)
        Debug = "++++++++ Acquiring Mutex MTX2 (2nd acquire)"
        Acquire (MTX2, 0x0001)
        Debug = "++++++++ Releasing Mutex MTX2"
        Release (MTX2)
        /* Type 1 opcodes */

        Debug = "++++++++ Signalling Event EVT2"
        Signal (EVT2)
        Debug = "++++++++ Resetting Event EVT2"
        Reset (EVT2)
        Debug = "++++++++ Signalling Event EVT2"
        Signal (EVT2)
        Debug = "++++++++ Waiting Event EVT2"
        Wait (EVT2, 0xFFFF)
        Debug = "++++++++ Sleep"
        Sleep (0x64)
        Debug = "++++++++ Stall"
        Stall (0xFE)
        Debug = "++++++++ NoOperation"
        Noop
        /* Type 2 Opcodes */

        Debug = "++++++++ Return from Method OBJ2"
        Return (0x04)
    }

    Method (NUM1, 0, NotSerialized)
    {
        /* ADD */

        Debug = "++++++++ Add (0x12345678, 0x11111111, Local0)"
        Local0 = (0x12345678 + 0x11111111)
        Debug = "++++++++ Store (Add (0x12345678, 0x11111111), Local1)"
        Store ((0x12345678 + 0x11111111), Local1)
        Debug = "++++++++ Checking result from ADD"
        If ((Local0 != Local1))
        {
            ERR (0x00, 0x060E)
        }

        /* SUBTRACT */

        Debug = "++++++++ Subtract (0x87654321, 0x11111111, Local4)"
        Local4 = (0x87654321 - 0x11111111)
        Debug = "++++++++ Store (Subtract (0x87654321, 0x11111111), Local5)"
        Store ((0x87654321 - 0x11111111), Local5)
        Debug = "++++++++ Checking result from SUBTRACT"
        If ((Local4 != Local5))
        {
            ERR (0x00, 0x061D)
        }

        /* MULTIPLY */

        Debug = "++++++++ Multiply (33, 10, Local6)"
        Local6 = (0x21 * 0x0A)
        Debug = "++++++++ Store (Multiply (33, 10), Local7)"
        Store ((0x21 * 0x0A), Local7)
        Debug = "++++++++ Checking result from MULTIPLY"
        If ((Local6 != Local7))
        {
            ERR (0x00, 0x062D)
        }

        /* DIVIDE */

        Debug = "++++++++ Divide (100, 9, Local1, Local2)"
        Divide (0x64, 0x09, Local1, Local2)
        Debug = "++++++++ Store (Divide (100, 9), Local3)"
        Store ((0x64 / 0x09), Local3)
        Debug = "++++++++ Checking (quotient) result from DIVIDE"
        If ((Local2 != Local3))
        {
            ERR (0x00, 0x063C)
        }

        /* INCREMENT */

        Debug = "++++++++ Increment (Local0)"
        Local0 = 0x01
        Local1 = 0x02
        Local0++
        Debug = "++++++++ Checking result from INCREMENT"
        If ((Local0 != Local1))
        {
            ERR (0x00, 0x064A)
        }

        /* DECREMENT */

        Debug = "++++++++ Decrement (Local0)"
        Local0 = 0x02
        Local1 = 0x01
        Local0--
        Debug = "++++++++ Checking result from DECREMENT"
        If ((Local0 != Local1))
        {
            ERR (0x00, 0x0658)
        }

        /* TOBCD */
        /* FROMBCD */
        Debug = "++++++++ ToBCD (0x1234, Local5)"
        ToBCD (0x1234, Local5)
        Debug = "++++++++ FromBCD (Local5, Local6)"
        FromBCD (Local5, Local6)
        Debug = "++++++++ Return (Local6)"
        Return (Local6)
    }

    Method (CHEK, 0, NotSerialized)
    {
        Local0 = 0x03
        Debug = 0x03
        Debug = Local0
        Local1 = 0x07
        (Local0 + Local1)
        If ((Local0 != 0x03))
        {
            ERR (0x02, 0x0675)
        }

        If ((Local1 != 0x07))
        {
            ERR (0x02, 0x0679)
        }

        Local2 = (Local0 + Local1)
        If ((Local0 != 0x03))
        {
            ERR (0x02, 0x0680)
        }

        If ((Local1 != 0x07))
        {
            ERR (0x02, 0x0684)
        }
    }

    Method (RET1, 0, NotSerialized)
    {
        Local0 = 0x03
        Return (Local0)
    }

    Method (RET2, 0, NotSerialized)
    {
        Return (RET1 ())
    }

    Method (RETZ, 0, NotSerialized)
    {
        RET2 ()
    }

    Method (BITZ, 0, NotSerialized)
    {
        Debug = "++++++++ FindSetLeftBit (0x00100100, Local0)"
        FindSetLeftBit (0x00100100, Local0)
        If ((Local0 != 0x15))
        {
            ERR (0x01, 0x06A0)
        }

        Debug = "++++++++ FindSetRightBit (0x00100100, Local1)"
        FindSetRightBit (0x00100100, Local1)
        If ((Local1 != 0x09))
        {
            ERR (0x01, 0x06A7)
        }

        Debug = "++++++++ And (0xF0F0F0F0, 0x11111111, Local2)"
        Local2 = (0xF0F0F0F0 & 0x11111111)
        If ((Local2 != 0x10101010))
        {
            ERR (0x01, 0x06AE)
        }

        Debug = "++++++++ NAnd (0xF0F0F0F0, 0x11111111, Local3)"
        NAnd (0xF0F0F0F0, 0x11111111, Local3)
        If ((Local3 != 0xEFEFEFEF))
        {
            ERR (0x01, 0x06B5)
        }

        Debug = "++++++++ Or (0x11111111, 0x22222222, Local4)"
        Local4 = (0x11111111 | 0x22222222)
        If ((Local4 != 0x33333333))
        {
            ERR (0x01, 0x06BC)
        }

        Debug = "++++++++ NOr (0x11111111, 0x22222222, Local5)"
        NOr (0x11111111, 0x22222222, Local5)
        If ((Local5 != 0xCCCCCCCC))
        {
            ERR (0x01, 0x06C3)
        }

        Debug = "++++++++ XOr (0x11113333, 0x22222222, Local6)"
        Local6 = (0x11113333 ^ 0x22222222)
        If ((Local6 != 0x33331111))
        {
            ERR (0x01, 0x06CA)
        }

        Debug = "++++++++ ShiftLeft (0x11112222, 2, Local7)"
        Local7 = (0x11112222 << 0x02)
        If ((Local7 != 0x44448888))
        {
            ERR (0x01, 0x06D1)
        }

        Debug = "++++++++ ShiftRight (Local7, 2, Local7)"
        Local7 >>= 0x02
        If ((Local7 != 0x11112222))
        {
            ERR (0x01, 0x06D8)
        }

        Debug = "++++++++ Not (Local0, Local1)"
        Local0 = 0x22224444
        Local1 = ~Local0
        If ((Local0 != 0x22224444))
        {
            ERR (0x02, 0x06E1)
        }

        If ((Local1 != 0xDDDDBBBB))
        {
            ERR (0x01, 0x06E6)
        }

        Return (Local7)
    }

    Method (LOGS, 0, NotSerialized)
    {
        Debug = "++++++++ Store (LAnd (0xFFFFFFFF, 0x11111111), Local0)"
        Local0 = (0xFFFFFFFF && 0x11111111)
        Debug = "++++++++ Store (LEqual (0xFFFFFFFF, 0x11111111), Local)"
        Local1 = (0xFFFFFFFF == 0x11111111)
        Debug = "++++++++ Store (LGreater (0xFFFFFFFF, 0x11111111), Local2)"
        Local2 = (0xFFFFFFFF > 0x11111111)
        Debug = "++++++++ Store (LGreaterEqual (0xFFFFFFFF, 0x11111111), Local3)"
        Local3 = (0xFFFFFFFF >= 0x11111111)
        Debug = "++++++++ Store (LLess (0xFFFFFFFF, 0x11111111), Local4)"
        Local4 = (0xFFFFFFFF < 0x11111111)
        Debug = "++++++++ Store (LLessEqual (0xFFFFFFFF, 0x11111111), Local5)"
        Local5 = (0xFFFFFFFF <= 0x11111111)
        Debug = "++++++++ Store (LNot (0x31313131), Local6)"
        Local6 = 0x1111
        Local7 = !Local6
        If ((Local6 != 0x1111))
        {
            ERR (0x02, 0x0707)
        }

        If ((Local7 != 0x00))
        {
            ERR (0x01, 0x070C)
        }

        Debug = "++++++++ Store (LNotEqual (0xFFFFFFFF, 0x11111111), Local7)"
        Local7 = (0xFFFFFFFF != 0x11111111)
        Debug = "++++++++ Lor (0x0, 0x1)"
        If ((0x00 || 0x01))
        {
            Debug = "+_+_+_+_+ Lor (0x0, 0x1) returned TRUE"
        }

        Return (Local7)
    }

    Method (COND, 0, NotSerialized)
    {
        Debug = "++++++++ Store (0x4, Local0)"
        Local0 = 0x04
        Debug = "++++++++ While (Local0)"
        While (Local0)
        {
            Debug = "++++++++ Decrement (Local0)"
            Local0--
        }

        Debug = "++++++++ Store (0x3, Local6)"
        Local6 = 0x03
        Debug = "++++++++ While (Subtract (Local6, 1))"
        While ((Local6 - 0x01))
        {
            Debug = "++++++++ Decrement (Local6)"
            Local6--
        }

        Debug = "++++++++ [LVL1] If (LGreater (0x2, 0x1))"
        If ((0x02 > 0x01))
        {
            Debug = "++++++++ [LVL2] If (LEqual (0x11111111, 0x22222222))"
            If ((0x11111111 == 0x22222222))
            {
                Debug = "++++++++ ERROR: If (LEqual (0x11111111, 0x22222222)) returned TRUE"
            }
            Else
            {
                Debug = "++++++++ [LVL3] If (LNot (0x0))"
                If (!0x00)
                {
                    Debug = "++++++++ [LVL4] If (LAnd (0xEEEEEEEE, 0x2))"
                    If ((0xEEEEEEEE && 0x02))
                    {
                        Debug = "++++++++ [LVL5] If (LLess (0x44444444, 0x3))"
                        If ((0x44444444 < 0x03))
                        {
                            Debug = "++++++++ ERROR: If (LLess (0x44444444, 0x3)) returned TRUE"
                        }
                        Else
                        {
                            Debug = "++++++++ Exiting from nested IF/ELSE statements"
                        }
                    }
                }
            }
        }

        Debug = "++++++++ [LVL1] If (LGreater (0x2, 0x1))"
        If ((0x02 > 0x01))
        {
            Debug = "++++++++ [LVL2] If (LEqual (0x11111111, 0x22222222))"
            If ((0x11111111 == 0x22222222))
            {
                Debug = "++++++++ ERROR: If (LEqual (0x11111111, 0x22222222)) returned TRUE"
            }
            Else
            {
                Debug = "++++++++ [LVL3] If (LNot (0x0))"
                If (!0x00)
                {
                    Debug = "++++++++ [LVL4] If (LAnd (0xEEEEEEEE, 0x2))"
                    If ((0xEEEEEEEE && 0x02))
                    {
                        Debug = "++++++++ [LVL5] If (LLess (0x44444444, 0x3))"
                        If ((0x44444444 < 0x03))
                        {
                            Debug = "++++++++ ERROR: If (LLess (0x44444444, 0x3)) returned TRUE"
                        }
                        Else
                        {
                            Debug = "++++++++ Returning from nested IF/ELSE statements"
                            Return (Local6)
                        }
                    }
                }
            }
        }
    }

    Method (REFS, 0, Serialized)
    {
        Name (BBUF, Buffer (0x08)
        {
             0xB0, 0xB1, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6, 0xB7   // ........
        })
        Name (NEST, Package (0x02)
        {
            Package (0x06)
            {
                0x01, 
                0x02, 
                0x03, 
                0x04, 
                0x05, 
                0x06
            }, 

            Package (0x06)
            {
                0x11, 
                0x12, 
                0x12, 
                0x14, 
                0x15, 
                0x16
            }
        })
        Local5 = RefOf (MAIN)
        /* For this to work, ABCD must NOT exist. */

        Local1 = CondRefOf (ABCD, Local0)
        If ((Local1 != 0x00))
        {
            ERR (0x02, 0x0791)
        }

        Local1 = CondRefOf (BBUF, Local0)
        If ((Local1 != Ones))
        {
            ERR (0x02, 0x0797)
        }

        Local6 = DerefOf (BBUF [0x03])
        If ((Local6 != 0xB3))
        {
            ERR (0x02, 0x079D)
        }

        Local0 = DerefOf (DerefOf (NEST [0x01]) [0x03])
        If ((Local0 != 0x14))
        {
            ERR (0x02, 0x07A3)
        }

        Local0 = 0x11223344
        Local1 = RefOf (Local0)
        Local2 = DerefOf (Local1)
        If ((Local2 != 0x11223344))
        {
            ERR (0x02, 0x07AD)
        }
        /* Parser thinks this is a method invocation!! */
    /*  RefOf (MAIN) */
    /*  RefOf (R___) */
    /*  RefOf (BBUF) */
    /*  Store (RefOf (Local0), Local1) */
    /*  CondRefOf (BBUF, Local2) */
    /*  CondRefOf (R___, Local3) */
    /*  Store (DerefOf (Local1), Local4) */
    /*  Return (Local4) */
    }

    Method (INDX, 0, Serialized)
    {
        Name (STAT, Package (0x04){})
        STAT [0x00] = 0x44443333
    }

    /*================================================================= */
    /*================================================================= */
    /*===================== iPCO TESTS ================================ */
    /*================================================================= */
    /*================================================================= */
    /* */
    /* */
    /* test IfElseOp.asl */
    /* */
    /*  test for IfOp and ElseOp, including validation of object stack cleanup */
    /* */
    Device (IFEL)
    {
        Name (DWRD, 0x01)
        Name (RSLT, 0x00)
        /*  IFNR control method executes IfOp branch with NO nested Return */
        /*  and no Else branch */
        Method (IFNR, 0, NotSerialized)
        {
            RSLT = DWRD /* \IFEL.DWRD */
            If ((DWRD == 0x01))
            {
                RSLT = 0x00
            }
        }   /*  IFNR */

        /*  NINR control method does not execute If branch and has no Else branch */

        Method (NINR, 0, NotSerialized)
        {
            RSLT = 0x00
            If ((DWRD != 0x01))
            {
                RSLT = DWRD /* \IFEL.DWRD */
            }
        }   /*  NINR */

        /*  IENR control method executes IfOp branch with NO nested Return */

        Method (IENR, 0, NotSerialized)
        {
            If ((DWRD == 0x01))
            {
                RSLT = 0x00
            }
            Else
            {
                RSLT = DWRD /* \IFEL.DWRD */
            }
        }   /*  IENR */

        /*  ELNR control method executes ElseOp branch with NO nested Return */

        Method (ELNR, 0, NotSerialized)
        {
            If ((DWRD != 0x01))
            {
                RSLT = DWRD /* \IFEL.DWRD */
            }
            Else
            {
                RSLT = 0x00
            }
        }   /*  ELNR */

        /*  IFRT control method executes IfOp branch with nested Return with */
        /*  no Else branch */
        Method (IFRT, 0, NotSerialized)
        {
            If ((DWRD == 0x01))
            {
                Return (0x00)
            }

            Return (DWRD) /* \IFEL.DWRD */
        }   /*  IFRT */

        /*  IERT control method executes IfOp branch with nested Return with */
        /*  Else branch */
        Method (IERT, 0, NotSerialized)
        {
            If ((DWRD == 0x01))
            {
                Return (0x00)
            }
            Else
            {
                Return (DWRD) /* \IFEL.DWRD */
            }
        }   /*  IERT */

        /*  ELRT control method executes ElseOp branch with nested Return */

        Method (ELRT, 0, NotSerialized)
        {
            If ((DWRD != 0x01))
            {
                Return (DWRD) /* \IFEL.DWRD */
            }
            Else
            {
                Return (0x00)
            }
        }   /*  ELRT */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ IfElseOp Test"
            /*  IfOp with NO return value */

            IFNR ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            /*  IfOp with NO return value */

            NINR ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            /*  IfOp with NO return value */

            IENR ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            /*  ElseOp with NO return value */

            ELNR ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            /*  IfOp with return value */

            RSLT = IFRT ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            /*  IfOp with return value */

            RSLT = IERT ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            /*  ElseOp with return value */

            RSLT = ELRT ()
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \IFEL.RSLT */
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  IFEL */

    /* */
    /* test NoSave.asl */
    /* */
    /* */
    /*  Internal test cases to validate IfOp (Operator (,,)) where Operator */
    /*  target is ZeroOp to throw away the results. */
    /*  Includes internal test cases for logical operators with no destination */
    /*  operands. */
    /* */
    Device (NOSV)
    {
        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ NoSave Test"
            Name (WRD, 0x1234)
            /* */
            /*  Begin test of nested operators without saving results */
            /* */
            /*  Test If (And ()) with no save of And result */
            If ((0x03 & 0x01))
            {
                WRD = 0x01  /*  pass -- just do something */
            }
            Else
            {
                Return (0x01)      /*  fail */
            }

            /*  Test If (And ()) with no save of And result */

            If ((0x04 & 0x01))
            {
                Return (0x02)      /*  fail */
            }
            Else
            {
                WRD = 0x02  /*  pass -- just do something */
            }

            /*  Test If (NAnd ()) with no save of NAnd result */

            If (NAnd (0x03, 0x01))
            {
                WRD = 0x03  /*  pass -- just do something */
            }
            Else
            {
                Return (0x03)      /*  fail */
            }

            /*  Test If (NAnd ()) with no save of NAnd result */

            If (NAnd (0xFFFFFFFF, 0xFFFFFFFF))
            {
                Return (0x04)      /* fail */
            }
            Else
            {
                WRD = 0x04  /*  pass -- just do something */
            }

            /*  Test If (NOr ()) with no save of NOr result */

            If (NOr (0x00, 0x01))
            {
                WRD = 0x05  /*  pass -- just do something */
            }
            Else
            {
                Return (0x05)      /*  fail */
            }

            /*  Test If (NOr ()) with no save of NOr result */

            If (NOr (0xFFFFFFFE, 0x01))
            {
                Return (0x06)      /* fail */
            }
            Else
            {
                WRD = 0x06  /*  pass -- just do something */
            }

            /*  Test If (Not ()) with no save of Not result */

            If (~0x01)
            {
                WRD = 0x07  /*  pass -- just do something */
            }
            Else
            {
                Return (0x07)      /*  fail */
            }

            /*  Test If (Not ()) with no save of Not result */

            If (~0xFFFFFFFF)
            {
                Return (0x08)      /* fail */
            }
            Else
            {
                WRD = 0x08  /*  pass -- just do something */
            }

            /*  Test If (Or ()) with no save of Or result */

            If ((0x03 | 0x01))
            {
                WRD = 0x09  /*  pass -- just do something */
            }
            Else
            {
                Return (0x09)      /*  fail */
            }

            /*  Test If (Or ()) with no save of Or result */

            If ((0x00 | 0x00))
            {
                Return (0x0A)     /*  fail */
            }
            Else
            {
                WRD = 0x0A /*  pass -- just do something */
            }

            /*  Test If (XOr ()) with no save of XOr result */

            If ((0x03 ^ 0x01))
            {
                WRD = 0x0B /*  pass -- just do something */
            }
            Else
            {
                Return (0x0B)     /* fail */
            }

            /*  Test If (XOr ()) with no save of XOr result */

            If ((0x03 ^ 0x03))
            {
                Return (0x0C)     /* fail */
            }
            Else
            {
                WRD = 0x0C /*  pass -- just do something */
            }

            /* */
            /*  Begin test of logical operators with no destination operands */
            /* */
            /*  Test If (LAnd ()) with no save of LAnd result */
            If ((0x03 && 0x03))
            {
                WRD = 0x15 /*  pass -- just do something */
            }
            Else
            {
                Return (0x15)     /* fail */
            }

            /*  Test If (LAnd ()) with no save of LAnd result */

            If ((0x03 && 0x00))
            {
                Return (0x16)     /* fail */
            }
            Else
            {
                WRD = 0x16 /*  pass -- just do something */
            }

            /*  Test If (LAnd ()) with no save of LAnd result */

            If ((0x00 && 0x03))
            {
                Return (0x17)     /*  fail */
            }
            Else
            {
                WRD = 0x17 /*  pass -- just do something */
            }

            /*  Test If (LAnd ()) with no save of LAnd result */

            If ((0x00 && 0x00))
            {
                Return (0x18)     /*  fail */
            }
            Else
            {
                WRD = 0x18 /*  pass -- just do something */
            }

            /*  Test If (LEqual ()) with no save of LEqual result */

            If ((0x03 == 0x03))
            {
                WRD = 0x1F /*  pass -- just do something */
            }
            Else
            {
                Return (0x1F)     /*  fail */
            }

            /*  Test If (LEqual ()) with no save of LEqual result */

            If ((0x01 == 0x03))
            {
                Return (0x20)     /*  fail */
            }
            Else
            {
                WRD = 0x20 /*  pass -- just do something */
            }

            /*  Test If (LGreater ()) with no save of LGreater result */

            If ((0x03 > 0x01))
            {
                WRD = 0x29 /*  pass -- just do something */
            }
            Else
            {
                Return (0x29)     /*  fail */
            }

            /*  Test If (LGreater ()) with no save of LGreater result */

            If ((0x04 > 0x04))
            {
                Return (0x2A)     /*  fail */
            }
            Else
            {
                WRD = 0x2A /*  pass -- just do something */
            }

            /*  Test If (LGreater ()) with no save of LGreater result */

            If ((0x01 > 0x04))
            {
                Return (0x2B)     /*  fail */
            }
            Else
            {
                WRD = 0x2B /*  pass -- just do something */
            }

            /*  Test If (LGreaterEqual ()) with no save of LGreaterEqual result */

            If ((0x03 >= 0x01))
            {
                WRD = 0x2C /*  pass -- just do something */
            }
            Else
            {
                Return (0x2C)     /*  fail */
            }

            /*  Test If (LGreaterEqual ()) with no save of LGreaterEqual result */

            If ((0x03 >= 0x03))
            {
                WRD = 0x2D /*  pass -- just do something */
            }
            Else
            {
                Return (0x2D)     /*  fail */
            }

            /*  Test If (LGreaterEqual ()) with no save of LGreaterEqual result */

            If ((0x03 >= 0x04))
            {
                Return (0x2E)     /*  fail */
            }
            Else
            {
                WRD = 0x2E /*  pass -- just do something */
            }

            /*  Test If (LLess ()) with no save of LLess result */

            If ((0x01 < 0x03))
            {
                WRD = 0x33 /*  pass -- just do something */
            }
            Else
            {
                Return (0x33)     /*  fail */
            }

            /*  Test If (LLess ()) with no save of LLess result */

            If ((0x02 < 0x02))
            {
                Return (0x34)     /*  fail */
            }
            Else
            {
                WRD = 0x34 /*  pass -- just do something */
            }

            /*  Test If (LLess ()) with no save of LLess result */

            If ((0x04 < 0x02))
            {
                Return (0x35)     /*  fail */
            }
            Else
            {
                WRD = 0x35 /*  pass -- just do something */
            }

            /*  Test If (LLessEqual ()) with no save of LLessEqual result */

            If ((0x01 <= 0x03))
            {
                WRD = 0x36 /*  pass -- just do something */
            }
            Else
            {
                Return (0x36)     /*  fail */
            }

            /*  Test If (LLessEqual ()) with no save of LLessEqual result */

            If ((0x02 <= 0x02))
            {
                WRD = 0x37 /*  pass -- just do something */
            }
            Else
            {
                Return (0x37)     /*  fail */
            }

            /*  Test If (LLessEqual ()) with no save of LLessEqual result */

            If ((0x04 <= 0x02))
            {
                Return (0x38)     /*  fail */
            }
            Else
            {
                WRD = 0x38 /*  pass -- just do something */
            }

            /*  Test If (LNot ()) with no save of LNot result */

            If (!0x00)
            {
                WRD = 0x3D /*  pass -- just do something */
            }
            Else
            {
                Return (0x3D)     /*  fail */
            }

            /*  Test If (LNot ()) with no save of LNot result */

            If (!0x01)
            {
                Return (0x3E)     /*  fail */
            }
            Else
            {
                WRD = 0x3E /*  pass -- just do something */
            }

            /*  Test If (LNotEqual ()) with no save of LNotEqual result */

            If ((0x03 != 0x03))
            {
                Return (0x3F)     /*  fail */
            }
            Else
            {
                WRD = 0x3F /*  pass -- just do something */
            }

            /*  Test If (LNotEqual ()) with no save of LNotEqual result */

            If ((0x01 != 0x03))
            {
                WRD = 0x40 /*  pass -- just do something */
            }
            Else
            {
                Return (0x40)     /*  fail */
            }

            /*  Test If (LOr ()) with no save of LOr result */

            If ((0x03 || 0x01))
            {
                WRD = 0x47 /*  pass -- just do something */
            }
            Else
            {
                Return (0x47)     /*  fail */
            }

            /*  Test If (LOr ()) with no save of LOr result */

            If ((0x00 || 0x01))
            {
                WRD = 0x48 /*  pass -- just do something */
            }
            Else
            {
                Return (0x48)     /*  fail */
            }

            /*  Test If (LOr ()) with no save of LOr result */

            If ((0x03 || 0x00))
            {
                WRD = 0x49 /*  pass -- just do something */
            }
            Else
            {
                Return (0x49)     /*  fail */
            }

            /*  Test If (LOr ()) with no save of LOr result */

            If ((0x00 || 0x00))
            {
                Return (0x4A)     /*  fail */
            }
            Else
            {
                WRD = 0x4A /*  pass -- just do something */
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  NOSV */

    /* */
    /* test IndxFld.asl */
    /* */
    /*  IndexFld test */
    /*      This is just a subset of the many RegionOp/Index Field test cases. */
    /*      Tests index field element AccessAs macro. */
    /* */
    Device (IDXF)
    {
        /*  Test device name */

        OperationRegion (SIO, SystemIO, 0x0100, 0x02)
        Field (SIO, ByteAcc, NoLock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        IndexField (INDX, DATA, AnyAcc, NoLock, WriteAsOnes)
        {
            AccessAs (ByteAcc, 0x00), 
            IFE0,   8, 
            IFE1,   8, 
            IFE2,   8, 
            IFE3,   8, 
            IFE4,   8, 
            IFE5,   8, 
            IFE6,   8, 
            IFE7,   8, 
            IFE8,   8, 
            IFE9,   8
        }

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ IndxFld Test"
            Local0 = IFE0 /* \IDXF.IFE0 */
            Local1 = IFE1 /* \IDXF.IFE1 */
            Local2 = IFE2 /* \IDXF.IFE2 */
            Return (0x00)
        }   /*  TEST */
    }   /*  IDXF */

    /* */
    /* test NestdLor.asl */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Name (ZER0, 0x00)
        Name (ZER1, 0x00)
        Name (ZER2, 0x00)
        Name (ONE0, 0x01)
        Device (NSTL)
        {
            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ NestdLor Test"
                If ((ZER0 || (ZER1 || (ZER2 || ONE0))))
                {
                    /*  Indicate Pass */

                    Local0 = 0x00
                }
                Else
                {
                    /*  Indicate Fail */

                    Local0 = 0x01
                }

                Return (Local0)
            }   /*  End Method TEST */
        }   /*  Device NSTL */
    }   /*  _SB system bus */

    /* */
    /* test RetBuf.asl */
    /* */
    /*  Test ReturnOp(Buffer) */
    /*      This is required to support Control Method Batteries on */
    /*          Dell Latitude Laptops (e.g., CP1-A) */
    /* */
    Device (RTBF)
    {
        Method (SUBR, 1, NotSerialized)
        {
            Return (Arg0)
        }

        Method (RBUF, 0, Serialized)
        {
            /*  RBUF: Return Buffer from local variable */

            Name (ABUF, Buffer (0x11)
            {
                "ARBITRARY_BUFFER"
            })
            /*  store local buffer ABUF into Local0 */

            Local0 = ABUF /* \RTBF.RBUF.ABUF */
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Buffer */

            If ((Local1 != 0x03))  /*  Buffer type is 3 */
            {
                Return (0x01)      /*  failure */
            }

            /*  store value returned by control method SUBR into Local0 */

            Local0 = SUBR (ABUF)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Buffer */

            If ((Local1 != 0x03))  /*  Buffer type is 3 */
            {
                Return (0x02)      /*  failure */
            }

            /*  allocate buffer using Local1 as buffer size (run-time evaluation) */

            Local1 = 0x05
            Name (BUFR, Buffer (Local1){})
            /*  store value returned by control method SUBR into Local0 */

            Local0 = SUBR (BUFR)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Buffer */

            If ((Local1 != 0x03))  /*  Buffer type is 3 */
            {
                Return (0x03)      /*  failure */
            }

            /*  store BUFR Buffer into Local0 */

            Local0 = BUFR /* \RTBF.RBUF.BUFR */
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Buffer */

            If ((Local1 != 0x03))  /*  Buffer type is 3 */
            {
                Return (0x04)      /*  failure */
            }

            /*  return Local0 Buffer */

            Return (Local0)
        }   /*  RBUF */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ RetBuf Test"
            /*  store RBUF Buffer return value into Local0 */

            Local0 = RBUF ()
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Buffer */

            If ((Local1 != 0x03))  /*  Buffer type is 3 */
            {
                Return (0x0A)     /*  failure */
            }
            Else
            {
                Return (0x00)      /*  success */
            }
        }   /*  TEST */
    }   /*  RTBF */

    /* */
    /* test RetLVal.asl */
    /* */
    /*  Test ReturnOp(Lvalue) */
    /*      This is required to support _PSR on IBM ThinkPad 560D and */
    /*      _DCK on Toshiba Tecra 8000. */
    /* */
    Device (GPE2)
    {
        Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Debug = "Method GPE2._L03 invoked"
            Return (Zero)
        }

        Method (_E05, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Debug = "Method GPE2._E05 invoked"
            Return (Zero)
        }
    }

    Device (PRW2)
    {
        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
        {
            Package (0x02)
            {
                \GPE2, 
                0x05
            }, 

            0x03
        })
    }

    Scope (\_GPE)
    {
        Name (ACST, 0xFF)
        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Debug = "Method _GPE._L08 invoked"
            Return (Zero)
        }

        Method (_E09, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Debug = "Method _GPE._E09 invoked"
            Return (Zero)
        }

        Method (_E11, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Debug = "Method _GPE._E11 invoked"
            Notify (\PRW1, 0x02) // Device Wake
        }

        Method (_L22, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Debug = "Method _GPE._L22 invoked"
            Return (Zero)
        }

        Method (_L33, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Debug = "Method _GPE._L33 invoked"
            Return (Zero)
        }

        Method (_E64, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Debug = "Method _GPE._E64 invoked"
            Return (Zero)
        }
    }   /*  _GPE */

    Device (PRW1)
    {
        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
        {
            0x11, 
            0x03
        })
    }

    Device (PWRB)
    {
        Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
        {
            0x33, 
            0x03
        })
    }

    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Device (ACAD)
        {
            /*  ACAD:   AC adapter device */

            Name (_HID, "ACPI0003" /* Power Source Device */) /*  AC adapter device */  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            OperationRegion (AREG, SystemIO, 0x0372, 0x02)
            Field (AREG, ByteAcc, NoLock, Preserve)
            {
                AIDX,   8, 
                ADAT,   8
            }

            IndexField (AIDX, ADAT, ByteAcc, NoLock, Preserve)
            {
                    ,   1, 
                ACIN,   1, 
                    ,   2, 
                CHAG,   1, 
                Offset (0x01), 
                    ,   7, 
                ABAT,   1
            }   /*  IndexField */

            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Local0 = \_GPE.ACST
                Local1 = ACIN /* \_SB_.ACAD.ACIN */
                If ((\_GPE.ACST != Local1))
                {
                    \_GPE.ACST = Local1
                                /* This Notify is commented because it causes a */
                /*  method error when running on a system without the */
                /*  specific device. */
                /* Notify (\_SB_.ACAD, 0) */
                }

                Return (Local0)
            }   /*  _PSR */

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                \_GPE.ACST = ACIN /* \_SB_.ACAD.ACIN */
            }
        }   /*  ACAD:   AC adapter device */

        /*  test implicit return from control method */

        Method (DIS, 1, NotSerialized)
        {
            Local0 = Arg0
        }

        Device (RTLV)
        {
            /*  test implicit return inside nested if with explicit return of Lvalue */

            Method (_DCK, 1, NotSerialized)  // _DCK: Dock Present
            {
                If (Arg0)
                {
                    /*  dock */

                    Local0 = 0x87
                    If (Local0)
                    {
                        DIS (0x23)
                        Return (0x01)
                    }

                    Return (0x00)
                }   /*  dock */
                Else
                {
                    /*  undock */

                    Local0 = Arg0
                    If (Local0)
                    {
                        DIS (0x23)
                        Return (0x01)
                    }

                    Return (0x00)
                }   /*  undock */
            }   /*  _DCK control method */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ RetLVal Test"
                /*  store _PSR return value into Local0 */

                Local0 = \_SB.ACAD._PSR ()
                /*  save Local0 object type value into Local1 */

                Local1 = ObjectType (Local0)
                /*  validate Local0 is a Number */

                If ((Local1 != 0x01))  /*  Number/Integer type is 1 */
                {
                    Return (0x01)      /*  failure */
                }

                /*  test implicit return inside nested if with explicit return of Lvalue */

                Local2 = _DCK (0x01)
                /*  save Local2 object type value into Local3 */

                Local3 = ObjectType (Local2)
                /*  validate Local2 is a Number */

                If ((Local3 != 0x01))  /*  Number/Integer type is 1 */
                {
                    Return (0x02)      /*  failure */
                }

                If ((Local2 != 0x01))
                {
                    Return (0x03)      /*  failure */
                }

                Return (0x00)  /*  success */
            }   /*  TEST */
        }   /*  RTLV */
    }   /*  _SB system bus */

    /* */
    /* test RetPkg.asl */
    /* */
    /*  Test ReturnOp(Package) */
    /*      This is required to support _PRT on Dell Optiplex Workstations (e.g. GX1) */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  /*  PCI interrupt link */  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  /*  PCI interrupt link */  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  /*  PCI interrupt link */  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  /*  PCI interrupt link */  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
        }

        Device (PCI1)
        {
            /*  PCI1:   Root PCI Bus */

            Name (_HID, "PNP0A03" /* PCI Bus */)  /*  Need _HID for root device (String format) */  // _HID: Hardware ID
            Name (_ADR, 0x00)  // _ADR: Address
            Name (_CRS, 0x00)  // _CRS: Current Resource Settings
            Name (_PRT, Package (0x0C)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0x0004FFFF, 
                    0x00, 
                    LNKA, 
                    0x00
                },             /*  Slot 1, INTA */

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x01, 
                    LNKB, 
                    0x00
                },             /*  Slot 1, INTB */

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x02, 
                    LNKC, 
                    0x00
                },             /*  Slot 1, INTC */

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x03, 
                    LNKD, 
                    0x00
                },             /*  Slot 1, INTD */

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x00, 
                    \_SB.LNKB, 
                    0x00
                },   /*  Slot 2, INTA */

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x01, 
                    \_SB.LNKC, 
                    0x00
                },   /*  Slot 2, INTB */

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x02, 
                    \_SB.LNKD, 
                    0x00
                },   /*  Slot 2, INTC */

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    \_SB.LNKA, 
                    0x00
                },   /*  Slot 2, INTD */

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    LNKC, 
                    0x00
                },             /*  Slot 3, INTA */

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x01, 
                    LNKD, 
                    0x00
                },             /*  Slot 3, INTB */

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    LNKA, 
                    0x00
                },             /*  Slot 3, INTC */

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    LNKB, 
                    0x00
                }            /*  Slot 3, INTD */
            })
            Device (PX40)
            {
                /* Map f0 space, Start PX40 */

                Name (_ADR, 0x00070000)  /*  Address+function. */  // _ADR: Address
            }
        }   /*  PCI0:   Root PCI Bus */

        Device (RETP)
        {
            Method (RPKG, 0, NotSerialized)
            {
                /*  RPKG: Return Package from local variable */
                /*  store _PRT package into Local0 */
                Local0 = \_SB.PCI1._PRT
                /*  return Local0 Package */

                Return (Local0)
            }   /*  RPKG */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ RetPkg Test"
                /*  store RPKG package return value into Local0 */

                Local0 = RPKG ()
                /*  save Local0 object type value into Local1 */

                Local1 = ObjectType (Local0)
                /*  validate Local0 is a Package */

                If ((Local1 != 0x04))  /*  Package type is 4 */
                {
                    Return (0x01)
                }   /*  failure */
                Else
                {
                    Return (0x00)
                }   /*  success */
            }   /*  TEST */
        }   /*  RETP */
    } /* _SB_ */

    /* */
    /* test WhileRet.asl */
    /* */
    /*  WhileRet.asl tests a ReturnOp nested in a IfOp nested in a WhileOp. */
    /* */
    Device (WHLR)
    {
        Name (LCNT, 0x00)
        Method (WIR, 0, NotSerialized)
        {
            /*  WIR:    control method that returns inside of IfOp inside of WhileOp */

            While ((LCNT < 0x04))
            {
                If ((LCNT == 0x02))
                {
                    Return (0x00)
                }

                LCNT++
            }

            Return (LCNT) /* \WHLR.LCNT */
        }   /*  WIR:    control method that returns inside of IfOp inside of WhileOp */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ WhileRet Test"
            Local0 = WIR ()
            Return (Local0)
        }   /*  TEST */
    }   /*  WHLR */

    /* */
    /* test AndOrOp.asl */
    /* */
    /*This code tests the bitwise AndOp and OrOp Operator terms */
    /* */
    /*Syntax of Andop term */
    /*And - Bitwise And */
    /*AndTerm   := And( */
    /*  Source1,    //TermArg=>Integer */
    /*  Source2,    //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source1 and Source2 are evaluated as integer data types, */
    /* a bit-wise AND is performed, and the result is optionally */
    /*stored into Result. */
    /* */
    /* */
    /*Syntax of OrOp */
    /*Or - Bit-wise Or */
    /*OrTerm    := Or( */
    /*  Source1,    //TermArg=>Integer */
    /*  Source2 //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source1 and Source2 are evaluated as integer data types, */
    /* a bit-wide OR is performed, and the result is optionally */
    /*stored in Result */
    /* */
    Device (ANDO)
    {
        OperationRegion (TMEM, SystemMemory, 0xC4, 0x02)
        Field (TMEM, ByteAcc, NoLock, Preserve)
        {
                ,   3, 
            TOUD,   13
        }

        /*Create System Memory Operation Region and field overlays */

        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }/* Field(RAM) */

        /*And with Byte Data */

        Name (BYT1, 0xFF)
        Name (BYT2, 0xFF)
        Name (BRSL, 0x00)
        /*And with Word Data */

        Name (WRD1, 0xFFFF)
        Name (WRD2, 0xFFFF)
        Name (WRSL, 0x00)
        /*And with DWord Data */

        Name (DWD1, 0xFFFFFFFF)
        Name (DWD2, 0xFFFFFFFF)
        Name (DRSL, 0x00)
        Method (ANDP, 0, NotSerialized)
        {
            /*Check with 1 And 1 on byte data */

            BRSL = (BYT1 & BYT2) /* \ANDO.BYT2 */
            If ((BRSL != 0xFF))
            {
                Return (0x01)
            }

            /*Check with 1 And 1 on Word data */

            WRSL = (WRD1 & WRD2) /* \ANDO.WRD2 */
            If ((WRSL != 0xFFFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 And 1 Dword */

            DRSL = (DWD1 & DWD2) /* \ANDO.DWD2 */
            If ((DRSL != 0xFFFFFFFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 0 And 0 on byte data */

            BYT1 = 0x00
            BYT2 = 0x00
            BRSL = 0x00
            BRSL = (BYT1 & BYT2) /* \ANDO.BYT2 */
            If ((BRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 0 And 0 on Word data */

            WRD1 = 0x00
            WRD2 = 0x00
            WRSL = 0x00
            WRSL = (WRD1 & WRD2) /* \ANDO.WRD2 */
            If ((WRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 0 And 0 Dword */

            DWD1 = 0x00
            DWD2 = 0x00
            DRSL = 0x00
            DRSL = (DWD1 & DWD2) /* \ANDO.DWD2 */
            If ((DRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 And 0 on byte data */

            BYT1 = 0x55
            BYT2 = 0xAA
            BRSL = 0x00
            BRSL = (BYT1 & BYT2) /* \ANDO.BYT2 */
            If ((BRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 And 0 on Word data */

            WRD1 = 0x5555
            WRD2 = 0xAAAA
            WRSL = 0x00
            WRSL = (WRD1 & WRD2) /* \ANDO.WRD2 */
            If ((WRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 And 0 on Dword */

            DWD1 = 0x55555555
            DWD2 = 0xAAAAAAAA
            DRSL = 0x00
            DRSL = (DWD1 & DWD2) /* \ANDO.DWD2 */
            If ((DRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            TOUD = 0x1FFF
            Local0 = TOUD /* \ANDO.TOUD */
            If ((Local0 != 0x1FFF))
            {
                Return (0x01)      /*  failure */
            }

            /*TBD- Do We need to check for system memory data also for each test case ?? */

            Return (0x00)
        }/*ANDP */

        Method (OROP, 0, NotSerialized)
        {
            /*Check with 1 Ored with 1 on byte data */

            BYT1 = 0xFF
            BYT2 = 0xFF
            BRSL = 0x00
            BRSL = (BYT1 | BYT2) /* \ANDO.BYT2 */
            If ((BRSL != 0xFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 Ored with 1 on Word data */

            WRD1 = 0xFFFF
            WRD2 = 0xFFFF
            WRSL = 0x00
            WRSL = (WRD1 | WRD2) /* \ANDO.WRD2 */
            If ((WRSL != 0xFFFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 Ored with 1 on Dword data */

            DWD1 = 0xFFFFFFFF
            DWD2 = 0xFFFFFFFF
            DRSL = 0x00
            DRSL = (DWD1 | DWD2) /* \ANDO.DWD2 */
            If ((DRSL != 0xFFFFFFFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 0 Ored with 0 on byte data */

            BYT1 = 0x00
            BYT2 = 0x00
            BRSL = 0x00
            BRSL = (BYT1 | BYT2) /* \ANDO.BYT2 */
            If ((BRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 0 Ored with 0 on Word data */

            WRD1 = 0x00
            WRD2 = 0x00
            WRSL = 0x00
            WRSL = (WRD1 | WRD2) /* \ANDO.WRD2 */
            If ((WRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 0 Ored with  0 Dword data */

            DWD1 = 0x00
            DWD2 = 0x00
            DRSL = 0x00
            DRSL = (DWD1 | DWD2) /* \ANDO.DWD2 */
            If ((DRSL != 0x00))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 Ored with 0 on byte data */

            BYT1 = 0x55
            BYT2 = 0xAA
            BRSL = 0x00
            BRSL = (BYT1 | BYT2) /* \ANDO.BYT2 */
            If ((BRSL != 0xFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 Ored with 0 on Word data */

            WRD1 = 0x5555
            WRD2 = 0xAAAA
            WRSL = 0x00
            WRSL = (WRD1 | WRD2) /* \ANDO.WRD2 */
            If ((WRSL != 0xFFFF))
            {
                Return (0x01)      /*  failure */
            }

            /*Check with 1 Ored with 0 on Dword data */

            DWD1 = 0x55555555
            DWD2 = 0xAAAAAAAA
            DRSL = 0x00
            DRSL = (DWD1 | DWD2) /* \ANDO.DWD2 */
            If ((DRSL != 0xFFFFFFFF))
            {
                Return (0x01)      /*  failure */
            }

            /*TBD - Do We need to check for system memory data also for each test case ?? */

            Return (0x00)
        }/*OROP */

        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ AndOrOp Test"
            Name (RSLT, 0x01)
            /*Call Andop method */

            RSLT = ANDP ()
            If ((RSLT == 0x01))
            {
                Return (RSLT) /* \ANDO.TEST.RSLT */
            }

            /*Call OrOp Method */

            RSLT = OROP ()
            If ((RSLT == 0x01))
            {
                Return (RSLT) /* \ANDO.TEST.RSLT */
            }

            /* */
            /* Return original conditions to allow iterative execution */
            /* */
            BYT1 = 0xFF
            BYT2 = 0xFF
            BRSL = 0x00
            WRD1 = 0xFFFF
            WRD2 = 0xFFFF
            WRSL = 0x00
            DWD1 = 0xFFFFFFFF
            DWD2 = 0xFFFFFFFF
            DRSL = 0x00
            Return (0x00)
        }   /*TEST */
    }   /*ANDO */

    /* */
    /* test BreakPnt.asl */
    /* */
    /* This code tests the BreakPoint opcode term. The syntax of BreakPoint Term is */
    /* BreakPointTerm    := BreakPoint */
    /* Used for debugging, the Breakpoint opcode stops the execution and enters the AML debugger. */
    /* In the non-debug version of the interpreter, BreakPoint is equivalent to Noop. */
    /* */
    Device (BRKP)
    {
        Name (CNT0, 0x00)
        Method (BK1, 0, NotSerialized)
        {
            BreakPoint
            Return (0x00)
        }

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ BreakPnt Test"
            CNT0 = 0x00
            /*Check BreakPoint statement */

            While ((CNT0 < 0x0A))
            {
                CNT0++
            }

            /*Check the BreakPoint statement */

            If ((CNT0 == 0x0A))
            {
                /*            BreakPoint */

                Return (0x00)
            }

            /*failed */

            Return (0x01)
        }
    }

    /* */
    /* test AddSubOp.asl */
    /* */
    Device (ADSU)
    {
        /*  create System Memory Operation Region and field overlays */

        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }   /*  Field(RAM) */

        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ AddSubOp Test"
            Name (DWRD, 0x12345678)
            Name (WRD, 0x1234)
            Name (BYT, 0x12)
            /*  Test AddOp with DWORD data */

            DWRD = 0x12345678
            DWRD += 0x07
            If ((DWRD != 0x1234567F))
            {
                Return (DWRD) /* \ADSU.TEST.DWRD */
            }

            /*  Test AddOp with WORD data */

            WRD += 0x05
            If ((WRD != 0x1239))
            {
                Return (WRD) /* \ADSU.TEST.WRD_ */
            }

            /*  Test AddOp with BYTE data */

            BYT += 0x03
            If ((BYT != 0x15))
            {
                Return (BYT) /* \ADSU.TEST.BYT_ */
            }

            /*  Test SubtractOp with DWORD data */

            DWRD -= 0x07
            If ((DWRD != 0x12345678))
            {
                Return (DWRD) /* \ADSU.TEST.DWRD */
            }

            /*  Test SubtractOp with WORD data */

            WRD -= 0x03
            If ((WRD != 0x1236))
            {
                Return (WRD) /* \ADSU.TEST.WRD_ */
            }

            /*  Test SubtractOp with BYTE data */

            BYT -= 0x03
            If ((BYT != 0x12))
            {
                Return (BYT) /* \ADSU.TEST.BYT_ */
            }

            /*  test AddOp with DWORD SystemMemory OpRegion */

            SMDW = 0x01234567
            SMDW += 0x08
            If ((SMDW != 0x0123456F))
            {
                Return (SMDW) /* \ADSU.SMDW */
            }

            /*  test SubtractOp with DWORD SystemMemory OpRegion */

            SMDW -= 0x07
            If ((SMDW != 0x01234568))
            {
                Return (SMDW) /* \ADSU.SMDW */
            }

            /*  test AddOp with WORD SystemMemory OpRegion */

            SMWD = 0x0123
            SMWD += 0x06
            If ((SMWD != 0x0129))
            {
                Return (SMWD) /* \ADSU.SMWD */
            }

            /*  test SubtractOp with WORD SystemMemory OpRegion */

            SMWD -= 0x05
            If ((SMWD != 0x0124))
            {
                Return (SMWD) /* \ADSU.SMWD */
            }

            /*  test AddOp with BYTE SystemMemory OpRegion */

            SMBY = 0x01
            SMBY += 0x04
            If ((SMBY != 0x05))
            {
                Return (SMBY) /* \ADSU.SMBY */
            }

            /*  test SubtractOp with BYTE SystemMemory OpRegion */

            SMBY -= 0x03
            If ((SMBY != 0x02))
            {
                Return (SMBY) /* \ADSU.SMBY */
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  ADSU */

    /* */
    /* test IncDecOp.asl */
    /* */
    Device (INDC)
    {
        /*  create System Memory Operation Region and field overlays */

        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }   /*  Field(RAM) */

        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ IncDecOp Test"
            Name (DWRD, 0x12345678)
            Name (WRD, 0x1234)
            Name (BYT, 0x12)
            /*  Test IncrementOp with DWORD data */

            DWRD = 0x12345678
            DWRD++
            If ((DWRD != 0x12345679))
            {
                Return (DWRD) /* \INDC.TEST.DWRD */
            }

            /*  Test IncrementOp with WORD data */

            WRD++
            If ((WRD != 0x1235))
            {
                Return (WRD) /* \INDC.TEST.WRD_ */
            }

            /*  Test IncrementOp with BYTE data */

            BYT++
            If ((BYT != 0x13))
            {
                Return (BYT) /* \INDC.TEST.BYT_ */
            }

            /*  Test DecrementOp with DWORD data */

            DWRD--
            If ((DWRD != 0x12345678))
            {
                Return (DWRD) /* \INDC.TEST.DWRD */
            }

            /*  Test DecrementOp with WORD data */

            WRD--
            If ((WRD != 0x1234))
            {
                Return (WRD) /* \INDC.TEST.WRD_ */
            }

            /*  Test DecrementOp with BYTE data */

            BYT--
            If ((BYT != 0x12))
            {
                Return (BYT) /* \INDC.TEST.BYT_ */
            }

            /*  test IncrementOp with DWORD SystemMemory OpRegion */

            SMDW = 0x01234567
            SMDW++
            If ((SMDW != 0x01234568))
            {
                Return (SMDW) /* \INDC.SMDW */
            }

            /*  test DecrementOp with DWORD SystemMemory OpRegion */

            SMDW--
            If ((SMDW != 0x01234567))
            {
                Return (SMDW) /* \INDC.SMDW */
            }

            /*  test IncrementOp with WORD SystemMemory OpRegion */

            SMWD = 0x0123
            SMWD++
            If ((SMWD != 0x0124))
            {
                Return (SMWD) /* \INDC.SMWD */
            }

            /*  test DecrementOp with WORD SystemMemory OpRegion */

            SMWD--
            If ((SMWD != 0x0123))
            {
                Return (SMWD) /* \INDC.SMWD */
            }

            /*  test IncrementOp with BYTE SystemMemory OpRegion */

            SMBY = 0x01
            SMBY++
            If ((SMBY != 0x02))
            {
                Return (SMBY) /* \INDC.SMBY */
            }

            /*  test DecrementOp with BYTE SystemMemory OpRegion */

            SMBY--
            If ((SMBY != 0x01))
            {
                Return (SMBY) /* \INDC.SMBY */
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  INDC */

    /* */
    /* test LOps.asl */
    /* */
    /*This source tests all the logical operators. Logical operators in ASL are as follows. */
    /*LAnd, LEqual, LGreater, LLess, LNot, LNotEqual, LOr. */
    /* Success will return 0 and failure will return a non zero number. Check the source code for */
    /* non zero number to find where the test failed */
    Device (LOPS)
    {
        /*Create System Memory Operation Region and field overlays */

        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }/* Field(RAM) */

        /*And with Byte Data */

        Name (BYT1, 0xFF)
        Name (BYT2, 0xFF)
        Name (BRSL, 0x00)
        /*And with Word Data */

        Name (WRD1, 0xFFFF)
        Name (WRD2, 0xFFFF)
        Name (WRSL, 0x00)
        /*And with DWord Data */

        Name (DWD1, 0xFFFFFFFF)
        Name (DWD2, 0xFFFFFFFF)
        Name (DRSL, 0x00)
        Name (RSLT, 0x01)
        Method (ANDL, 2, NotSerialized)
        {
            /*test with the arguments passed */

            If ((Arg0 == Arg1))
            {
                RSLT = (Arg0 && Arg1)
                If ((Ones != RSLT))
                {
                    Return (0x0B)
                }
            }

            /*test with he locals */

            Local0 = Arg0
            Local1 = Arg1
            If ((Local0 == Local1))
            {
                RSLT = (Local0 && Local1)
                If ((Ones != RSLT))
                {
                    Return (0x0C)
                }
            }

            /*test with BYTE data */

            If ((BYT1 == BYT2))
            {
                BRSL = (BYT1 && BYT2)
                If ((Ones != BRSL))
                {
                    Return (0x0D)
                }
            }

            /*test with WORD data */

            If ((WRD1 == WRD2))
            {
                WRSL = (WRD1 && WRD2)
                If ((Ones != WRSL))
                {
                    Return (0x0E)
                }
            }

            /*test with DWORD data */

            If ((DWD1 == DWD2))
            {
                DRSL = (DWD1 && DWD2)
                If ((Ones != DRSL))
                {
                    Return (0x0F)
                }
            }

            /*Test for system memory data for each test case. */

            BYT1 = 0xFF
            SMBY = 0xFF
            BRSL = 0x00
            /*test with BYTE system memory data */

            If ((BYT1 == SMBY))
            {
                BRSL = (BYT1 && SMBY)
                If ((Ones != BRSL))
                {
                    Return (0x10)
                }
            }

            WRD1 = 0xFFFF
            SMWD = 0xFFFF
            WRSL = 0x00
            /*test with WORD system memory data */

            If ((WRD1 == SMWD))
            {
                WRSL = (WRD1 && SMWD)
                If ((Ones != WRSL))
                {
                    Return (0x11)
                }
            }

            DRSL = 0x00
            DWD1 = 0x00FFFFFF
            SMDW = 0x00FFFFFF
            /*test with DWORD system memory data */

            If ((DWD1 == SMDW))
            {
                DRSL = (DWD1 && SMDW)
                If ((Ones != DRSL))
                {
                    Return (0x12)
                }
            }

            Return (0x00)
        }/*ANDL */

        /*Test the LOr Operator */

        Method (ORL, 2, NotSerialized)
        {
            /*ORL_ */
            /*test with the arguments passed */
            If ((Arg0 == Arg1))
            {
                RSLT = (Arg0 || Arg1)
                If ((Ones != RSLT))
                {
                    Return (0x15)
                }
            }

            /*test with he locals */

            Local0 = Arg0
            Local1 = Arg1
            If ((Local0 == Local1))
            {
                RSLT = (Local0 || Local1)
                If ((Ones != RSLT))
                {
                    Return (0x16)
                }
            }

            /*Check with 1 LOred with 0 on byte data */

            BYT1 = 0xFF
            BYT2 = 0x00
            BRSL = 0x00
            If ((BYT1 != BYT2))
            {
                BRSL = (BYT1 || BYT2)
                If ((Ones != BRSL))
                {
                    Return (0x17)
                }
            }

            /*Check with 1 LOred with 0 on WORD data */

            WRD1 = 0xFFFF
            WRD2 = 0x00
            WRSL = 0x00
            If ((WRD1 != WRD2))
            {
                WRSL = (WRD1 || WRD2)
                If ((Ones != WRSL))
                {
                    Return (0x18)
                }
            }

            /*Check with 1 LOred with 0 on DWORD data */

            DWD1 = 0xFFFFFFFF
            DWD2 = 0x00
            DRSL = 0x00
            If ((DWD1 != DWD2))
            {
                DRSL = (DWD1 || DWD2)
                If ((Ones != DRSL))
                {
                    Return (0x19)
                }
            }

            BYT1 = 0x00
            SMBY = 0xFF
            BRSL = 0x00
            /*test with BYTE system memory data */

            If ((BYT1 == SMBY))
            {
                BRSL = (BYT1 || SMBY)
                If ((Ones != BRSL))
                {
                    Return (0x1A)
                }
            }

            WRD1 = 0x00
            SMWD = 0xFFFF
            WRSL = 0x00
            /*test with WORD system memory data */

            If ((WRD1 == SMWD))
            {
                WRSL = (WRD1 || SMWD)
                If ((Ones != WRSL))
                {
                    Return (0x1B)
                }
            }

            DWD1 = 0x00
            SMDW = 0xFFFFFFFF
            DRSL = 0x00
            /*test with DWORD system memory data */

            If ((DWD1 == SMDW))
            {
                DRSL = (DWD1 && SMDW)
                If ((Ones != DRSL))
                {
                    Return (0x1C)
                }
            }

            Return (0x00)
        }/*ORL_ */

        /*This method tests LGreater and LNot operator */

        Method (LSGR, 2, NotSerialized)
        {
            /*LSGR */
            /*Test on arguements passed */
            /*in test data, Arg1 > Arg0 */
            If ((Ones == (Arg1 <= Arg0)))
            {
                Return (0x1F)
            }

            /*test LLessEqual */

            If ((Ones == !(Arg1 >= Arg0)))
            {
                Return (0x20)
            }

            If ((Ones == (Arg1 < Arg0)))
            {
                Return (0x21)
            }

            /*test LLessEqual */

            If ((Ones == (Arg1 <= Arg0)))
            {
                Return (0x22)
            }

            Local0 = Arg0
            Local1 = Arg1
            /*test with the locals */

            If ((Local1 <= Local0))
            {
                Return (0x23)
            }

            /*test on Byte data */

            BYT1 = 0x12
            BYT2 = 0x21
            If ((BYT2 <= BYT1))
            {
                Return (0x24)
            }

            If ((BYT1 >= BYT2))
            {
                Return (0x25)
            }

            /*test LGreaterEqual with byte data */

            If (!(BYT2 >= BYT1))
            {
                Return (0x26)
            }

            /*test LLessEqual byte data */

            If (!(BYT1 <= BYT2))
            {
                Return (0x27)
            }

            /*test on Word data */

            WRD1 = 0x1212
            WRD2 = 0x2121
            If ((WRD2 <= WRD1))
            {
                Return (0x0136)
            }

            If ((WRD1 >= WRD2))
            {
                Return (0x0137)
            }

            /*Test LGreaterEqual with Word Data */

            If (!(WRD2 >= WRD1))
            {
                Return (0x0138)
            }

            /*Test LLessEqual with Word Data */

            If (!(WRD1 <= WRD2))
            {
                Return (0x0139)
            }

            /*test on DWord data */

            DWD1 = 0x12121212
            DWD2 = 0x21212121
            If ((DWD2 <= DWD1))
            {
                Return (0x013A)
            }

            If ((DWD1 >= DWD2))
            {
                Return (0x013B)
            }

            /*Test LGreaterEqual with Dword */

            If (!(DWD2 >= DWD1))
            {
                Return (0x013C)
            }

            /*Test LLessEqual DWord */

            If (!(DWD1 <= DWD2))
            {
                Return (0x013D)
            }

            Return (0x00)
        }/*LSGR */

        /*The test method */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ LOps Test"
            RSLT = 0x00
            /*Call LAndOp method */

            RSLT = ANDL (0x02, 0x02)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \LOPS.RSLT */
            }

            /*Call LOrOp Method */

            RSLT = ORL (0x05, 0x05)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \LOPS.RSLT */
            }

            /*Call LSGR Method */

            RSLT = LSGR (0x05, 0x07)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \LOPS.RSLT */
            }

            Return (0x00)
        }/*TEST */
    }/*LOPS */

    /* */
    /* test FdSetOps.asl */
    /* */
    /*  FindSetLeftBit - Find Set Left Bit */
    /*  FindSetLeftBitTerm  := FindSetLeftBit */
    /*  (   Source, //TermArg=>Integer */
    /*      Result  //Nothing | SuperName */
    /*  ) => Integer */
    /*  Source is evaluated as integer data type, and the one-based bit location of */
    /*  the first MSb (most significant set bit) is optionally stored into Result. */
    /*  The result of 0 means no bit was set, 1 means the left-most bit set is the */
    /*  first bit, 2 means the left-most bit set is the second bit, and so on. */
    /*  FindSetRightBit - Find Set Right Bit */
    /*  FindSetRightBitTerm := FindSetRightBit */
    /*  (   Source, //TermArg=>Integer */
    /*      Result  //Nothing | SuperName */
    /*  ) => Integer */
    /*  Source is evaluated as integer data type, and the one-based bit location of */
    /*  the most LSb (least significant set bit) is optionally stored in Result. */
    /*  The result of 0 means no bit was set, 32 means the first bit set is the */
    /*  32nd bit, 31 means the first bit set is the 31st bit, and so on. */
    /*  If the Control method is success Zero is returned. Otherwise a non-zero */
    /*  number is returned. */
    /* */
    Device (FDSO)
    {
        /*  FDSO */
        /*  Create System Memory Operation Region and field overlays */
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,      /*  8-bit BYTE */   8
        }   /*  Field(RAM) */

        /*  Byte Data */

        Name (BYT1, 0x01)
        Name (BRSL, 0x00)
        /*  Word Data */

        Name (WRD1, 0x0100)
        Name (WRSL, 0x00)
        /*  DWord Data */

        Name (DWD1, 0x00010000)
        Name (DRSL, 0x00)
        Name (RSLT, 0x01)
        Name (CNTR, 0x01)
        Method (SHFT, 2, NotSerialized)
        {
            /*  SHFT */

            Local0 = Arg0
            Local1 = Arg1
            FindSetLeftBit (Arg0, BRSL) /* \FDSO.BRSL */
            If ((BRSL != Arg1))
            {
                Return (0x11)
            }

            If ((Arg0 != Local0))
            {
                Return (0x12)
            }

            FindSetLeftBit (Local0, BRSL) /* \FDSO.BRSL */
            If ((BRSL != Local1))
            {
                Return (0x13)
            }

            If ((Arg0 != Local0))
            {
                Return (0x14)
            }

            /*  test the byte value for SetLeftBit */

            BYT1 = 0x07
            FindSetLeftBit (BYT1, BRSL) /* \FDSO.BRSL */
            If ((BRSL != 0x03))
            {
                Return (0x15)
            }

            If ((BYT1 != 0x07))
            {
                Return (0x16)
            }

            BYT1 = 0x01
            CNTR = 0x01
            While ((CNTR <= 0x08))
            {
                /*  FindSetLeftBit check loop for byte data */

                FindSetLeftBit (BYT1, BRSL) /* \FDSO.BRSL */
                If ((BRSL != CNTR))
                {
                    Return (0x17)
                }

                /*  Shift the bits to check the same */

                BYT1 <<= 0x01
                CNTR++
            }   /*  FindSetLeftBit check loop for byte data */

            /*  Check BYTE value for SetRightBit */

            BYT1 = 0x07
            FindSetRightBit (BYT1, BRSL) /* \FDSO.BRSL */
            If ((BRSL != 0x01))
            {
                Return (0x21)
            }

            If ((BYT1 != 0x07))
            {
                Return (0x22)
            }

            CNTR = 0x01
            BYT1 = 0xFF
            While ((CNTR <= 0x08))
            {
                /*  FindSetRightBit check loop for byte data */

                FindSetRightBit (BYT1, BRSL) /* \FDSO.BRSL */
                If ((BRSL != CNTR))
                {
                    Return (0x23)
                }

                BYT1 <<= 0x01
                CNTR++
            }   /*  FindSetRightBit check loop for byte data */

            /*  Test Word value for SetLeftBit */

            CNTR = 0x09
            WRD1 = 0x0100
            While ((CNTR <= 0x10))
            {
                /*  FindSetLeftBit check loop for Word data */

                FindSetLeftBit (WRD1, WRSL) /* \FDSO.WRSL */
                If ((WRSL != CNTR))
                {
                    Return (0x31)
                }

                /*  Shift the bits to check the same */

                WRD1 <<= 0x01
                CNTR++
            }   /*  FindSetLeftBit check loop for Word data */

            /*  Check Word value for SetRightBit */

            CNTR = 0x09
            WRD1 = 0xFF00
            While ((CNTR <= 0x10))
            {
                /*  FindSetRightBit check loop for Word data */

                FindSetRightBit (WRD1, WRSL) /* \FDSO.WRSL */
                If ((WRSL != CNTR))
                {
                    Return (0x32)
                }

                WRD1 <<= 0x01
                CNTR++
            }   /*  FindSetRightBit check loop for Word data */

            /*  Test the DWord value for SetLeftBit */

            CNTR = 0x11
            DWD1 = 0x00010000
            While ((CNTR <= 0x20))
            {
                /*  FindSetLeftBit check loop for Dword */

                FindSetLeftBit (DWD1, DRSL) /* \FDSO.DRSL */
                If ((DRSL != CNTR))
                {
                    Return (0x41)
                }

                /*  Shift the bits to check the same */

                DWD1 <<= 0x01
                CNTR++
            }   /*  FindSetLeftBit check loop for Dword */

            /*  Check DWord value for SetRightBit */

            CNTR = 0x11
            DWD1 = 0xFFFF0000
            While ((CNTR <= 0x20))
            {
                /*  FindSetRightBit Check loop for DWORD */

                FindSetRightBit (DWD1, DRSL) /* \FDSO.DRSL */
                If ((DRSL != CNTR))
                {
                    Return (0x42)
                }

                DWD1 <<= 0x01
                CNTR++
            }   /*  FindSetRightBit Check loop for DWORD */

            Return (0x00)
        }   /*  SHFT */

        /*  Test method called from amlexec */

        Method (TEST, 0, NotSerialized)
        {
            /*  TEST */

            Debug = "++++++++ FdSetOps Test"
            RSLT = SHFT (0x80, 0x08)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \FDSO.RSLT */
            }

            Return (0x00)  /*  pass */
        }   /*  TEST */
    }   /*  Device FDSO */

    /* */
    /* test MulDivOp.asl */
    /* */
    Device (MLDV)
    {
        /*  create System Memory Operation Region and field overlays */

        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }   /*  Field(RAM) */

        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ MulDivOp Test"
            Name (RMDR, 0x00)
            Name (DWRD, 0x12345678)
            Name (WRD, 0x1234)
            Name (BYT, 0x12)
            /*  Test MultiplyOp with DWORD data */

            DWRD = 0x12345678
            DWRD *= 0x03
            If ((DWRD != 0x369D0368))
            {
                Return (DWRD) /* \MLDV.TEST.DWRD */
            }

            /*  Test MultiplyOp with WORD data */

            WRD *= 0x04
            If ((WRD != 0x48D0))
            {
                Return (WRD) /* \MLDV.TEST.WRD_ */
            }

            /*  Test MultiplyOp with BYTE data */

            BYT *= 0x05
            If ((BYT != 0x5A))
            {
                Return (BYT) /* \MLDV.TEST.BYT_ */
            }

            /*  Test DivideOp with DWORD data */

            Divide (DWRD, 0x03, DWRD, RMDR) /* \MLDV.TEST.RMDR */
            If ((DWRD != 0x12345678))
            {
                Return (DWRD) /* \MLDV.TEST.DWRD */
            }

            If ((RMDR != 0x00))
            {
                Return (RMDR) /* \MLDV.TEST.RMDR */
            }

            /*  Test DivideOp with WORD data */

            Divide (WRD, 0x04, WRD, RMDR) /* \MLDV.TEST.RMDR */
            If ((WRD != 0x1234))
            {
                Return (WRD) /* \MLDV.TEST.WRD_ */
            }

            If ((RMDR != 0x00))
            {
                Return (RMDR) /* \MLDV.TEST.RMDR */
            }

            /*  Test DivideOp with BYTE data */

            Divide (BYT, 0x05, BYT, RMDR) /* \MLDV.TEST.RMDR */
            If ((BYT != 0x12))
            {
                Return (BYT) /* \MLDV.TEST.BYT_ */
            }

            If ((RMDR != 0x00))
            {
                Return (RMDR) /* \MLDV.TEST.RMDR */
            }

            /*  test MultiplyOp with DWORD SystemMemory OpRegion */

            SMDW = 0x01234567
            SMDW *= 0x02
            If ((SMDW != 0x02468ACE))
            {
                Return (SMDW) /* \MLDV.SMDW */
            }

            /*  test DivideOp with DWORD SystemMemory OpRegion */

            Divide (SMDW, 0x03, SMDW, RMDR) /* \MLDV.TEST.RMDR */
            If ((SMDW != 0x00C22E44))
            {
                Return (SMDW) /* \MLDV.SMDW */
            }

            If ((RMDR != 0x02))
            {
                Return (RMDR) /* \MLDV.TEST.RMDR */
            }

            /*  test MultiplyOp with WORD SystemMemory OpRegion */

            SMWD = 0x0123
            SMWD *= 0x03
            If ((SMWD != 0x0369))
            {
                Return (SMWD) /* \MLDV.SMWD */
            }

            /*  test DivideOp with WORD SystemMemory OpRegion */

            Divide (SMWD, 0x02, SMWD, RMDR) /* \MLDV.TEST.RMDR */
            If ((SMWD != 0x01B4))
            {
                Return (SMWD) /* \MLDV.SMWD */
            }

            If ((RMDR != 0x01))
            {
                Return (RMDR) /* \MLDV.TEST.RMDR */
            }

            /*  test MultiplyOp with BYTE SystemMemory OpRegion */

            SMBY = 0x01
            SMBY *= 0x07
            If ((SMBY != 0x07))
            {
                Return (SMBY) /* \MLDV.SMBY */
            }

            /*  test DivideOp with BYTE SystemMemory OpRegion */

            Divide (SMBY, 0x04, SMBY, RMDR) /* \MLDV.TEST.RMDR */
            If ((SMBY != 0x01))
            {
                Return (SMBY) /* \MLDV.SMBY */
            }

            If ((RMDR != 0x03))
            {
                Return (RMDR) /* \MLDV.TEST.RMDR */
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  MLDV */

    /* */
    /* test NBitOps.asl */
    /* */
    /*NAnd - Bit-wise NAnd */
    /*NAndTerm  := NAnd( */
    /*  Source1,    //TermArg=>Integer */
    /*  Source2 //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source1 and Source2 are evaluated as integer data types, a bit-wise NAND is performed, and the result is optionally */
    /*stored in Result. */
    /*NOr - Bitwise NOr */
    /*NOrTerm   := NOr( */
    /*  Source1,    //TermArg=>Integer */
    /*  Source2 //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source1 and Source2 are evaluated as integer data types, a bit-wise NOR is performed, and the result is optionally */
    /*stored in Result. */
    /* Not - Not */
    /*NotTerm   := Not( */
    /*  Source, //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source1 is evaluated as an integer data type, a bit-wise NOT is performed, and the result is optionally stored in */
    /*Result. */
    /*If the Control method is success Zero is returned else a non-zero number is returned */
    Device (NBIT)
    {
        /*NBIT */
        /*Create System Memory Operation Region and field overlays */
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }/* Field(RAM) */

        /*And with Byte Data */

        Name (BYT1, 0xFF)
        Name (BYT2, 0xFF)
        Name (BRSL, 0x00)
        /*And with Word Data */

        Name (WRD1, 0xFFFF)
        Name (WRD2, 0xFFFF)
        Name (WRSL, 0x00)
        /*And with DWord Data */

        Name (DWD1, 0xFFFFFFFF)
        Name (DWD2, 0xFFFFFFFF)
        Name (DRSL, 0x00)
        Name (RSLT, 0x01)
        Name (ARSL, 0x00)
        Name (LRSL, 0x00)
        Method (NNDB, 2, NotSerialized)
        {
            /*NNDB */

            SMDW = 0xFFFFFFFF
            SMWD = 0xFFFF
            SMBY = 0xFF
            NAnd (Arg0, Arg1, ARSL) /* \NBIT.ARSL */
            If ((ARSL != 0xFFFFFFFD))
            {
                Return (0x0B)
            }

            Local0 = Arg0
            Local1 = Arg1
            NAnd (Local0, Local1, LRSL) /* \NBIT.LRSL */
            If ((LRSL != 0xFFFFFFFD))
            {
                Return (0x0C)
            }

            /*Byte data */

            NAnd (BYT1, BYT2, BRSL) /* \NBIT.BRSL */
            If ((BRSL != 0xFFFFFF00))
            {
                Return (0x0D)
            }

            /*Word Data */

            NAnd (WRD1, WRD2, WRSL) /* \NBIT.WRSL */
            If ((WRSL != 0xFFFF0000))
            {
                Return (0x0E)
            }

            /*DWord Data */

            NAnd (DWD1, DWD2, DRSL) /* \NBIT.DRSL */
            If ((DRSL != 0x00))
            {
                Return (0x0F)
            }

            /*Byte data */

            NAnd (SMBY, 0xFF, BRSL) /* \NBIT.BRSL */
            If ((BRSL != 0xFFFFFF00))
            {
                Return (0x10)
            }

            /*Word Data */

            NAnd (SMWD, 0xFFFF, WRSL) /* \NBIT.WRSL */
            If ((WRSL != 0xFFFF0000))
            {
                Return (0x11)
            }

            /*DWord Data */

            NAnd (SMDW, 0xFFFFFFFF, DRSL) /* \NBIT.DRSL */
            If ((DRSL != 0x00))
            {
                Return (0x12)
            }

            Return (0x00)
        }/*NNDB */

        Method (NNOR, 2, NotSerialized)
        {
            /*NNOR */

            NOr (Arg0, Arg1, ARSL) /* \NBIT.ARSL */
            If ((ARSL != 0xFFFFFFFD))
            {
                Return (0x15)
            }

            Local0 = Arg0
            Local1 = Arg1
            NOr (Local0, Local1, LRSL) /* \NBIT.LRSL */
            If ((LRSL != 0xFFFFFFFD))
            {
                Return (0x16)
            }

            /*Byte data */

            NOr (BYT1, BYT2, BRSL) /* \NBIT.BRSL */
            If ((BRSL != 0xFFFFFF00))
            {
                Return (0x17)
            }

            /*Word Data */

            NOr (WRD1, WRD2, WRSL) /* \NBIT.WRSL */
            If ((WRSL != 0xFFFF0000))
            {
                Return (0x18)
            }

            /*DWord Data */

            NOr (DWD1, DWD2, DRSL) /* \NBIT.DRSL */
            If ((DRSL != 0x00))
            {
                Return (0x19)
            }

            /*System Memory Byte data */

            NOr (SMBY, 0xFF, BRSL) /* \NBIT.BRSL */
            If ((BRSL != 0xFFFFFF00))
            {
                Return (0x1A)
            }

            /*System Memory Word Data */

            NOr (SMWD, 0xFFFF, WRSL) /* \NBIT.WRSL */
            If ((WRSL != 0xFFFF0000))
            {
                Return (0x1B)
            }

            /*System Memory DWord Data */

            NOr (SMDW, 0xFFFFFFFF, DRSL) /* \NBIT.DRSL */
            If ((DRSL != 0x00))
            {
                Return (0x1C)
            }

            Return (0x00)
        }/*NNOR */

        Method (NNOT, 2, NotSerialized)
        {
            /*NNOT */

            ARSL = (Arg0 | Arg1)
            ARSL = ~ARSL /* \NBIT.ARSL */
            If ((ARSL != 0xFFFFFFFD))
            {
                Return (0x1F)
            }

            Local0 = Arg0
            Local1 = Arg1
            LRSL = (Local0 | Local1)
            LRSL = ~LRSL /* \NBIT.LRSL */
            If ((LRSL != 0xFFFFFFFD))
            {
                Return (0x20)
            }

            /*Byte data */

            BRSL = (BYT1 | BYT2) /* \NBIT.BYT2 */
            BRSL = ~BRSL /* \NBIT.BRSL */
            If ((BRSL != 0xFFFFFF00))
            {
                Return (0x21)
            }

            /*Word Data */

            WRSL = (WRD1 | WRD2) /* \NBIT.WRD2 */
            WRSL = ~WRSL /* \NBIT.WRSL */
            If ((WRSL != 0xFFFF0000))
            {
                Return (0x22)
            }

            /*DWord Data */

            DRSL = (DWD1 | DWD2) /* \NBIT.DWD2 */
            DRSL = ~DRSL /* \NBIT.DRSL */
            If ((DRSL != 0x00))
            {
                Return (0x23)
            }

            /*System Memory Byte data */

            BRSL = (SMBY | 0xFF)
            BRSL = ~BRSL /* \NBIT.BRSL */
            If ((BRSL != 0xFFFFFF00))
            {
                Return (0x24)
            }

            /*System Memory Word Data */

            WRSL = (SMWD | 0xFFFF)
            WRSL = ~WRSL /* \NBIT.WRSL */
            If ((WRSL != 0xFFFF0000))
            {
                Return (0x25)
            }

            /*System Memory DWord Data */

            DRSL = (SMDW | 0xFFFFFFFF)
            DRSL = ~DRSL /* \NBIT.DRSL */
            If ((DRSL != 0x00))
            {
                Return (0x26)
            }

            Return (0x00)
        }/*NNOT */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ NBitOps Test"
            RSLT = NNDB (0x02, 0x02)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \NBIT.RSLT */
            }

            RSLT = NNOR (0x02, 0x02)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \NBIT.RSLT */
            }

            RSLT = NNOT (0x02, 0x02)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \NBIT.RSLT */
            }

            Return (0x00)
        }
    }/*Device NBIT */

    /* */
    /* test ShftOp.asl */
    /* */
    /*ShiftRightTerm    := ShiftRight( */
    /*  Source, //TermArg=>Integer */
    /*  ShiftCount  //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source and ShiftCount are evaluated as integer data types. Source is shifted right with the most significant bit */
    /*zeroed ShiftCount times. The result is optionally stored into Result. */
    /*ShiftLeft( */
    /*  Source, //TermArg=>Integer */
    /*  ShiftCount  //TermArg=>Integer */
    /*  Result  //Nothing | SuperName */
    /*) => Integer */
    /*Source and ShiftCount are evaluated as integer data types. Source is shifted left with the least significant */
    /*bit zeroed ShiftCount times. The result is optionally stored into Result. */
    /*If the Control method is success Zero is returned else a non-zero number is returned */
    Device (SHFT)
    {
        /*SHFT */
        /*Create System Memory Operation Region and field overlays */
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW, /*  32-bit DWORD */   32, 
            SMWD, /*  16-bit WORD */   16, 
            SMBY,  /*  8-bit BYTE */   8
        }/* Field(RAM) */

        Name (SHFC, 0x00)
        /*And with Byte Data */

        Name (BYT1, 0xFF)
        Name (BRSL, 0x00)
        /*And with Word Data */

        Name (WRD1, 0xFFFF)
        Name (WRSL, 0x00)
        /*And with DWord Data */

        Name (DWD1, 0xFFFFFFFF)
        Name (DRSL, 0x00)
        Name (RSLT, 0x01)
        Name (ARSL, 0x00)
        Name (LRSL, 0x00)
        Method (SLFT, 2, NotSerialized)
        {
            /*SLFT */

            SMDW = 0xFFFFFFFF
            SMWD = 0xFFFF
            SMBY = 0xFF
            /*Arg0-> 2 & Arg1->2 */

            ARSL = (Arg0 << Arg1)
            If ((ARSL != 0x08))
            {
                Return (0x0B)
            }

            Local0 = Arg0
            Local1 = Arg1
            /*Local0->8 and Local1->2 */

            LRSL = (Local0 << Local1)
            If ((LRSL != 0x08))
            {
                Return (0x0C)
            }

            SHFC = 0x02
            /*Byte data */

            BRSL = (BYT1 << SHFC) /* \SHFT.SHFC */
            If ((BRSL != 0x03FC))
            {
                Return (0x0D)
            }

            SHFC = 0x04
            /*Word Data */

            WRSL = (WRD1 << SHFC) /* \SHFT.SHFC */
            If ((WRSL != 0x000FFFF0))
            {
                Return (0x0E)
            }

            SHFC = 0x08
            /*DWord Data */

            DRSL = (DWD1 << SHFC) /* \SHFT.SHFC */
            If ((DRSL != 0xFFFFFF00))
            {
                Return (0x0F)
            }

            /*System Memory Byte data */

            SHFC = 0x04
            BRSL = (SMBY << SHFC) /* \SHFT.SHFC */
            If ((BRSL != 0x0FF0))
            {
                Return (0x10)
            }

            /*Word Data */

            SHFC = 0x04
            WRSL = (SMWD << SHFC) /* \SHFT.SHFC */
            If ((WRSL != 0x000FFFF0))
            {
                Return (0x11)
            }

            /*DWord Data */

            SHFC = 0x08
            DRSL = (SMDW << SHFC) /* \SHFT.SHFC */
            If ((DRSL != 0xFFFFFF00))
            {
                Return (0x12)
            }

            Return (0x00)
        }/*SLFT */

        Method (SRGT, 2, NotSerialized)
        {
            /*SRGT */
            /*And with Byte Data */
            BYT1 = 0xFF
            BRSL = 0x00
            /*And with Word Data */

            WRD1 = 0xFFFF
            WRSL = 0x00
            /*And with DWord Data */

            DWD1 = 0xFFFFFFFF
            DRSL = 0x00
            /*Reinitialize the result objects */

            ARSL = 0x00
            LRSL = 0x00
            SMDW = 0xFFFFFFFF
            SMWD = 0xFFFF
            SMBY = 0xFF
            /*Arg0-> 2 & Arg1->2 */

            ARSL = (Arg0 >> Arg1)
            If ((ARSL != 0x00))
            {
                Return (0x15)
            }

            Local0 = Arg0
            Local1 = Arg1
            /*Local0->8 and Local1->2 */

            LRSL = (Local0 >> Local1)
            If ((LRSL != 0x00))
            {
                Return (0x16)
            }

            SHFC = 0x02
            /*Byte data */

            BRSL = (BYT1 >> SHFC) /* \SHFT.SHFC */
            If ((BRSL != 0x3F))
            {
                Return (0x17)
            }

            SHFC = 0x04
            /*Word Data */

            WRSL = (WRD1 >> SHFC) /* \SHFT.SHFC */
            If ((WRSL != 0x0FFF))
            {
                Return (0x18)
            }

            SHFC = 0x08
            /*DWord Data */

            DRSL = (DWD1 >> SHFC) /* \SHFT.SHFC */
            If ((DRSL != 0x00FFFFFF))
            {
                Return (0x19)
            }

            /*System Memory Byte data */

            SHFC = 0x04
            BRSL = (SMBY >> SHFC) /* \SHFT.SHFC */
            If ((BRSL != 0x0F))
            {
                Return (0x1A)
            }

            /*Word Data */

            SHFC = 0x04
            WRSL = (SMWD >> SHFC) /* \SHFT.SHFC */
            If ((WRSL != 0x0FFF))
            {
                Return (0x1B)
            }

            /*DWord Data */

            SHFC = 0x08
            DRSL = (SMDW >> SHFC) /* \SHFT.SHFC */
            If ((DRSL != 0x00FFFFFF))
            {
                Return (0x1C)
            }

            Return (0x00)
        }/*SRGT */

        /*Test method called from amlexec */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ ShftOp Test"
            RSLT = SLFT (0x02, 0x02)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \SHFT.RSLT */
            }

            RSLT = SRGT (0x02, 0x02)
            If ((RSLT != 0x00))
            {
                Return (RSLT) /* \SHFT.RSLT */
            }

            Return (0x00)
        }
    }/*Device SHFT */

    /* */
    /* test Xor.asl and slightly modified */
    /* */
    /*This code tests the XOR opcode term */
    /*Syntax of XOR term */
    /*          XOr( */
    /*                  Source1  //TermArg=>BufferTerm */
    /*                  Source2  //TermArg=>Integer */
    /*                  Result //NameString */
    /*              ) */
    /*"Source1" and "Source2" are evaluated as integers, a bit-wise XOR is performed, and the result is optionally stored in */
    /* Result */
    Device (XORD)
    {
        /*This Method tests XOr operator for all the data types i.e. BYTE, WORD and DWORD */

        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ Xor Test"
            /*Overlay in system memory */

            OperationRegion (RAM, SystemMemory, 0x00800000, 0x0100)
            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                RES1,  /*Offset */   1, 
                BYT1,  /*First BYTE */   8, 
                BYT2,  /*Second BYTE */   8, 
                RBYT,  /*Result Byte */   8, 
                RES2,  /*Offset */   1, 
                WRD1, /*First WORD field */   16, 
                WRD2, /*Second WORD field */   16, 
                RWRD, /*RSLT WORD field */   16, 
                RES3,  /*Offset */   1, 
                DWD1, /*First Dword */   32, 
                DWD2, /*Second Dword */   32, 
                RDWD, /*Result Dword */   32, 
                RES4,  /*Offset */   1
            }

            /* Store bits in the single bit fields for checking */
            /*  at the end */
            RES1 = 0x01
            RES2 = 0x01
            RES3 = 0x01
            RES4 = 0x01
            /* Check the stored single bits */

            If ((RES1 != 0x01))
            {
                Return (0x01)
            }

            If ((RES2 != 0x01))
            {
                Return (0x01)
            }

            If ((RES3 != 0x01))
            {
                Return (0x01)
            }

            If ((RES4 != 0x01))
            {
                Return (0x01)
            }

            /************************************************* */
            /* (BYT1) Bit1 ->0 and (BYT2)Bit2 -> 0 condition */
            BYT1 = 0x00
            BYT2 = 0x00
            Local0 = (BYT1 ^ BYT2) /* \XORD.TEST.BYT2 */
            RBYT = Local0
            If ((RBYT != 0x00))
            {
                Return (0x01)
            }

            /* (BYT1) Bit1 ->1 and (BYT2)Bit2 -> 1 condition */

            BYT1 = 0xFF
            BYT2 = 0xFF
            Local0 = (BYT1 ^ BYT2) /* \XORD.TEST.BYT2 */
            RBYT = Local0
            If ((RBYT != 0x00))
            {
                Return (0x01)
            }

            /* (BYT1) Bit1 ->1 and (BYT)Bit2 -> 0 condition */

            BYT1 = 0x55
            BYT2 = 0xAA
            Local0 = (BYT1 ^ BYT2) /* \XORD.TEST.BYT2 */
            RBYT = Local0
            If ((RBYT != 0xFF))
            {
                Return (0x01)
            }

            /*(BYT1) Bit1 ->0 and (BYT2)Bit2 -> 1 condition */

            BYT1 = 0xAA
            BYT2 = 0x55
            Local0 = (BYT1 ^ BYT2) /* \XORD.TEST.BYT2 */
            RBYT = Local0
            If ((RBYT != 0xFF))
            {
                Return (0x01)
            }

            BYT1 = 0x12
            BYT2 = 0xED
            Local0 = (BYT1 ^ BYT2) /* \XORD.TEST.BYT2 */
            RBYT = Local0
            If ((RBYT != 0xFF))
            {
                Return (0x01)
            }

            /* Store known values for checking later */

            BYT1 = 0x12
            If ((BYT1 != 0x12))
            {
                Return (0x01)
            }

            BYT2 = 0xFE
            If ((BYT2 != 0xFE))
            {
                Return (0x01)
            }

            RBYT = 0xAB
            If ((RBYT != 0xAB))
            {
                Return (0x01)
            }

            /************************************************ */
            /* (WRD1) Bit1 ->0 and (WRD2)Bit2 -> 0 condition */
            WRD1 = 0x00
            WRD2 = 0x00
            RWRD = (WRD1 ^ WRD2) /* \XORD.TEST.WRD2 */
            If ((RWRD != 0x00))
            {
                Return (0x01)
            }

            /* (WRD1) Bit1 ->1 and (WRD2)Bit2 -> 1 condition */

            WRD1 = 0xFFFF
            WRD2 = 0xFFFF
            RWRD = (WRD1 ^ WRD2) /* \XORD.TEST.WRD2 */
            If ((RWRD != 0x00))
            {
                Return (0x01)
            }

            /* (WRD1) Bit1 ->1 and (WRD2)Bit2 -> 0 condition */

            WRD1 = 0x5555
            WRD2 = 0xAAAA
            RWRD = (WRD1 ^ WRD2) /* \XORD.TEST.WRD2 */
            If ((RWRD != 0xFFFF))
            {
                Return (0x01)
            }

            /*(WRD1) Bit1 ->0 and (WRD2)Bit2 -> 1 condition */

            WRD1 = 0xAAAA
            WRD2 = 0x5555
            RWRD = (WRD1 ^ WRD2) /* \XORD.TEST.WRD2 */
            If ((RWRD != 0xFFFF))
            {
                Return (0x01)
            }

            WRD1 = 0x1234
            WRD2 = 0xEDCB
            RWRD = (WRD1 ^ WRD2) /* \XORD.TEST.WRD2 */
            If ((RWRD != 0xFFFF))
            {
                Return (0x01)
            }

            /* Store known values for checking later */

            WRD1 = 0x1234
            If ((WRD1 != 0x1234))
            {
                Return (0x01)
            }

            WRD2 = 0xFEDC
            If ((WRD2 != 0xFEDC))
            {
                Return (0x01)
            }

            RWRD = 0x87AB
            If ((RWRD != 0x87AB))
            {
                Return (0x01)
            }

            /*************************************************** */
            /* (DWD1) Bit1 ->0 and (DWD2)Bit2 -> 0 condition */
            DWD1 = 0x00
            DWD2 = 0x00
            RDWD = (DWD1 ^ DWD2) /* \XORD.TEST.DWD2 */
            If ((RDWD != 0x00))
            {
                Return (0x01)
            }

            /* (DWD1) Bit1 ->1 and (DWD2)Bit2 -> 1 condition */

            DWD1 = 0xFFFFFFFF
            DWD2 = 0xFFFFFFFF
            RDWD = (DWD1 ^ DWD2) /* \XORD.TEST.DWD2 */
            If ((RDWD != 0x00))
            {
                Return (0x01)
            }

            /* (DWD1) Bit1 ->1 and (DWD2)Bit2 -> 0 condition */

            DWD1 = 0x55555555
            DWD2 = 0xAAAAAAAA
            RDWD = (DWD1 ^ DWD2) /* \XORD.TEST.DWD2 */
            If ((RDWD != 0xFFFFFFFF))
            {
                Return (0x01)
            }

            /*(DWD1) Bit1 ->0 and (DWD2)Bit2 -> 1 condition */

            DWD1 = 0xAAAAAAAA
            DWD2 = 0x55555555
            RDWD = (DWD1 ^ DWD2) /* \XORD.TEST.DWD2 */
            If ((RDWD != 0xFFFFFFFF))
            {
                Return (0x01)
            }

            /* (DWD1) Bit1 ->1 and (DWD2)Bit2 -> 0 condition */

            DWD1 = 0x12345678
            DWD2 = 0xEDCBA987
            RDWD = (DWD1 ^ DWD2) /* \XORD.TEST.DWD2 */
            If ((RDWD != 0xFFFFFFFF))
            {
                Return (0x01)
            }

            DWD1 = 0x12345678
            If ((DWD1 != 0x12345678))
            {
                Return (0x01)
            }

            DWD2 = 0xFEDCBA98
            If ((DWD2 != 0xFEDCBA98))
            {
                Return (0x01)
            }

            RDWD = 0x91827364
            If ((RDWD != 0x91827364))
            {
                Return (0x01)
            }

            /***************************************************** */
            /* Check the stored single bits */
            If ((RES1 != 0x01))
            {
                Return (0x01)
            }

            If ((RES2 != 0x01))
            {
                Return (0x01)
            }

            If ((RES3 != 0x01))
            {
                Return (0x01)
            }

            If ((RES4 != 0x01))
            {
                Return (0x01)
            }

            /* Change all of the single bit fields to zero */

            RES1 = 0x00
            RES2 = 0x00
            RES3 = 0x00
            RES4 = 0x00
            /* Now, check all of the fields */
            /* Byte */
            If ((BYT1 != 0x12))
            {
                Return (0x01)
            }

            If ((BYT2 != 0xFE))
            {
                Return (0x01)
            }

            If ((RBYT != 0xAB))
            {
                Return (0x01)
            }

            /* Word */

            If ((WRD1 != 0x1234))
            {
                Return (0x01)
            }

            If ((WRD2 != 0xFEDC))
            {
                Return (0x01)
            }

            If ((RWRD != 0x87AB))
            {
                Return (0x01)
            }

            /* Dword */

            If ((DWD1 != 0x12345678))
            {
                Return (0x01)
            }

            If ((DWD2 != 0xFEDCBA98))
            {
                Return (0x01)
            }

            If ((RDWD != 0x91827364))
            {
                Return (0x01)
            }

            /* Bits */

            If ((RES1 != 0x00))
            {
                Return (0x01)
            }

            If ((RES2 != 0x00))
            {
                Return (0x01)
            }

            If ((RES3 != 0x00))
            {
                Return (0x01)
            }

            If ((RES4 != 0x00))
            {
                Return (0x01)
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  XORD */

    /* */
    /* test CrBytFld.asl */
    /* */
    /*  CrBytFld test */
    /*      Test for CreateByteField. */
    /*      Tests creating byte field overlay of buffer stored in Local0. */
    /*      Tests need to be added for Arg0 and Name buffers. */
    /* */
    Device (CRBF)
    {
        /*  Test device name */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ CrBytFld Test"
            /*  Local0 is unitialized buffer with 4 elements */

            Local0 = Buffer (0x04){}
            /*  create Byte Field named BF0 based on Local0 element 0 */

            CreateByteField (Local0, 0x00, BF0)
            /*  validate CreateByteField did not alter Local0 */

            Local1 = ObjectType (Local0) /*  Local1 = Local0 object type */
            If ((Local1 != 0x03))  /*  Buffer object type value is 3 */
            {
                Return (0x02)
            }

            /*  store something into BF0 */

            BF0 = 0x01
            /*  validate Store did not alter Local0 object type */

            Local1 = ObjectType (Local0) /*  Local1 = Local0 object type */
            If ((Local1 != 0x03))  /*  Buffer object type value is 3 */
            {
                Return (0x03)
            }

            /*  verify that the Store into BF0 was successful */

            If ((BF0 != 0x01))
            {
                Return (0x04)
            }

            /*  create Byte Field named BF1 based on Local0 element 1 */

            CreateByteField (Local0, 0x01, BF1)
            /*  validate CreateByteField did not alter Local0 */

            Local1 = ObjectType (Local0) /*  Local1 = Local0 object type */
            If ((Local1 != 0x03))  /*  Buffer object type value is 3 */
            {
                Return (0x0A)
            }

            /*  store something into BF1 */

            BF1 = 0x05
            /*  validate Store did not alter Local0 object type */

            Local1 = ObjectType (Local0) /*  Local1 = Local0 object type */
            If ((Local1 != 0x03))  /*  Buffer object type value is 3 */
            {
                Return (0x0B)
            }

            /*  verify that the Store into BF1 was successful */

            If ((BF1 != 0x05))
            {
                Return (0x0C)
            }

            /*  verify that the Store into BF1 did not alter BF0 */

            If ((BF0 != 0x01))
            {
                Return (0x0D)
            }

            /*  store something into BF0 */

            BF0 = 0xFFFF
            /*  verify that the Store into BF0 was successful */

            If ((BF0 != 0xFF))
            {
                Return (0x14)
            }

            /*  verify that the Store into BF0 did not alter BF1 */

            If ((BF1 != 0x05))
            {
                Return (0x15)
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  CRBF */

    /* */
    /* test IndexOp4.asl */
    /* */
    /*  IndexOp4 test */
    /*      This is just a subset of the many RegionOp/Index Field test cases. */
    /*      Tests access of index fields smaller than 8 bits. */
    /* */
    Device (IDX4)
    {
        /*  Test device name */
        /*  MADM:   Misaligned Dynamic RAM SystemMemory OperationRegion */
        /*          Tests OperationRegion memory access using misaligned BYTE, */
        /*          WORD, and DWORD field element accesses. Validation is performed */
        /*          using both misaligned field entries and aligned field entries. */
        /* */
        /*          MADM returns 0 if all test cases pass or non-zero identifying */
        /*          the failing test case for debug purposes. This non-zero numbers */
        /*          are not guaranteed to be in perfect sequence (i.e., test case */
        /*          index), but are guaranteed to be unique so the failing test */
        /*          case can be uniquely identified. */
        /* */
        Method (MADM, 1, Serialized)
        {
            /*  MADM:   Misaligned Dynamic RAM SystemMemory OperationRegion */

            OperationRegion (RAM, SystemMemory, Arg0, 0x0100)
            Field (RAM, DWordAcc, NoLock, Preserve)
            {
                /*  aligned field definition (for verification) */

                DWD0, /*  aligned DWORD field */   32, 
                DWD1,      /*  aligned DWORD field */   32
            }

            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                /*  bit access field definition */

                BIT0,      /*  single bit field entry */   1, 
                BIT1,      /*  single bit field entry */   1, 
                BIT2,      /*  single bit field entry */   1, 
                BIT3,      /*  single bit field entry */   1, 
                BIT4,      /*  single bit field entry */   1, 
                BIT5,      /*  single bit field entry */   1, 
                BIT6,      /*  single bit field entry */   1, 
                BIT7,      /*  single bit field entry */   1, 
                BIT8,      /*  single bit field entry */   1, 
                BIT9,      /*  single bit field entry */   1, 
                BITA,      /*  single bit field entry */   1, 
                BITB,      /*  single bit field entry */   1, 
                BITC,      /*  single bit field entry */   1, 
                BITD,      /*  single bit field entry */   1, 
                BITE,      /*  single bit field entry */   1, 
                BITF,      /*  single bit field entry */   1, 
                BI10,      /*  single bit field entry */   1, 
                BI11,      /*  single bit field entry */   1, 
                BI12,      /*  single bit field entry */   1, 
                BI13,      /*  single bit field entry */   1, 
                BI14,      /*  single bit field entry */   1, 
                BI15,      /*  single bit field entry */   1, 
                BI16,      /*  single bit field entry */   1, 
                BI17,      /*  single bit field entry */   1, 
                BI18,      /*  single bit field entry */   1, 
                BI19,      /*  single bit field entry */   1, 
                BI1A,      /*  single bit field entry */   1, 
                BI1B,      /*  single bit field entry */   1, 
                BI1C,      /*  single bit field entry */   1, 
                BI1D,      /*  single bit field entry */   1, 
                BI1E,      /*  single bit field entry */   1, 
                BI1F,       /*  single bit field entry */   1
            }   /*  bit access field definition */

            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                /*  two-bit access field definition */

                B2_0,      /*  single bit field entry */   2, 
                B2_1,      /*  single bit field entry */   2, 
                B2_2,      /*  single bit field entry */   2, 
                B2_3,      /*  single bit field entry */   2, 
                B2_4,      /*  single bit field entry */   2, 
                B2_5,      /*  single bit field entry */   2, 
                B2_6,      /*  single bit field entry */   2, 
                B2_7,      /*  single bit field entry */   2, 
                B2_8,      /*  single bit field entry */   2, 
                B2_9,      /*  single bit field entry */   2, 
                B2_A,      /*  single bit field entry */   2, 
                B2_B,      /*  single bit field entry */   2, 
                B2_C,      /*  single bit field entry */   2, 
                B2_D,      /*  single bit field entry */   2, 
                B2_E,      /*  single bit field entry */   2, 
                B2_F,       /*  single bit field entry */   2
            }   /*  bit access field definition */

            /*  initialize memory contents using aligned field entries */

            DWD0 = 0x5AA55AA5
            DWD1 = 0x5AA55AA5
            /*  set memory contents to known values using misaligned field entries */

            BIT0 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BIT0 != 0x00))
            {
                Return (0x01)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55AA4))
            {
                Return (0x02)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT1 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BIT1 != 0x01))
            {
                Return (0x03)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55AA6))
            {
                Return (0x04)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT2 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BIT2 != 0x00))
            {
                Return (0x05)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55AA2))
            {
                Return (0x06)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT3 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BIT3 != 0x01))
            {
                Return (0x07)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55AAA))
            {
                Return (0x08)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT4 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BIT4 != 0x01))
            {
                Return (0x09)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55ABA))
            {
                Return (0x0A)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT5 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BIT5 != 0x00))
            {
                Return (0x0B)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55A9A))
            {
                Return (0x0C)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT6 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BIT6 != 0x01))
            {
                Return (0x0D)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55ADA))
            {
                Return (0x0E)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT7 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BIT7 != 0x00))
            {
                Return (0x0F)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55A5A))
            {
                Return (0x10)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT8 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BIT8 != 0x01))
            {
                Return (0x11)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55B5A))
            {
                Return (0x12)
            }

            /*  set memory contents to known values using misaligned field entries */

            BIT9 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BIT9 != 0x00))
            {
                Return (0x13)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA5595A))
            {
                Return (0x14)
            }

            /*  set memory contents to known values using misaligned field entries */

            BITA = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BITA != 0x01))
            {
                Return (0x15)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA55D5A))
            {
                Return (0x16)
            }

            /*  set memory contents to known values using misaligned field entries */

            BITB = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BITB != 0x00))
            {
                Return (0x17)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA5555A))
            {
                Return (0x18)
            }

            /*  set memory contents to known values using misaligned field entries */

            BITC = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BITC != 0x00))
            {
                Return (0x19)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA5455A))
            {
                Return (0x1A)
            }

            /*  set memory contents to known values using misaligned field entries */

            BITD = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BITD != 0x01))
            {
                Return (0x1B)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA5655A))
            {
                Return (0x1C)
            }

            /*  set memory contents to known values using misaligned field entries */

            BITE = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BITE != 0x00))
            {
                Return (0x1D)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA5255A))
            {
                Return (0x1E)
            }

            /*  set memory contents to known values using misaligned field entries */

            BITF = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BITF != 0x01))
            {
                Return (0x1F)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA5A55A))
            {
                Return (0x20)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI10 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI10 != 0x00))
            {
                Return (0x21)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA4A55A))
            {
                Return (0x22)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI11 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI11 != 0x01))
            {
                Return (0x23)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA6A55A))
            {
                Return (0x24)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI12 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI12 != 0x00))
            {
                Return (0x25)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AA2A55A))
            {
                Return (0x26)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI13 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI13 != 0x01))
            {
                Return (0x27)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5AAAA55A))
            {
                Return (0x28)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI14 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI14 != 0x01))
            {
                Return (0x29)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5ABAA55A))
            {
                Return (0x2A)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI15 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI15 != 0x00))
            {
                Return (0x2B)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5A9AA55A))
            {
                Return (0x2C)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI16 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI16 != 0x01))
            {
                Return (0x2D)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5ADAA55A))
            {
                Return (0x2E)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI17 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI17 != 0x00))
            {
                Return (0x2F)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5A5AA55A))
            {
                Return (0x30)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI18 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI18 != 0x01))
            {
                Return (0x31)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5B5AA55A))
            {
                Return (0x32)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI19 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI19 != 0x00))
            {
                Return (0x33)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x595AA55A))
            {
                Return (0x34)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI1A = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI1A != 0x01))
            {
                Return (0x35)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x5D5AA55A))
            {
                Return (0x36)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI1B = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI1B != 0x00))
            {
                Return (0x37)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x555AA55A))
            {
                Return (0x38)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI1C = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI1C != 0x00))
            {
                Return (0x39)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x455AA55A))
            {
                Return (0x3A)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI1D = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI1D != 0x01))
            {
                Return (0x3B)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x655AA55A))
            {
                Return (0x3C)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI1E = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((BI1E != 0x00))
            {
                Return (0x3D)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x255AA55A))
            {
                Return (0x3E)
            }

            /*  set memory contents to known values using misaligned field entries */

            BI1F = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((BI1F != 0x01))
            {
                Return (0x3F)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA55A))
            {
                Return (0x40)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_0 = 0x03
            /*  verify memory contents using misaligned field entries */

            If ((B2_0 != 0x03))
            {
                Return (0x41)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA55B))
            {
                Return (0x42)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_1 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((B2_1 != 0x01))
            {
                Return (0x43)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA557))
            {
                Return (0x44)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_2 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((B2_2 != 0x00))
            {
                Return (0x45)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA547))
            {
                Return (0x46)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_3 = 0x03
            /*  verify memory contents using misaligned field entries */

            If ((B2_3 != 0x03))
            {
                Return (0x47)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA5C7))
            {
                Return (0x48)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_4 = 0x03
            /*  verify memory contents using misaligned field entries */

            If ((B2_4 != 0x03))
            {
                Return (0x49)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA7C7))
            {
                Return (0x4A)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_5 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((B2_5 != 0x00))
            {
                Return (0x4B)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55AA3C7))
            {
                Return (0x4C)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_6 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((B2_6 != 0x01))
            {
                Return (0x4D)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55A93C7))
            {
                Return (0x4E)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_7 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((B2_7 != 0x01))
            {
                Return (0x4F)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55A53C7))
            {
                Return (0x50)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_8 = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((B2_8 != 0x00))
            {
                Return (0x51)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55853C7))
            {
                Return (0x52)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_9 = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((B2_9 != 0x01))
            {
                Return (0x53)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA55453C7))
            {
                Return (0x54)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_A = 0x02
            /*  verify memory contents using misaligned field entries */

            If ((B2_A != 0x02))
            {
                Return (0x55)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA56453C7))
            {
                Return (0x56)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_B = 0x02
            /*  verify memory contents using misaligned field entries */

            If ((B2_B != 0x02))
            {
                Return (0x57)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA5A453C7))
            {
                Return (0x58)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_C = 0x03
            /*  verify memory contents using misaligned field entries */

            If ((B2_C != 0x03))
            {
                Return (0x59)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xA7A453C7))
            {
                Return (0x5A)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_D = 0x03
            /*  verify memory contents using misaligned field entries */

            If ((B2_D != 0x03))
            {
                Return (0x5B)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0xAFA453C7))
            {
                Return (0x5C)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_E = 0x01
            /*  verify memory contents using misaligned field entries */

            If ((B2_E != 0x01))
            {
                Return (0x5D)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x9FA453C7))
            {
                Return (0x5E)
            }

            /*  set memory contents to known values using misaligned field entries */

            B2_F = 0x00
            /*  verify memory contents using misaligned field entries */

            If ((B2_F != 0x00))
            {
                Return (0x5F)
            }

            /*  verify memory contents using aligned field entries */

            If ((DWD0 != 0x1FA453C7))
            {
                Return (0x60)
            }

            Return (0x00)  /*  pass */
        }   /*  MADM:   Misaligned Dynamic RAM SystemMemory OperationRegion */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ IndexOp4 Test"
            /*  MADM (Misaligned Dynamic RAM SystemMemory OperationRegion) arguments: */
            /*      Arg0    --  SystemMemory OperationRegion base address */
            Local0 = MADM (0x00800000)
            If ((Local0 != 0x00))      /*  MADM returns zero if successful */
            {
                Return (Local0)
            }       /*  failure:    return MADM error code */

            Return (Local0)
        }   /*  TEST */
    }   /*  IDX4 */

    /* */
    /* test Event.asl */
    /* */
    /*  EventOp, ResetOp, SignalOp, and WaitOp test cases. */
    /* */
    Device (EVNT)
    {
        Event (EVNT)    /*  event synchronization object */
        Method (TEVN, 1, NotSerialized)
        {
            /*  TEVN control method to test ResetOp, SignalOp, and WaitOp */
            /*  reset EVNT to initialization (zero) state */
            Reset (EVNT)
            /*  prime EVNT with two outstanding signals */

            Signal (EVNT)
            Signal (EVNT)
            /*  acquire existing signal */

            Local0 = Wait (EVNT, Arg0)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x21)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 != 0x00))  /*  Number is type 1 */
            {
                Return (0x22)
            }       /*  timeout occurred without acquiring signal */

            Debug = "Acquire 1st existing signal PASS"
            /*  acquire existing signal */

            Local0 = Wait (EVNT, Arg0)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x31)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 != 0x00))  /*  Number is type 1 */
            {
                Return (0x32)
            }       /*  timeout occurred without acquiring signal */

            Debug = "Acquire 2nd existing signal PASS"
            /*  ensure WaitOp timeout test cases do not hang */

            If ((Arg0 == 0xFFFF))
            {
                Arg0 = 0xFFFE
            }

            /*  acquire non-existing signal */

            Local0 = Wait (EVNT, Arg0)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x41)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 == 0x00))     /*  Number is type 1 */
            {
                Return (0x42)
            }       /*  non-existant signal was acquired */

            Debug = "Acquire signal timeout PASS"
            /*  prime EVNT with two outstanding signals */

            Signal (EVNT)
            Signal (EVNT)
            /*  reset EVNT to initialization (zero) state */

            Reset (EVNT)
            /*  acquire non-existing signal */

            Local0 = Wait (EVNT, Arg0)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x51)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 == 0x00))     /*  Number is type 1 */
            {
                Return (0x52)
            }       /*  non-existant signal was acquired */

            Debug = "Reset signal PASS"
            /*  acquire non-existing signal using Lvalue timeout */

            Local0 = Wait (EVNT, Zero)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x61)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 == 0x00))     /*  Number is type 1 */
            {
                Return (0x62)
            }       /*  non-existant signal was acquired */

            Debug = "Zero Lvalue PASS"
            /*  acquire non-existing signal using Lvalue timeout */

            Local0 = Wait (EVNT, One)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x71)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 == 0x00))     /*  Number is type 1 */
            {
                Return (0x72)
            }       /*  non-existant signal was acquired */

            Debug = "One Lvalue PASS"
            /*  Lvalue Event test cases */
            /* ILLEGAL SOURCE OPERAND        Store (EVNT, Local2) */
            /*  validate Local2 is an Event */
            Local1 = ObjectType (EVNT)
            If ((Local1 != 0x07))  /*  Event is type 7 */
            {
                Return (0x81)
            }       /*  Local1 indicates Local0 is not a Number */

            /*  reset EVNT to initialization (zero) state */

            Reset (EVNT)
            /*  prime EVNT with two outstanding signals */

            Signal (EVNT)
            /*  acquire existing signal */

            Local0 = Wait (EVNT, Arg0)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x82)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 != 0x00))  /*  Number is type 1 */
            {
                Return (0x83)
            }       /*  timeout occurred without acquiring signal */

            Debug = "Acquire Lvalue existing signal PASS"
            /*  acquire non-existing signal */

            Local0 = Wait (EVNT, Arg0)
            /*  validate Local0 is a Number */

            Local1 = ObjectType (Local0)
            If ((Local1 != 0x01))  /*  Number is type 1 */
            {
                Return (0x84)
            }       /*  Local1 indicates Local0 is not a Number */

            If ((Local0 == 0x00))     /*  Number is type 1 */
            {
                Return (0x85)
            }       /*  non-existant signal was acquired */

            Debug = "Acquire Lvalue signal timeout PASS"
            Return (0x00)  /*  success */
        }   /*  TEVN control method to test ResetOp, SignalOp, and WaitOp */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ Event Test"
            Local0 = TEVN (0x64)
            Return (Local0)
        }   /*  TEST */
    }   /*  EVNT */

    /* */
    /* test SizeOfLv.asl */
    /* */
    /*  Test for SizeOf (Lvalue) */
    /* */
    /*  This next section will contain the packages that the SizeOfOp will be */
    /*  exercised on. The first one, PKG0, is a regular package of 3 elements. */
    /*  The 2nd one, PKG1, is a nested package with 3 packages inside it, each */
    /*  with 3 elements. It is expected that SizeOf operator will return the */
    /*  same value for these two packages since they both have 3 elements. The */
    /*  final package, PKG2, has 4 elements and the SizeOf operator is expected */
    /*  to return different results for this package. */
    Name (PKG0, Package (0x03)
    {
        0x0123, 
        0x4567, 
        0x89AB
    })   /*  PKG0 */
    Name (PKG1, Package (0x03)
    {
        Package (0x03)
        {
            0x0123, 
            0x4567, 
            0x89AB
        }, 

        Package (0x03)
        {
            0xCDEF, 
            0xFEDC, 
            0xBA98
        }, 

        Package (0x03)
        {
            0x7654, 
            0x3210, 
            0x1234
        }
    })   /*  PKG1 */
    Name (PKG2, Package (0x04)
    {
        0x0123, 
        0x4567, 
        0x89AB, 
        0x8888
    })   /*  PKG2 */
    Name (PKG3, Package (0x05)
    {
        0x0123, 
        0x4567, 
        0x89AB, 
        0x8888, 
        0x7777
    })   /*  PKG3 */
    /*  End Packages    ********************************************************** */
    /*  The following section will declare the data strings that will be used to */
    /*  exercise the SizeOf operator. STR0 and STR1 are expected to be equal, */
    /*  STR2 is expected to have a different SizeOf value than STR0 and STR1. */
    Name (STR0, "ACPI permits very flexible methods of expressing a system")
    Name (STR1, "MIKE permits very flexible methods of expressing a system")
    Name (STR2, "Needless to say, Mike and ACPI are frequently at odds")
    /*  This string is being made in case we want to do a SizeOf comparison */
    /*  between strings and packages or buffers */
    Name (STR3, "12345")
    /*  End Strings     ********************************************************** */
    /*  The following section will declare the buffers that will be used to exercise */
    /*  the SizeOf operator. */
    Name (BUF0, Buffer (0x0A){})
    Name (BUF1, Buffer (0x0A){})
    Name (BUF2, Buffer (0x08){})
    Name (BUF3, Buffer (0x05){})
    /*  End Buffers     ********************************************************** */

    Device (SZLV)
    {
        Method (CMPR, 2, NotSerialized)
        {
            /*  CMPR is passed two arguments. If unequal, return 1 to indicate */
            /*  that, otherwise return 0 to indicate SizeOf each is equal. */
            Local0 = 0x01
            If ((SizeOf (Arg0) == SizeOf (Arg1)))
            {
                Local0 = 0x00
            }

            Return (Local0)
        }   /*  CMPR */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ SizeOfLv Test"
            /*  TBD:    SizeOf ("string") */
            /*          SizeOf (Buffer) */
            /*          SizeOf (Package) */
            /*          SizeOf (String) */
            /*          SizeOf (STR0)   --  where Name (STR0,...) -- lot's of cases */
            /*              buffer, string, package, */
            /*          SizeOf (METH) -- where METH control method returns */
            /*              buffer, string, package, */
            /*  TBD:    SLOC [SizeOf (Local0)] -- dup SARG */
            /*  Compare the elements that we expect to be the same. Exit out with an error */
            /*  code on the first failure. */
            If ((0x00 != CMPR (STR0, STR1)))
            {
                Return (0x01)
            }

            If ((0x00 != CMPR (STR3, BUF3)))
            {
                Return (0x02)
            }

            If ((0x00 != CMPR (STR3, PKG3)))
            {
                Return (0x03)
            }

            /*  In the following section, this test will cover the SizeOf */
            /*  operator for Local values. */
            /*  In this case, both Local0 and Local1 should have the same Size */
            Local0 = STR0 /* \STR0 */
            Local1 = STR1 /* \STR1 */
            If ((SizeOf (Local0) != SizeOf (Local1)))
            {
                Return (0x04)
            }

            /*  Now create a case where Local0 and Local1 are different */

            Local1 = STR2 /* \STR2 */
            If ((SizeOf (Local0) == SizeOf (Local1)))
            {
                Return (0x05)
            }

            /*  Finally, check for the return of SizeOf for a known Buffer. Just */
            /*  in case we magically pass above cases due to all Buffers being Zero */
            /*  bytes in size, or Infinity, etc. */
            If ((0x05 != SizeOf (BUF3)))
            {
                Return (0x06)
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  SZLV */

    /* */
    /* test BytField.asl */
    /* */
    /*  BytField test */
    /*      This is just a subset of the many RegionOp/Index Field test cases. */
    /*      Tests access of TBD. */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Device (BYTF)
        {
            /*  Test device name */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ BytField Test"
                Return (\_TZ.C19B.RSLT)
            }   /*  TEST */
        }   /*  BYTF */

        Device (C005)
        {
            /*  Device C005 */

            Device (C013)
            {
                        /*  Device C013 */
            }   /*  Device C013 */
        }   /*  Device C005 */

        Method (C115, 0, NotSerialized)
        {
            /*  C115 control method */

            Acquire (\_GL, 0xFFFF)
            Local0 = \_SB.C005.C013.C058.C07E
            Release (\_GL)
            Local0 &= 0x10
            Store ((Local0 >> 0x04), Local1)
            If ((Local1 == 0x00))
            {
                Return (0x01)
            }
            Else
            {
                Return (0x00)
            }
        }   /*  C115 control method */
    }   /*  _SB system bus */

    OperationRegion (C018, SystemIO, 0x5028, 0x04)
    Field (C018, AnyAcc, NoLock, Preserve)
    {
        /*  Field overlaying C018 */

        C019,   32
    }   /*  Field overlaying C018 */

    OperationRegion (C01A, SystemIO, 0x5030, 0x04)
    Field (C01A, ByteAcc, NoLock, Preserve)
    {
        /*  Field overlaying C01A */

        C01B,   8, 
        C01C,   8, 
        C01D,   8, 
        C01E,   8
    }   /*  Field overlaying C01A */

    Mutex (\C01F, 0x00)
    Name (\C020, 0x00)
    Name (\C021, 0x00)
    Method (\C022, 0, NotSerialized)
    {
        /*  \C022 control method */

        Acquire (\C01F, 0xFFFF)
        If ((\C021 == 0x00))
        {
            Local0 = C019 /* \C019 */
            Local0 &= 0xFFFEFFFE
            C019 = Local0
            \C021++
        }

        Release (\C01F)
    }   /*  \C022 control method */

    Scope (\_SB.C005.C013)
    {
        /*  Scope \_SB.C005.C013 */

        Device (C058)
        {
            /*  Device C058 */

            Name (_HID, "*PNP0A06")  // _HID: Hardware ID
            OperationRegion (C059, SystemIO, 0xE0, 0x02)
            Field (C059, ByteAcc, NoLock, Preserve)
            {
                /*  Field overlaying C059 */

                C05A,   8, 
                C05B,   8
            }   /*  Field overlaying C059 */

            OperationRegion (C05C, SystemIO, 0xE2, 0x02)
            Field (C05C, ByteAcc, NoLock, Preserve)
            {
                /*  Field overlaying C05C */

                C05D,   8, 
                C05E,   8
            }   /*  Field overlaying C05C */

            IndexField (C05D, C05E, ByteAcc, NoLock, Preserve)
            {
                Offset (0x82), 
                /*  IndexField overlaying C05D/C05E */

                C05F,   8, 
                C060,   8, 
                C061,   8, 
                C062,   8, 
                C063,   8, 
                C064,   8, 
                C065,   8, 
                C066,   8, 
                C067,   8, 
                C068,   8, 
                C069,   8, 
                C06A,   8, 
                C06B,   8, 
                C06C,   8, 
                C06D,   8, 
                C06E,   8, 
                Offset (0xA0), 
                C06F,   8, 
                C070,   8, 
                C071,   8, 
                C072,   8, 
                C073,   8, 
                C074,   8, 
                C075,   8, 
                C076,   8, 
                C077,   8, 
                C078,   8, 
                C079,   8, 
                C07A,   8, 
                C07B,   8, 
                C07C,   8, 
                C07D,   8, 
                C07E,   8
            }   /*  IndexField overlaying C05D/C05E */

            OperationRegion (C07F, SystemIO, 0xE4, 0x02)
            Field (C07F, ByteAcc, NoLock, Preserve)
            {
                /*  Field overlaying C07F */

                C080,   8, 
                C081,   8
            }   /*  Field overlaying C07F */

            OperationRegion (C082, SystemIO, 0xE0, 0x01)
            Field (C082, ByteAcc, NoLock, Preserve)
            {
                /*  Field overlaying C082 */

                C083,   8
            }   /*  Field overlaying C082 */

            OperationRegion (C084, SystemIO, 0xFF, 0x01)
            Field (C084, ByteAcc, NoLock, Preserve)
            {
                /*  Field overlaying C084 */

                C085,   8
            }   /*  Field overlaying C084 */

            OperationRegion (C086, SystemIO, 0xFD, 0x01)
            Field (C086, ByteAcc, NoLock, Preserve)
            {
                /*  Field overlaying C086 */

                C087,   8
            }   /*  Field overlaying C086 */

            Mutex (C088, 0x00)
            Mutex (C089, 0x00)
            Mutex (C08A, 0x00)
            Mutex (C08B, 0x00)
            Mutex (C08C, 0x00)
            Mutex (C08D, 0x00)
            Name (C08E, 0xFFFFFFFD)
            Name (C08F, 0x00)
            Method (C0AA, 4, NotSerialized)
            {
                /*  C0AA control method */

                Local7 = Buffer (0x04){}
                CreateByteField (Local7, 0x00, C0AB)
                CreateByteField (Local7, 0x01, C0AC)
                CreateByteField (Local7, 0x02, C0AD)
                CreateByteField (Local7, 0x03, C0AE)
                Acquire (^C08B, 0xFFFF)
                Acquire (\_GL, 0xFFFF)
                \C022 ()
                \_SB.C005.C013.C058.C06B = 0x01
                While ((0x00 != \_SB.C005.C013.C058.C06B))
                {
                    Stall (0x64)
                }

                \_SB.C005.C013.C058.C06E = Arg3
                \_SB.C005.C013.C058.C06D = Arg2
                \_SB.C005.C013.C058.C06C = Arg1
                \_SB.C005.C013.C058.C06B = Arg0
                While ((0x00 != \_SB.C005.C013.C058.C06B))
                {
                    Stall (0x64)
                }

                C0AB = \_SB.C005.C013.C058.C06E
                C0AC = \_SB.C005.C013.C058.C06D
                C0AD = \_SB.C005.C013.C058.C06C
                C0AE = \_SB.C005.C013.C058.C06B
                If ((Arg0 != 0x17))
                {
                    \_SB.C005.C013.C058.C06B = 0x02
                    Stall (0x64)
                }

                Release (\_GL)
                Release (^C08B)
                Return (Local7)
            }   /*  C0AA control method */
        }   /*  Device C058 */
    }   /*  Scope \_SB.C005.C013 */

    Scope (\_TZ)
    {
        /*  \_TZ thermal zone scope */

        Name (C18B, Package (0x02)
        {
            Package (0x02)
            {
                Package (0x05)
                {
                    0x05AC, 
                    0x0CD2, 
                    0x0D68, 
                    0x0DE0, 
                    0x0E4E
                }, 

                Package (0x05)
                {
                    0x0D04, 
                    0x0D9A, 
                    0x0DFE, 
                    0x0E80, 
                    0x0FA2
                }
            }, 

            Package (0x02)
            {
                Package (0x05)
                {
                    0x05AC, 
                    0x0CD2, 
                    0x0D68, 
                    0x0DE0, 
                    0x0E4E
                }, 

                Package (0x05)
                {
                    0x0D04, 
                    0x0D9A, 
                    0x0DFE, 
                    0x0E80, 
                    0x0FA2
                }
            }
        })  /*  C18B */
        Name (C18C, Package (0x02)
        {
            Package (0x02)
            {
                Package (0x03)
                {
                    0x64, 
                    0x4B, 
                    0x32
                }, 

                Package (0x03)
                {
                    0x64, 
                    0x4B, 
                    0x32
                }
            }
        })  /*  C81C */
        Name (C18D, 0x00)
        Name (C18E, 0x00)
        Name (C18F, 0x00)
        Name (C190, 0x00)
        Name (C191, 0x03)
        Name (C192, 0x00)
        Name (C193, 0x01)
        Name (C194, 0x02)
        Mutex (C195, 0x00)
        Name (C196, 0x01)
        Name (C197, 0x0B9C)
        Name (C198, 0x0B9C)
        Name (C199, 0xFFFFFFFD)
        Name (C19A, 0x00)
        Device (C19B)
        {
            /*  Device C19B */

            Name (RSLT, 0x00)  /*  default to zero */
            Method (XINI, 0, NotSerialized)
            {
                /*  _INI control method (Uses Global Lock -- can't run under AcpiExec) */

                C19A = \_SB.C115 ()
                \_TZ.C19C._SCP (0x00)
                Local1 = (0x0EB2 - 0x0AAC)   /*  Local1 = AACh - EB2h */
                Divide (Local1, 0x0A, Local0, Local2) /*  Local0 = Local1 / 10 */
                /*  Local2 = Local1 % 10 */

                \_SB.C005.C013.C058.C0AA (0x0E, Local2, 0x00, 0x00)
                C18D = DerefOf (DerefOf (\_TZ.C18C [C19A]) [0x00])
                C18E = DerefOf (DerefOf (\_TZ.C18C [C19A]) [0x01])
                C18F = DerefOf (DerefOf (\_TZ.C18C [C19A]) [0x02])
                RSLT = 0x01 /*  set RSLT to 1 if _INI control method completes */
            }   /*  _INI control method */
                /*  PowerResource (C19D) {...} */
        }   /*  Device C19B */

        ThermalZone (C19C)
        {
            Method (_SCP, 1, NotSerialized)  // _SCP: Set Cooling Policy
            {
                /*  _SCP control method */

                Local0 = Arg0
                If ((Local0 == 0x00))
                {
                    \_TZ.C192 = 0x00
                    \_TZ.C193 = 0x01
                    \_TZ.C194 = 0x02
                    \_TZ.C191 = 0x03
                }
                Else
                {
                    \_TZ.C191 = 0x00
                    \_TZ.C192 = 0x01
                    \_TZ.C193 = 0x02
                    \_TZ.C194 = 0x03
                }
            }   /*  _SCP control method */
        }   /*  ThermalZone C19C */
    }   /*  \_TZ thermal zone scope */

    /* */
    /* test DwrdFld.asl */
    /* */
    Name (BUFR, Buffer (0x0A)
    {
        /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
        /* 0008 */  0x00, 0x00                                       // ..
    })
    Device (DWDF)
    {
        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ DwrdFld Test"
            CreateByteField (BUFR, 0x00, BYTE)
            BYTE = 0xAA
            CreateWordField (BUFR, 0x01, WORD)
            WORD = 0xBBCC
            CreateDWordField (BUFR, 0x03, DWRD)
            DWRD = 0xDDEEFF00
            CreateByteField (BUFR, 0x07, BYT2)
            BYT2 = 0x11
            CreateWordField (BUFR, 0x08, WRD2)
            WRD2 = 0x2233
            Return (0x00)
        }   /*  End Method TEST */
    }   /*  Device DWDF */

    /* */
    /* test DivAddx.asl */
    /* */
    Name (B1LO, 0xAA)
    Name (B1HI, 0xBB)
    Method (MKW, 2, NotSerialized)
    {
        /*  This control method will take two bytes and make them into a WORD */

        Local0 = (B1HI * 0x0100)    /*  Make high byte.....high */
        Local0 |= B1LO       /*  OR in the low byte */ /* \B1LO */
        Return (Local0)                 /*  Return the WORD */
    }   /*  MKW_ */

    Device (DVAX)
    {
        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ DivAddx Test"
            B1LO = 0x19
            B1HI = 0x00
            /*  We'll multiply 25 * 3 to get 75, add 99 to it then divide */
            /*  by 100. We expect to get 74 for the remainder and 1 for */
            /*  the quotient. */
            Divide (((0x03 * MKW (B1LO, B1HI)) + 0x63),                 /*  Dividend, */

0x64,         /*  Divisor */Local4,      /*  Remainder */
                Local2)     /*  Quotient */
            If (((0x4A == Local4) && (0x01 == Local2)))
            {
                /*  Indicate Pass */

                Local0 = 0x00
            }
            Else
            {
                /*  Indicate Fail */

                Local0 = 0x01
            }

            Return (Local0)
        }   /*  End Method TEST */
    }   /*  Device DVAX */

    /* */
    /* test IndexFld.asl (IndexOp6.asl) */
    /* */
    /*  IndexFld test */
    /*      This is just a subset of the many RegionOp/Index Field test cases. */
    /*      Tests index field element AccessAs macro. */
    /*      Also tests name resolution of index field elements with same names */
    /*      but different namespace scopes. */
    /* */
    Device (IDX6)
    {
        /*  Test device name */

        OperationRegion (SIO, SystemIO, 0x0100, 0x02)
        Field (SIO, ByteAcc, NoLock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        IndexField (INDX, DATA, AnyAcc, NoLock, WriteAsOnes)
        {
            AccessAs (ByteAcc, 0x00), 
            IFE0,   8, 
            IFE1,   8, 
            IFE2,   8, 
            IFE3,   8, 
            IFE4,   8, 
            IFE5,   8, 
            IFE6,   8, 
            IFE7,   8, 
            IFE8,   8, 
            IFE9,   8
        }

        Device (TST)
        {
            /*  TST_:   provides a different namespace scope for IFE0 and IFE1 */

            OperationRegion (SIO2, SystemIO, 0x0100, 0x02)
            Field (SIO2, ByteAcc, NoLock, Preserve)
            {
                IND2,   8, 
                DAT2,   8
            }

            IndexField (IND2, DAT2, AnyAcc, NoLock, WriteAsOnes)
            {
                IFE0,  /*  duplicate IndexField name with different scope */   8, 
                IFE1,   8
            }
        }   /*  TST_:   provides a different namespace scope for IFE0 and IFE1 */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ IndexOp6 Test"
            Local0 = IFE0 /* \IDX6.IFE0 */
            Local1 = IFE1 /* \IDX6.IFE1 */
            Local2 = IFE2 /* \IDX6.IFE2 */
            /*  validate name resolution of IndexFields with different scopes */

            Local3 = \IDX6.IFE0
            Local4 = \IDX6.IFE1
            /*  verioading of namespace can resolve following names */

            Local5 = \IDX6.TST.IFE0
            Local6 = \IDX6.TST.IFE1
            Return (0x00)
        }   /*  TEST */
    }   /*  IDX6 */

    /* */
    /* test IndexOp5.asl */
    /* */
    /*  IndexOp5 test */
    /*      This is just a subset of the many RegionOp/Index Field test cases. */
    /*      Tests copying string into buffer then performing IndexOp on result. */
    /* */
    Device (IDX5)
    {
        /*  Test device name */

        Name (OSFL, 0x00)  /*  0 == Windows 98, 1 == Windows NT */
        /*  MCTH is a control method to compare two strings. It returns */
        /*  zero if the strings mismatch, or 1 if the strings match. */
        /*  This exercises the test case of copying a string into a buffer */
        /*  and performing an IndexOp on the resulting buffer. */
        Method (MCTH, 2, Serialized)
        {
            /*  MCTH:   Control Method to compare two strings */
            /*  Arg0:       first string to compare */
            /*  Arg1:       second string to compare */
            /*  Return: zero if strings mismatch, 1 if strings match */
            /*  check if first string's length is less than second string's length */
            If ((SizeOf (Arg0) < SizeOf (Arg1)))
            {
                Return (0x00)
            }

            /*  increment length to include NULL termination character */

            Local0 = (SizeOf (Arg0) + 0x01)  /*  Local0 = strlen(Arg0) + 1 */
            /*  create two buffers of size Local0 [strlen(Arg0)+1] */

            Name (BUF0, Buffer (Local0){})
            Name (BUF1, Buffer (Local0){})
            /*  copy strings into buffers */

            BUF0 = Arg0
            BUF1 = Arg1
            /*  validate BUF0 and BUF1 are still buffers */

            Local1 = ObjectType (BUF0)
            If ((Local1 != 0x03))  /*  Buffer is type 3 */
            {
                Return (0x14)
            }

            Local1 = ObjectType (BUF1)
            If ((Local1 != 0x03))  /*  Buffer is type 3 */
            {
                Return (0x15)
            }

            /* Decrement because the Index base below is zero based */
            /*  while Local0 length is one based. */
            Local0--
            While (Local0)
            {
                /*  loop through all BUF0 buffer elements */

                Local0--
                /*  check if BUF0[n] == BUF1[n] */

                If ((DerefOf (BUF0 [Local0]) == DerefOf (BUF1 [Local0]))){}   /*  this is how the code was really implemented */
                Else
                {
                    Return (Zero)
                }
            }   /*  loop through all BUF0 buffer elements */

            Return (One)    /*  strings / buffers match */
        }   /*  MCTH:   Control Method to compare two strings */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ IndexOp5 Test"
            If (MCTH (\_OS, "Microsoft Windows NT"))
            {
                OSFL = 0x01
            }

            If ((OSFL != 0x01))
            {
                Return (0x0B)
            }

            Return (0x00)
        }   /*  TEST */
    }   /*  IDX5 */

    /* */
    /* test IndexOp.asl */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Method (C097, 0, NotSerialized)
        {
            Return (0x01)
        }

        Device (PCI2)
        {
            /*  Root PCI Bus */

            Name (_HID, EisaId ("PNP0A03") /* PCI Bus */)  // _HID: Hardware ID
            Name (_ADR, 0x00)  // _ADR: Address
            Name (_CRS, Buffer (0x1A)  // _CRS: Current Resource Settings
            {
                "_SB_.PCI2._CRS..........."
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Device (ISA)
            {
                /*  ISA bridge */

                Name (_ADR, 0x00030000)     /*  ISA bus ID */  // _ADR: Address
                Device (EC0)
                {
                    /*  Embedded Controller */

                    Name (_GPE, 0x00)              /*  EC use GPE0 */  // _GPE: General Purpose Events
                    Name (_ADR, 0x00030000)  /*  PCI address */  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }       /*  EC is functioning */

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    /*  create EC's region and field */

                    OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
                    Field (RAM, AnyAcc, NoLock, Preserve)
                    {
                        /*  AC information */

                        ADP,      /*  AC Adapter 1:On-line, 0:Off-line */    1, 
                        AFLT,      /*  AC Adapter Fault  1:Fault  0:Normal */   1, 
                        BAT0,      /*  BAT0  1:present, 0:not present */   1, 
                            ,   1, 
                        Offset (0x04), 
                        /*  CMBatt information */

                        BPU0, /*  Power Unit */   32, 
                        BDC0, /*  Designed Capacity */   32, 
                        BFC0, /*  Last Full Charge Capacity */   32, 
                        BTC0, /*  Battery Technology */   32, 
                        BDV0, /*  Design Voltage */   32, 
                        BST0, /*  Battery State */   32, 
                        BPR0, /*  Battery Present Rate */   32, 
                        /*  (Designed Capacity)x(%)/{(h)x100} */

                        BRC0, /*  Battery Remaining Capacity */   32, 
                        /*  (Designed Capacity)(%)^100 */

                        BPV0, /*  Battery Present Voltage */   32, 
                        BTP0, /*  Trip Point */   32, 
                        BCW0, /*  Design capacity of Warning */   32, 
                        BCL0, /*  Design capacity of Low */   32, 
                        BCG0, /*  capacity granularity 1 */   32, 
                        BG20, /*  capacity granularity 2 */   32, 
                        BMO0, /*  Battery model number field */   32, 
                        BIF0, /*  OEM Information(00h) */   32, 
                        BSN0, /*  Battery Serial Number */   32, 
                        BTY0, /*  Battery Type (e.g., "Li-Ion") */   32, 
                        BTY1,      /*  Battery Type (e.g., "Li-Ion") */   32
                    }   /*  Field */
                }   /*  EC0: Embedded Controller */
            }   /*  ISA bridge */
        }   /*  PCI2 Root PCI Bus */

        Device (IDX0)
        {
            /*  Test device name */

            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)     /*  Control Method Battey ID */  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                /*  _STA bits 0-3 indicate existence of battery slot */
                /*  _STA bit 4 indicates battery (not) present */
                If (\_SB.PCI2.ISA.EC0.BAT0)
                {
                    Return (0x1F)
                }   /*  Battery present */
                Else
                {
                    Return (0x0F)
                }   /*  Battery not present */
            }   /*  _STA */

            Method (_BIF, 0, Serialized)  // _BIF: Battery Information
            {
                Name (BUFR, Package (0x0D){})
                BUFR [0x00] = \_SB.PCI2.ISA.EC0.BPU0  /*  Power Unit */
                BUFR [0x01] = \_SB.PCI2.ISA.EC0.BDC0  /*  Designed Capacity */
                BUFR [0x02] = \_SB.PCI2.ISA.EC0.BFC0  /*  Last Full Charge Capa. */
                BUFR [0x03] = \_SB.PCI2.ISA.EC0.BTC0  /*  Battery Technology */
                BUFR [0x04] = \_SB.PCI2.ISA.EC0.BDV0  /*  Designed Voltage */
                BUFR [0x05] = \_SB.PCI2.ISA.EC0.BCW0  /*  Designed warning level */
                BUFR [0x06] = \_SB.PCI2.ISA.EC0.BCL0  /*  Designed Low level */
                BUFR [0x07] = \_SB.PCI2.ISA.EC0.BCG0  /*  Capacity granularity 1 */
                BUFR [0x08] = \_SB.PCI2.ISA.EC0.BG20  /*  Capacity granularity 2 */
                BUFR [0x09] = ""                              /*  Model Number */
                BUFR [0x0A] = ""                         /*  Serial Number */
                BUFR [0x0B] = "LiOn"                     /*  Battery Type */
                BUFR [0x0C] = "Chicony"                  /*  OEM Information */
                Return (BUFR) /* \_SB_.IDX0._BIF.BUFR */
            }   /*  _BIF */

            Method (_BST, 0, Serialized)  // _BST: Battery Status
            {
                Name (BUFR, Package (0x04)
                {
                    0x01, 
                    0x0100, 
                    0x76543210, 
                    0x0180
                })
                Return (BUFR) /* \_SB_.IDX0._BST.BUFR */
            }   /*  _BST */

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                \_SB.PCI2.ISA.EC0.BTP0 = Arg0    /*  Set Battery Trip point */
            }

            Method (TEST, 0, Serialized)
            {
                Debug = "++++++++ IndexOp Test"
                /*  test storing into uninitialized package elements */

                Name (PBUF, Package (0x04){})  /*  leave unitialized */
                PBUF [0x00] = 0x01234567
                PBUF [0x01] = 0x89ABCDEF
                PBUF [0x02] = 0xFEDCBA98
                PBUF [0x03] = 0x76543210
                /*  verify values stored into uninitialized package elements */

                If ((DerefOf (PBUF [0x00]) != 0x01234567))
                {
                    Return (0x10)
                }

                If ((DerefOf (PBUF [0x01]) != 0x89ABCDEF))
                {
                    Return (0x11)
                }

                If ((DerefOf (PBUF [0x02]) != 0xFEDCBA98))
                {
                    Return (0x12)
                }

                If ((DerefOf (PBUF [0x03]) != 0x76543210))
                {
                    Return (0x13)
                }

                /*  store _BIF package return value into Local0 */

                Local0 = _BIF ()
                /*  save Local0 object type value into Local1 */

                Local1 = ObjectType (Local0)
                /*  validate Local0 is a Package */

                If ((Local1 != 0x04))  /*  Package type is 4 */
                {
                    Return (0x21)
                }   /*  failure */

                /*  test storing into buffer field elements */

                Name (BUFR, Buffer (0x10)
                {
                    /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                })   /*  BUFR */
                /*  test storing into buffer field elements */

                BUFR [0x00] = 0x01234567  /*  should only store 0x67 */
                BUFR [0x04] = 0x89ABCDEF  /*  should only store 0xEF */
                BUFR [0x08] = 0xFEDCBA98  /*  should only store 0x98 */
                BUFR [0x0C] = 0x76543210 /*  should only store 0x10 */
                /*  verify storing into buffer field elements */

                If ((DerefOf (BUFR [0x00]) != 0x67))
                {
                    Return (0x30)
                }

                If ((DerefOf (BUFR [0x01]) != 0x00))
                {
                    Return (0x31)
                }

                If ((DerefOf (BUFR [0x04]) != 0xEF))
                {
                    Return (0x34)
                }

                If ((DerefOf (BUFR [0x08]) != 0x98))
                {
                    Return (0x38)
                }

                If ((DerefOf (BUFR [0x0C]) != 0x10))
                {
                    Return (0x3C)
                }

                Return (0x00)  /*  pass */
            }   /*  TEST */
        }   /*  IDX0 */
    }   /*  _SB system bus */

    /* */
    /* test BitIndex.asl */
    /* */
    /*  BitIndex test */
    /*  This is a test case for accessing fields defined as single bits in */
    /*  memory. This is done by creating two index fields that overlay the */
    /*  same DWORD in memory. One field accesses the DWORD as a DWORD, the */
    /*  other accesses individual bits of the same DWORD field in memory. */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        OperationRegion (RAM, SystemMemory, 0x00800000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            /*  Any access */

            TREE,   3, 
            WRD0,   16, 
            WRD1,   16, 
            WRD2,   16, 
            WRD3,   16, 
            WRD4,   16, 
            DWRD, /*  DWORD field */   32
        }

        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            /*  Any access */

            THRE,   3, 
            WD00,   16, 
            WD01,   16, 
            WD02,   16, 
            WD03,   16, 
            WD04,   16, 
            BYT0,  /*  Start off with a BYTE */   8, 
            BIT0,  /*  single-bit field */   1, 
            BIT1,  /*  single-bit field */   1, 
            BIT2,  /*  single-bit field */   1, 
            BIT3,  /*  single-bit field */   1, 
            BIT4,  /*  single-bit field */   1, 
            BIT5,  /*  single-bit field */   1, 
            BIT6,  /*  single-bit field */   1, 
            BIT7,  /*  single-bit field */   1, 
            BIT8,  /*  single-bit field */   1, 
            BIT9,  /*  single-bit field */   1, 
            BITA,  /*  single-bit field */   1, 
            BITB,  /*  single-bit field */   1, 
            BITC,  /*  single-bit field */   1, 
            BITD,  /*  single-bit field */   1, 
            BITE,  /*  single-bit field */   1, 
            BITF,  /*  single-bit field */   1, 
            BYTZ,  /*  End with a BYTE for a total of 32 bits */   8
        }

        Device (BITI)
        {
            /*  Test device name */

            Method (MBIT, 0, NotSerialized)
            {
                If ((DWRD != 0x00))
                {
                    Local0 = 0xFF00
                }
                Else
                {
                    /*  Prime Local0 with 0...assume passing condition */

                    Local0 = 0x00
                    /*  set memory contents to known values using DWORD field */

                    DWRD = 0x5A5A5A5A
                    /*  Given the value programmed into DWRD, only the odd bits */
                    /*  of the lower nibble should be set. BIT1, BIT3 should be set. */
                    /*  BIT0 and BIT2 should be clear */
                    If (BIT0)
                    {
                        Local0 |= 0x01
                    }

                    If (!BIT1)
                    {
                        Local0 |= 0x02
                    }

                    If (BIT2)
                    {
                        Local0 |= 0x04
                    }

                    If (!BIT3)
                    {
                        Local0 |= 0x08
                    }

                    /*  Now check the upper nibble. Only the "even" bits should */
                    /*  be set. BIT4, BIT6. BIT5 and BIT7 should be clear. */
                    If (!BIT4)
                    {
                        Local0 |= 0x10
                    }

                    If (BIT5)
                    {
                        Local0 |= 0x20
                    }

                    If (!BIT6)
                    {
                        Local0 |= 0x40
                    }

                    If (BIT7)
                    {
                        Local0 |= 0x80
                    }
                }   /*  End Else DWRD zeroed out */

                Return (Local0)
            }   /*  MBIT:   Test single bit memory accesses */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ BitIndex Test"
                /*  Zero out DWRD */

                DWRD = 0x00
                /*  MBIT returns zero if successful */
                /*  This may be causing problems -- Return (MBIT) */
                Local0 = MBIT ()
                Return (Local0)
            }   /*  TEST */
        }   /*  BITI */
    }   /*  _SB system bus */

    /* */
    /* test IndexOp3.asl */
    /* */
    /*  Additional IndexOp test cases to support ACPICMB (control method battery */
    /*  test) on Compaq laptops. Test cases include storing a package into */
    /*  an IndexOp target and validating that changing source and destination */
    /*  package contents are independent of each other. */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Name (C174, 0x0D)
        Name (C175, 0x08)
        Device (C158)
        {
            /*  C158:   AC Adapter device */

            Name (_HID, "ACPI0003" /* Power Source Device */) /*  AC Adapter device */  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Acquire (\_GL, 0xFFFF)
                Release (\_GL)
                Local0 &= 0x01 /*  Local0 &= 1 */
                Return (Local0)
            }   /*  _PSR */
        }   /*  C158:   AC Adapter device */

        Name (C176, Package (0x04)
        {
            "Primary", 
            "MultiBay", 
            "DockRight", 
            "DockLeft"
        })
        Name (C177, Package (0x04)
        {
            0x99F5, 
            0x99F5, 
            0x995F, 
            0x995F
        })
        Name (C178, Package (0x04)
        {
            Package (0x04)
            {
                0x00, 
                0x00, 
                0x966B, 
                0x4190
            }, 

            Package (0x04)
            {
                0x00, 
                0x00, 
                0x966B, 
                0x4190
            }, 

            Package (0x04)
            {
                0x00, 
                0x00, 
                0x966B, 
                0x4190
            }, 

            Package (0x04)
            {
                0x00, 
                0x00, 
                0x966B, 
                0x4190
            }
        })  /*  C178 */
        Name (C179, Package (0x04)
        {
            0x00, 
            0x00, 
            0x966B, 
            0x4190
        })
        Name (C17A, Package (0x04)
        {
            Package (0x03)
            {
                0x00, 
                0x00, 
                0x00
            }, 

            Package (0x03)
            {
                0x00, 
                0x00, 
                0x00
            }, 

            Package (0x03)
            {
                0x00, 
                0x00, 
                0x00
            }, 

            Package (0x03)
            {
                0x00, 
                0x00, 
                0x00
            }
        })  /*  C17A */
        Method (C17B, 1, Serialized)
        {
            /*  C17B:   _BIF implementation */

            Name (C17C, Package (0x0D)
            {
                /*  C17C:   _BIF control method return package */

                0x00,                   /*  Power Unit (0 ==> mWh and mW) */
                0x99F5,          /*  Design Capacity */
                0x99F5,          /*  Last Full Charge Capacity */
                0x01,                   /*  Battery Technology (1 ==> rechargeable) */
                0x3840,          /*  Design Voltage */
                0x1280,          /*  Design Capacity of Warning */
                0x0AC7,          /*  Design Capacity of Low */
                0x01,                   /*  Battery Capacity Granularity 1 (Low -- Warning) */
                0x01,                   /*  Battery Capacity Granularity 2 (Warning -- Full) */
                "2891",          /*  Model Number (ASCIIZ) */
                "(-Unknown-)",   /*  Serial Number (ASCIIZ) */
                "LIon",          /*  Battery Type (ASCIIZ) */
                0x00                   /*  OEM Information (ASCIIZ) */
            })  /*  C17C:   _BIF control method return package */
            Local0 = (Arg0 & 0x07)                       /*  Local0 = Arg0 & 7 */
            Local4 = (Local0 >> 0x01)          /*  Local4 = Local0 >> 1 */
            C178 [Local4] = C179    /*  C178->Local4 = C179 */ /* \_SB_.C179 */
            /*  verify source and destination packages can be altered independent */
            /*  of each other (i.e., changing one's contents does NOT change other's */
            /*  contents) */
            C179 [0x02] = 0x1234               /*  C179[2] = 0x1234 */
            Local2 = DerefOf (C179 [0x02]) /*  Local2 = C179[2] */
            If ((Local2 != 0x1234))
            {
                Return (0x1234)
            }

            /*  Local2 = C178[0,2] */

            Local2 = DerefOf (DerefOf (C178 [0x00]) [0x02])
            If ((Local2 != 0x966B))
            {
                Return (0x1234)
            }

            /* Restore data to allow iterative execution */

            C179 [0x02] = 0x966B               /*  C179[2] = 0x966B */
            /*  C178[0,3] = 0x5678 */

            DerefOf (C178 [0x00]) [0x03] = 0x5678
            /*  Local2 = C178[0,3] */

            Local2 = DerefOf (DerefOf (C178 [0x00]) [0x03])
            If ((Local2 != 0x5678))
            {
                Return (0x5678)
            }

            Local2 = DerefOf (C179 [0x03]) /*  Local2 = C179[3] */
            If ((Local2 != 0x4190))
            {
                Return (0x5678)
            }

            /* Restore data to allow iterative execution */

            DerefOf (C178 [0x00]) [0x03] = 0x4190    /*  C179[2] = 0x4190 */
            Return (C17C) /* \_SB_.C17B.C17C */
        }   /*  C17B:   _BIF implementation */

        Device (C154)
        {
            /*  C154:   Battery 0 */

            Name (_HID, "*PNP0C0A")     /*  Control Method Battey ID */  // _HID: Hardware ID
            Name (_UID, 0x00)                  /*  first instance */  // _UID: Unique ID
            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                /*  _BIF */

                Return (C17B (0x30))
            }   /*  _BIF */
        }   /*  C154:   Battery 0 */

        Device (IDX3)
        {
            Method (LCLB, 0, Serialized)
            {
                /*  LCLB control method: test Index(Local#) where Local# is buffer */
                /*  Local0 is index counter */
                /*  Local1 is buffer */
                /*  Local2 receives BUFR[Local0] via Deref(Index(Local1...)) */
                /*  Local3 is Local1 or Local2 object type */
                /*  Local4 is return error code */
                Name (BUFR, Buffer (0x0A)
                {
                    /* 0000 */  0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,  // ........
                    /* 0008 */  0x08, 0x09                                       // ..
                })
                /*  save PKG into Local1 */

                Local1 = BUFR /* \_SB_.IDX3.LCLB.BUFR */
                /*  save Local2 object type value into Local3 */

                Local3 = ObjectType (Local1)
                /*  validate Local1 is a Buffer */

                If ((Local3 != 0x03))      /*  Buffer type is 3 */
                {
                    Return (0x9F)
                }

                Local0 = 0x00
                While ((Local0 < 0x05))
                {
                    /*  While (Local0 < 5) */
                    /*  Local2 = Local1[Local0] */
                    Local2 = DerefOf (Local1 [Local0])
                    /*  save Local2 object type value into Local3 */

                    Local3 = ObjectType (Local2)
                    /*  validate Local2 is a Number */

                    If ((Local3 != 0x01))      /*  Number type is 1 */
                    {
                        Return (0x9E)
                    }

                    /*  validate Local1[Local0] value == Local0 */

                    If ((Local0 != Local2))
                    {
                        /*  Local0 != Local2 == PKG[Local0] */
                        /*  Local4 = 0x90 + loop index (Local0) */
                        Local4 = (0x90 + Local0)
                        /*  return 0x90 + loop index */

                        Return (Local4)
                    }

                    Local0++
                }   /*  While (Local0 < 5) */

                Debug = "DerefOf(Index(LocalBuffer,,)) PASS"
                Return (0x00)  /*  Pass */
            }   /*  LCLB control method: test Index(Local#) where Local# is buffer */

            Method (LCLP, 0, Serialized)
            {
                /*  LCLP control method: test Index(Local#) where Local# is package */
                /*  Local0 is index counter */
                /*  Local1 is package */
                /*  Local2 receives PKG[Local0] via Deref(Index(Local1...)) */
                /*  Local3 is Local1 or Local2 object type */
                /*  Local4 is return error code */
                Name (PKG, Package (0x0A)
                {
                    0x00, 
                    0x01, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09
                })
                /*  save PKG into Local1 */

                Local1 = PKG /* \_SB_.IDX3.LCLP.PKG_ */
                /*  save Local2 object type value into Local3 */

                Local3 = ObjectType (Local1)
                /*  validate Local1 is a Package */

                If ((Local3 != 0x04))      /*  Package type is 4 */
                {
                    Return (0x8F)
                }

                Local0 = 0x00
                While ((Local0 < 0x05))
                {
                    /*  While (Local0 < 5) */
                    /*  Local2 = Local1[Local0] */
                    Local2 = DerefOf (Local1 [Local0])
                    /*  save Local2 object type value into Local3 */

                    Local3 = ObjectType (Local2)
                    /*  validate Local2 is a Number */

                    If ((Local3 != 0x01))      /*  Number type is 1 */
                    {
                        Return (0x8E)
                    }

                    /*  validate Local1[Local0] value == Local0 */

                    If ((Local0 != Local2))
                    {
                        /*  Local0 != Local2 == PKG[Local0] */
                        /*  Local4 = 0x80 + loop index (Local0) */
                        Local4 = (0x80 + Local0)
                        /*  return 0x80 + loop index */

                        Return (Local4)
                    }

                    Local0++
                }   /*  While (Local0 < 5) */

                Debug = "DerefOf(Index(LocalPackage,,)) PASS"
                Return (0x00)  /*  Pass */
            }   /*  LCLP control method: test Index(Local#) where Local# is package */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ IndexOp3 Test"
                /*  store _BIF package return value into Local0 */

                Local0 = \_SB.C154._BIF ()
                /*  save Local0 object type value into Local1 */

                Local1 = ObjectType (Local0)
                /*  validate Local0 is a Package */

                If ((Local1 != 0x04))      /*  Package type is 4 */
                {
                    /*  failure: did not return a Package (type 4) */
                    /*  if Local0 is a Number, it contains an error code */
                    If ((Local1 == 0x01))     /*  Number type is 1 */
                    {
                        Return (Local0)
                    }   /*  return Local0 error code */
                    Else
                    {
                        Return (0x01)
                    }           /*  return default error code */
                }   /*  failure: did not return a Package (type 4) */

                /*  save LCLB control method return value into Local2 */

                Local2 = LCLB ()
                If ((Local2 != 0x00))
                {
                    Return (Local2)
                }   /*  return failure code */

                /*  save LCLP control method return value into Local2 */

                Local2 = LCLP ()
                If ((Local2 != 0x00))
                {
                    Return (Local2)
                }   /*  return failure code */

                Return (0x00)  /*  Pass */
            }   /*  TEST */
        }   /*  IDX3:   Test device name */
    }   /*  _SB system bus */

    /* */
    /* MTL developed test to exercise Indexes into buffers */
    /* */
    Device (IDX7)
    {
        Name (PKG4, Package (0x05)
        {
            0x02, 
            "A short string", 
            Buffer (0x04)
            {
                 0x0A, 0x0B, 0x0C, 0x0D                           // ....
            }, 

            0x1234, 
            Package (0x02)
            {
                IDX7, 
                0x03
            }
        })
        /* */
        /* Generic Test method */
        /* */
        /* This test returns 0xE (14) - ObjectType = Buffer Field */
        Method (TST1, 0, Serialized)
        {
            Name (DEST, Buffer (0x3F)
            {
                "Destination buffer that is longer than the short source buffer"
            })
            /*  verify object type returned by Index(Buffer,Element,) */

            Store (DEST [0x02], Local1)
            Local2 = ObjectType (Local1)
            If ((Local2 == 0x0E))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x01)
            }
        }

        Method (TST2, 0, Serialized)
        {
            Name (BUF0, Buffer (0x05)
            {
                 0x01, 0x02, 0x03, 0x04, 0x05                     // .....
            })
            BUF0 [0x02] = 0x55
            Local0 = DerefOf (BUF0 [0x02])
            If ((Local0 == 0x55))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x02)
            }
        }

        Method (TST3, 0, Serialized)
        {
            Name (BUF1, Buffer (0x05)
            {
                 0x01, 0x02, 0x03, 0x04, 0x05                     // .....
            })
            Store (BUF1 [0x01], Local0)
            Local1 = DerefOf (Local0)
            If ((Local1 == 0x02))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (TST4, 0, NotSerialized)
        {
            /* Index (PKG4, 0) is a Number */

            Store (PKG4 [0x00], Local0)
            Local1 = ObjectType (Local0)
            If ((Local1 == 0x01))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x04)
            }
        }

        Method (TST5, 0, NotSerialized)
        {
            /* Index (PKG4, 1) is a String */

            Store (PKG4 [0x01], Local0)
            Local1 = ObjectType (Local0)
            If ((Local1 == 0x02))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x05)
            }
        }

        Method (TST6, 0, NotSerialized)
        {
            /* Index (PKG4, 2) is a Buffer */

            Store (PKG4 [0x02], Local0)
            Local1 = ObjectType (Local0)
            If ((Local1 == 0x03))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x06)
            }
        }

        Method (TST7, 0, NotSerialized)
        {
            /* Index (PKG4, 3) is a Number */

            Store (PKG4 [0x03], Local0)
            Local1 = ObjectType (Local0)
            If ((Local1 == 0x01))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x07)
            }
        }

        Method (TST8, 0, NotSerialized)
        {
            /* Index (PKG4, 4) is a Package */

            Store (PKG4 [0x04], Local0)
            Local1 = ObjectType (Local0)
            If ((Local1 == 0x04))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x08)
            }
        }

        Method (TST9, 0, NotSerialized)
        {
            /* DerefOf (Index (PKG4, 0)) is a Number */

            Local0 = DerefOf (PKG4 [0x00])
            If ((Local0 == 0x02))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x09)
            }
        }

        Method (TSTA, 0, NotSerialized)
        {
            /* DerefOf (Index (PKG4, 1)) is a String */

            Local0 = DerefOf (PKG4 [0x01])
            Local1 = SizeOf (Local0)
            If ((Local1 == 0x0E))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x0A)
            }
        }

        Method (TSTB, 0, NotSerialized)
        {
            /* DerefOf (Index (PKG4, 2)) is a Buffer */

            Local0 = DerefOf (PKG4 [0x02])
            Local1 = SizeOf (Local0)
            If ((Local1 == 0x04))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x0B)
            }
        }

        Method (TSTC, 0, NotSerialized)
        {
            /* DerefOf (Index (PKG4, 3)) is a Number */

            Local0 = DerefOf (PKG4 [0x03])
            If ((Local0 == 0x1234))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x0C)
            }
        }

        Method (TSTD, 0, NotSerialized)
        {
            /* DerefOf (Index (PKG4, 4)) is a Package */

            Local0 = DerefOf (PKG4 [0x04])
            Local1 = SizeOf (Local0)
            If ((Local1 == 0x02))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x0D)
            }
        }

        Method (TSTE, 0, NotSerialized)
        {
            /* DerefOf (Index (PKG4, 2)) is a Buffer */

            Local0 = DerefOf (PKG4 [0x02])
            /* DerefOf (Index (Local0, 1)) is a Number */

            Local1 = DerefOf (Local0 [0x01])
            If ((Local1 == 0x0B))
            {
                Return (0x00)
            }
            Else
            {
                Return (0x0E)
            }
        }

        Method (TSTF, 0, Serialized)
        {
            Name (SRCB, Buffer (0x0C){}) /*  12 characters */
            SRCB = "Short Buffer"
            Name (DEST, Buffer (0x3F)
            {
                "Destination buffer that is longer than the short source buffer"
            })
            /*  overwrite DEST contents, starting at buffer position 2 */

            DEST [0x02] = SRCB /* \IDX7.TSTF.SRCB */
            /* */
            /*  The DEST buffer element should be replaced with the last element of */
            /*      the SRCB element (i.e. 's'->'r') */
            Local0 = DerefOf (DEST [0x02])
            If ((Local0 != 0x72))       /*  'r' */
            {
                /*  DEST element does not match the value from SRCB */

                Return ((Local0 | 0x1000))
            }

            Return (0x00)
        }

        Method (TSTG, 0, Serialized)
        {
            Name (SRCB, Buffer (0x0C){}) /*  12 characters */
            SRCB = "Short Buffer"
            Name (DEST, Buffer (0x3F)
            {
                "Destination buffer that is longer than the short source buffer"
            })
            /*  overwrite DEST contents, starting at buffer position 2 */

            DEST [0x02] = SRCB /* \IDX7.TSTG.SRCB */
            /* */
            /* The next element of DEST should be unchanged */
            /* */
            Local0 = DerefOf (DEST [0x03])
            If ((Local0 != 0x74))       /*  't' */
            {
                /*  DEST has been changed */

                Return ((Local0 | 0x2000))
            }

            /* */
            /* The next element of DEST should be unchanged */
            /* */
            Local0 = DerefOf (DEST [0x04])
            If ((Local0 != 0x69))       /*  'i' */
            {
                /*  DEST has been changed */

                Return ((Local0 | 0x2100))
            }

            /* */
            /* The next element of DEST should be unchanged */
            /* */
            Local0 = DerefOf (DEST [0x05])
            If ((Local0 != 0x6E))       /*  'n' */
            {
                /*  DEST has been changed */

                Return ((Local0 | 0x2200))
            }

            /* */
            /* The next element of DEST should be unchanged */
            /* */
            Local0 = DerefOf (DEST [0x06])
            If ((Local0 != 0x61))       /*  'a' */
            {
                /*  DEST has been changed */

                Return ((Local0 | 0x2300))
            }

            /* */
            /* The next element of DEST should be unchanged */
            /* */
            Local0 = DerefOf (DEST [0x07])
            If ((Local0 != 0x74))       /*  't' */
            {
                /*  DEST has been changed */

                Return ((Local0 | 0x2400))
            }

            /* */
            /*  Verify DEST elements beyond end of SRCB buffer copy */
            /*  have not been changed */
            Local0 = DerefOf (DEST [0x0E])
            If ((Local0 != 0x66))       /* 'f' */
            {
                /*  DEST has been changed */

                Return ((Local0 | 0x2400))
            }

            Return (0x00)
        }

        /* */
        /* This test shows that MS ACPI.SYS stores only the lower 8-bits of a 32-bit */
        /*  number into the index'ed buffer */
        /* */
        Method (TSTH, 0, Serialized)
        {
            /* Create a Destination Buffer */

            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            /* Store a number > UINT8 into an index of the buffer */

            DBUF [0x02] = 0x12345678
            /* Check the results */

            Local0 = DerefOf (DBUF [0x02])
            If ((Local0 != 0x78))   /* 0x78 */
            {
                Return ((Local0 | 0x3000))
            }

            Local0 = DerefOf (DBUF [0x03])
            If ((Local0 != 0x64))   /* 'd' */
            {
                Return ((Local0 | 0x3100))
            }

            Local0 = DerefOf (DBUF [0x04])
            If ((Local0 != 0x65))   /* 'e' */
            {
                Return ((Local0 | 0x3200))
            }

            Local0 = DerefOf (DBUF [0x05])
            If ((Local0 != 0x66))   /* 'f' */
            {
                Return ((Local0 | 0x3300))
            }

            Return (0x00)
        }

        Method (TSTI, 0, Serialized)
        {
            /* Create a Destination Buffer */

            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            /* Store a String into an index of the buffer */

            DBUF [0x02] = "ABCDEFGH"
            /* Check the results */

            Local0 = DerefOf (DBUF [0x02])
            If ((Local0 != 0x48))   /* 'H' */
            {
                Return ((Local0 | 0x4000))
            }

            Local0 = DerefOf (DBUF [0x03])
            If ((Local0 != 0x64))   /* 'd' */
            {
                Return ((Local0 | 0x4100))
            }

            Local0 = DerefOf (DBUF [0x04])
            If ((Local0 != 0x65))   /* 'e' */
            {
                Return ((Local0 | 0x4200))
            }

            Local0 = DerefOf (DBUF [0x05])
            If ((Local0 != 0x66))   /* 'f' */
            {
                Return ((Local0 | 0x4300))
            }

            Return (0x00)
        }

        Method (TSTJ, 0, Serialized)
        {
            /* Create a Destination Buffer */

            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            /* Store a number > UINT8 into an index of the buffer */

            DBUF [0x02] = 0x1234
            /* Check the results */

            Local0 = DerefOf (DBUF [0x02])
            If ((Local0 != 0x34))   /* 0x34 */
            {
                Return ((Local0 | 0x3000))
            }

            Local0 = DerefOf (DBUF [0x03])
            If ((Local0 != 0x64))   /* 'd' */
            {
                Return ((Local0 | 0x3100))
            }

            Local0 = DerefOf (DBUF [0x04])
            If ((Local0 != 0x65))   /* 'e' */
            {
                Return ((Local0 | 0x3200))
            }

            Local0 = DerefOf (DBUF [0x05])
            If ((Local0 != 0x66))   /* 'f' */
            {
                Return ((Local0 | 0x3300))
            }

            Return (0x00)
        }

        Method (TSTK, 0, Serialized)
        {
            /* Create a Destination Buffer */

            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            /* Store a number > UINT8 into an index of the buffer */

            DBUF [0x02] = 0x00123456
            /* Check the results */

            Local0 = DerefOf (DBUF [0x02])
            If ((Local0 != 0x56))   /* 0x56 */
            {
                Return ((Local0 | 0x3000))
            }

            Local0 = DerefOf (DBUF [0x03])
            If ((Local0 != 0x64))   /* 'd' */
            {
                Return ((Local0 | 0x3100))
            }

            Local0 = DerefOf (DBUF [0x04])
            If ((Local0 != 0x65))   /* 'e' */
            {
                Return ((Local0 | 0x3200))
            }

            Local0 = DerefOf (DBUF [0x05])
            If ((Local0 != 0x66))   /* 'f' */
            {
                Return ((Local0 | 0x3300))
            }

            Return (0x00)
        }

        Method (TSTL, 0, Serialized)
        {
            /* Create a Destination Buffer */

            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            /* Store a number > UINT8 into an index of the buffer */

            DBUF [0x02] = 0x12
            /* Check the results */

            Local0 = DerefOf (DBUF [0x02])
            If ((Local0 != 0x12))   /* 0x12 */
            {
                Return ((Local0 | 0x3000))
            }

            Local0 = DerefOf (DBUF [0x03])
            If ((Local0 != 0x64))   /* 'd' */
            {
                Return ((Local0 | 0x3100))
            }

            Local0 = DerefOf (DBUF [0x04])
            If ((Local0 != 0x65))   /* 'e' */
            {
                Return ((Local0 | 0x3200))
            }

            Local0 = DerefOf (DBUF [0x05])
            If ((Local0 != 0x66))   /* 'f' */
            {
                Return ((Local0 | 0x3300))
            }

            Return (0x00)
        }

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ IndexOp7 Test"
            Local0 = TST1 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST2 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST3 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST4 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST5 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST6 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST7 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST8 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TST9 ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTA ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTB ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTC ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTD ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTE ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            /* No longer ACPI compliant */
            /*
             Store(TSTF(), Local0)
             if (LGreater (Local0, 0))
             {
             Return(Local0)
             }
             */
            Local0 = TSTG ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTH ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            /* No longer ACPI compliant */
            /*
             Store(TSTI(), Local0)
             if (LGreater (Local0, 0))
             {
             Return(Local0)
             }
             */
            Local0 = TSTJ ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTK ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Local0 = TSTL ()
            If ((Local0 > 0x00))
            {
                Return (Local0)
            }

            Return (Local0)
        }
    } /* Device(IDX7) */

    /* */
    /* test MatchOp.asl */
    /* */
    /*  MatchOp test cases that utilize nested DerefOf(Index(...)) to validate */
    /*  MatchOp, DerefOfOp, and IndexOp of nested packages. */
    /* */
    Device (MTCH)
    {
        Method (TEST, 0, Serialized)
        {
            Debug = "++++++++ MatchOp Test"
            Name (TIM0, Package (0x08)
            {
                Package (0x04)
                {
                    0x78, 
                    0xB4, 
                    0xF0, 
                    0x0384
                }, 

                Package (0x04)
                {
                    0x23, 
                    0x21, 
                    0x10, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0B, 
                    0x09, 
                    0x04, 
                    0x00
                }, 

                Package (0x05)
                {
                    0x70, 
                    0x49, 
                    0x36, 
                    0x27, 
                    0x19
                }, 

                Package (0x05)
                {
                    0x00, 
                    0x01, 
                    0x02, 
                    0x01, 
                    0x02
                }, 

                Package (0x05)
                {
                    0x00, 
                    0x00, 
                    0x00, 
                    0x01, 
                    0x01
                }, 

                Package (0x04)
                {
                    0x04, 
                    0x03, 
                    0x02, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x02, 
                    0x01, 
                    0x00, 
                    0x00
                }
            })  /*  TIM0 */
            Name (TMD0, Buffer (0x14)
            {
                 0xFF, 0xFF, 0xFF, 0xFF                           // ....
            })
            CreateDWordField (TMD0, 0x00, PIO0)    /*  0xFFFFFFFF */
            CreateDWordField (TMD0, 0x04, DMA0)
            CreateDWordField (TMD0, 0x08, PIO1)
            CreateDWordField (TMD0, 0x0C, DMA1)
            CreateDWordField (TMD0, 0x10, CHNF)
            /*  validate PIO0 value */

            Local3 = PIO0 /* \MTCH.TEST.PIO0 */
            /*  save Local3 object type value into Local2 */

            Local2 = ObjectType (Local3)
            /*  validate Local3 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                Return (0x02)
            }   /*  failure */

            /*  validate Local3 Number value */

            If ((Local3 != 0xFFFFFFFF)) /*  Number value 0xFFFFFFFF */
            {
                Return (0x03)
            }   /*  failure */

            Debug = "DWordField PASS"
            Local5 = 0x00
            Local6 = Match (DerefOf (TIM0 [0x01]), MLE, Local5, MTR, 0x00, 
                0x00)
            /*  save Local6 object type value into Local2 */

            Local2 = ObjectType (Local6)
            /*  validate Local6 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                Return (0x04)
            }   /*  failure */

            Debug = "Match(DerefOf(Index(TIM0,1)),... PASS"
            /*  validate following produces a nested package to validate */
            /*  that MatchOp did not corrupt SearchPackage (TIM0) */
            Local4 = DerefOf (TIM0 [0x01])
            /*  save Local4 object type value into Local2 */

            Local2 = ObjectType (Local4)
            /*  validate Local4 is a Package */

            If ((Local2 != 0x04))  /*  Package type is 4 */
            {
                Return (0x05)
            }   /*  failure */

            Debug = "DerefOf(Index(TIM0,1)),... PASS"
            Local0 = (Match (DerefOf (TIM0 [0x00]), MGE, PIO0, MTR, 0x00, 
                0x00) & 0x03)
            /*  save Local0 object type value into Local2 */

            Local2 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                Return (0x06)
            }   /*  failure */

            /*  validate Local0 Number value */

            If ((Local0 != 0x03))  /*  Number value 3 */
            {
                Return (0x07)
            }   /*  failure */

            Debug = "And(Match(DerefOf(Index(TIM0,0)),... PASS"
            /*  again, validate following produces a nested package */

            Local4 = DerefOf (TIM0 [0x01])
            /*  save Local4 object type value into Local2 */

            Local2 = ObjectType (Local4)
            /*  validate Local4 is a Package */

            If ((Local2 != 0x04))  /*  Package type is 4 */
            {
                Return (0x08)
            }   /*  failure */

            Debug = "DerefOf(Index(TIM0,1)),... PASS again"
            /*  again, validate following produces a nested package */

            Local4 = DerefOf (TIM0 [0x01])
            /*  save Local4 object type value into Local2 */

            Local2 = ObjectType (Local4)
            /*  validate Local4 is a Package */

            If ((Local2 != 0x04))  /*  Package type is 4 */
            {
                Return (0x09)
            }   /*  failure */

            Debug = "DerefOf(Index(TIM0,1)),... PASS again"
            /*  test nested DerefOf(Index) operators */

            Local1 = DerefOf (DerefOf (TIM0 [0x01]) [Local0])
            /*  save Local1 object type value into Local2 */

            Local2 = ObjectType (Local1)
            /*  validate Local1 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                Return (0x0A)
            }   /*  failure */

            /*  zero indicates pass, non-zero is an error code */

            If ((Local1 != 0x00))
            {
                Return (0x0B)
            }   /*  failure */

            Debug = "DerefOf(Index(DerefOf(Index(TIM0,1)),... PASS"
            /*  again, validate following produces a nested package */

            Local4 = DerefOf (TIM0 [0x01])
            /*  save Local4 object type value into Local2 */

            Local2 = ObjectType (Local4)
            /*  validate Local4 is a Package */

            If ((Local2 != 0x04))  /*  Package type is 4 */
            {
                Return (0x0C)
            }   /*  failure */

            Debug = "DerefOf(Index(TIM0,1)),... PASS again"
            /*  retest nested DerefOf(Index) operators */

            Local1 = DerefOf (DerefOf (TIM0 [0x01]) [Local0])
            /*  save Local1 object type value into Local2 */

            Local2 = ObjectType (Local1)
            /*  validate Local1 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                Return (0x0D)
            }   /*  failure */

            /*  zero indicates pass, non-zero is an error code */

            If ((Local1 != 0x00))
            {
                Return (0x0E)
            }   /*  failure */

            Debug = "DerefOf(Index(DerefOf(Index(TIM0,1)),... PASS again"
            /*  again, validate following produces a nested package */

            Local4 = DerefOf (TIM0 [0x01])
            /*  save Local4 object type value into Local2 */

            Local2 = ObjectType (Local4)
            /*  validate Local4 is a Package */

            If ((Local2 != 0x04))  /*  Package type is 4 */
            {
                Return (0x0F)
            }   /*  failure */

            Debug = "DerefOf(Index(TIM0,1)),... PASS again"
            Return (0x00)  /*  pass */
        }   /*  TEST */
    }   /* MTCH */

    /* */
    /* test WhileBrk.asl */
    /* */
    /*  This code tests the Break term and While term */
    /* */
    /*  Syntax of Break term */
    /*      BreakTerm := Break */
    /*  The break operation causes the current package execution to complete. */
    /* */
    /*  Syntax of While Term */
    /*      WhileTerm   := While( */
    /*          Predicate   //TermArg=>Integer */
    /*      ) {TermList} */
    /*  Predicate is evaluated as an integer. */
    /*  If the integer is non-zero, the list of terms in TermList is executed. */
    /*  The operation repeats until the Predicate evaluates to zero. */
    /* */
    /* MTL NOTE: This test has been modified to reflect ACPI 2.0 break */
    /* NOTE: This test, when run under the MS ACPI.SYS grinds the system to */
    /*  a halt. */
    /* */
    Device (WHLB)
    {
        Name (CNT0, 0x00)
        Name (CNT1, 0x00)
        Method (TEST, 0, NotSerialized)
        {
            /*  Check Break statement nested in If nested in While nested in */
            /*  While only exits inner-most While loop */
            CNT0 = 0x00
            While ((CNT0 < 0x04))
            {
                CNT1 = 0x00
                While ((CNT1 < 0x0A))
                {
                    If ((CNT1 == 0x01))
                    {
                        Break       /*  exit encompassing loop */
                    }

                    CNT1++
                }

                If ((CNT1 != 0x01))
                {
                    /*  failure */

                    Return (0x07)
                }

                CNT0++
            }

            /*  Verify Break only exited inner-most While loop */

            If ((CNT0 != 0x04))
            {
                /*  failure */

                Return (0x08)
            }

            Debug = "While/While/If/Break PASS"
            Debug = "++++++++ WhileBrk Test"
            /*  Check Break statement nested in While */

            CNT0 = 0x00
            While ((CNT0 < 0x0A))
            {
                Break
                CNT0++
            }

            If ((CNT0 != 0x00))    /*  instruction after Break executed */
            {
                Return (0x04)
            }

            CNT0 = 0x00
            /*  Test While Term */

            While ((CNT0 < 0x0A))
            {
                CNT0++
            }

            /*  Check if the while loop was executed until the condition is satisfied. */

            If ((CNT0 != 0x0A))
            {
                Return (0x01)
            }

            /*  While loop in a reverse order */

            While ((CNT0 > 0x00))
            {
                CNT0--
            }

            /*  Check if the while loop was executed until the condition is satisfied. */

            If ((CNT0 != 0x00))
            {
                Return (0x02)
            }

            Debug = "While/Break PASS"
            /*  Check Break statement nested in If nested in While */

            CNT0 = 0x00
            While ((CNT0 < 0x0A))
            {
                If ((CNT0 == 0x05))
                {
                    Break
                    /*  if we execute the next instruction, */
                    /*  Break did not exit the loop */
                    CNT0 = 0x14    /*  exit While loop with value larger */
                                /*  than above */
                }

                CNT0++    /*  check if Break exited both If and While */
            }   /*  While */

            If ((CNT0 > 0x13))
            {
                /*  instruction after Break inside IfOp executed */

                Return (0x05)
            }

            /* */
            /* Break will exit out of the while loop, therefore */
            /*  the CNT0 counter should still Increment until 5 */
            /* */
            If ((CNT0 != 0x05))
            {
                /*  instruction after Break inside WhileOp executed */

                Return (0x06)
            }

            Debug = "While/If/Break PASS"
            /*  All the conditions passed */

            Return (0x00)
        }   /*  TEST */
    }   /*  WHLB */

    /* */
    /* test IndexOp2.asl */
    /* */
    /*  Additional IndexOp test cases to support ACPICMB (control method battery */
    /*  test) on Toshiba Portege 7020CT. Test cases include appropriate bit */
    /*  shifting of Field elements and reading Field elements greater than 64 bits. */
    /* */
    /* MTL NOTE: This test has been modified slightly from the original test */
    /*  to take into account ACPI specification limitations. */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */

        Device (MEM)
        {
            /*  MEM */

            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
            Name (_STA, 0x0F)  // _STA: Status
            OperationRegion (SMEM, SystemMemory, 0x00800000, 0x0100)
            Field (SMEM, AnyAcc, NoLock, Preserve)
            {
                /*  Field:  SMEM overlay using 32-bit field elements */

                SMD0, /*  32-bits */   32, 
                SMD1,     /*  32-bits */   32, 
                SMD2,     /*  32-bits */   32, 
                SMD3,  /*  32-bits */   32
            }   /*  Field:  SMEM overlay using 32-bit field elements */

            Field (SMEM, AnyAcc, NoLock, Preserve)
            {
                /*  Field:  SMEM overlay using greater than 32-bit field elements */

                SME0, /*  larger than an integer (32 or 64) */   69, 
                SME1,  /*  larger than an integer */   97
            }   /*  Field:  SMEM overlay using greater than 32-bit field elements */

            OperationRegion (SRAM, SystemMemory, 0x100B0000, 0xF000)
            Field (SRAM, AnyAcc, NoLock, Preserve)
            {
                Offset (0x6800), 
                /*  Field:  SRAM overlay */

                IEAX,   32, 
                IEBX,   32, 
                IECX,   32, 
                IEDX,   32, 
                IESI,   32, 
                IEDI,   32, 
                IEBP,   32, 
                Offset (0x6820), 
                OEAX,   32, 
                OEBX,   32, 
                OECX,   32, 
                OEDX,   32, 
                OESI,   32, 
                OEDI,   32, 
                OEBP,   32, 
                Offset (0x68FF), 
                ACST,   1, 
                BES1,   1, 
                BES2,   1, 
                Offset (0x6900), 
                BMN1,   104, 
                BSN1,   88, 
                BTP1,   72, 
                BPU1,   32, 
                BDC1,   32, 
                BLF1,   32, 
                BTC1,   32, 
                BDV1,   32, 
                BST1,   32, 
                BPR1,   32, 
                BRC1,   32, 
                BPV1,   32, 
                Offset (0x6949), 
                BCW1,   32, 
                BCL1,   32, 
                BG11,   32, 
                BG21,   32, 
                BOI1,   32, 
                Offset (0x6A03), 
                BMN2,   104, 
                BSN2,   88, 
                BTP2,   72, 
                BPU2,   32, 
                BDC2,   32, 
                BLF2,   32, 
                BTC2,   32, 
                BDV2,   32, 
                BST2,   32, 
                BPR2,   32, 
                BRC2,   32, 
                BPV2,   32, 
                Offset (0x6A4C), 
                BCW2,   32, 
                BCL2,   32, 
                BG12,   32, 
                BG22,   32, 
                BOI2,   32, 
                Offset (0x6B03), 
                AC01,   16, 
                AC11,   16, 
                PSV1,   16, 
                CRT1,   16, 
                TMP1,   16, 
                AST1,   16, 
                AC21,   16, 
                AC31,   16, 
                AC02,   16, 
                AC12,   16, 
                PSV2,   16, 
                CRT2,   16, 
                TMP2,   16, 
                AST2,   16, 
                AC22,   16, 
                AC32,   16, 
                AC03,   16, 
                AC13,   16, 
                PSV3,   16, 
                CRT3,   16, 
                TMP3,   16, 
                AST3,   16, 
                AC23,   16, 
                AC33,   16, 
                Offset (0x6B43), 
                TMPF,   16, 
                Offset (0x6BF3), 
                FANH,   1, 
                FANL,   7, 
                TF11,   1, 
                TF21,   1, 
                TF31,   1, 
                    ,   1, 
                TF10,   1, 
                TF20,   1, 
                TF30,   1, 
                Offset (0x6BF5), 
                TP11,   1, 
                TP21,   1, 
                TP31,   1, 
                Offset (0x6C03), 
                GP50,   1, 
                GP51,   1, 
                GP52,   1, 
                GP53,   1, 
                Offset (0x6C04), 
                GP60,   1, 
                GP61,   1, 
                GP62,   1, 
                GP63,   1, 
                GP64,   1, 
                GP65,   1, 
                GP66,   1, 
                Offset (0x6C05), 
                GP70,   1, 
                GP71,   1, 
                GP72,   1, 
                GP73,   1, 
                GP74,   1, 
                GP75,   1, 
                GP76,   1, 
                Offset (0x6C06), 
                WED0,   1, 
                WED1,   1, 
                WED2,   1, 
                WED3,   1, 
                WED4,   1, 
                Offset (0x6C07), 
                SBL0,   1, 
                SBL1,   1, 
                SBL2,   1, 
                SBL3,   1, 
                Offset (0x6C08), 
                LIDS,   1, 
                VALF,   1, 
                    ,   2, 
                DCKI,   1, 
                DCKF,   1, 
                BT1F,   1, 
                BT2F,   1, 
                Offset (0x6D03), 
                HKCD,   8, 
                Offset (0x6D05), 
                DLID,   32, 
                DSRN,   32, 
                Offset (0x6D11), 
                BDID,   32, 
                DSPW,   1, 
                VGAF,   1, 
                VWE0,   1, 
                VWE1,   1, 
                PPSC,   1, 
                SPSC,   1, 
                EWLD,   1, 
                EWPS,   1, 
                Offset (0x7003), 
                PRES,   32768
            }   /*  Field:  SRAM overlay */
        }   /*  MEM */

        Device (BAT1)
        {
            /*  BAT1 */

            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)     /*  Control Method Battey ID */  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                /*  _STA */

                If (\_SB.MEM.BES1)
                {
                    Return (0x1F)
                }   /*  battery present */
                Else
                {
                    Return (0x0F)
                }   /*  battery not present */
            }   /*  _STA */

            Method (_BIF, 0, Serialized)  // _BIF: Battery Information
            {
                /*  _BIF */

                Name (BUFR, Package (0x0D){})
                BUFR [0x00] = \_SB.MEM.BPU1
                BUFR [0x01] = \_SB.MEM.BDC1
                BUFR [0x02] = \_SB.MEM.BLF1
                BUFR [0x03] = \_SB.MEM.BTC1
                BUFR [0x04] = \_SB.MEM.BDV1
                BUFR [0x05] = \_SB.MEM.BCW1
                BUFR [0x06] = \_SB.MEM.BCL1
                BUFR [0x07] = \_SB.MEM.BG11
                BUFR [0x08] = \_SB.MEM.BG21
                BUFR [0x09] = \_SB.MEM.BMN1
                BUFR [0x0A] = \_SB.MEM.BSN1
                BUFR [0x0B] = \_SB.MEM.BTP1
                BUFR [0x0C] = \_SB.MEM.BOI1
                Return (BUFR) /* \_SB_.BAT1._BIF.BUFR */
            }   /*  _BIF */
        }   /*  BAT1 */

        Device (IDX2)
        {
            Method (B2IB, 0, Serialized)
            {
                /*  B2IB:   store from Buffer into Index'ed Buffer */

                Name (SRCB, Buffer (0x0D)
                {
                    "Short Buffer"
                })   /*  12 characters plus NULL */
                Name (DEST, Buffer (0x3F)
                {
                    "Destination buffer that is longer than the short source buffer"
                })
                /*  verify object type returned by Index(Buffer,Element,) */

                Store (DEST [0x02], Local1)
                Local2 = ObjectType (Local1)
                If ((Local2 != 0x0E))     /*  Buffer Field is type 14 */
                {
                    /*  Local2 indicates Local1 is not a Buffer Field */

                    Return (0x61)
                }

                /*  verify object type and value returned by DerefOf(Index(Buffer,Element,)) */
                /*  should return Number containing element value */
                Local3 = DerefOf (Local1)
                Local4 = ObjectType (Local3)
                If ((Local4 != 0x01))          /*  Number is type 1 */
                {
                    /*  Local2 indicates Local1 is not a Number */

                    Return (0x62)
                }
                ElseIf ((Local3 != 0x73))       /*  expect 's' element from DEST */
                {
                    Return (0x63)
                }

                Debug = "DerefOf(Index(Buffer,,)) PASS"
                /* */
                /* The following sections have been rewritten because storing into */
                /* an Indexed buffer only changes one byte - the FIRST byte of the */
                /* buffer is written to the source index. This is the ONLY byte */
                /* written -- as per ACPI 2.0 */
                /* */
                /* Overwrite DEST contents, at buffer position 2 [only] */
                DEST [0x02] = SRCB /* \_SB_.IDX2.B2IB.SRCB */
                /* */
                /* Check that the next byte is not changed */
                /* */
                Local0 = DerefOf (DEST [0x03])
                If ((Local0 != 0x74))       /*  't' */
                {
                    /*  DEST element is not matching original value */

                    If ((Local0 == 0x68))
                    {
                        /*  DEST element was altered to 'h' */

                        Return (0x68)
                    }
                    Else
                    {
                        /* DEST element is an unknown value */

                        Return (0x69)
                    }
                }

                /* */
                /* Check that the elements beyond the SRCB buffer copy */
                /*  have not been altered. */
                /* */
                Local0 = DerefOf (DEST [0x0E])
                /* */
                /* This should be an 'f'. */
                /* */
                If ((Local0 != 0x66))
                {
                    /*  DEST element was zero'd by buffer copy */

                    If ((Local0 == 0x00))
                    {
                        /*  DEST element is zero */

                        Return (0x6A)
                    }
                    Else
                    {
                        /*  DEST element is unknown value */

                        Return (0x6B)
                    }
                }

                Debug = "Store(SRCB,Index(Buffer,,)) PASS"
                /* */
                /*  verify altering SRCB does NOT alter DEST */
                /* */
                SRCB [0x01] = 0x6A   /*  SRCB = "Sjort Buffer" */
                Local0 = DerefOf (SRCB [0x01])
                If ((Local0 != 0x6A))       /*  'j' */
                {
                    /*  SRCB element is unaltered */

                    Return (0x71)
                }

                Local0 = DerefOf (DEST [0x03]) /* DEST = "Destination buffer that... */
                If ((Local0 != 0x74))       /*  't' */
                {
                    /*  DEST element is altered */

                    If ((Local0 == 0x6A))  /*  'j' */
                    {
                        /*  SRCB change altered DEST element */

                        Return (0x72)
                    }
                    Else
                    {
                        /*  DEST element is unknown value */

                        Return (0x73)
                    }
                }

                /*  verify altering DEST does NOT alter SRCB */

                DEST [0x04] = 0x6B /*  DEST = "DeSkination buffer..." */
                Local0 = DerefOf (DEST [0x04])
                If ((Local0 != 0x6B))       /*  'k' */
                {
                    /*  DEST element is unaltered */

                    Return (0x74)
                }

                Local0 = DerefOf (SRCB [0x02])
                If ((Local0 != 0x6F))       /*  'o' */
                {
                    /*  SRC element is altered */

                    If ((Local0 == 0x6B))  /*  'k' */
                    {
                        /*  DEST change altered SRCB element */

                        Return (0x75)
                    }
                    Else
                    {
                        /*  SRCB element is unknown value */

                        Return (0x76)
                    }
                }

                Debug = "SRCB and DEST independent PASS"
                /* verify string can be written to Index target/destination */
                /* Only FIRST byte is written */
                DEST [0x02] = "New Buff"   /*  DEST = "DeNkination buffer..." */
                Local0 = DerefOf (DEST [0x02])
                If ((Local0 != 0x4E))       /*  'N' */
                {
                    /*  DEST element is unaltered */

                    Return (0x81)
                }

                Local0 = DerefOf (DEST [0x06])
                If ((Local0 != 0x61))       /*  'a' */
                {
                    /*  DEST element is unaltered */

                    Return (0x82)
                }

                Local0 = DerefOf (DEST [0x0A])
                If ((Local0 != 0x6E))       /*  'n' */
                {
                    /*  DEST element is unaltered */

                    Return (0x83)
                }

                Debug = "Store(String,Index) PASS"
                Return (0x00)  /*  pass */
            }   /*  B2IB:   store from Buffer into Index'ed Buffer */

            Method (FB2P, 0, Serialized)
            {
                /*  FB2P:   store from Field Buffer into Index'ed Package */

                Name (DEST, Package (0x02){})
                /*  initialize memory using 32-bit field elements */

                \_SB.MEM.SMD0 = 0x01234567
                \_SB.MEM.SMD1 = 0x89ABCDEF
                \_SB.MEM.SMD2 = 0xFEDCBA98
                \_SB.MEM.SMD3 = 0x76543210
                /*  move greater than 64-bit buffers into DEST package */

                DEST [0x00] = \_SB.MEM.SME0
                DEST [0x01] = \_SB.MEM.SME1
                /*  validate DEST contents */

                Local0 = DerefOf (DEST [0x00])
                Local1 = DerefOf (DEST [0x01])
                /*  verify Local0 and Local1 are Buffers */

                Local2 = ObjectType (Local0)
                If ((Local2 != 0x03))  /*  Buffer type is 3 */
                {
                    Return (0x11)
                }

                Local3 = ObjectType (Local1)
                If ((Local3 != 0x03))  /*  Buffer type is 3 */
                {
                    Return (0x12)
                }

                /*  validate DEST buffer contents */

                Local4 = DerefOf (DerefOf (DEST [0x00]) [0x00])
                If ((Local4 != 0x67))
                {
                    Return (0x13)
                }

                Local4 = DerefOf (DerefOf (DEST [0x00]) [0x01])
                If ((Local4 != 0x45))
                {
                    Return (0x14)
                }

                Local4 = DerefOf (DerefOf (DEST [0x00]) [0x04])
                If ((Local4 != 0xEF))
                {
                    Return (0x15)
                }

                Local4 = DerefOf (DerefOf (DEST [0x00]) [0x05])
                If ((Local4 != 0xCD))
                {
                    Return (0x16)
                }

                Debug = "Store(Mem,PkgElement) PASS"
                /*  validate changing source \_SB.MEM.SMD* does not impact DEST */

                \_SB.MEM.SMD0 = 0x12345678
                Local5 = DerefOf (DerefOf (DEST [0x00]) [0x00])
                If ((Local5 != 0x67))
                {
                    Return (0x21)
                }

                Local5 = DerefOf (DerefOf (DEST [0x00]) [0x01])
                If ((Local5 != 0x45))
                {
                    Return (0x22)
                }

                /*  validate changing DEST does not impact source \_SB.MEM.SMD* */

                DerefOf (DEST [0x00]) [0x00] = 0x30
                Local5 = DerefOf (DerefOf (DEST [0x00]) [0x00])
                If ((Local5 != 0x30))
                {
                    Return (0x23)
                }

                /* */
                /* This section was modified from the original iPCO code because */
                /*  it attempted to compare two buffers. This is not allowed until */
                /*  ACPI v2.0, so the test has been modified to just check the */
                /*  changed \_SB.MEM.SMD0 */
                /* */
                Local5 = \_SB.MEM.SMD0
                If ((Local5 != 0x12345678))
                {
                    Return (0x24)
                }

                Debug = "Mem and Pkg independent PASS"
                Return (0x00)
            }   /*  FB2P:   store from Field Buffer into Index'ed Package */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ IndexOp2 Test"
                /*  store _BIF package return value into Local0 */

                Local0 = \_SB.BAT1._BIF ()
                /*  save Local0 object type value into Local1 */

                Local1 = ObjectType (Local0)
                /*  validate Local0 is a Package */

                If ((Local1 != 0x04))  /*  Package type is 4 */
                {
                    /*  failure */

                    Return (0x02)
                }

                /*  validate source and destination buffers are independent of each */
                /*  of each other (i.e., changing one's contents does not change */
                /*  other's contents) using B2IB (store from Buffer into Index'ed */
                /*  Buffer) and FB2P (store from Field Buffer into Index'ed Package) */
                /*  call B2IB (store from Buffer into Index'ed Buffer) */
                Local2 = B2IB ()    /*  Local2 is B2IB return value */
                /*  save Local2 object type value into Local3 */

                Local3 = ObjectType (Local2)
                /*  validate Local2 is a Number */

                If ((Local3 != 0x01))  /*  Number type is 1 */
                {
                    /*  failure */

                    Return (0x04)
                }

                /*  zero indicates pass, non-zero is an error code */

                If ((Local2 != 0x00))
                {
                    /*  return B2IB error code */

                    Return (Local2)
                }

                /*  call FB2P (store from Field Buffer into Index'ed Package) */

                Local2 = FB2P ()    /*  Local2 is FB2P return value */
                /*  save Local2 object type value into Local3 */

                Local3 = ObjectType (Local2)
                /*  validate Local2 is a Number */

                If ((Local3 != 0x01))  /*  Number type is 1 */
                {
                    /*  failure */

                    Return (0x05)
                }

                /*  zero indicates pass, non-zero is an error code */

                If ((Local2 != 0x00))
                {
                    /*  return FB2P error code */

                    Return (Local2)
                }

                Return (0x00)
            }   /*  TEST */
        }   /*  IDX2:   Test device name */
    }   /*  _SB system bus */

    /* */
    /* test SizeOf.asl */
    /* */
    /*  Test for SizeOf */
    /*      test cases include following SizeOf arguments: */
    /*          buffer, buffer field; */
    /*          control method argument, control method local variable; */
    /*          control method return values; */
    /*          direct string, string; */
    /*          package; */
    /*          buffer, package, and string package elements */
    /* */
    /* MTL NOTE: This test has been modified to remove any SizeOf(Index(Buff,... */
    /*  calls because it is not legal to perform a SizeOf operation on a Buffer Field. */
    /*  This test has also been extended to test additional Package element sizes. */
    /* */
    Device (SIZO)
    {
        /*  SAR0 control method validates SizeOf(Arg) */
        /*      SAR0 should only be called by SARG */
        Method (SAR0, 2, NotSerialized)
        {
            /*  SAR0:   SizeOf(Arg) test control method */
            /*  Local0  Arg0 length */
            /*  Local1  Local0 object type */
            /*  Store first string size (Arg0) into Local7 */
            Local0 = SizeOf (Arg0)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x21)
            }

            /*  If strings are not of equal size, return error code */

            If ((Local0 != Arg1))
            {
                Return (0x22)
            }

            Return (0x00)
        }   /*  SAR0:   SizeOf(Arg) test control method */

        Method (SARG, 0, Serialized)
        {
            /*  SARG:   SizeOf(Arg) test control method */

            Name (BUFR, Buffer (0x0C){}) /*  uninitialized Buffer */
            Name (BUF1, Buffer (0x05)
            {
                 0x01, 0x02, 0x03, 0x04, 0x05                     // .....
            })
            Name (PKG0, Package (0x04){}) /*  uninitialized Package */
            Name (STR0, "String")
            Name (PKG1, Package (0x04)
            {
                BUFR, 
                "String2", 
                STR0, 
                PKG0
            })  /*  PKG1 */
            Name (PKG2, Package (0x04)
            {
                Buffer (0x0F){}, 
                "String 1", 
                Package (0x02){}
            })  /*  PKG2 */
            /*  Namespace entry buffer reference */

            Local0 = SAR0 (BUFR, 0x0C)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x23)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=BUFR) PASS"
            /*  Namespace entry package reference */

            Local0 = SAR0 (PKG0, 0x04)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x24)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=PKG0) PASS"
            /*  Namespace entry string reference */

            Local0 = SAR0 (STR0, 0x06)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x25)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=STR0) PASS"
            /*  direct string reference */

            Local0 = SAR0 ("String", 0x06)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x26)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=String) PASS"
            BUF1 [0x02] = 0x55
            /****************************************************
             //
             // This section is commented because it is illegal to
             //  perform a SizeOf operation on a Buffer Field
             //
             //  Namespace BufferField reference
             Store (SAR0 (Index (BUFR, 2, ), 10), Local0)
             //  save Local0 object type value into Local1
             Store (ObjectType (Local0), Local1)
             //  validate Local0 is a Number
             If (LNotEqual (Local1, 1))      //  Number type is 1
             {   Return (0x27)   }
             If (LNotEqual (Local0, 0))      //  Local0 is SAR0 return error code
             {   Return (Local0) }
             Store ("SizeOf(Arg=BufferField) PASS", Debug)
             ****************************************************/
            /*  Namespace BufferPackageElement reference */
            /* */
            Local0 = SAR0 (PKG1 [0x00], 0x0C)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x28)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=PackageBuffer NTE Reference Element) PASS"
            /*  Namespace StringPackageElement reference */

            Local0 = SAR0 (PKG1 [0x01], 0x07)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x29)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=Package String Element) PASS"
            /*  Namespace StringPackageElement reference */

            Local0 = SAR0 (PKG1 [0x02], 0x06)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x2A)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=Package String NTE Reference Element) PASS"
            /*  Namespace PackagePackageElement reference */

            Local0 = SAR0 (PKG1 [0x03], 0x04)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x2B)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=Package Package NTE Reference Element) PASS"
            /* Package Buffer Element */

            Local0 = SAR0 (PKG2 [0x00], 0x0F)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x2B)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=Package Buffer Element) PASS"
            /* Package String Element */

            Local0 = SAR0 (PKG2 [0x01], 0x08)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x2B)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=Package String Element) PASS"
            /* Package Package Element */

            Local0 = SAR0 (PKG2 [0x02], 0x02)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x2B)
            }

            If ((Local0 != 0x00))      /*  Local0 is SAR0 return error code */
            {
                Return (Local0)
            }

            Debug = "SizeOf(Arg=Package Package Element) PASS"
            Debug = "SizeOf(Arg) PASS"
            Return (0x00)
        }   /*  SARG:   SizeOf(Arg) test control method */

        Method (SBUF, 0, Serialized)
        {
            /*  SBUF:   SizeOf(Buffer) test control method */

            Name (BUFR, Buffer (0x0C){})
            /*  store size of BUFR buffer into Local0 */

            Local0 = SizeOf (BUFR)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x31)
            }

            If ((Local0 != 0x0C))     /*  BUFR size is 12 */
            {
                Return (0x32)
            }

            Debug = "SizeOf(BUFR) PASS"
            Return (0x00)
        }   /*  SBUF:   SizeOf(Buffer) test control method */

        /****************************************************
         //
         // This section is commented because it is illegal to
         //  perform a SizeOf operation on a Buffer Field
         //
         Method (SIND)
         {   //  SIND:   SizeOf(Index(,,)) test control method
         Name (BUFR, Buffer (12) {})
         //  store size of Index(BUFR,2,) buffer into Local0
         Store (SizeOf (Index (BUFR, 2, )), Local0)
         //  save Local0 object type value into Local1
         Store (ObjectType (Local0), Local1)
         //  validate Local0 is a Number
         If (LNotEqual (Local1, 1))      //  Number type is 1
         {
         Return (0x41)
         }
         If (LNotEqual (Local0, 10))     //  12 - 2 = 10
         {
         Return (0x42)
         }
         Store ("SizeOf(Index(BUFR,,)) PASS", Debug)
         //  TBD:    strings and packages
         Return (0)
         }   //  SIND:   SizeOf(Index(,,)) test control method
         ****************************************************/
        Method (SLOC, 0, Serialized)
        {
            /*  SLOC:   SizeOf(Local) test control method */

            Name (BUFR, Buffer (0x0C){}) /*  uninitialized Buffer */
            Name (STR0, "String")
            Name (PKG0, Package (0x04){}) /*  uninitialized Package */
            /*  store BUFR Buffer into Local2 */

            Local2 = BUFR /* \SIZO.SLOC.BUFR */
            /*  store size of BUFR buffer into Local0 */

            Local0 = SizeOf (Local2)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x51)
            }

            If ((Local0 != 0x0C)) /*  BUFR size is 12 */
            {
                Return (0x52)
            }

            Debug = "SizeOf(Local2=Buffer) PASS"
            /*  store STR0 string into Local2 */

            Local2 = STR0 /* \SIZO.SLOC.STR0 */
            /*  store size of STR0 buffer into Local0 */

            Local0 = SizeOf (Local2)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x53)
            }

            If ((Local0 != 0x06))      /*  STR0 size is 6 */
            {
                Return (0x54)
            }

            Debug = "SizeOf(Local2=String) PASS"
            /*  store PKG0 Package into Local2 */

            Local2 = PKG0 /* \SIZO.SLOC.PKG0 */
            /*  store size of PKG0 buffer into Local0 */

            Local0 = SizeOf (Local2)
            /*  save Local0 object type value into Local1 */

            Local1 = ObjectType (Local0)
            /*  validate Local0 is a Number */

            If ((Local1 != 0x01))      /*  Number type is 1 */
            {
                Return (0x55)
            }

            If ((Local0 != 0x04))      /*  PKG0 size is 4 */
            {
                Return (0x56)
            }

            Debug = "SizeOf(Local2=Package) PASS"
            Return (0x00)
        }   /*  SLOC:   SizeOf(Local) test control method */

        Method (TEST, 0, NotSerialized)
        {
            Debug = "++++++++ SizeOf Test"
            /*  Store current operating system string into Local0 */

            Local0 = _OS /* \_OS_ */
            Local3 = SizeOf (_OS)
            /*  save Local3 object type value into Local4 */

            Local4 = ObjectType (Local3)
            /*  validate Local3 is a Number */

            If ((Local4 != 0x01))  /*  Number type is 1 */
            {
                /*  failure */

                Return (0x61)
            }

            /*  Store current operating system string into Local0 */
            /*  This verifies above SizeOf(_OS) did not corrupt ACPI namespace */
            Local0 = _OS /* \_OS_ */
            /*  Store SARG [Validate SizeOf(Arg)] return value into Local1 */

            Local1 = SARG ()
            /*  save Local1 object type value into Local2 */

            Local2 = ObjectType (Local1)
            /*  validate Local1 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                /*  failure */

                Return (0x62)
            }

            /*  zero indicates pass, non-zero is an error code */

            If ((Local1 != 0x00))
            {
                /*  return SARG error code */

                Return (Local1)
            }

            /*  Store SBUF [Validate SizeOf(Buffer)] return value into Local1 */

            Local1 = SBUF ()
            /*  save Local1 object type value into Local2 */

            Local2 = ObjectType (Local1)
            /*  validate Local1 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                /*  failure */

                Return (0x63)
            }

            /*  zero indicates pass, non-zero is an error code */

            If ((Local1 != 0x00))
            {
                /*  return SBUF error code */

                Return (Local1)
            }

            /****************************************************
             //
             // This section is commented because it is illegal to
             //  perform a SizeOf operation on a Buffer Field
             //
             //  Store SIND [verify SizeOf(Index(,,))] return value into Local1
             Store (SIND, Local1)
             //  save Local1 object type value into Local2
             Store (ObjectType (Local1), Local2)
             //  validate Local1 is a Number
             If (LNotEqual (Local2, 1))  //  Number type is 1
             {
             //  failure
             Return (0x64)
             }
             //  zero indicates pass, non-zero is an error code
             If (LNotEqual (Local1, 0))
             {
             //  return SARG error code
             Return (Local1)
             }
             ****************************************************/
            /*  Store SLOC [verify SizeOf(Local)] return value into Local1 */
            Local1 = SLOC ()
            /*  save Local1 object type value into Local2 */

            Local2 = ObjectType (Local1)
            /*  validate Local1 is a Number */

            If ((Local2 != 0x01))  /*  Number type is 1 */
            {
                /*  failure */

                Return (0x65)
            }

            /*  zero indicates pass, non-zero is an error code */

            If ((Local1 != 0x00))
            {
                /*  return SLOC error code */

                Return (Local1)
            }

            /*  TBD:    SizeOf (METH) -- where METH control method returns */
            /*              buffer, BufferField, string, package, package element */
            Return (0x00)
        }   /*  TEST */
    }   /*  SIZO */

    /* */
    /* test SmiShare.asl */
    /* */
    Scope (\_SB)    /*  System Bus */
    {
        /*  _SB system bus */
        /*  Declare an OpRegion in Memory starting at offset 0x400000 that is 10 bytes long */
        OperationRegion (RAM1, SystemMemory, 0x00400000, 0x0A)
        Field (RAM1, AnyAcc, NoLock, Preserve)
        {
            BI1T,        /* Create some bits in memory to access */   1, 
            BI2T,   2, 
            BI3T,   3, 
            LST2,   2
        }   /*  End Field RAM1 */

        Field (RAM1, WordAcc, NoLock, WriteAsZeros)
        {
            WRD,    16
        }   /*  End 2nd Field RAM1 */

        Field (RAM1, ByteAcc, NoLock, WriteAsOnes)
        {
            BYTE,   8
        }   /*  End 3rd Field RAM1 */

        Field (RAM1, ByteAcc, NoLock, Preserve)
        {
            SMIC,   8, 
            SMID,   8
        }

        Device (MBIT)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                BI1T = 0x00
                BI2T = 0x03
                BI3T = 0x07
                LST2 = 0x00
            }   /*  End _INI Method */
        }   /*  End Device MBIT */

        Device (MWRD)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                WRD = 0x00
            }   /*  End _INI Method */
        }   /*  End Device MWRD */

        Device (MBYT)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                BYTE = 0x00
                SMIC = 0x0C
                SMID = 0x0D
            }   /*  End _INI Method */
        }   /*  End Device MBYT */

        /*
         //  Declare an OpRegion in Memory starting at offset 0x400000 that is 10 bytes long
         OperationRegion(\RAM1, SystemMemory, 0x400000, 0xA)
         Field (\RAM1, AnyAcc, NoLock, Preserve)
         {
         BI1T, 1,        // Create some bits in memory to access
         BI2T, 2,
         BI3T, 3,
         LST2, 2
         }   //  End Field RAM1
         Field (\RAM1, WordAcc, NoLock, WriteAsZeros)
         {
         WRD, 16
         }   //  End 2nd Field RAM1
         Field (\RAM1, ByteAcc, NoLock, WriteAsOnes)
         {
         BYTE, 8
         }   //  End 3rd Field RAM1
         Field (\RAM1, ByteAcc, NoLock, Preserve)
         {
         SMIC, 8,
         SMID, 8
         }
         */
        Method (SMIX, 0, NotSerialized)
        {
            Return (BYTE) /* \_SB_.BYTE */
        }   /*  End SMIX */

        Method (EVNT, 0, NotSerialized)
        {
            Local0 = SMIX ()
            Notify (\_SB, 0x29) // Reserved
            If ((Local0 & 0x01))
            {
                Notify (\_SB.SMIS, 0x21) // Reserved
            }

            If ((Local0 & 0x02))
            {
                Notify (\_SB.SMIS, 0x22) // Reserved
            }

            If ((Local0 & 0x04))
            {
                Notify (\_SB.SMIS, 0x24) // Reserved
            }

            If ((Local0 & 0x08))
            {
                Notify (\_SB.SMIS, 0x28) // Reserved
            }
        }   /*  End Method EVNT */

        Method (NTFY, 0, NotSerialized)
        {
            Notify (\_SB, 0x01) // Device Check
            Notify (\_TZ.TZ1, 0x02) // Device Wake
            Notify (\_PR.CPU0, 0x03) // Eject Request
            Notify (\_SB, 0x81) // Information Change
            Notify (\_TZ.TZ1, 0x82) // Thermal Device List Change
            Notify (\_PR.CPU0, 0x83) // Guaranteed Change
        }

        Device (SMIS)
        {
            Method (BINK, 0, NotSerialized)
            {
                Local0 = 0x00               /*  Zero out Local0 */
                If ((SMID != 0x0D))
                {
                    Local0 |= 0x80
                }

                If ((SMIC != 0x0C))
                {
                    Local0 |= 0x40
                }

                If ((BYTE != 0x00))
                {
                    Local0 |= 0x20
                }

                If ((WRD != 0x00))
                {
                    Local0 |= 0x10
                }

                If ((LST2 != 0x00))
                {
                    Local0 |= 0x08
                }

                If ((BI3T != 0x07))
                {
                    Local0 |= 0x04
                }

                If ((BI2T != 0x03))
                {
                    Local0 |= 0x02
                }

                If ((BI1T != 0x00))
                {
                    Local0 |= 0x01
                }

                Return (Local0)
            }   /*  End Method BINK */

            Method (TEST, 0, NotSerialized)
            {
                Debug = "++++++++ SmiShare Test"
                /*  Expect EVNT to generate Notify value we just previously */
                /*  stored in BYTE */
                BYTE = 0x20
                EVNT ()
                BYTE = 0x21
                EVNT ()
                BYTE = 0x22
                EVNT ()
                BYTE = 0x23
                EVNT ()
                NTFY ()
                Return (0x00)  /*  pass */
            }   /*  End Method TEST */
        }   /*  Device SMIS */

        Device (CNDT)
        {
            Method (TEST, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    Return ("Broken")
                }
                Else
                {
                    Return ("Works")
                }
            }

            Method (ECOK, 0, NotSerialized)
            {
                Return (0x00)
            }
        }
    }   /*  _SB system bus */

    /* Test a very big buffer */

    Name (WQAB, Buffer (0x1A64)
    {
        /* 0000 */  0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,  // FOMB....
        /* 0008 */  0x54, 0x1A, 0x00, 0x00, 0xBA, 0xAD, 0x00, 0x00,  // T.......
        /* 0010 */  0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,  // DS...}.T
        /* 0018 */  0x98, 0xBD, 0x92, 0x00, 0x01, 0x06, 0x18, 0x42,  // .......B
        /* 0020 */  0x10, 0x47, 0x10, 0x92, 0x46, 0x62, 0x02, 0x89,  // .G..Fb..
        /* 0028 */  0x80, 0x90, 0x18, 0x18, 0x14, 0x81, 0x85, 0x00,  // ........
        /* 0030 */  0x49, 0x02, 0x88, 0xC4, 0x41, 0xE1, 0x20, 0xD4,  // I...A. .
        /* 0038 */  0x9F, 0x40, 0x7E, 0x05, 0x20, 0x74, 0x28, 0x40,  // .@~. t(@
        /* 0040 */  0xA6, 0x00, 0x83, 0x02, 0x9C, 0x22, 0x88, 0xA0,  // ....."..
        /* 0048 */  0x57, 0x01, 0x36, 0x05, 0x98, 0x14, 0x60, 0x51,  // W.6...`Q
        /* 0050 */  0x80, 0x76, 0x01, 0x96, 0x05, 0xE8, 0x16, 0x20,  // .v..... 
        /* 0058 */  0x1D, 0x96, 0x88, 0x04, 0x47, 0x89, 0x01, 0x47,  // ....G..G
        /* 0060 */  0xE9, 0xC4, 0x16, 0x6E, 0xD8, 0xE0, 0x85, 0xA2,  // ...n....
        /* 0068 */  0x68, 0x06, 0x51, 0x12, 0x94, 0x8B, 0x20, 0x5D,  // h.Q... ]
        /* 0070 */  0x10, 0x52, 0x2E, 0xC0, 0x37, 0x82, 0x06, 0x10,  // .R..7...
        /* 0078 */  0xA5, 0x77, 0x01, 0xB6, 0x05, 0x98, 0x86, 0x27,  // .w.....'
        /* 0080 */  0xD2, 0x20, 0xE4, 0x60, 0x08, 0x54, 0xCE, 0x80,  // . .`.T..
        /* 0088 */  0x20, 0x69, 0x44, 0x21, 0x1E, 0xA7, 0x44, 0x08,  //  iD!..D.
        /* 0090 */  0x0A, 0x84, 0x90, 0xD4, 0xF1, 0xA0, 0xA0, 0x71,  // .......q
        /* 0098 */  0x88, 0xAD, 0xCE, 0x46, 0x93, 0xA9, 0x74, 0x7E,  // ...F..t~
        /* 00A0 */  0x48, 0x82, 0x70, 0xC6, 0x2A, 0x7E, 0x3A, 0x9A,  // H.p.*~:.
        /* 00A8 */  0xD0, 0xD9, 0x9C, 0x60, 0xE7, 0x18, 0x72, 0x3C,  // ...`..r<
        /* 00B0 */  0x48, 0xF4, 0x20, 0xB8, 0x00, 0x0F, 0x1C, 0x2C,  // H. ....,
        /* 00B8 */  0x34, 0x84, 0x22, 0x6B, 0x80, 0xC1, 0x8C, 0xDD,  // 4."k....
        /* 00C0 */  0x63, 0xB1, 0x0B, 0x4E, 0x0A, 0xEC, 0x61, 0xB3,  // c..N..a.
        /* 00C8 */  0x01, 0x19, 0xA2, 0x24, 0x38, 0xD4, 0x11, 0xC0,  // ...$8...
        /* 00D0 */  0x12, 0x05, 0x98, 0x1F, 0x87, 0x0C, 0x0F, 0x95,  // ........
        /* 00D8 */  0x8C, 0x25, 0x24, 0x1B, 0xAB, 0x87, 0xC2, 0xA5,  // .%$.....
        /* 00E0 */  0x40, 0x68, 0x6C, 0x27, 0xED, 0x19, 0x45, 0x2C,  // @hl'..E,
        /* 00E8 */  0x79, 0x4A, 0x82, 0x49, 0xE0, 0x51, 0x44, 0x36,  // yJ.I.QD6
        /* 00F0 */  0x1A, 0x27, 0x28, 0x1B, 0x1A, 0x25, 0x03, 0x42,  // .'(..%.B
        /* 00F8 */  0x9E, 0x05, 0x58, 0x07, 0x26, 0x04, 0x76, 0x2F,  // ..X.&.v/
        /* 0100 */  0xC0, 0x9A, 0x00, 0x73, 0xB3, 0x90, 0xB1, 0xB9,  // ...s....
        /* 0108 */  0xE8, 0xFF, 0x0F, 0x71, 0xB0, 0x31, 0xDA, 0x9A,  // ...q.1..
        /* 0110 */  0xAE, 0x90, 0xC2, 0xC4, 0x88, 0x12, 0x2C, 0x5E,  // ......,^
        /* 0118 */  0xC5, 0xC3, 0x10, 0xCA, 0x93, 0x42, 0xA8, 0x48,  // .....B.H
        /* 0120 */  0x95, 0xA1, 0x68, 0xB4, 0x51, 0x2A, 0x14, 0xE0,  // ..h.Q*..
        /* 0128 */  0x4C, 0x80, 0x30, 0x5C, 0x1D, 0x03, 0x82, 0x46,  // L.0\...F
        /* 0130 */  0x88, 0x15, 0x29, 0x56, 0xFB, 0x83, 0x20, 0xF1,  // ..)V.. .
        /* 0138 */  0x2D, 0x40, 0x54, 0x01, 0xA2, 0x48, 0xA3, 0x41,  // -@T..H.A
        /* 0140 */  0x9D, 0x03, 0x3C, 0x5C, 0x0F, 0xF5, 0xF0, 0x3D,  // ..<\...=
        /* 0148 */  0xF6, 0x93, 0x0C, 0x72, 0x90, 0x67, 0xF1, 0xA8,  // ...r.g..
        /* 0150 */  0x70, 0x9C, 0x06, 0x49, 0xE0, 0x0B, 0x80, 0x4F,  // p..I...O
        /* 0158 */  0x08, 0x1E, 0x38, 0xDE, 0x35, 0xA0, 0x66, 0x7C,  // ..8.5.f|
        /* 0160 */  0xBC, 0x4C, 0x10, 0x1C, 0x6A, 0x88, 0x1E, 0x68,  // .L..j..h
        /* 0168 */  0xB8, 0x13, 0x38, 0x44, 0x06, 0xE8, 0x49, 0x3D,  // ..8D..I=
        /* 0170 */  0x52, 0x60, 0x07, 0x77, 0x32, 0xEF, 0x01, 0xAF,  // R`.w2...
        /* 0178 */  0x0A, 0xCD, 0x5E, 0x12, 0x08, 0xC1, 0xF1, 0xF8,  // ..^.....
        /* 0180 */  0x7E, 0xC0, 0x26, 0x9C, 0xC0, 0xF2, 0x07, 0x81,  // ~.&.....
        /* 0188 */  0x1A, 0x99, 0xA1, 0x3D, 0xCA, 0xD3, 0x8A, 0x19,  // ...=....
        /* 0190 */  0xF2, 0x31, 0xC1, 0x04, 0x16, 0x0B, 0x21, 0x05,  // .1....!.
        /* 0198 */  0x10, 0x1A, 0x0F, 0xF8, 0x6F, 0x00, 0x8F, 0x17,  // ....o...
        /* 01A0 */  0xBE, 0x12, 0xC4, 0xF6, 0x80, 0x12, 0x0C, 0x0B,  // ........
        /* 01A8 */  0x21, 0x23, 0xAB, 0xF0, 0x78, 0xE8, 0x28, 0x7C,  // !#..x.(|
        /* 01B0 */  0x95, 0x38, 0x9C, 0xD3, 0x8A, 0x67, 0x82, 0xE1,  // .8...g..
        /* 01B8 */  0x20, 0xF4, 0x05, 0x90, 0x00, 0x51, 0xE7, 0x0C,  //  ....Q..
        /* 01C0 */  0xD4, 0x61, 0xC1, 0xE7, 0x04, 0x76, 0x33, 0x38,  // .a...v38
        /* 01C8 */  0x83, 0x47, 0x00, 0x8F, 0xE4, 0x84, 0xFC, 0x2B,  // .G.....+
        /* 01D0 */  0xF1, 0xC0, 0xE0, 0x03, 0xE2, 0xEF, 0x1F, 0xA7,  // ........
        /* 01D8 */  0xEC, 0x11, 0x9C, 0xA9, 0x01, 0x7D, 0x1C, 0xF0,  // .....}..
        /* 01E0 */  0xFF, 0x7F, 0x28, 0x7C, 0x88, 0x1E, 0xDF, 0x29,  // ..(|...)
        /* 01E8 */  0x1F, 0xAF, 0x4F, 0x17, 0x96, 0x35, 0x4E, 0xE8,  // ..O..5N.
        /* 01F0 */  0x77, 0x08, 0x9F, 0x38, 0x7C, 0x64, 0x71, 0x44,  // w..8|dqD
        /* 01F8 */  0x08, 0x39, 0x39, 0x05, 0xA0, 0x81, 0x4F, 0xF7,  // .99...O.
        /* 0200 */  0xEC, 0x22, 0x9C, 0xAE, 0x27, 0xE5, 0x40, 0xC3,  // ."..'.@.
        /* 0208 */  0xA0, 0xE3, 0x04, 0xC7, 0x79, 0x00, 0x1C, 0xE3,  // ....y...
        /* 0210 */  0x84, 0x7F, 0x2E, 0x80, 0x3F, 0x40, 0x7E, 0xCA,  // ....?@~.
        /* 0218 */  0x78, 0xC5, 0x48, 0xE0, 0x98, 0x23, 0x44, 0x9F,  // x.H..#D.
        /* 0220 */  0x6B, 0x3C, 0x42, 0x2C, 0xFC, 0x53, 0x45, 0xE1,  // k<B,.SE.
        /* 0228 */  0x03, 0x21, 0x63, 0x04, 0x17, 0xA0, 0xC7, 0x08,  // .!c.....
        /* 0230 */  0x7C, 0x03, 0x8E, 0x11, 0x7D, 0x94, 0xE0, 0xEA,  // |...}...
        /* 0238 */  0x0F, 0x1A, 0x74, 0x80, 0xB8, 0xFF, 0xFF, 0x00,  // ..t.....
        /* 0240 */  0xE1, 0x83, 0x7A, 0x80, 0xC0, 0x37, 0xFA, 0xD1,  // ..z..7..
        /* 0248 */  0x03, 0x3D, 0x2E, 0x8B, 0x3E, 0x0F, 0xC8, 0xF8,  // .=..>...
        /* 0250 */  0x89, 0x46, 0xF3, 0xE2, 0xA7, 0x03, 0x7E, 0xF8,  // .F....~.
        /* 0258 */  0x00, 0x0F, 0xA8, 0x87, 0x84, 0x03, 0xC5, 0x4C,  // .......L
        /* 0260 */  0x9B, 0x83, 0x3E, 0xBB, 0x1C, 0x3A, 0x76, 0xB8,  // ..>..:v.
        /* 0268 */  0xE0, 0x3F, 0x81, 0x80, 0x4B, 0xDE, 0x21, 0x0C,  // .?..K.!.
        /* 0270 */  0x14, 0x23, 0xC6, 0x9F, 0x83, 0x7C, 0x0A, 0x03,  // .#...|..
        /* 0278 */  0xFF, 0xFF, 0xFF, 0x14, 0x06, 0xFE, 0xE1, 0xF0,  // ........
        /* 0280 */  0x20, 0x4F, 0x07, 0x9F, 0xB6, 0xA8, 0x74, 0x18,  //  O....t.
        /* 0288 */  0xD4, 0x81, 0x0B, 0xB0, 0x32, 0x89, 0x08, 0xCF,  // ....2...
        /* 0290 */  0x12, 0xB5, 0x41, 0xE8, 0xD4, 0xF0, 0x36, 0xF1,  // ..A...6.
        /* 0298 */  0xB6, 0xE5, 0x5B, 0x40, 0x9C, 0xD3, 0xEC, 0xED,  // ..[@....
        /* 02A0 */  0xC0, 0x45, 0x30, 0x22, 0xD4, 0x0C, 0x45, 0x4E,  // .E0"..EN
        /* 02A8 */  0x5A, 0x11, 0x63, 0x44, 0x79, 0xDC, 0x32, 0xCA,  // Z.cDy.2.
        /* 02B0 */  0xDB, 0xD6, 0x0B, 0x40, 0xBC, 0x13, 0x7B, 0xDE,  // ...@..{.
        /* 02B8 */  0x32, 0x46, 0xF0, 0xC8, 0x0F, 0x5C, 0x2C, 0xC6,  // 2F...\,.
        /* 02C0 */  0xEA, 0xF5, 0x5F, 0xF3, 0x81, 0x0B, 0x70, 0xF6,  // .._...p.
        /* 02C8 */  0xFF, 0x3F, 0x70, 0x01, 0x1C, 0x0A, 0x7A, 0x18,  // .?p...z.
        /* 02D0 */  0x42, 0x0F, 0xC3, 0x53, 0x39, 0x97, 0x87, 0xC8,  // B..S9...
        /* 02D8 */  0x53, 0x89, 0x18, 0x35, 0x4C, 0xD4, 0x67, 0x28,  // S..5L.g(
        /* 02E0 */  0xDF, 0x2D, 0x7C, 0x20, 0x02, 0xDF, 0x99, 0x0B,  // .-| ....
        /* 02E8 */  0xF8, 0xFD, 0xFF, 0x0F, 0x44, 0x70, 0x8E, 0x29,  // ....Dp.)
        /* 02F0 */  0xB8, 0x33, 0x0D, 0x78, 0x7C, 0xCE, 0x40, 0x20,  // .3.x|.@ 
        /* 02F8 */  0xA7, 0xE2, 0x43, 0x0D, 0x60, 0x41, 0xF4, 0x13,  // ..C.`A..
        /* 0300 */  0xC2, 0x27, 0x1A, 0x2A, 0x13, 0x06, 0x75, 0xA8,  // .'.*..u.
        /* 0308 */  0x01, 0xAC, 0x5C, 0x61, 0x9E, 0x46, 0xCF, 0xF9,  // ..\a.F..
        /* 0310 */  0x59, 0xC6, 0xA7, 0x1A, 0x1F, 0x4A, 0x8D, 0x63,  // Y....J.c
        /* 0318 */  0x88, 0x97, 0x99, 0x87, 0x1A, 0x1F, 0x0B, 0x5E,  // .......^
        /* 0320 */  0x49, 0x7D, 0xA8, 0x31, 0x54, 0x9C, 0x87, 0x1A,  // I}.1T...
        /* 0328 */  0x0F, 0x37, 0x50, 0xD4, 0x37, 0x9B, 0x67, 0x1B,  // .7P.7.g.
        /* 0330 */  0xA3, 0xC7, 0xF7, 0x0D, 0xD5, 0x10, 0x0F, 0x35,  // .......5
        /* 0338 */  0x4C, 0xF2, 0x4A, 0x35, 0x16, 0x1F, 0x6A, 0xC0,  // L.J5..j.
        /* 0340 */  0xF1, 0xFF, 0x3F, 0xD4, 0x00, 0xFC, 0xFF, 0xFF,  // ..?.....
        /* 0348 */  0x1F, 0x6A, 0x00, 0x47, 0x47, 0x03, 0x38, 0x47,  // .j.GG.8G
        /* 0350 */  0x46, 0xDC, 0xD1, 0x00, 0x5C, 0x87, 0x52, 0xE0,  // F...\.R.
        /* 0358 */  0x70, 0x34, 0x00, 0x1E, 0x47, 0x21, 0x30, 0x5F,  // p4..G!0_
        /* 0360 */  0x68, 0x7C, 0x14, 0x02, 0x16, 0xFF, 0xFF, 0xA3,  // h|......
        /* 0368 */  0x10, 0xF8, 0x65, 0x9F, 0x83, 0x50, 0x42, 0x8F,  // ..e..PB.
        /* 0370 */  0x42, 0x80, 0xA0, 0xDB, 0xCF, 0x53, 0xC4, 0xB3,  // B....S..
        /* 0378 */  0x8F, 0x2F, 0x3F, 0x0F, 0x04, 0x11, 0x5E, 0xF3,  // ./?...^.
        /* 0380 */  0x7D, 0x0A, 0xF2, 0x21, 0xDF, 0x47, 0x21, 0x06,  // }..!.G!.
        /* 0388 */  0x63, 0x28, 0x5F, 0x83, 0x7C, 0x14, 0x62, 0x50,  // c(_.|.bP
        /* 0390 */  0xAF, 0x41, 0xBE, 0xEF, 0x1B, 0xE4, 0xF1, 0x22,  // .A....."
        /* 0398 */  0x48, 0xEC, 0x67, 0x02, 0x1F, 0x85, 0x98, 0xE8,  // H.g.....
        /* 03A0 */  0xA3, 0x10, 0xA0, 0xF0, 0xFF, 0x7F, 0x14, 0x02,  // ........
        /* 03A8 */  0xF8, 0xFF, 0xFF, 0x3F, 0x0A, 0x01, 0xCE, 0x02,  // ...?....
        /* 03B0 */  0x1C, 0x0D, 0x40, 0x37, 0xAD, 0x47, 0x21, 0xF0,  // ..@7.G!.
        /* 03B8 */  0xDE, 0x59, 0x4E, 0xFB, 0x04, 0x7C, 0x16, 0x02,  // .YN..|..
        /* 03C0 */  0xCC, 0xFE, 0xFF, 0xCF, 0x42, 0xC0, 0xEC, 0x28,  // ....B..(
        /* 03C8 */  0x74, 0x14, 0x67, 0xF9, 0x2A, 0xF4, 0x04, 0xF0,  // t.g.*...
        /* 03D0 */  0x02, 0x10, 0x23, 0xCC, 0x3B, 0xD0, 0x4B, 0x26,  // ..#.;.K&
        /* 03D8 */  0xBB, 0x8B, 0x1B, 0xE7, 0xC9, 0xE5, 0x2C, 0x9E,  // ......,.
        /* 03E0 */  0xC4, 0x7D, 0x09, 0xF2, 0x81, 0xE2, 0x59, 0xC8,  // .}....Y.
        /* 03E8 */  0x50, 0xA7, 0x1B, 0xF4, 0x8D, 0xDC, 0x03, 0x8B,  // P.......
        /* 03F0 */  0x19, 0x3F, 0xC4, 0xF3, 0x90, 0x21, 0x9E, 0x85,  // .?...!..
        /* 03F8 */  0x00, 0x76, 0xFD, 0xFF, 0xCF, 0x42, 0x00, 0xFF,  // .v...B..
        /* 0400 */  0xFF, 0xFF, 0x47, 0x03, 0xF8, 0x2F, 0x00, 0x9F,  // ..G../..
        /* 0408 */  0x85, 0x80, 0xE7, 0x09, 0xE0, 0x41, 0xDB, 0x67,  // .....A.g
        /* 0410 */  0x21, 0x80, 0x33, 0x87, 0xCB, 0xF3, 0x7F, 0x05,  // !.3.....
        /* 0418 */  0x3A, 0x96, 0xF7, 0x08, 0xCF, 0xFA, 0x24, 0x5F,  // :.....$_
        /* 0420 */  0x2F, 0x3D, 0xD3, 0x87, 0x82, 0x67, 0x21, 0x86,  // /=...g!.
        /* 0428 */  0x75, 0x18, 0x3E, 0x0B, 0x31, 0x88, 0x17, 0x4D,  // u.>.1..M
        /* 0430 */  0x43, 0xBC, 0x70, 0xFA, 0x30, 0xE0, 0xFF, 0x3F,  // C.p.0..?
        /* 0438 */  0x5E, 0xE0, 0x57, 0x4E, 0x03, 0x05, 0x09, 0xF4,  // ^.WN....
        /* 0440 */  0x2C, 0x04, 0x30, 0xFE, 0xFF, 0x7F, 0x16, 0x02,  // ,.0.....
        /* 0448 */  0xC8, 0xB8, 0x46, 0x9D, 0x85, 0x80, 0xE5, 0x6D,  // ..F....m
        /* 0450 */  0xE5, 0x19, 0xDB, 0xA7, 0x95, 0x04, 0xFF, 0xFF,  // ........
        /* 0458 */  0x67, 0x21, 0xC0, 0x41, 0x2E, 0x23, 0x07, 0x21,  // g!.A.#.!
        /* 0460 */  0x4C, 0xC4, 0x87, 0x83, 0x8F, 0x99, 0x80, 0x9E,  // L.......
        /* 0468 */  0x29, 0xBE, 0xB8, 0x1B, 0xE3, 0x09, 0xE0, 0x45,  // )......E
        /* 0470 */  0xE2, 0x31, 0x93, 0x1D, 0x35, 0x0D, 0xF3, 0x2C,  // .1..5..,
        /* 0478 */  0x64, 0xBC, 0xB3, 0x78, 0x0D, 0x78, 0x82, 0xF7,  // d..x.x..
        /* 0480 */  0xE4, 0x9F, 0x85, 0x18, 0xD8, 0x61, 0x05, 0x7B,  // .....a.{
        /* 0488 */  0x14, 0x32, 0xA8, 0xC1, 0x63, 0x87, 0x08, 0x13,  // .2..c...
        /* 0490 */  0xE8, 0x59, 0x88, 0xC5, 0x7D, 0xAE, 0xE8, 0x3C,  // .Y..}..<
        /* 0498 */  0xE1, 0xB3, 0x10, 0xF0, 0xFE, 0xFF, 0x9F, 0x25,  // .......%
        /* 04A0 */  0xE0, 0x5E, 0x0D, 0x9E, 0x85, 0x00, 0x13, 0x87,  // .^......
        /* 04A8 */  0x0D, 0x9F, 0x35, 0xC0, 0x33, 0x7C, 0x8F, 0xEA,  // ..5.3|..
        /* 04B0 */  0x1C, 0x1E, 0x8F, 0x81, 0x7F, 0x56, 0x1D, 0xE7,  // .....V..
        /* 04B8 */  0x04, 0x96, 0x7B, 0xD1, 0xB2, 0x71, 0xA0, 0xA1,  // ..{..q..
        /* 04C0 */  0x23, 0xB2, 0x3A, 0x20, 0x8D, 0x0D, 0x73, 0x29,  // #.: ..s)
        /* 04C8 */  0x89, 0x7C, 0x72, 0x6C, 0xD4, 0x56, 0x04, 0xA7,  // .|rl.V..
        /* 04D0 */  0x33, 0x93, 0x4F, 0x00, 0xD6, 0x42, 0x21, 0x05,  // 3.O..B!.
        /* 04D8 */  0x34, 0x1A, 0x8B, 0xE1, 0x9D, 0xF9, 0xE8, 0x44,  // 4......D
        /* 04E0 */  0x41, 0x0C, 0xE8, 0xE3, 0x90, 0x6D, 0x1C, 0x0A,  // A....m..
        /* 04E8 */  0x50, 0x7B, 0xD1, 0x14, 0xC8, 0x39, 0x07, 0xA3,  // P{...9..
        /* 04F0 */  0x7F, 0x76, 0x74, 0x36, 0xBE, 0x13, 0x70, 0x0D,  // .vt6..p.
        /* 04F8 */  0x10, 0x3A, 0x25, 0x18, 0xDA, 0x6A, 0x04, 0xFC,  // .:%..j..
        /* 0500 */  0xFF, 0x67, 0x89, 0x01, 0x33, 0xFE, 0x53, 0x8C,  // .g..3.S.
        /* 0508 */  0x09, 0x7C, 0x8E, 0xC1, 0x1F, 0x0C, 0xF0, 0x03,  // .|......
        /* 0510 */  0x7F, 0x31, 0xA8, 0xFA, 0x5E, 0xA0, 0xFB, 0x82,  // .1..^...
        /* 0518 */  0xD5, 0xDD, 0x64, 0x20, 0xCC, 0xC8, 0x04, 0xF5,  // ..d ....
        /* 0520 */  0x9D, 0x0E, 0x40, 0x01, 0xE4, 0x0B, 0x81, 0xCF,  // ..@.....
        /* 0528 */  0x51, 0x0F, 0x05, 0x6C, 0x22, 0x21, 0xC2, 0x44,  // Q..l"!.D
        /* 0530 */  0x33, 0x3A, 0x62, 0xC2, 0xA8, 0xE8, 0x13, 0xA6,  // 3:b.....
        /* 0538 */  0x20, 0x9E, 0xB0, 0x63, 0x4D, 0x18, 0x3D, 0x13,  //  ..cM.=.
        /* 0540 */  0x5F, 0x74, 0xD8, 0x88, 0x31, 0x21, 0xAE, 0x1E,  // _t..1!..
        /* 0548 */  0xD0, 0x26, 0x18, 0xD4, 0x97, 0x22, 0x58, 0x43,  // .&..."XC
        /* 0550 */  0xE6, 0x63, 0xF1, 0x05, 0x02, 0x37, 0x65, 0x30,  // .c...7e0
        /* 0558 */  0xCE, 0x89, 0x5D, 0x13, 0x7C, 0xD9, 0xC1, 0xCD,  // ..].|...
        /* 0560 */  0x19, 0x8C, 0xF0, 0x98, 0xBB, 0x18, 0xBF, 0x3A,  // .......:
        /* 0568 */  0x79, 0x74, 0xFC, 0xA0, 0xE0, 0x1B, 0x0E, 0xC3,  // yt......
        /* 0570 */  0x7E, 0x32, 0xF3, 0x8C, 0xDE, 0xCB, 0x7C, 0x8D,  // ~2....|.
        /* 0578 */  0xC3, 0xC0, 0x7A, 0xBC, 0x1C, 0xD6, 0x68, 0x61,  // ..z...ha
        /* 0580 */  0x0F, 0xED, 0x3D, 0xC4, 0xFF, 0xFF, 0x43, 0x8C,  // ..=...C.
        /* 0588 */  0xCF, 0x13, 0xC6, 0x08, 0xEB, 0xDB, 0x0B, 0x38,  // .......8
        /* 0590 */  0xEE, 0x59, 0xF0, 0xEF, 0x1A, 0xE0, 0xB9, 0x84,  // .Y......
        /* 0598 */  0xF8, 0xAE, 0x01, 0x30, 0xF0, 0xFF, 0x7F, 0xD7,  // ...0....
        /* 05A0 */  0x00, 0x4E, 0xD7, 0x04, 0xDF, 0x35, 0x80, 0xF7,  // .N...5..
        /* 05A8 */  0xD0, 0x7D, 0xD7, 0x00, 0xAE, 0xD9, 0xEF, 0x1A,  // .}......
        /* 05B0 */  0xA8, 0x63, 0x80, 0x15, 0xDE, 0x35, 0xA0, 0x5D,  // .c...5.]
        /* 05B8 */  0xD9, 0xDE, 0xD7, 0x9E, 0xB0, 0xAC, 0xE9, 0xB2,  // ........
        /* 05C0 */  0x81, 0x52, 0x73, 0xD9, 0x00, 0x14, 0xFC, 0xFF,  // .Rs.....
        /* 05C8 */  0x2F, 0x1B, 0x80, 0x01, 0x29, 0x13, 0x46, 0x85,  // /...).F.
        /* 05D0 */  0x9F, 0x30, 0x05, 0xF1, 0x84, 0x1D, 0xEC, 0xB2,  // .0......
        /* 05D8 */  0x01, 0x8A, 0x18, 0x97, 0x0D, 0xD0, 0x8F, 0xED,  // ........
        /* 05E0 */  0x65, 0x03, 0x18, 0xDC, 0x13, 0xF8, 0x6D, 0x03,  // e.....m.
        /* 05E8 */  0x78, 0x43, 0xFA, 0xB6, 0x01, 0xD6, 0xFF, 0xFF,  // xC......
        /* 05F0 */  0x6D, 0x03, 0xAC, 0xF9, 0x6F, 0x1B, 0x28, 0x0E,  // m...o.(.
        /* 05F8 */  0xAB, 0xBC, 0x6D, 0x40, 0x3C, 0xC9, 0x33, 0x02,  // ..m@<.3.
        /* 0600 */  0xAB, 0xBA, 0x6E, 0xA0, 0xF4, 0x5C, 0x37, 0x00,  // ..n..\7.
        /* 0608 */  0x12, 0x88, 0x99, 0x30, 0x2A, 0xFE, 0x84, 0x29,  // ...0*..)
        /* 0610 */  0x88, 0x27, 0xEC, 0x68, 0xD7, 0x0D, 0x50, 0x04,  // .'.h..P.
        /* 0618 */  0xB9, 0x6E, 0x80, 0x7E, 0x5E, 0x09, 0xFE, 0xFF,  // .n.~^...
        /* 0620 */  0xAF, 0x1B, 0xC0, 0xE0, 0xA2, 0x80, 0xB9, 0x6F,  // .......o
        /* 0628 */  0x00, 0x6F, 0x58, 0x7E, 0xDF, 0x00, 0x7C, 0xDC,  // .oX~..|.
        /* 0630 */  0xC4, 0x31, 0xF7, 0x0D, 0xC0, 0xCC, 0xFF, 0xFF,  // .1......
        /* 0638 */  0xBE, 0x01, 0xB0, 0xE7, 0xA2, 0x80, 0xBB, 0x6F,  // .......o
        /* 0640 */  0x00, 0xEF, 0x8B, 0xB4, 0xEF, 0x1B, 0x60, 0xFE,  // ......`.
        /* 0648 */  0xFF, 0xDF, 0x37, 0xC0, 0x28, 0x6D, 0xFD, 0x1E,  // ..7.(m..
        /* 0650 */  0x1C, 0x3D, 0x21, 0x78, 0x7C, 0xB8, 0xFB, 0xA5,  // .=!x|...
        /* 0658 */  0xC7, 0xE7, 0xBB, 0x39, 0x38, 0x06, 0x79, 0x8C,  // ...98.y.
        /* 0660 */  0x87, 0x76, 0xC0, 0xAF, 0xEF, 0x9E, 0x98, 0xEF,  // .v......
        /* 0668 */  0xE6, 0xC0, 0xFF, 0x4C, 0x70, 0x3C, 0x18, 0x68,  // ...Lp<.h
        /* 0670 */  0x1C, 0x62, 0xAB, 0x97, 0x06, 0x72, 0x34, 0x38,  // .b...r48
        /* 0678 */  0x3F, 0xDC, 0x19, 0x81, 0x61, 0x15, 0x7F, 0xF2,  // ?...a...
        /* 0680 */  0x47, 0x38, 0xC7, 0xD0, 0xD9, 0xE1, 0x20, 0xB1,  // G8.... .
        /* 0688 */  0x83, 0xE0, 0xC1, 0x56, 0x6D, 0x02, 0x85, 0x86,  // ...Vm...
        /* 0690 */  0x50, 0x14, 0x18, 0x14, 0x8B, 0x0F, 0x18, 0xF8,  // P.......
        /* 0698 */  0x61, 0xB3, 0xB3, 0x00, 0x93, 0x04, 0x87, 0x3A,  // a......:
        /* 06A0 */  0x02, 0xF8, 0x3E, 0xD1, 0xFC, 0x38, 0x74, 0x37,  // ..>..8t7
        /* 06A8 */  0x38, 0x54, 0x8F, 0xE5, 0xA1, 0x80, 0x9E, 0x01,  // 8T......
        /* 06B0 */  0x71, 0xC7, 0x0C, 0x32, 0x69, 0xCF, 0x28, 0xE2,  // q..2i.(.
        /* 06B8 */  0x53, 0xC2, 0x29, 0x85, 0x49, 0xE0, 0xF3, 0x03,  // S.).I...
        /* 06C0 */  0x43, 0xE3, 0x04, 0xAF, 0x0D, 0xA1, 0xF9, 0xFF,  // C.......
        /* 06C8 */  0xFF, 0xA4, 0xC0, 0x3C, 0xDF, 0x31, 0x04, 0x6C,  // ...<.1.l
        /* 06D0 */  0x02, 0xBB, 0xBF, 0x64, 0xC8, 0xDA, 0xC0, 0x75,  // ...d...u
        /* 06D8 */  0x4B, 0x32, 0x44, 0x6F, 0x38, 0xB2, 0x85, 0xA2,  // K2Do8...
        /* 06E0 */  0xE9, 0x44, 0x79, 0xDF, 0x88, 0x62, 0x67, 0x08,  // .Dy..bg.
        /* 06E8 */  0xC2, 0x88, 0x12, 0x2C, 0xC8, 0xA3, 0x42, 0xAC,  // ...,..B.
        /* 06F0 */  0x28, 0x2F, 0x05, 0x46, 0x88, 0x18, 0xE2, 0x95,  // (/.F....
        /* 06F8 */  0x23, 0xD0, 0x09, 0x87, 0x0F, 0xF2, 0xD8, 0x14,  // #.......
        /* 0700 */  0xA7, 0xFD, 0x41, 0x90, 0x58, 0x4F, 0x02, 0x8D,  // ..A.XO..
        /* 0708 */  0xC5, 0x91, 0x46, 0x83, 0x3A, 0x07, 0x78, 0xB8,  // ..F.:.x.
        /* 0710 */  0x3E, 0xC4, 0x78, 0xF8, 0x0F, 0x21, 0x06, 0x39,  // >.x..!.9
        /* 0718 */  0xC8, 0x73, 0x7B, 0x54, 0x38, 0x4E, 0x5F, 0x25,  // .s{T8N_%
        /* 0720 */  0x4C, 0xF0, 0x02, 0xE0, 0x83, 0x0A, 0x1C, 0xD7,  // L.......
        /* 0728 */  0x80, 0x9A, 0xF1, 0x33, 0x06, 0x58, 0x8E, 0xE3,  // ...3.X..
        /* 0730 */  0x3E, 0xA9, 0xC0, 0x1D, 0x8F, 0xEF, 0x07, 0x6C,  // >......l
        /* 0738 */  0xC2, 0x09, 0x2C, 0x7F, 0x10, 0xA8, 0xE3, 0x0C,  // ..,.....
        /* 0740 */  0x9F, 0xE7, 0x0B, 0x8B, 0x21, 0x1F, 0x13, 0x4C,  // ....!..L
        /* 0748 */  0x60, 0xB1, 0x27, 0x1B, 0x3A, 0x1E, 0xF0, 0xDF,  // `.'.:...
        /* 0750 */  0x63, 0x1E, 0x2F, 0x7C, 0x32, 0xF1, 0x7C, 0x4D,  // c./|2.|M
        /* 0758 */  0x30, 0x22, 0x84, 0x9C, 0x8C, 0x07, 0x7D, 0x87,  // 0"....}.
        /* 0760 */  0xC0, 0x5C, 0x6F, 0xD8, 0xB9, 0x85, 0x8B, 0x3A,  // .\o....:
        /* 0768 */  0x68, 0xA0, 0x4E, 0x0B, 0x3E, 0x28, 0xB0, 0x9B,  // h.N.>(..
        /* 0770 */  0x11, 0xE6, 0xB8, 0xCE, 0xCF, 0x2A, 0x60, 0xF8,  // .....*`.
        /* 0778 */  0xFF, 0x9F, 0x55, 0x60, 0x8F, 0x10, 0xFE, 0xED,  // ..U`....
        /* 0780 */  0xC1, 0xF3, 0xF2, 0x95, 0xE1, 0xD5, 0x21, 0x81,  // ......!.
        /* 0788 */  0x43, 0x8E, 0x10, 0x3D, 0x2E, 0x8F, 0x10, 0x73,  // C..=...s
        /* 0790 */  0x3E, 0xC2, 0x0C, 0x11, 0x5C, 0x67, 0x01, 0x70,  // >...\g.p
        /* 0798 */  0x0C, 0x11, 0xF8, 0x1C, 0x70, 0xC0, 0x71, 0x69,  // ....p.qi
        /* 07A0 */  0xE2, 0x03, 0xF5, 0x01, 0x07, 0x70, 0x70, 0x4D,  // .....ppM
        /* 07A8 */  0xC3, 0x1D, 0x70, 0xC0, 0x71, 0x16, 0x60, 0xFF,  // ..p.q.`.
        /* 07B0 */  0xFF, 0xC3, 0x0D, 0x2C, 0x49, 0x26, 0x0E, 0x23,  // ...,I&.#
        /* 07B8 */  0x18, 0x11, 0x30, 0x28, 0x02, 0x02, 0xA4, 0xB3,  // ..0(....
        /* 07C0 */  0x80, 0x0F, 0x29, 0x00, 0x1F, 0xAE, 0x0C, 0x0F,  // ..).....
        /* 07C8 */  0x29, 0xD8, 0x93, 0x86, 0x07, 0x8E, 0x1B, 0x85,  // ).......
        /* 07D0 */  0x07, 0x8D, 0x0B, 0x30, 0x68, 0x7A, 0xE2, 0x80,  // ...0hz..
        /* 07D8 */  0x7F, 0x4C, 0xF0, 0x19, 0x05, 0x1C, 0xE3, 0x06,  // .L......
        /* 07E0 */  0xDF, 0x2A, 0x0C, 0xFC, 0xFF, 0x3F, 0x30, 0xCC,  // .*...?0.
        /* 07E8 */  0xE1, 0xC2, 0x63, 0x39, 0x8A, 0xA0, 0x07, 0x1E,  // ..c9....
        /* 07F0 */  0xD4, 0xF7, 0x8C, 0x33, 0xF7, 0x24, 0x8F, 0xD1,  // ...3.$..
        /* 07F8 */  0x51, 0x0F, 0x27, 0xF4, 0xE4, 0x85, 0x3B, 0x57,  // Q.'...;W
        /* 0800 */  0xF9, 0x0A, 0x71, 0x14, 0x18, 0xB8, 0x77, 0x29,  // ..q...w)
        /* 0808 */  0x8F, 0xCF, 0x17, 0x2B, 0xC3, 0x63, 0x46, 0xFB,  // ...+.cF.
        /* 0810 */  0x1E, 0x72, 0xD6, 0x11, 0x02, 0xE2, 0x2F, 0x75,  // .r..../u
        /* 0818 */  0x6C, 0xC0, 0x60, 0x39, 0x18, 0x00, 0x87, 0x01,  // l.`9....
        /* 0820 */  0xE3, 0x13, 0x0D, 0x58, 0x67, 0x1B, 0x3C, 0xF4,  // ...Xg.<.
        /* 0828 */  0x69, 0x31, 0xC4, 0xE3, 0x0B, 0xFB, 0x56, 0x61,  // i1....Va
        /* 0830 */  0x82, 0xEA, 0x41, 0x75, 0x12, 0xF4, 0xD0, 0xC0,  // ..Au....
        /* 0838 */  0x01, 0xE8, 0xA1, 0xC1, 0x3F, 0xB9, 0x90, 0xFB,  // ....?...
        /* 0840 */  0x2B, 0x1D, 0x82, 0xB5, 0xE2, 0x69, 0xDE, 0x47,  // +....i.G
        /* 0848 */  0x1E, 0xF3, 0xDC, 0xA2, 0xBC, 0x0D, 0x3C, 0x07,  // ......<.
        /* 0850 */  0xF0, 0xD3, 0x82, 0x87, 0xE3, 0x63, 0x81, 0xC7,  // .....c..
        /* 0858 */  0xE9, 0x4B, 0x58, 0x82, 0xF7, 0x1A, 0x9F, 0x6C,  // .KX....l
        /* 0860 */  0x1E, 0x5C, 0x58, 0xB2, 0x21, 0xA0, 0x06, 0xEB,  // .\X.!...
        /* 0868 */  0x21, 0x60, 0xA6, 0x9A, 0xC0, 0x49, 0x46, 0x80,  // !`...IF.
        /* 0870 */  0xCA, 0x00, 0xA1, 0x1B, 0xCB, 0xE9, 0x3E, 0x8B,  // ......>.
        /* 0878 */  0x84, 0x38, 0xCD, 0x47, 0x99, 0xC7, 0x02, 0x8F,  // .8.G....
        /* 0880 */  0xF5, 0xC1, 0xC0, 0xFF, 0x7F, 0xCD, 0x23, 0xD4,  // ......#.
        /* 0888 */  0x7D, 0xCD, 0x33, 0x7B, 0x3A, 0xC0, 0xAC, 0x22,  // }.3{:.."
        /* 0890 */  0xDC, 0x7B, 0xCE, 0x1B, 0x86, 0xD1, 0x9E, 0x2D,  // .{.....-
        /* 0898 */  0x7C, 0xCD, 0x78, 0xD6, 0x34, 0x42, 0x38, 0x76,  // |.x.4B8v
        /* 08A0 */  0x83, 0xF3, 0x48, 0x8C, 0xF0, 0x82, 0xC0, 0x4E,  // ..H....N
        /* 08A8 */  0x0C, 0x0F, 0x30, 0xC6, 0x39, 0x79, 0xC3, 0xFA,  // ..0.9y..
        /* 08B0 */  0xC2, 0xCB, 0x40, 0x83, 0x19, 0xDB, 0x97, 0x01,  // ..@.....
        /* 08B8 */  0x36, 0x2A, 0xDF, 0x88, 0xC0, 0x97, 0xFC, 0x62,  // 6*.....b
        /* 08C0 */  0x00, 0x65, 0x16, 0xBE, 0x9E, 0xF8, 0xA0, 0xC4,  // .e......
        /* 08C8 */  0x2E, 0x06, 0x2C, 0xE5, 0xC5, 0x00, 0x54, 0x37,  // ..,...T7
        /* 08D0 */  0x0C, 0x5F, 0x0C, 0xE0, 0x5F, 0x89, 0x5E, 0x0C,  // ._.._.^.
        /* 08D8 */  0xC0, 0x70, 0x71, 0xF2, 0x3D, 0xC0, 0x1E, 0xEE,  // .pq.=...
        /* 08E0 */  0xA3, 0x74, 0x9C, 0xBE, 0xFD, 0xBD, 0x19, 0xF8,  // .t......
        /* 08E8 */  0x6C, 0xC0, 0x60, 0x3C, 0xC3, 0x30, 0xC6, 0x08,  // l.`<.0..
        /* 08F0 */  0xE3, 0x51, 0x86, 0x31, 0xC1, 0xDC, 0xB7, 0x03,  // .Q.1....
        /* 08F8 */  0xE8, 0x39, 0x87, 0x81, 0x4A, 0x78, 0x3B, 0x80,  // .9..Jx;.
        /* 0900 */  0x72, 0x0E, 0xE8, 0xF2, 0x68, 0x42, 0x4F, 0x01,  // r...hBO.
        /* 0908 */  0x4F, 0x07, 0x3E, 0x29, 0x1A, 0xA2, 0xAF, 0xB1,  // O.>)....
        /* 0910 */  0x0A, 0x26, 0x50, 0xC4, 0x07, 0x0D, 0x3E, 0xB5,  // .&P...>.
        /* 0918 */  0x28, 0x3E, 0x15, 0x78, 0x2D, 0xCF, 0x4E, 0xE1,  // (>.x-.N.
        /* 0920 */  0xE2, 0x9C, 0x89, 0xA7, 0x6A, 0x38, 0x03, 0xBD,  // ....j8..
        /* 0928 */  0xE6, 0x86, 0x63, 0xFF, 0x7F, 0x38, 0xFC, 0xA9,  // ..c..8..
        /* 0930 */  0xE0, 0x35, 0x80, 0x1D, 0x24, 0x3D, 0x2D, 0x23,  // .5..$=-#
        /* 0938 */  0xC2, 0x38, 0xA4, 0x3C, 0x32, 0xF8, 0xB6, 0x18,  // .8.<2...
        /* 0940 */  0xC7, 0x90, 0x0F, 0x91, 0xBE, 0x13, 0x18, 0xF2,  // ........
        /* 0948 */  0x21, 0xEF, 0x79, 0xC7, 0xC0, 0xAF, 0x08, 0x71,  // !.y....q
        /* 0950 */  0x9E, 0xB2, 0x7C, 0x67, 0xF0, 0x65, 0x01, 0x7C,  // ..|g.e.|
        /* 0958 */  0x91, 0x2E, 0x0B, 0x68, 0x68, 0x9F, 0x64, 0x7C,  // ...hh.d|
        /* 0960 */  0x41, 0x30, 0xEC, 0x89, 0xB3, 0x00, 0x77, 0x05,  // A0....w.
        /* 0968 */  0x50, 0x81, 0xFA, 0xAE, 0x00, 0xFF, 0x42, 0xF0,  // P.....B.
        /* 0970 */  0xAE, 0x00, 0x86, 0x79, 0xF9, 0x56, 0xC0, 0x35,  // ...y.V.5
        /* 0978 */  0x1D, 0x4A, 0xD0, 0x67, 0x12, 0x5F, 0x17, 0x70,  // .J.g._.p
        /* 0980 */  0x53, 0x64, 0xA9, 0x8E, 0x0A, 0xD0, 0x53, 0x4C,  // Sd....SL
        /* 0988 */  0x02, 0x75, 0x47, 0xF7, 0x51, 0x01, 0xC6, 0x4D,  // .uG.Q..M
        /* 0990 */  0xD9, 0x07, 0x54, 0x76, 0x5A, 0x60, 0x67, 0x21,  // ..TvZ`g!
        /* 0998 */  0x76, 0x1D, 0xC1, 0x5D, 0x49, 0x18, 0xCA, 0xB3,  // v..]I...
        /* 09A0 */  0x81, 0x2F, 0x59, 0xFC, 0x70, 0x00, 0x03, 0xDC,  // ./Y.p...
        /* 09A8 */  0xB3, 0x38, 0xC4, 0x08, 0xB1, 0xD9, 0x81, 0xEB,  // .8......
        /* 09B0 */  0x75, 0xD2, 0x70, 0x2F, 0x44, 0xEC, 0xFF, 0x7F,  // u.p/D...
        /* 09B8 */  0x32, 0x00, 0xE3, 0x51, 0x1B, 0x1C, 0x27, 0x9D,  // 2..Q..'.
        /* 09C0 */  0xF0, 0x91, 0x9E, 0x59, 0xF8, 0x49, 0x19, 0x30,  // ...Y.I.0
        /* 09C8 */  0x71, 0xF2, 0x03, 0xE3, 0xC9, 0x1A, 0xC6, 0x00,  // q.......
        /* 09D0 */  0xB8, 0xBC, 0x57, 0x95, 0x81, 0xFC, 0x43, 0x90,  // ..W...C.
        /* 09D8 */  0x20, 0x18, 0xD4, 0x29, 0x19, 0x38, 0x1C, 0xC5,  //  ..).8..
        /* 09E0 */  0x70, 0xA7, 0x64, 0x78, 0x50, 0xF8, 0xC3, 0x00,  // p.dxP...
        /* 09E8 */  0xE6, 0x46, 0xE8, 0x7B, 0x82, 0xA1, 0xDE, 0x93,  // .F.{....
        /* 09F0 */  0x0E, 0xE3, 0x91, 0xD0, 0x04, 0x3E, 0x2D, 0xC3,  // .....>-.
        /* 09F8 */  0xFA, 0xFF, 0x9F, 0x96, 0x81, 0xD5, 0xB1, 0xDD,  // ........
        /* 0A00 */  0x43, 0xF6, 0x59, 0x01, 0x77, 0x76, 0x80, 0x3B,  // C.Y.wv.;
        /* 0A08 */  0x3D, 0x7E, 0x7A, 0x00, 0x9C, 0x00, 0x3D, 0x3D,  // =~z...==
        /* 0A10 */  0x80, 0xED, 0xBC, 0x01, 0xF7, 0x40, 0x80, 0x38,  // .....@.8
        /* 0A18 */  0xFE, 0xA3, 0x82, 0x5F, 0x59, 0x28, 0x1C, 0x3F,  // ..._Y(.?
        /* 0A20 */  0xB6, 0xF3, 0x63, 0x09, 0xEE, 0x70, 0xE0, 0x23,  // ..c..p.#
        /* 0A28 */  0x83, 0x0F, 0x90, 0xB8, 0xA1, 0xF8, 0x50, 0x81,  // ......P.
        /* 0A30 */  0x3C, 0x0B, 0x80, 0x62, 0xF4, 0x6C, 0x04, 0xEC,  // <..b.l..
        /* 0A38 */  0x06, 0xF3, 0xD2, 0x12, 0xE5, 0xFF, 0xFF, 0xDE,  // ........
        /* 0A40 */  0xC0, 0x4E, 0x29, 0xB8, 0x83, 0x00, 0xF8, 0x8E,  // .N).....
        /* 0A48 */  0x01, 0xE0, 0x1D, 0x0C, 0x97, 0x35, 0x66, 0x94,  // .....5f.
        /* 0A50 */  0x10, 0x18, 0x8D, 0x19, 0x77, 0x08, 0xE1, 0x27,  // ....w..'
        /* 0A58 */  0x02, 0xDC, 0x98, 0x3D, 0x6E, 0x8F, 0x19, 0x77,  // ...=n..w
        /* 0A60 */  0x9C, 0xE5, 0xA3, 0x7A, 0xCA, 0x08, 0xE5, 0x03,  // ...z....
        /* 0A68 */  0x07, 0x3B, 0x67, 0xBC, 0x11, 0xF0, 0xA1, 0x03,  // .;g.....
        /* 0A70 */  0x8F, 0x03, 0x0C, 0xEE, 0x48, 0x01, 0xC6, 0xCB,  // ....H...
        /* 0A78 */  0x01, 0x1B, 0x3B, 0xB8, 0x83, 0x90, 0x53, 0x20,  // ..;...S 
        /* 0A80 */  0x4B, 0x87, 0xD1, 0xD8, 0x71, 0xB2, 0x81, 0x74,  // K...q..t
        /* 0A88 */  0x8C, 0xF1, 0x21, 0xD7, 0x63, 0xC7, 0x0D, 0xD6,  // ..!.c...
        /* 0A90 */  0x63, 0xC7, 0x1D, 0x5F, 0xB0, 0xFF, 0xFF, 0xE3,  // c.._....
        /* 0A98 */  0x0B, 0x18, 0xC6, 0xC0, 0xC5, 0x0F, 0x03, 0x7D,  // .......}
        /* 0AA0 */  0xF3, 0xF3, 0xE8, 0x0C, 0xEE, 0x61, 0xFB, 0x04,  // .....a..
        /* 0AA8 */  0x13, 0xE3, 0xF9, 0x25, 0xC4, 0x23, 0xCC, 0x8B,  // ...%.#..
        /* 0AB0 */  0x4B, 0x84, 0xA3, 0x08, 0xF2, 0xE6, 0x12, 0xE7,  // K.......
        /* 0AB8 */  0xD5, 0x20, 0xCC, 0x63, 0x4B, 0x94, 0x10, 0x11,  // . .cK...
        /* 0AC0 */  0x0E, 0x26, 0xCE, 0x13, 0x8C, 0x11, 0x0E, 0x3C,  // .&.....<
        /* 0AC8 */  0x8A, 0x21, 0x22, 0x9C, 0x40, 0x88, 0x93, 0x3E,  // .!".@..>
        /* 0AD0 */  0xD9, 0x20, 0xE1, 0x63, 0x84, 0x8D, 0xF6, 0x04,  // . .c....
        /* 0AD8 */  0xC3, 0xC7, 0xC2, 0xCF, 0x2B, 0x1E, 0x3C, 0x3F,  // ....+.<?
        /* 0AE0 */  0xAD, 0xF9, 0x2E, 0xE8, 0xC9, 0x9C, 0xE3, 0x43,  // .......C
        /* 0AE8 */  0x96, 0xA7, 0xF6, 0x38, 0xE9, 0xC3, 0x2C, 0x6E,  // ...8..,n
        /* 0AF0 */  0x50, 0x0F, 0x8E, 0xEC, 0xAE, 0xE3, 0xE3, 0x35,  // P......5
        /* 0AF8 */  0xF6, 0x14, 0xE4, 0x21, 0xF0, 0x13, 0x81, 0x2F,  // ...!.../
        /* 0B00 */  0x88, 0x9E, 0xAC, 0xEF, 0x7A, 0xEC, 0x5E, 0x66,  // ....z.^f
        /* 0B08 */  0x8C, 0xEA, 0xA7, 0x80, 0x3A, 0xA6, 0x9C, 0xC1,  // ....:...
        /* 0B10 */  0x2B, 0x04, 0xBB, 0xE7, 0xF9, 0x90, 0xED, 0xBB,  // +.......
        /* 0B18 */  0x24, 0x1B, 0x05, 0xEE, 0x90, 0xE0, 0x33, 0x12,  // $.....3.
        /* 0B20 */  0x3F, 0x55, 0x78, 0x18, 0x1E, 0x05, 0x8C, 0x19,  // ?Ux.....
        /* 0B28 */  0xBC, 0x23, 0x1C, 0x5A, 0x88, 0x03, 0x7E, 0xDF,  // .#.Z..~.
        /* 0B30 */  0x65, 0x43, 0x8D, 0x71, 0x7A, 0x3E, 0x7F, 0xB0,  // eC.qz>..
        /* 0B38 */  0x41, 0xC0, 0x87, 0x3A, 0x54, 0x0F, 0xF3, 0xA8,  // A..:T...
        /* 0B40 */  0x5E, 0x0A, 0x19, 0xCE, 0xD9, 0xC1, 0x1D, 0x04,  // ^.......
        /* 0B48 */  0xF6, 0xF8, 0xE1, 0x41, 0xF0, 0x9B, 0x25, 0x1F,  // ...A..%.
        /* 0B50 */  0x04, 0x3B, 0xDF, 0xBC, 0xC1, 0x19, 0xE4, 0xFF,  // .;......
        /* 0B58 */  0x7F, 0x0C, 0xB0, 0xCF, 0x54, 0x3E, 0x9A, 0x20,  // ....T>. 
        /* 0B60 */  0x8E, 0x80, 0xE8, 0xF3, 0x87, 0xC7, 0xF0, 0x26,  // .......&
        /* 0B68 */  0xC7, 0x87, 0x83, 0x3D, 0x7A, 0xE0, 0x4E, 0x22,  // ...=z.N"
        /* 0B70 */  0x70, 0x8F, 0x5D, 0x07, 0xED, 0x6B, 0x9C, 0x2F,  // p.]..k./
        /* 0B78 */  0x5A, 0x30, 0xEE, 0x7B, 0xCF, 0x22, 0xE0, 0xC7,  // Z0.{."..
        /* 0B80 */  0x78, 0x6C, 0x01, 0xC7, 0xA1, 0x04, 0xDC, 0xC1,  // xl......
        /* 0B88 */  0x8E, 0x6B, 0x1C, 0x42, 0x51, 0x60, 0x74, 0x28,  // .k.BQ`t(
        /* 0B90 */  0xC1, 0xC5, 0x00, 0x12, 0x8C, 0x63, 0x9C, 0xD1,  // .....c..
        /* 0B98 */  0xD0, 0x97, 0x48, 0x1F, 0xD2, 0xE0, 0x0C, 0x1A,  // ..H.....
        /* 0BA0 */  0xF6, 0x3C, 0x9F, 0x50, 0xB8, 0x3D, 0x01, 0x8A,  // .<.P.=..
        /* 0BA8 */  0x4E, 0x28, 0x20, 0xC3, 0x7D, 0x06, 0xC1, 0x9E,  // N( .}...
        /* 0BB0 */  0x10, 0xF8, 0x19, 0x84, 0xFD, 0xFF, 0x0F, 0x8E,  // ........
        /* 0BB8 */  0x1E, 0xF7, 0x7B, 0xA3, 0x4F, 0x8D, 0x6C, 0xEE,  // ..{.O.l.
        /* 0BC0 */  0x0F, 0x01, 0x27, 0x70, 0xEE, 0xEC, 0xD4, 0x8C,  // ..'p....
        /* 0BC8 */  0x3B, 0x33, 0x60, 0xCF, 0x1F, 0x1E, 0x02, 0x3F,  // ;3`....?
        /* 0BD0 */  0x17, 0x78, 0xF8, 0x1E, 0x02, 0x7E, 0xF0, 0x0F,  // .x...~..
        /* 0BD8 */  0xCC, 0x06, 0x07, 0xE3, 0x29, 0xC2, 0xD7, 0x0E,  // ....)...
        /* 0BE0 */  0x0E, 0xCE, 0x4F, 0x03, 0x06, 0xE7, 0xAF, 0x50,  // ..O....P
        /* 0BE8 */  0x9F, 0xE7, 0x19, 0x38, 0xF6, 0xD4, 0xEB, 0x7B,  // ...8...{
        /* 0BF0 */  0x87, 0xE7, 0xEB, 0x43, 0x05, 0xFE, 0xA6, 0xE7,  // ...C....
        /* 0BF8 */  0x43, 0x05, 0x38, 0x0E, 0x0F, 0xFC, 0xB0, 0xC2,  // C.8.....
        /* 0C00 */  0x86, 0xF0, 0x28, 0x80, 0x3F, 0xB5, 0xF8, 0xF8,  // ..(.?...
        /* 0C08 */  0x17, 0xE7, 0x29, 0x82, 0xDD, 0x46, 0xB0, 0x87,  // ..)..F..
        /* 0C10 */  0x0B, 0xC0, 0x51, 0xB4, 0xB3, 0x18, 0x2A, 0xCC,  // ..Q...*.
        /* 0C18 */  0x59, 0x8C, 0xFC, 0xFF, 0xCF, 0x51, 0xA8, 0xB3,  // Y....Q..
        /* 0C20 */  0x18, 0x3D, 0x5C, 0x00, 0x2E, 0x04, 0x1F, 0x0F,  // .=\.....
        /* 0C28 */  0x40, 0x73, 0x10, 0x78, 0x5C, 0xF0, 0x85, 0xE0,  // @s.x\...
        /* 0C30 */  0x48, 0x0E, 0xE4, 0xE9, 0x00, 0xF0, 0x19, 0x4A,  // H......J
        /* 0C38 */  0xC3, 0xA1, 0x09, 0x13, 0x03, 0x06, 0x75, 0x3E,  // ......u>
        /* 0C40 */  0xF0, 0x09, 0xC5, 0xC7, 0x0E, 0x7E, 0x36, 0xF0,  // .....~6.
        /* 0C48 */  0x8D, 0xDC, 0x43, 0xE5, 0xA7, 0x66, 0x5F, 0xF2,  // ..C..f_.
        /* 0C50 */  0x11, 0xE0, 0x02, 0x75, 0xA0, 0x61, 0xA0, 0x46,  // ...u.a.F
        /* 0C58 */  0xE4, 0x23, 0xD2, 0xFF, 0xFF, 0xB9, 0x0D, 0x1B,  // .#......
        /* 0C60 */  0x60, 0x68, 0xF4, 0x1C, 0x0E, 0xE3, 0x80, 0xEB,  // `h......
        /* 0C68 */  0x73, 0x38, 0x76, 0x40, 0x3E, 0x87, 0xC3, 0x3F,  // s8v@>..?
        /* 0C70 */  0x47, 0xC3, 0x1F, 0x1B, 0x3B, 0xDD, 0xF3, 0x81,  // G...;...
        /* 0C78 */  0xC1, 0xBA, 0x7E, 0x63, 0x06, 0x06, 0xB6, 0x6F,  // ..~c...o
        /* 0C80 */  0x91, 0x07, 0x06, 0x1C, 0x51, 0xCF, 0xC6, 0x57,  // ....Q..W
        /* 0C88 */  0x08, 0x0F, 0x0C, 0x6C, 0x80, 0x1E, 0x18, 0xF0,  // ...l....
        /* 0C90 */  0x89, 0x05, 0x21, 0x27, 0x03, 0x43, 0x9D, 0x32,  // ..!'.C.2
        /* 0C98 */  0x8C, 0x1C, 0xF3, 0x89, 0xC3, 0xC3, 0xF0, 0xA1,  // ........
        /* 0CA0 */  0x22, 0xEA, 0x33, 0xC0, 0x23, 0x1E, 0x1B, 0x1B,  // ".3.#...
        /* 0CA8 */  0xFB, 0xFF, 0x8F, 0x0D, 0x2C, 0xC7, 0x16, 0x8F,  // ....,...
        /* 0CB0 */  0x0D, 0xFC, 0x47, 0x78, 0xFC, 0xD8, 0xE0, 0x8C,  // ..Gx....
        /* 0CB8 */  0xE5, 0xD1, 0xC4, 0x97, 0x99, 0x23, 0x3B, 0x8D,  // .....#;.
        /* 0CC0 */  0x33, 0x7B, 0x0D, 0xF1, 0xD1, 0xEE, 0xF1, 0xDB,  // 3{......
        /* 0CC8 */  0x63, 0x03, 0x97, 0x85, 0xB1, 0x01, 0xA5, 0x90,  // c.......
        /* 0CD0 */  0x63, 0x43, 0x1F, 0x52, 0x7C, 0x0A, 0xB0, 0x71,  // cC.R|..q
        /* 0CD8 */  0x54, 0x32, 0x0F, 0x1F, 0xAF, 0x7C, 0x62, 0x38,  // T2...|b8
        /* 0CE0 */  0xBA, 0x20, 0x6F, 0xE8, 0xBE, 0x5C, 0xF8, 0x48,  // . o..\.H
        /* 0CE8 */  0x63, 0x30, 0x5F, 0x5A, 0x7C, 0x06, 0xE5, 0x43,  // c0_Z|..C
        /* 0CF0 */  0x04, 0xD7, 0x57, 0xC5, 0x43, 0x04, 0x3E, 0xA1,  // ..W.C.>.
        /* 0CF8 */  0x86, 0x88, 0x1E, 0xCF, 0xFF, 0xFF, 0x11, 0xCC,  // ........
        /* 0D00 */  0x43, 0x64, 0x43, 0x03, 0xAF, 0x87, 0xA1, 0x01,  // CdC.....
        /* 0D08 */  0xA5, 0x98, 0xC0, 0x5E, 0x85, 0x87, 0x46, 0x4F,  // ...^..FO
        /* 0D10 */  0x3F, 0x3E, 0x04, 0x30, 0x08, 0xDF, 0x06, 0xD8,  // ?>.0....
        /* 0D18 */  0x55, 0xC0, 0x57, 0x21, 0x83, 0x24, 0x18, 0xE7,  // U.W!.$..
        /* 0D20 */  0x64, 0x41, 0x07, 0x07, 0x8E, 0x21, 0x79, 0x70,  // dA...!yp
        /* 0D28 */  0xF0, 0x07, 0xE3, 0x21, 0x70, 0x60, 0xCF, 0xE0,  // ...!p`..
        /* 0D30 */  0xB9, 0xE8, 0x31, 0xD8, 0xA7, 0x1D, 0x9F, 0x4A,  // ..1....J
        /* 0D38 */  0xC0, 0x77, 0xE6, 0x04, 0xC7, 0xE9, 0x1D, 0x7B,  // .w.....{
        /* 0D40 */  0x29, 0xF0, 0x08, 0x1E, 0xAD, 0x3C, 0x02, 0x7E,  // )....<.~
        /* 0D48 */  0xB4, 0x02, 0x66, 0xFF, 0xFF, 0xA3, 0x15, 0x30,  // ..f....0
        /* 0D50 */  0x09, 0x7A, 0xE6, 0xA4, 0x03, 0x77, 0x34, 0x18,  // .z...w4.
        /* 0D58 */  0xD4, 0xD1, 0x0A, 0x5C, 0x11, 0xC0, 0x75, 0xDC,  // ...\..u.
        /* 0D60 */  0xF0, 0xD1, 0x02, 0xCE, 0x50, 0x0F, 0xDA, 0x07,  // ....P...
        /* 0D68 */  0x65, 0xCF, 0xDA, 0x97, 0x21, 0x76, 0xB4, 0x00,  // e...!v..
        /* 0D70 */  0x97, 0x89, 0x43, 0x08, 0xD0, 0x04, 0x3E, 0x89,  // ..C...>.
        /* 0D78 */  0x67, 0xEF, 0x43, 0x03, 0xB3, 0x8A, 0xA1, 0x01,  // g.C.....
        /* 0D80 */  0xA5, 0xA3, 0x01, 0xEE, 0x44, 0x81, 0xFD, 0xFF,  // ....D...
        /* 0D88 */  0x9F, 0x28, 0x60, 0xDE, 0x30, 0x70, 0x07, 0x0A,  // .(`.0p..
        /* 0D90 */  0xC0, 0xCD, 0xE9, 0xDB, 0xE3, 0xE2, 0xD0, 0x38,  // .......8
        /* 0D98 */  0xC4, 0xE7, 0xA7, 0x73, 0xF6, 0xD1, 0xE8, 0x4C,  // ...s...L
        /* 0DA0 */  0x71, 0x67, 0x11, 0x30, 0x9C, 0x7D, 0x11, 0x8F,  // qg.0.}..
        /* 0DA8 */  0x18, 0x03, 0xF9, 0x81, 0x21, 0x59, 0x30, 0x28,  // ....!Y0(
        /* 0DB0 */  0x16, 0x0F, 0xC5, 0x07, 0x03, 0x0E, 0xEC, 0x23,  // .......#
        /* 0DB8 */  0x02, 0x3B, 0x17, 0xB0, 0x73, 0xAD, 0xE1, 0xF8,  // .;..s...
        /* 0DC0 */  0x59, 0xC0, 0xA7, 0x84, 0xB7, 0xA6, 0x17, 0x7B,  // Y......{
        /* 0DC8 */  0x9F, 0xD7, 0x7D, 0xD6, 0x08, 0xC9, 0xCE, 0xF4,  // ..}.....
        /* 0DD0 */  0x3E, 0x89, 0xE2, 0x0E, 0xA2, 0x70, 0x4E, 0x9F,  // >....pN.
        /* 0DD8 */  0xE0, 0x22, 0xF0, 0x65, 0xDF, 0xA3, 0xE0, 0xA7,  // .".e....
        /* 0DE0 */  0x07, 0xCF, 0xF1, 0x8D, 0xC1, 0xA7, 0x07, 0xE6,  // ........
        /* 0DE8 */  0x7E, 0xF8, 0x9A, 0xF1, 0x33, 0xC3, 0xE3, 0x43,  // ~...3..C
        /* 0DF0 */  0x88, 0x27, 0xE2, 0xDA, 0xA6, 0x20, 0x5B, 0x18,  // .'... [.
        /* 0DF8 */  0x42, 0x09, 0xF4, 0xFF, 0x8F, 0x10, 0xE5, 0x6D,  // B......m
        /* 0E00 */  0x20, 0xCA, 0x29, 0x44, 0x88, 0x12, 0xA4, 0xB1,  //  .)D....
        /* 0E08 */  0xC9, 0x0B, 0x35, 0xCA, 0xD9, 0x45, 0x6E, 0x6D,  // ..5..Enm
        /* 0E10 */  0xF6, 0x82, 0x0B, 0x14, 0x2A, 0x66, 0x9C, 0x28,  // ....*f.(
        /* 0E18 */  0xEF, 0x10, 0xB1, 0xDA, 0x1F, 0x04, 0x91, 0xF4,  // ........
        /* 0E20 */  0x32, 0xD0, 0x71, 0xC9, 0x91, 0x0E, 0x7D, 0xE8,  // 2.q...}.
        /* 0E28 */  0x61, 0xFB, 0x04, 0x8C, 0x3F, 0x48, 0xE2, 0xAE,  // a...?H..
        /* 0E30 */  0x2A, 0x3E, 0x28, 0xF8, 0x00, 0x80, 0x77, 0x09,  // *>(...w.
        /* 0E38 */  0xA8, 0x5B, 0x9D, 0xC7, 0xED, 0xF3, 0x06, 0xF8,  // .[......
        /* 0E40 */  0xAF, 0x17, 0x58, 0x82, 0xF2, 0x07, 0x81, 0x1A,  // ..X.....
        /* 0E48 */  0x99, 0xA1, 0x3D, 0xCC, 0xB7, 0x19, 0x43, 0xBE,  // ..=...C.
        /* 0E50 */  0x07, 0x1C, 0x16, 0x3B, 0x27, 0xF9, 0xF0, 0x08,  // ...;'...
        /* 0E58 */  0x1C, 0x8E, 0x01, 0x4F, 0x1B, 0xBE, 0x51, 0x7B,  // ...O..Q{
        /* 0E60 */  0xBE, 0x3E, 0x62, 0x01, 0x8E, 0xFE, 0xFF, 0x47,  // .>b....G
        /* 0E68 */  0x2C, 0x30, 0x9D, 0xDF, 0x7D, 0x82, 0x01, 0xC7,  // ,0..}...
        /* 0E70 */  0xCD, 0x82, 0x9F, 0x61, 0x00, 0x67, 0x40, 0xCF,  // ...a.g@.
        /* 0E78 */  0x30, 0x60, 0x1F, 0x2A, 0x6E, 0x08, 0x5C, 0xEE,  // 0`.*n.\.
        /* 0E80 */  0x8A, 0x28, 0x90, 0x05, 0xC2, 0xA0, 0x0E, 0xFD,  // .(......
        /* 0E88 */  0xE4, 0x08, 0x42, 0xCF, 0x9C, 0x70, 0x86, 0x72,  // ..B..p.r
        /* 0E90 */  0xB2, 0xBD, 0x5F, 0x1D, 0xC8, 0x2D, 0xC2, 0x43,  // .._..-.C
        /* 0E98 */  0x3D, 0x8B, 0xC7, 0x04, 0x76, 0xDA, 0x02, 0x36,  // =...v..6
        /* 0EA0 */  0xFF, 0xFF, 0xE3, 0x29, 0xB0, 0x98, 0xF7, 0xD3,  // ...)....
        /* 0EA8 */  0x69, 0x84, 0x63, 0x03, 0xFB, 0x71, 0x0B, 0x38,  // i.c..q.8
        /* 0EB0 */  0x1D, 0xCC, 0xE0, 0xDC, 0x7F, 0xD8, 0x2D, 0x1A,  // ......-.
        /* 0EB8 */  0x37, 0x34, 0xB0, 0x0D, 0xCC, 0x43, 0x03, 0x3E,  // 74...C.>
        /* 0EC0 */  0x27, 0x47, 0x30, 0x9E, 0x98, 0xF8, 0x55, 0xE2,  // 'G0...U.
        /* 0EC8 */  0xE1, 0x89, 0x1F, 0x43, 0xC0, 0xFA, 0xFF, 0x3F,  // ...C...?
        /* 0ED0 */  0x99, 0x01, 0xF6, 0x84, 0x1E, 0xCB, 0x50, 0xD2,  // ......P.
        /* 0ED8 */  0x4E, 0x66, 0x80, 0xC0, 0xFB, 0xD8, 0x3B, 0xC3,  // Nf....;.
        /* 0EE0 */  0x4B, 0x83, 0xE7, 0x74, 0xD2, 0xCF, 0x62, 0x3E,  // K..t..b>
        /* 0EE8 */  0x99, 0x19, 0x21, 0x0A, 0xBB, 0x8F, 0x19, 0xAD,  // ..!.....
        /* 0EF0 */  0x37, 0x14, 0xCD, 0x3C, 0xE8, 0x3B, 0x99, 0x51,  // 7..<.;.Q
        /* 0EF8 */  0x62, 0x46, 0x6A, 0x0E, 0x4C, 0x48, 0x11, 0x0F,  // bFj.LH..
        /* 0F00 */  0x27, 0x4A, 0x88, 0x60, 0xAF, 0x13, 0x6F, 0x67,  // 'J.`..og
        /* 0F08 */  0x4F, 0x66, 0x4C, 0xD6, 0xC9, 0x0C, 0x24, 0xFF,  // OfL...$.
        /* 0F10 */  0xFF, 0x93, 0x19, 0x98, 0x5C, 0x9F, 0xCC, 0x80,  // ....\...
        /* 0F18 */  0xCA, 0x39, 0x0A, 0x7F, 0x32, 0x03, 0x78, 0x74,  // .9..2.xt
        /* 0F20 */  0xC0, 0xC2, 0x9D, 0xCC, 0xC0, 0xF2, 0xFF, 0x3F,  // .......?
        /* 0F28 */  0xC4, 0x00, 0xCE, 0xC7, 0x0A, 0x63, 0x0C, 0x3C,  // .....c.<
        /* 0F30 */  0xDA, 0xC1, 0x0C, 0x15, 0xE6, 0x6C, 0x86, 0x0E,  // .....l..
        /* 0F38 */  0x72, 0x08, 0xA1, 0xC1, 0x0E, 0x21, 0x50, 0xE6,  // r....!P.
        /* 0F40 */  0x72, 0xA0, 0xA7, 0xF0, 0x9A, 0xE0, 0x73, 0x14,  // r.....s.
        /* 0F48 */  0xD8, 0x0F, 0x67, 0xC0, 0xE1, 0xD4, 0x80, 0x0F,  // ..g.....
        /* 0F50 */  0x74, 0xE2, 0x42, 0x8F, 0xC2, 0x23, 0x0E, 0x58,  // t.B..#.X
        /* 0F58 */  0xFD, 0xC0, 0xC8, 0xFF, 0xFF, 0x64, 0x06, 0x18,  // .....d..
        /* 0F60 */  0x78, 0x6A, 0xF8, 0x40, 0x82, 0x63, 0x31, 0xEA,  // xj.@.c1.
        /* 0F68 */  0x1B, 0xC4, 0x21, 0xBE, 0x8D, 0xF8, 0xE8, 0xFE,  // ..!.....
        /* 0F70 */  0x6A, 0xE2, 0x4B, 0x00, 0xE6, 0x42, 0xE2, 0xD3,  // j.K..B..
        /* 0F78 */  0x09, 0xB3, 0x70, 0x38, 0x03, 0x5A, 0x43, 0x60,  // ..p8.ZC`
        /* 0F80 */  0x57, 0x26, 0xCF, 0x9C, 0x0F, 0xE1, 0x6C, 0x3C,  // W&....l<
        /* 0F88 */  0x7A, 0xDC, 0xE9, 0x04, 0xDE, 0x38, 0x7C, 0x3A,  // z....8|:
        /* 0F90 */  0x01, 0x5E, 0x07, 0x0C, 0xCC, 0x0C, 0xC2, 0x3F,  // .^.....?
        /* 0F98 */  0x84, 0xB0, 0x21, 0x9C, 0xAA, 0xC7, 0x70, 0xEE,  // ..!...p.
        /* 0FA0 */  0xAF, 0x38, 0x3E, 0x9D, 0x80, 0xF3, 0xFF, 0x7F,  // .8>.....
        /* 0FA8 */  0x62, 0x03, 0x0C, 0x0A, 0x7E, 0x32, 0xF8, 0xB8,  // b...~2..
        /* 0FB0 */  0x46, 0x25, 0xC2, 0xA0, 0x8E, 0xE6, 0x80, 0x7B,  // F%.....{
        /* 0FB8 */  0x98, 0x27, 0x36, 0x26, 0x6F, 0xC5, 0x1A, 0x8B,  // .'6&o...
        /* 0FC0 */  0x4F, 0x6C, 0x30, 0xFF, 0xFF, 0x27, 0x36, 0x80,  // Ol0..'6.
        /* 0FC8 */  0xD1, 0x87, 0x20, 0xB0, 0xFD, 0xFF, 0x0F, 0x41,  // .. ....A
        /* 0FD0 */  0x60, 0x1C, 0xA0, 0x0F, 0x41, 0x80, 0x9B, 0xD3,  // `...A...
        /* 0FD8 */  0x09, 0xEE, 0xC4, 0x07, 0xB6, 0x63, 0x10, 0x60,  // .....c.`
        /* 0FE0 */  0x6D, 0xE8, 0x3E, 0x06, 0x81, 0xF9, 0xFF, 0x3F,  // m.>....?
        /* 0FE8 */  0x5A, 0x98, 0xA3, 0xE0, 0xC2, 0x8E, 0x7C, 0x28,  // Z.....|(
        /* 0FF0 */  0x29, 0xA7, 0x3E, 0xB4, 0x0C, 0x20, 0x69, 0x38,  // ).>.. i8
        /* 0FF8 */  0xC9, 0x01, 0x9D, 0xD3, 0x3D, 0x70, 0x92, 0x75,  // ....=p.u
        /* 1000 */  0xEA, 0x40, 0x8F, 0xC7, 0xA0, 0xAF, 0x1C, 0xBE,  // .@......
        /* 1008 */  0x12, 0xF0, 0x23, 0x07, 0x93, 0x00, 0xAA, 0x41,  // ..#....A
        /* 1010 */  0xFA, 0xCC, 0x07, 0x9C, 0x8E, 0x1C, 0xE0, 0x38,  // .......8
        /* 1018 */  0x26, 0x05, 0xC6, 0xDE, 0x0E, 0xDE, 0x22, 0x3D,  // &....."=
        /* 1020 */  0x89, 0xA7, 0xA1, 0xE3, 0x0C, 0x51, 0x38, 0x26,  // .....Q8&
        /* 1028 */  0x39, 0x18, 0x44, 0x7A, 0x95, 0x62, 0x03, 0x7C,  // 9.Dz.b.|
        /* 1030 */  0xAB, 0xF1, 0xD9, 0xC8, 0x07, 0x10, 0x78, 0xE3,  // ......x.
        /* 1038 */  0xF6, 0xD8, 0x61, 0xFF, 0xFF, 0x0F, 0x75, 0xC0,  // ..a...u.
        /* 1040 */  0x01, 0xE2, 0xA4, 0xF8, 0x21, 0xC3, 0x98, 0x67,  // ....!..g
        /* 1048 */  0xC5, 0x0F, 0x75, 0x80, 0xF5, 0x18, 0x27, 0x3A,  // ..u...':
        /* 1050 */  0x94, 0xF0, 0x43, 0x1D, 0x20, 0xE8, 0xFF, 0x7F,  // ..C. ...
        /* 1058 */  0xA8, 0x03, 0x86, 0x38, 0x6F, 0x24, 0xD1, 0x1E,  // ...8o$..
        /* 1060 */  0xEA, 0x98, 0xE8, 0x43, 0x1D, 0x40, 0xC8, 0xFF,  // ...C.@..
        /* 1068 */  0xFF, 0xA1, 0x0E, 0x18, 0x9E, 0x87, 0x00, 0xAE,  // ........
        /* 1070 */  0x9C, 0xEF, 0xC0, 0x7C, 0x22, 0x02, 0xEF, 0xFF,  // ...|"...
        /* 1078 */  0xFF, 0x7C, 0x07, 0xB8, 0x1B, 0x2D, 0xCC, 0x51,  // .|...-.Q
        /* 1080 */  0x70, 0x41, 0xAF, 0x0E, 0x03, 0x51, 0x09, 0x30,  // pA...Q.0
        /* 1088 */  0x28, 0x02, 0xC7, 0x5F, 0x9B, 0x60, 0x1C, 0xEA,  // (.._.`..
        /* 1090 */  0x7C, 0x87, 0x3E, 0x2F, 0x78, 0xD8, 0x4F, 0x05,  // |.>/x.O.
        /* 1098 */  0x9E, 0xC4, 0xA9, 0xFA, 0x5A, 0x70, 0x14, 0x4F,  // ....Zp.O
        /* 10A0 */  0x00, 0x3E, 0xE1, 0x01, 0xFF, 0xA1, 0xC1, 0x9A,  // .>......
        /* 10A8 */  0x44, 0xF1, 0x43, 0x03, 0xF5, 0x11, 0xE4, 0xFF,  // D.C.....
        /* 10B0 */  0x7F, 0x68, 0xC0, 0x28, 0xEA, 0xF9, 0x06, 0x7D,  // .h.(...}
        /* 10B8 */  0xCC, 0xF2, 0xD9, 0x20, 0xE6, 0x0B, 0x48, 0x84,  // ... ..H.
        /* 10C0 */  0x07, 0x10, 0x5F, 0x1F, 0xD8, 0x71, 0xD2, 0x67,  // .._..q.g
        /* 10C8 */  0xA0, 0x40, 0x51, 0xDE, 0x37, 0xF8, 0x09, 0x07,  // .@Q.7...
        /* 10D0 */  0x5C, 0x83, 0xF3, 0x09, 0x07, 0xBC, 0x87, 0x23,  // \......#
        /* 10D8 */  0x1F, 0x4B, 0xC0, 0x77, 0xD0, 0x84, 0x73, 0x81,  // .K.w..s.
        /* 10E0 */  0xF1, 0x8D, 0x8D, 0x9D, 0x06, 0xC0, 0x76, 0x00,  // ......v.
        /* 10E8 */  0x06, 0xDF, 0x69, 0x00, 0x1C, 0xC7, 0x24, 0x7E,  // ..i...$~
        /* 10F0 */  0x3A, 0x04, 0x13, 0xCC, 0xC1, 0xBC, 0x34, 0xFB,  // :.....4.
        /* 10F8 */  0xFF, 0xEF, 0xFD, 0x94, 0x43, 0xCF, 0x86, 0x80,  // ....C...
        /* 1100 */  0x75, 0x49, 0x07, 0x43, 0x94, 0x88, 0xB3, 0x21,  // uI.C...!
        /* 1108 */  0x20, 0xFD, 0xFF, 0x7F, 0x36, 0xC4, 0x20, 0xC4,  //  ...6. .
        /* 1110 */  0x09, 0xFC, 0x12, 0xD1, 0xDC, 0xD9, 0x90, 0xAE,  // ........
        /* 1118 */  0xD8, 0x67, 0x43, 0x80, 0xE1, 0xFF, 0xFF, 0x23,  // .gC....#
        /* 1120 */  0x00, 0xF6, 0x7C, 0x04, 0x38, 0x3D, 0x64, 0x83,  // ..|.8=d.
        /* 1128 */  0xE7, 0x14, 0x08, 0xE3, 0xE4, 0x03, 0x38, 0xFE,  // ......8.
        /* 1130 */  0xFF, 0x8F, 0x15, 0xE6, 0x18, 0x78, 0xEA, 0x97,  // .....x..
        /* 1138 */  0x9B, 0x8F, 0x03, 0x54, 0xD4, 0x2B, 0xC2, 0x30,  // ...T.+.0
        /* 1140 */  0x94, 0xC5, 0x87, 0x05, 0x1F, 0x11, 0xF8, 0x61,  // .......a
        /* 1148 */  0xC1, 0x23, 0xA8, 0x78, 0x9C, 0xF4, 0x74, 0xE3,  // .#.x..t.
        /* 1150 */  0x33, 0x21, 0x3B, 0x24, 0x38, 0xFC, 0x20, 0xE9,  // 3!;$8. .
        /* 1158 */  0x41, 0x13, 0x3C, 0xE7, 0x23, 0x78, 0xB7, 0x1E,  // A.<.#x..
        /* 1160 */  0x38, 0xA7, 0x02, 0xC0, 0x4D, 0xAE, 0x27, 0xA3,  // 8...M.'.
        /* 1168 */  0x4E, 0x17, 0x0E, 0x70, 0x8E, 0x92, 0x8D, 0x63,  // N..p...c
        /* 1170 */  0x08, 0xE5, 0x70, 0xCC, 0xB7, 0x87, 0xA6, 0xC9,  // ..p.....
        /* 1178 */  0x4E, 0x56, 0x30, 0x63, 0x41, 0xEA, 0x24, 0xE0,  // NV0cA.$.
        /* 1180 */  0x01, 0x38, 0x10, 0x8C, 0xB4, 0x93, 0x68, 0x34,  // .8....h4
        /* 1188 */  0x86, 0xB3, 0x5A, 0x18, 0xC1, 0x19, 0xC4, 0xC7,  // ..Z.....
        /* 1190 */  0x11, 0xE7, 0x3A, 0x19, 0xA1, 0x3F, 0x07, 0x3E,  // ..:..?.>
        /* 1198 */  0x15, 0x61, 0x82, 0xDC, 0x4B, 0xE8, 0xBC, 0x7D,  // .a..K..}
        /* 11A0 */  0x37, 0xE0, 0x57, 0x61, 0x8F, 0xC5, 0xFF, 0x7F,  // 7.Wa....
        /* 11A8 */  0x60, 0xDF, 0x4E, 0xC0, 0x31, 0x17, 0xAB, 0x01,  // `.N.1...
        /* 11B0 */  0x45, 0x0D, 0xC0, 0x68, 0x98, 0x53, 0xC0, 0x53,  // E..h.S.S
        /* 11B8 */  0x09, 0xB8, 0x82, 0xCD, 0x0D, 0x7D, 0x61, 0xB1,  // .....}a.
        /* 11C0 */  0xD6, 0xA9, 0xE8, 0x14, 0xF4, 0x3E, 0x70, 0x70,  // .....>pp
        /* 11C8 */  0xC0, 0x63, 0xF6, 0x1E, 0x1C, 0x2C, 0x34, 0x0F,  // .c...,4.
        /* 11D0 */  0x0E, 0x6C, 0xD9, 0x06, 0x87, 0x56, 0x72, 0x17,  // .l...Vr.
        /* 11D8 */  0x21, 0x87, 0x0F, 0xFC, 0xEC, 0x80, 0x03, 0xA0,  // !.......
        /* 11E0 */  0x67, 0x07, 0x0B, 0xC9, 0xB3, 0x03, 0x9B, 0xBE,  // g.......
        /* 11E8 */  0xB3, 0x08, 0x28, 0x70, 0xFE, 0xFF, 0x11, 0xDE,  // ..(p....
        /* 11F0 */  0x3B, 0x7C, 0x6E, 0x79, 0xF6, 0x60, 0x63, 0x78,  // ;|ny.`cx
        /* 11F8 */  0x74, 0x31, 0x9A, 0xD1, 0xB9, 0xA6, 0xDB, 0x04,  // t1......
        /* 1200 */  0x4A, 0xC5, 0x6D, 0x82, 0x82, 0xF8, 0x06, 0xE0,  // J.m.....
        /* 1208 */  0x84, 0x34, 0xBA, 0x75, 0xE2, 0x66, 0x62, 0xFC,  // .4.u.fb.
        /* 1210 */  0x47, 0x0C, 0x1F, 0x11, 0x0E, 0xE9, 0x6C, 0x4D,  // G.....lM
        /* 1218 */  0x30, 0x0F, 0xA4, 0x9E, 0x81, 0xBE, 0xB3, 0xE1,  // 0.......
        /* 1220 */  0x67, 0x1F, 0xF2, 0xC1, 0xC5, 0xD3, 0xF0, 0xF5,  // g.......
        /* 1228 */  0x86, 0xDC, 0x3B, 0xE8, 0xB4, 0x7D, 0x66, 0xC0,  // ..;..}f.
        /* 1230 */  0x1C, 0x74, 0x7D, 0x9D, 0x7A, 0x83, 0x27, 0x57,  // .t}.z.'W
        /* 1238 */  0x09, 0xEA, 0xE1, 0x02, 0x42, 0x2F, 0x34, 0xBE,  // ....B/4.
        /* 1240 */  0xDC, 0x25, 0x78, 0xE0, 0xF4, 0xE9, 0xEE, 0xBD,  // .%x.....
        /* 1248 */  0x84, 0x9D, 0xF1, 0x12, 0xBC, 0xE0, 0x25, 0x98,  // ......%.
        /* 1250 */  0x77, 0x10, 0xA8, 0x51, 0x79, 0x10, 0x98, 0xAB,  // w..Qy...
        /* 1258 */  0x3C, 0xCB, 0x37, 0x06, 0x54, 0xB2, 0x8B, 0x16,  // <.7.T...
        /* 1260 */  0x3D, 0xC3, 0xBC, 0xC3, 0xF8, 0x92, 0xE0, 0xEB,  // =.......
        /* 1268 */  0x87, 0xCF, 0x2D, 0x5E, 0xC0, 0xEB, 0x16, 0x0C,  // ..-^....
        /* 1270 */  0x82, 0x67, 0xA0, 0x57, 0x17, 0xDF, 0xD9, 0x0D,  // .g.W....
        /* 1278 */  0xFC, 0x2A, 0xF0, 0x46, 0x13, 0x22, 0x98, 0x61,  // .*.F.".a
        /* 1280 */  0x0F, 0xFF, 0xDD, 0xDD, 0xA8, 0xBE, 0xE9, 0x18,  // ........
        /* 1288 */  0xEB, 0x75, 0xC4, 0x23, 0xE5, 0xC7, 0x96, 0x03,  // .u.#....
        /* 1290 */  0x8A, 0xF4, 0xF2, 0xE6, 0x09, 0xF8, 0x2C, 0xE3,  // ......,.
        /* 1298 */  0x53, 0xDD, 0x49, 0xF9, 0x7A, 0x68, 0xF4, 0x57,  // S.I.zh.W
        /* 12A0 */  0x08, 0x1F, 0x7E, 0x8C, 0xEC, 0x73, 0x0E, 0x3B,  // ..~..s.;
        /* 12A8 */  0xDF, 0xB1, 0x41, 0x71, 0xC4, 0x07, 0x86, 0x97,  // ..Aq....
        /* 12B0 */  0x1A, 0x4F, 0x85, 0x9D, 0xBB, 0x60, 0x1C, 0x1C,  // .O...`..
        /* 12B8 */  0xD8, 0xB1, 0x08, 0x73, 0x7C, 0x05, 0xD7, 0xC9,  // ...s|...
        /* 12C0 */  0xE6, 0xFF, 0xFF, 0xE4, 0x00, 0x6E, 0x78, 0xCC,  // .....nx.
        /* 12C8 */  0xC1, 0xD7, 0xE7, 0x0D, 0xDF, 0x0C, 0x3C, 0x2E,  // ......<.
        /* 12D0 */  0x7E, 0xE4, 0xF0, 0x49, 0xE3, 0xA5, 0xD3, 0xD8,  // ~..I....
        /* 12D8 */  0xA7, 0xE9, 0xA3, 0xD1, 0xCB, 0x9B, 0x4F, 0x2F,  // ......O/
        /* 12E0 */  0x18, 0x58, 0x5F, 0x1A, 0x38, 0xAC, 0xD1, 0xC2,  // .X_.8...
        /* 12E8 */  0x3E, 0x06, 0x9C, 0xB9, 0x2F, 0x44, 0xB8, 0xC3,  // >.../D..
        /* 12F0 */  0x23, 0x58, 0x00, 0xF1, 0xB7, 0x92, 0x47, 0x0E,  // #X....G.
        /* 12F8 */  0x4F, 0xC0, 0x80, 0x4C, 0xD3, 0xBA, 0x74, 0x20,  // O..L..t 
        /* 1300 */  0xE2, 0xA7, 0x3C, 0x2B, 0x5F, 0x99, 0x2E, 0x43,  // ..<+_..C
        /* 1308 */  0x0C, 0xE3, 0xA9, 0xF2, 0xF1, 0xC3, 0xB3, 0xF1,  // ........
        /* 1310 */  0x51, 0xC0, 0xC7, 0x28, 0xCF, 0xFC, 0x8C, 0x22,  // Q..(..."
        /* 1318 */  0xBD, 0x32, 0x10, 0x50, 0x9D, 0x88, 0xB8, 0x42,  // .2.P...B
        /* 1320 */  0x18, 0x89, 0xA1, 0xD1, 0x9D, 0x83, 0xC7, 0x1F,  // ........
        /* 1328 */  0x22, 0x05, 0x31, 0xA0, 0x6F, 0x2E, 0xC0, 0xF4,  // ".1.o...
        /* 1330 */  0x4C, 0x04, 0x5C, 0xFE, 0xFF, 0x37, 0x17, 0x80,  // L.\..7..
        /* 1338 */  0xFF, 0xFF, 0xFF, 0x9B, 0x0B, 0xE0, 0xE6, 0xFE,  // ........
        /* 1340 */  0xE0, 0x9B, 0x0B, 0x70, 0x8D, 0xB4, 0x2A, 0x7A,  // ...p..*z
        /* 1348 */  0x61, 0x77, 0x08, 0x18, 0xD4, 0x9D, 0x1D, 0x70,  // aw.....p
        /* 1350 */  0x78, 0x2B, 0x78, 0x67, 0x87, 0xF5, 0xFF, 0xBF,  // x+xg....
        /* 1358 */  0xB3, 0xC3, 0xC3, 0x8C, 0x13, 0xE5, 0x85, 0x21,  // .......!
        /* 1360 */  0xC6, 0x3B, 0x3B, 0x0B, 0xF0, 0x26, 0xD0, 0x51,  // .;;..&.Q
        /* 1368 */  0xC6, 0x77, 0x76, 0x80, 0x1F, 0x67, 0xD8, 0x77,  // .wv..g.w
        /* 1370 */  0x69, 0xF0, 0x5E, 0x75, 0x81, 0xF5, 0xFF, 0xFF,  // i.^u....
        /* 1378 */  0xAA, 0x0B, 0x3C, 0x04, 0xDF, 0xA7, 0x41, 0x3E,  // ..<...A>
        /* 1380 */  0x5E, 0x30, 0x8C, 0x83, 0x2B, 0x27, 0xA1, 0xC7,  // ^0..+'..
        /* 1388 */  0x02, 0x6B, 0x85, 0x41, 0xDD, 0xA9, 0xC1, 0xA5,  // .k.A....
        /* 1390 */  0x09, 0x5C, 0x17, 0x5F, 0x1F, 0x6A, 0x7C, 0xA4,  // .\._.j|.
        /* 1398 */  0xC5, 0x9F, 0x2F, 0x70, 0x01, 0x86, 0x4C, 0x4F,  // ../p..LO
        /* 13A0 */  0x65, 0x30, 0xAE, 0x29, 0x3E, 0x95, 0x61, 0xEE,  // e0.)>.a.
        /* 13A8 */  0x0E, 0x1E, 0x90, 0x8F, 0x18, 0xC0, 0x67, 0x15,  // ......g.
        /* 13B0 */  0x1E, 0x18, 0xEE, 0xB4, 0xE0, 0x9B, 0x92, 0x41,  // .......A
        /* 13B8 */  0xCF, 0x31, 0xA8, 0x8F, 0x3C, 0x27, 0xEF, 0x7B,  // .1..<'.{
        /* 13C0 */  0xC2, 0xE3, 0x84, 0xA3, 0x9E, 0x83, 0xE8, 0xD8,  // ........
        /* 13C8 */  0xC0, 0x71, 0xDC, 0xC0, 0xFD, 0xFF, 0xC7, 0x06,  // .q......
        /* 13D0 */  0xEF, 0x70, 0x83, 0x3B, 0xE8, 0xF8, 0x62, 0x70,  // .p.;..bp
        /* 13D8 */  0x5C, 0x18, 0xB8, 0xE7, 0x02, 0x0F, 0xC3, 0x37,  // \......7
        /* 13E0 */  0x1D, 0x8F, 0x08, 0x33, 0xFE, 0xD7, 0x3F, 0x23,  // ...3..?#
        /* 13E8 */  0x04, 0xC4, 0x5F, 0x8C, 0xD8, 0x80, 0xC1, 0x78,  // .._....x
        /* 13F0 */  0x6B, 0xF3, 0xF5, 0x0D, 0x37, 0x60, 0x5F, 0x1D,  // k...7`_.
        /* 13F8 */  0x7C, 0xC1, 0xF0, 0x09, 0xCC, 0xE8, 0x2F, 0x30,  // |...../0
        /* 1400 */  0x4F, 0x62, 0x3E, 0x36, 0x90, 0x0B, 0x1C, 0x1D,  // Ob>6....
        /* 1408 */  0x30, 0x38, 0x00, 0x3D, 0x60, 0xF8, 0x87, 0x8B,  // 08.=`...
        /* 1410 */  0x77, 0x39, 0x30, 0x5C, 0x05, 0x7D, 0x5C, 0xF0,  // w90\.}\.
        /* 1418 */  0xB1, 0xC7, 0x8A, 0xEE, 0x72, 0xE8, 0x9B, 0x9C,  // ....r...
        /* 1420 */  0x61, 0xE2, 0x18, 0xE2, 0x0D, 0x8C, 0xDD, 0x25,  // a......%
        /* 1428 */  0xC8, 0x61, 0x0E, 0xEA, 0x5D, 0xC2, 0x73, 0xE0,  // .a..].s.
        /* 1430 */  0x67, 0x0B, 0x9F, 0xE0, 0x7C, 0xF3, 0x09, 0x71,  // g...|..q
        /* 1438 */  0xAA, 0x8F, 0x56, 0xEF, 0x01, 0x3E, 0x7A, 0xBC,  // ..V..>z.
        /* 1440 */  0x77, 0xF9, 0xEC, 0xC4, 0x2E, 0x02, 0x3E, 0x72,  // w.....>r
        /* 1448 */  0x19, 0xC7, 0xD3, 0xF4, 0x15, 0xD0, 0x43, 0x36,  // ......C6
        /* 1450 */  0xD8, 0xAB, 0x86, 0x4F, 0x60, 0x3E, 0xBA, 0xE1,  // ...O`>..
        /* 1458 */  0x8E, 0x51, 0x9E, 0x89, 0xA7, 0xEF, 0x3B, 0x08,  // .Q....;.
        /* 1460 */  0x3B, 0x92, 0x1C, 0x75, 0xA8, 0x6B, 0x7A, 0x44,  // ;..u.kzD
        /* 1468 */  0xF9, 0xFF, 0x9F, 0xD0, 0x81, 0xF8, 0xD6, 0x06,  // ........
        /* 1470 */  0xCE, 0x68, 0xF7, 0x0F, 0xF4, 0x36, 0x3D, 0x32,  // .h...6=2
        /* 1478 */  0xCC, 0xD1, 0x00, 0xD6, 0x25, 0x04, 0x5C, 0x77,  // ....%.\w
        /* 1480 */  0x0C, 0x5F, 0x42, 0x80, 0x4F, 0xD0, 0x4B, 0x04,  // ._B.O.K.
        /* 1488 */  0xFA, 0x9A, 0xE1, 0xD1, 0x3D, 0x02, 0x60, 0xAE,  // ....=.`.
        /* 1490 */  0x18, 0xEC, 0x58, 0xE0, 0xC3, 0x86, 0xAF, 0x01,  // ..X.....
        /* 1498 */  0xEC, 0x5E, 0xE0, 0x30, 0xF7, 0x08, 0x50, 0x81,  // .^.0..P.
        /* 14A0 */  0x7A, 0x78, 0xF0, 0xD5, 0xDE, 0x23, 0x40, 0x71,  // zx...#@q
        /* 14A8 */  0xB2, 0xF4, 0xA1, 0xC1, 0x03, 0xB5, 0xAA, 0x33,  // .......3
        /* 14B0 */  0x26, 0x94, 0x23, 0x26, 0x3F, 0x9B, 0xF9, 0x26,  // &.#&?..&
        /* 14B8 */  0x81, 0xB9, 0x5D, 0xFA, 0x26, 0x01, 0x37, 0xCF,  // ..].&.7.
        /* 14C0 */  0x2C, 0x50, 0x49, 0x20, 0xF4, 0xFF, 0xBF, 0x49,  // ,PI ...I
        /* 14C8 */  0xC0, 0x85, 0xE9, 0xF2, 0x32, 0x43, 0xE7, 0x7F,  // ....2C..
        /* 14D0 */  0xE0, 0xBE, 0xD5, 0x79, 0x84, 0x3E, 0x44, 0x30,  // ...y.>D0
        /* 14D8 */  0x94, 0xF7, 0x3C, 0x9F, 0xC2, 0xF8, 0x19, 0xC2,  // ..<.....
        /* 14E0 */  0x07, 0x4C, 0x76, 0xA6, 0xE0, 0x67, 0x4D, 0xDC,  // .Lv..gM.
        /* 14E8 */  0x1D, 0xC0, 0x28, 0x6F, 0x9E, 0x9E, 0x00, 0x3B,  // ..(o...;
        /* 14F0 */  0x7F, 0x1A, 0xF9, 0xDD, 0xE0, 0x5D, 0xC0, 0xD3,  // .....]..
        /* 14F8 */  0xF7, 0xBD, 0x88, 0x9F, 0x28, 0xC0, 0x17, 0xEC,  // ....(...
        /* 1500 */  0x4E, 0x07, 0x05, 0xFA, 0x84, 0x3C, 0x22, 0xA3,  // N....<".
        /* 1508 */  0xFA, 0x88, 0xC0, 0x2F, 0x49, 0x60, 0x3C, 0x92,  // .../I`<.
        /* 1510 */  0xF8, 0x40, 0x01, 0x84, 0xEE, 0x05, 0xA8, 0xD3,  // .@......
        /* 1518 */  0x07, 0x47, 0x3D, 0xE3, 0x17, 0x54, 0x63, 0xBE,  // .G=..Tc.
        /* 1520 */  0x5B, 0x3D, 0xC2, 0x79, 0x72, 0x98, 0xCB, 0x01,  // [=.yr...
        /* 1528 */  0x8B, 0x73, 0x4D, 0x02, 0xD5, 0x71, 0x97, 0x8F,  // .sM..q..
        /* 1530 */  0x0E, 0xEE, 0xB5, 0x15, 0xFB, 0xFF, 0x27, 0x38,  // ......'8
        /* 1538 */  0xB8, 0x77, 0x96, 0x77, 0x3E, 0x43, 0x79, 0x90,  // .w.w>Cy.
        /* 1540 */  0xE0, 0xBB, 0xB6, 0x82, 0xE3, 0xAA, 0x06, 0xE3,  // ........
        /* 1548 */  0xD8, 0xC2, 0x2F, 0x79, 0x80, 0x9D, 0x61, 0x71,  // ../y..aq
        /* 1550 */  0xC1, 0x7F, 0x0F, 0x03, 0x51, 0x89, 0x30, 0x28,  // ....Q.0(
        /* 1558 */  0x02, 0xCB, 0xBB, 0xB7, 0x52, 0xF8, 0x43, 0x06,  // ....R.C.
        /* 1560 */  0xE3, 0x4D, 0x81, 0x4F, 0x1A, 0x3B, 0x6A, 0xE0,  // .M.O.;j.
        /* 1568 */  0xFB, 0xFF, 0x1F, 0x35, 0xD8, 0x86, 0x8A, 0xBB,  // ...5....
        /* 1570 */  0x29, 0x82, 0x75, 0xAA, 0x98, 0x21, 0xF0, 0x60,  // ).u..!.`
        /* 1578 */  0x0F, 0x00, 0x9F, 0xAF, 0x7C, 0x06, 0x50, 0x14,  // ....|.P.
        /* 1580 */  0x18, 0xD4, 0xA1, 0x1D, 0xCE, 0x6D, 0x18, 0x70,  // .....m.p
        /* 1588 */  0x30, 0x62, 0xDC, 0xA5, 0x10, 0xEE, 0x94, 0xDF,  // 0b......
        /* 1590 */  0x51, 0x62, 0x3F, 0x97, 0xB3, 0xE9, 0xE2, 0xAE,  // Qb?.....
        /* 1598 */  0xE6, 0x3E, 0x9D, 0xB0, 0x0B, 0x32, 0x8C, 0xB3,  // .>...2..
        /* 15A0 */  0xC0, 0x23, 0xC0, 0xAB, 0x39, 0xBF, 0x20, 0x3F,  // .#..9. ?
        /* 15A8 */  0x17, 0xBF, 0x10, 0x3C, 0x26, 0x85, 0x78, 0x53,  // ...<&.xS
        /* 15B0 */  0x7A, 0x25, 0x36, 0xC6, 0x93, 0x71, 0x73, 0xB7,  // z%6..qs.
        /* 15B8 */  0x62, 0x72, 0xDE, 0x79, 0x41, 0x36, 0xC6, 0xD1,  // br.yA6..
        /* 15C0 */  0x44, 0x8C, 0x72, 0x6E, 0x0F, 0x03, 0x91, 0x5F,  // D.rn..._
        /* 15C8 */  0x90, 0x7D, 0x3F, 0x79, 0x21, 0x88, 0x18, 0xCD,  // .}?y!...
        /* 15D0 */  0x10, 0x41, 0x9F, 0x97, 0x8D, 0x15, 0x28, 0xDE,  // .A....(.
        /* 15D8 */  0x0B, 0x32, 0x13, 0xF8, 0x56, 0xD0, 0xC1, 0xC5,  // .2..V...
        /* 15E0 */  0x17, 0x64, 0xEC, 0xFF, 0xFF, 0x82, 0x0C, 0x30,  // .d.....0
        /* 15E8 */  0xE2, 0x64, 0x04, 0xF8, 0x3C, 0x71, 0xE0, 0xCE,  // .d..<q..
        /* 15F0 */  0x35, 0x30, 0xFE, 0xFF, 0x97, 0x6A, 0xD8, 0x27,  // 50...j.'
        /* 15F8 */  0x1B, 0xC0, 0xD9, 0xD0, 0x7D, 0xB2, 0x01, 0xF7,  // ....}...
        /* 1600 */  0x68, 0xE1, 0x1D, 0x4D, 0x10, 0x27, 0x1B, 0x0A,  // h..M.'..
        /* 1608 */  0xE4, 0xE0, 0xEB, 0xA2, 0x70, 0x3C, 0xF4, 0x49,  // ....p<.I
        /* 1610 */  0x84, 0x1E, 0x9D, 0x7C, 0x94, 0xC4, 0x9D, 0x19,  // ...|....
        /* 1618 */  0x3C, 0x91, 0x77, 0x16, 0x8F, 0xE2, 0x65, 0xD0,  // <.w...e.
        /* 1620 */  0xF7, 0x82, 0x13, 0x79, 0x7D, 0xB0, 0x9C, 0x63,  // ...y}..c
        /* 1628 */  0x24, 0xA8, 0x46, 0xE2, 0xE3, 0x03, 0xFC, 0xEB,  // $.F.....
        /* 1630 */  0x8B, 0x8F, 0x91, 0xF0, 0xF9, 0xFC, 0xC3, 0xF2,  // ........
        /* 1638 */  0x60, 0x0C, 0xF9, 0xFF, 0x7F, 0x8A, 0xC4, 0x80,  // `.......
        /* 1640 */  0x3C, 0xBB, 0x3C, 0x86, 0xF0, 0x0B, 0x24, 0xDC,  // <.<...$.
        /* 1648 */  0xD3, 0xCC, 0x01, 0x60, 0x64, 0x5D, 0x1E, 0xD1,  // ...`d]..
        /* 1650 */  0x67, 0x47, 0x8E, 0x11, 0xD7, 0x17, 0x45, 0x5F,  // gG....E_
        /* 1658 */  0x81, 0x7D, 0x10, 0x38, 0x9F, 0xE7, 0x44, 0xB0,  // .}.8..D.
        /* 1660 */  0x8E, 0x9A, 0x1F, 0x6D, 0xF8, 0xF8, 0x39, 0xF8,  // ...m..9.
        /* 1668 */  0x5B, 0xC1, 0x03, 0xA5, 0x8F, 0x45, 0x21, 0x1E,  // [....E!.
        /* 1670 */  0x91, 0xF8, 0x39, 0x11, 0x5C, 0x26, 0xCE, 0x89,  // ..9.\&..
        /* 1678 */  0x40, 0xE2, 0xD0, 0x0B, 0xE3, 0xB4, 0x80, 0x1B,  // @.......
        /* 1680 */  0x88, 0xCF, 0x94, 0xD8, 0x29, 0x9F, 0x08, 0x3B,  // ....)..;
        /* 1688 */  0x97, 0x60, 0x46, 0x07, 0xAE, 0xCB, 0xBD, 0x47,  // .`F....G
        /* 1690 */  0x07, 0xFE, 0x93, 0x00, 0x1E, 0xEB, 0xFF, 0xFF,  // ........
        /* 1698 */  0x78, 0x07, 0xBE, 0x93, 0xBA, 0xEF, 0x26, 0xBE,  // x.....&.
        /* 16A0 */  0xC8, 0xF8, 0x50, 0xF4, 0x7C, 0x07, 0xF8, 0x0F,  // ..P.|...
        /* 16A8 */  0x77, 0xB8, 0x43, 0xC5, 0x39, 0xDF, 0x01, 0xD2,  // w.C.9...
        /* 16B0 */  0xFE, 0xFF, 0xE7, 0x3B, 0x60, 0x79, 0xB6, 0x7E,  // ...;`y.~
        /* 16B8 */  0xBE, 0x03, 0xBB, 0xC8, 0xF3, 0x1D, 0x40, 0xAC,  // ......@.
        /* 16C0 */  0xFF, 0xFF, 0xF9, 0x0E, 0xB0, 0x73, 0x46, 0xC3,  // .....sF.
        /* 16C8 */  0x9D, 0xEF, 0xC0, 0x76, 0xB4, 0x01, 0xCC, 0x4D,  // ...v...M
        /* 16D0 */  0xE3, 0xD1, 0x06, 0xDC, 0xC3, 0x85, 0x3D, 0x0C,  // ......=.
        /* 16D8 */  0xAE, 0xD0, 0xA6, 0x4F, 0x8D, 0x46, 0xAD, 0x1A,  // ...O.F..
        /* 16E0 */  0x94, 0xA9, 0x51, 0xE6, 0xFF, 0xDF, 0xA0, 0x56,  // ..Q....V
        /* 16E8 */  0x9F, 0x4A, 0x8D, 0x19, 0xCB, 0x0E, 0xA5, 0x80,  // .J......
        /* 16F0 */  0x8F, 0x0A, 0x8D, 0xCD, 0xF2, 0x28, 0x04, 0x62,  // .....(.b
        /* 16F8 */  0x31, 0xAF, 0x06, 0x81, 0x38, 0x2C, 0x08, 0x8D,  // 1...8,..
        /* 1700 */  0xF4, 0xCA, 0x11, 0x88, 0x25, 0x3F, 0xFB, 0x05,  // ....%?..
        /* 1708 */  0x62, 0xB9, 0x6F, 0x06, 0x81, 0x38, 0xE0, 0x1B,  // b.o..8..
        /* 1710 */  0x4C, 0xE0, 0xE4, 0x61, 0x25, 0x70, 0xF2, 0x6E,  // L..a%p.n
        /* 1718 */  0x10, 0x88, 0x23, 0x83, 0x50, 0xA1, 0x3A, 0x40,  // ..#.P.:@
        /* 1720 */  0x58, 0x4C, 0x10, 0x1A, 0xCA, 0x07, 0x08, 0x93,  // XL......
        /* 1728 */  0xFE, 0x48, 0x10, 0x20, 0x31, 0x02, 0xC2, 0xC2,  // .H. 1...
        /* 1730 */  0xBD, 0xBF, 0x04, 0x62, 0x69, 0xEF, 0x09, 0x81,  // ...bi...
        /* 1738 */  0x58, 0x88, 0x15, 0x10, 0x16, 0x17, 0x84, 0x86,  // X.......
        /* 1740 */  0xD3, 0x02, 0xC2, 0x24, 0x99, 0x01, 0x61, 0x81,  // ...$..a.
        /* 1748 */  0x40, 0xA8, 0x7C, 0x35, 0x20, 0x4C, 0xA4, 0x1B,  // @.|5 L..
        /* 1750 */  0x40, 0xBA, 0x7A, 0x81, 0x38, 0x88, 0x1E, 0x10,  // @.z.8...
        /* 1758 */  0x26, 0xC3, 0x0F, 0x08, 0x0B, 0x0D, 0x42, 0xA3,  // &.....B.
        /* 1760 */  0x3D, 0x30, 0x04, 0x48, 0x0C, 0x81, 0xB0, 0xF8,  // =0.H....
        /* 1768 */  0x8E, 0x40, 0x98, 0xF8, 0x57, 0x91, 0x40, 0x9C,  // .@..W.@.
        /* 1770 */  0xDF, 0x12, 0xC4, 0x4D, 0x69, 0x88, 0x35, 0x01,  // ...Mi.5.
        /* 1778 */  0x31, 0x0D, 0x9E, 0x80, 0x98, 0x22, 0x10, 0x01,  // 1...."..
        /* 1780 */  0x39, 0xF6, 0xD3, 0x43, 0x40, 0xD6, 0x60, 0x0A,  // 9..C@.`.
        /* 1788 */  0x88, 0x45, 0x07, 0x11, 0x90, 0x85, 0xA8, 0x02,  // .E......
        /* 1790 */  0x62, 0x79, 0x5D, 0x01, 0xB1, 0xF0, 0x20, 0x02,  // by]... .
        /* 1798 */  0x72, 0xE6, 0x97, 0x9F, 0x80, 0xAC, 0xE0, 0xA5,  // r.......
        /* 17A0 */  0xF3, 0x10, 0xC0, 0xDE, 0x10, 0x81, 0x48, 0x72,  // ......Hr
        /* 17A8 */  0x10, 0x01, 0x39, 0xB0, 0x2F, 0x20, 0x16, 0x1F,  // ..9./ ..
        /* 17B0 */  0x44, 0x40, 0xCE, 0xFA, 0x28, 0x14, 0x90, 0x83,  // D@..(...
        /* 17B8 */  0x83, 0x68, 0x10, 0xE4, 0x6B, 0x26, 0x20, 0xA7,  // .h..k& .
        /* 17C0 */  0x07, 0x11, 0x10, 0xF9, 0x04, 0x05, 0x21, 0x6A,  // ......!j
        /* 17C8 */  0xBD, 0x81, 0x30, 0x3D, 0x8F, 0x42, 0x0D, 0x85,  // ..0=.B..
        /* 17D0 */  0x80, 0x50, 0xE5, 0xEA, 0xCE, 0x31, 0x2C, 0x07,  // .P...1,.
        /* 17D8 */  0x08, 0xCD, 0x05, 0x22, 0x30, 0xAB, 0x70, 0x07,  // ..."0.p.
        /* 17E0 */  0xC4, 0x54, 0x81, 0x08, 0xC8, 0x09, 0x80, 0xC8,  // .T......
        /* 17E8 */  0xFF, 0x9F, 0x60, 0x2A, 0x10, 0x9A, 0x12, 0x8C,  // ..`*....
        /* 17F0 */  0xEA, 0x92, 0x07, 0xC4, 0x12, 0x80, 0xD0, 0x54,  // .......T
        /* 17F8 */  0x20, 0x34, 0x25, 0x88, 0x00, 0xAD, 0xCA, 0x1E,  //  4%.....
        /* 1800 */  0x10, 0x53, 0x0A, 0x42, 0x95, 0x83, 0xD0, 0x74,  // .S.B...t
        /* 1808 */  0x20, 0x54, 0xB6, 0xBE, 0xC3, 0x02, 0x05, 0x11,  //  T......
        /* 1810 */  0x90, 0xA3, 0x83, 0x50, 0xE1, 0xFE, 0x40, 0x98,  // ...P..@.
        /* 1818 */  0xDE, 0x97, 0x86, 0x00, 0x9D, 0x0E, 0x44, 0x40,  // ......D@
        /* 1820 */  0x4E, 0x0C, 0x42, 0x15, 0x7C, 0x32, 0x82, 0x10,  // N.B.|2..
        /* 1828 */  0xB1, 0x20, 0x54, 0xC1, 0x27, 0x23, 0x28, 0xD1,  // . T.'#(.
        /* 1830 */  0xF2, 0xB2, 0x13, 0x90, 0xF5, 0x81, 0x50, 0xBD,  // ......P.
        /* 1838 */  0x20, 0x02, 0x73, 0x36, 0x20, 0x9A, 0x17, 0x84,  //  .s6 ...
        /* 1840 */  0xE6, 0x07, 0xA3, 0x5A, 0x8D, 0x02, 0x31, 0xFD,  // ...Z..1.
        /* 1848 */  0x20, 0x34, 0x0F, 0x88, 0xC0, 0xAC, 0xE0, 0xF9,  //  4......
        /* 1850 */  0x71, 0xC0, 0x0C, 0x84, 0xAA, 0x04, 0x11, 0x98,  // q.......
        /* 1858 */  0x73, 0x01, 0xD1, 0xAC, 0x20, 0x34, 0x3B, 0x18,  // s... 4;.
        /* 1860 */  0xD5, 0xFE, 0x0F, 0xD1, 0x00, 0x08, 0x08, 0xCD,  // ........
        /* 1868 */  0x07, 0xA2, 0xC3, 0x00, 0x79, 0x96, 0x09, 0xC8,  // ....y...
        /* 1870 */  0x1A, 0x41, 0xA8, 0x66, 0x10, 0x81, 0x39, 0x27,  // .A.f..9'
        /* 1878 */  0x10, 0xCD, 0x0E, 0x42, 0x95, 0xFD, 0x4D, 0x82,  // ...B..M.
        /* 1880 */  0x91, 0x8C, 0x0F, 0xD0, 0x40, 0x24, 0x37, 0x08,  // ....@$7.
        /* 1888 */  0xD5, 0xF1, 0x0C, 0x0A, 0x46, 0x74, 0x83, 0x08,  // ....Ft..
        /* 1890 */  0xC8, 0x59, 0x40, 0x68, 0x36, 0x30, 0x9A, 0x4C,  // .Y@h60.L
        /* 1898 */  0xED, 0x91, 0x80, 0xBA, 0x05, 0x61, 0xE9, 0x41,  // .....a.A
        /* 18A0 */  0x68, 0x3A, 0xBB, 0x83, 0xA7, 0x20, 0x54, 0x81,  // h:... T.
        /* 18A8 */  0x5E, 0x30, 0xA6, 0x19, 0x44, 0x87, 0x05, 0x02,  // ^0..D...
        /* 18B0 */  0x42, 0x73, 0x81, 0x51, 0x1D, 0xAF, 0x96, 0x40,  // Bs.Q...@
        /* 18B8 */  0x44, 0x1B, 0x08, 0xD5, 0x0A, 0xA2, 0x81, 0x93,  // D.......
        /* 18C0 */  0x1F, 0x53, 0x10, 0x92, 0x14, 0x84, 0xFC, 0xFF,  // .S......
        /* 18C8 */  0x07, 0xAA, 0xC7, 0x9C, 0x40, 0xAC, 0xFA, 0x5B,  // ....@..[
        /* 18D0 */  0x25, 0x50, 0x27, 0x01, 0xA1, 0xC9, 0x40, 0x74,  // %P'...@t
        /* 18D8 */  0x7C, 0x20, 0x0F, 0xB8, 0x83, 0x64, 0x20, 0x54,  // | ...d T
        /* 18E0 */  0x29, 0x88, 0xC0, 0xAC, 0xF4, 0x63, 0xA4, 0x23,  // )....c.#
        /* 18E8 */  0x05, 0x51, 0x7D, 0xBC, 0xA0, 0x20, 0x34, 0xD1,  // .Q}.. 4.
        /* 18F0 */  0x3B, 0x2C, 0x08, 0x7B, 0xB8, 0x69, 0xA8, 0xE4,  // ;,.{.i..
        /* 18F8 */  0x59, 0xA5, 0xA1, 0x12, 0x10, 0x9A, 0x0D, 0x44,  // Y......D
        /* 1900 */  0xC7, 0x04, 0xF2, 0xAA, 0x79, 0x4C, 0x60, 0x20,  // ....yL` 
        /* 1908 */  0x54, 0x2F, 0x08, 0xCD, 0x01, 0x42, 0x13, 0x83,  // T/...B..
        /* 1910 */  0x08, 0xD4, 0xA9, 0xBF, 0x37, 0x1A, 0x2A, 0xF9,  // ....7.*.
        /* 1918 */  0x5B, 0x09, 0xC4, 0xCA, 0x5E, 0x69, 0x02, 0xB1,  // [...^i..
        /* 1920 */  0xDE, 0xA7, 0x4E, 0x20, 0xE6, 0x1D, 0x98, 0xA9,  // ..N ....
        /* 1928 */  0x05, 0xA1, 0xEA, 0x41, 0x04, 0xE6, 0xB4, 0x40,  // ...A...@
        /* 1930 */  0x54, 0x81, 0x78, 0x10, 0xA6, 0x08, 0x44, 0x60,  // T.x...D`
        /* 1938 */  0x4E, 0x02, 0x44, 0xD3, 0x81, 0xD0, 0xEC, 0x60,  // N.D....`
        /* 1940 */  0x54, 0xE7, 0xA3, 0x4D, 0x40, 0xD6, 0x0E, 0x42,  // T..M@..B
        /* 1948 */  0xB3, 0x80, 0x08, 0xCC, 0x59, 0x1E, 0x69, 0x02,  // ....Y.i.
        /* 1950 */  0xB1, 0x92, 0x2F, 0x9D, 0x0E, 0x24, 0x04, 0x84,  // ../..$..
        /* 1958 */  0x26, 0xD3, 0x7F, 0x68, 0xA1, 0x05, 0x80, 0x99,  // &..h....
        /* 1960 */  0x84, 0x04, 0x20, 0x4C, 0x16, 0x88, 0x0E, 0x27,  // .. L...'
        /* 1968 */  0xD6, 0x08, 0x22, 0x40, 0xC7, 0x01, 0xA3, 0xD1,  // .."@....
        /* 1970 */  0x40, 0x68, 0x5C, 0x40, 0x9A, 0x1D, 0x90, 0x2A,  // @h\@...*
        /* 1978 */  0x6D, 0x00, 0xC6, 0x54, 0x83, 0xD0, 0x24, 0x20,  // m..T..$ 
        /* 1980 */  0x02, 0x74, 0x2C, 0x10, 0x01, 0x5A, 0x74, 0x04,  // .t,..Zt.
        /* 1988 */  0x30, 0x16, 0x01, 0x84, 0x46, 0x05, 0xA1, 0xC9,  // 0...F...
        /* 1990 */  0x2A, 0x80, 0xB2, 0x9C, 0x20, 0x1A, 0x20, 0xC9,  // *... . .
        /* 1998 */  0x30, 0x60, 0x0A, 0x42, 0x33, 0x81, 0xD0, 0x8C,  // 0`.B3...
        /* 19A0 */  0x20, 0x54, 0x7C, 0x07, 0x10, 0x16, 0x04, 0x84,  //  T|.....
        /* 19A8 */  0x86, 0x03, 0xD1, 0x00, 0xFE, 0xFF, 0x8F, 0x0C,  // ........
        /* 19B0 */  0x02, 0xD1, 0x00, 0x9C, 0x23, 0xC4, 0x61, 0x85,  // ....#.a.
        /* 19B8 */  0x82, 0xD0, 0xF4, 0x20, 0x34, 0x6C, 0x09, 0x50,  // ... 4l.P
        /* 19C0 */  0x16, 0x1D, 0x44, 0xC7, 0x23, 0x92, 0x02, 0x8C,  // ..D.#...
        /* 19C8 */  0x05, 0x02, 0xA1, 0x31, 0x41, 0x68, 0x6C, 0x10,  // ...1Ahl.
        /* 19D0 */  0x1A, 0x29, 0x06, 0x28, 0x13, 0x54, 0xE3, 0x50,  // .).(.T.P
        /* 19D8 */  0x44, 0x7B, 0x80, 0x31, 0x99, 0x20, 0x54, 0x36,  // D{.1. T6
        /* 19E0 */  0x88, 0xC0, 0x1C, 0x14, 0x88, 0x86, 0x07, 0xA1,  // ........
        /* 19E8 */  0x62, 0x82, 0x00, 0x52, 0x10, 0x01, 0x12, 0x20,  // b..R... 
        /* 19F0 */  0x1A, 0x1E, 0x84, 0x8A, 0x29, 0x32, 0x74, 0x0A,  // ....)2t.
        /* 19F8 */  0x42, 0x55, 0x24, 0x39, 0x9A, 0x50, 0x10, 0x1D,  // BU$9.P..
        /* 1A00 */  0x4D, 0x08, 0x08, 0xCD, 0x07, 0x46, 0x75, 0x35,  // M....Fu5
        /* 1A08 */  0x39, 0x6E, 0x50, 0x10, 0xAA, 0x1D, 0x84, 0x06,  // 9nP.....
        /* 1A10 */  0x05, 0xA1, 0x39, 0xA2, 0x80, 0xB2, 0xEC, 0x20,  // ..9.... 
        /* 1A18 */  0x02, 0xB2, 0x9E, 0x2A, 0x87, 0x0A, 0x0A, 0x22,  // ...*..."
        /* 1A20 */  0x30, 0xA7, 0x02, 0xA2, 0x49, 0x41, 0xA8, 0x8E,  // 0...IA..
        /* 1A28 */  0x2C, 0x47, 0x0A, 0x9A, 0x06, 0x84, 0x25, 0x06,  // ,G....%.
        /* 1A30 */  0xA1, 0xC9, 0xDA, 0x80, 0xB0, 0x0C, 0x75, 0x0E,  // ......u.
        /* 1A38 */  0x24, 0x14, 0x84, 0xE6, 0x04, 0xA1, 0x4A, 0xF2,  // $.....J.
        /* 1A40 */  0x0C, 0x8F, 0x82, 0xE8, 0x38, 0x42, 0x80, 0x68,  // ....8B.h
        /* 1A48 */  0x7A, 0x10, 0xAA, 0xA6, 0xCF, 0x00, 0x28, 0x88,  // z.....(.
        /* 1A50 */  0x06, 0x40, 0x40, 0x68, 0x4E, 0x30, 0xAA, 0xA8,  // .@@hN0..
        /* 1A58 */  0xD1, 0xD1, 0x84, 0x82, 0x50, 0xDD, 0x2F, 0x4E,  // ....P./N
        /* 1A60 */  0x81, 0xF8, 0xFF, 0x0F                           // ....
    })  /* END MBUF */
} /*end DefinitionBlock */

