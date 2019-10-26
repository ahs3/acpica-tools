/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of drtm.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [DRTM]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "DRTM"    [Dynamic Root of Trust for Measurement table]
[004h 0004   4]                 Table Length : 00000094
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : BF
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   8]           Entry Base Address : 0000000000000000
[02Ch 0044   8]                 Entry Length : 0000000000000000
[034h 0052   4]                     Entry 32 : 00000000
[038h 0056   8]                     Entry 64 : 0000000000000000
[040h 0064   8]                 Exit Address : 0000000000000000
[048h 0072   8]               Log Area Start : 0000000000000000
[050h 0080   4]              Log Area Length : 00000000
[054h 0084   8]       Arch Dependent Address : 0000000000000000
[05Ch 0092   4]        Flags (decoded below) : 00000000
                            Namespace in TCB : 0
                       Gap Code on S3 Resume : 0
                       Gap Code on DLME_Exit : 0
                     PCR_Authorities Changed : 0

[060h 0096   4]        Validated Table Count : 00000001
[064h 0100   8]                Table Address : 0000000000000000

[06Ch 0108   4]               Resource Count : 00000001
[070h 0112   7]                         Size : 00000000000000
[077h 0119   1]                         Type : 00
                               Resource Type : 0
                                 Protections : 0
[078h 0120   8]                      Address : 0000000000000000

[080h 0128   4]      DLME Platform Id Length : 00000000
[084h 0132  16]             DLME Platform Id : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Raw Table Data: Length 148 (0x94)

    0000: 44 52 54 4D 94 00 00 00 01 BF 49 4E 54 45 4C 20  // DRTM......INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00                                      // ....
