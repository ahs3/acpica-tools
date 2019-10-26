/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of pptt.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [PPTT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
[004h 0004   4]                 Table Length : 00000072
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 80
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703


[024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
[025h 0037   1]                       Length : 18
[026h 0038   2]                     Reserved : 0000
[028h 0040   4]        Flags (decoded below) : 00000000
                            Physical package : 0
                     ACPI Processor ID valid : 0
                       Processor is a thread : 0
                              Node is a leaf : 0
                    Identical Implementation : 0
[02Ch 0044   4]                       Parent : 00000000
[030h 0048   4]            ACPI Processor ID : 00000000
[034h 0052   4]      Private Resource Number : 00000001
[038h 0056   4]             Private Resource : 00000000

[03Ch 0060   1]                Subtable Type : 01 [Cache Type]
[03Dh 0061   1]                       Length : 18
[03Eh 0062   2]                     Reserved : 0000
[040h 0064   4]        Flags (decoded below) : 00000000
                                  Size valid : 0
                        Number of Sets valid : 0
                         Associativity valid : 0
                       Allocation Type valid : 0
                            Cache Type valid : 0
                          Write Policy valid : 0
                             Line Size valid : 0
[044h 0068   4]          Next Level of Cache : 00000000
[048h 0072   4]                         Size : 00000000
[04Ch 0076   4]               Number of Sets : 00000000
[050h 0080   1]                Associativity : 00
[051h 0081   1]                   Attributes : 00
                             Allocation Type : 0
                                  Cache Type : 0
                                Write Policy : 0
[052h 0082   2]                    Line Size : 0000

[054h 0084   1]                Subtable Type : 02 [ID]
[055h 0085   1]                       Length : 1E
[056h 0086   2]                     Reserved : 0000
[058h 0088   4]                    Vendor ID : 00000000
[05Ch 0092   8]                    Level1 ID : 0000000000000000
[064h 0100   8]                    Level2 ID : 0000000000000000
[06Ch 0108   2]               Major revision : 0000
[06Eh 0110   2]               Minor revision : 0000
[070h 0112   2]                Spin revision : 0000

Raw Table Data: Length 114 (0x72)

    0000: 50 50 54 54 72 00 00 00 01 80 49 4E 54 45 4C 20  // PPTTr.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 18 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 01 00 00 00 00 00 00 00 01 18 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 02 1E 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00                                            // ..
