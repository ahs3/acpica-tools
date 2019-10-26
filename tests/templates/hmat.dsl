/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of hmat.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [HMAT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
[004h 0004   4]                 Table Length : 0000009C
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 4C
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                     Reserved : 00000000

[028h 0040   2]               Structure Type : 0000 [Memory Proximity Domain Attributes]
[02Ah 0042   2]                     Reserved : 0000
[02Ch 0044   4]                       Length : 00000028
[030h 0048   2]        Flags (decoded below) : 0000
            Processor Proximity Domain Valid : 0
[032h 0050   2]                    Reserved1 : 0000
[034h 0052   4]   Processor Proximity Domain : 00000000
[038h 0056   4]      Memory Proximity Domain : 00000000
[03Ch 0060   4]                    Reserved2 : 00000000
[040h 0064   8]                    Reserved3 : 0000000000000000
[048h 0072   8]                    Reserved4 : 0000000000000000

[050h 0080   2]               Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[052h 0082   2]                     Reserved : 0000
[054h 0084   4]                       Length : 0000002A
[058h 0088   1]        Flags (decoded below) : 00
                            Memory Hierarchy : 0
[059h 0089   1]                    Data Type : 00
[05Ah 0090   2]                    Reserved1 : 0000
[05Ch 0092   4] Initiator Proximity Domains # : 00000001
[060h 0096   4]   Target Proximity Domains # : 00000001
[064h 0100   4]                    Reserved2 : 00000000
[068h 0104   8]              Entry Base Unit : 0000000000000000
[070h 0112   4] Initiator Proximity Domain List : 00000000
[074h 0116   4] Target Proximity Domain List : 00000000
[078h 0120   2]                        Entry : 0000

[07Ah 0122   2]               Structure Type : 0002 [Memory Side Cache Information]
[07Ch 0124   2]                     Reserved : 0000
[07Eh 0126   4]                       Length : 00000022
[082h 0130   4]      Memory Proximity Domain : 00000000
[086h 0134   4]                    Reserved1 : 00000000
[08Ah 0138   8]       Memory Side Cache Size : 0000000000000000
[092h 0146   4] Cache Attributes (decoded below) : 00000000
                          Total Cache Levels : 0
                                 Cache Level : 0
                         Cache Associativity : 0
                                Write Policy : 0
                             Cache Line Size : 0000
[096h 0150   2]                    Reserved2 : 0000
[098h 0152   2]              SMBIOS Handle # : 0001
[09Ah 0154   2]                SMBIOS Handle : 0000

Raw Table Data: Length 156 (0x9C)

    0000: 48 4D 41 54 9C 00 00 00 02 4C 49 4E 54 45 4C 20  // HMAT.....LINTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 00 00 00 00 28 00 00 00  // ... ........(...
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0050: 01 00 00 00 2A 00 00 00 00 00 00 00 01 00 00 00  // ....*...........
    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 02 00 00 00 22 00  // ..............".
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 01 00 00 00              // ............
