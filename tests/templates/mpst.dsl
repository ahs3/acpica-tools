/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of mpst.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [MPST]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "MPST"    [Memory Power State Table]
[004h 0004   4]                 Table Length : 000000B6
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 82
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]                   Channel ID : 00
[025h 0037   3]                     Reserved : 000000
[028h 0040   2]             Power Node Count : 0002
[02Ah 0042   2]                     Reserved : 0000

[02Ch 0044   1]        Flags (decoded below) : 00
                                Node Enabled : 0
                               Power Managed : 0
                            Hot Plug Capable : 0
[02Dh 0045   1]                     Reserved : 00
[02Eh 0046   2]                      Node ID : 0000
[030h 0048   4]                       Length : 00000000
[034h 0052   8]                Range Address : 0000000000000000
[03Ch 0060   8]                 Range Length : 0000000000000000
[044h 0068   4]             Num Power States : 00000002
[048h 0072   4]      Num Physical Components : 00000003

[04Ch 0076   1]                  Power State : 00
[04Dh 0077   1]                    InfoIndex : 00

[04Eh 0078   1]                  Power State : 00
[04Fh 0079   1]                    InfoIndex : 00

[050h 0080   2]                 Component Id : 0000
[052h 0082   2]                 Component Id : 0001
[054h 0084   2]                 Component Id : 0002

[056h 0086   1]        Flags (decoded below) : 00
                                Node Enabled : 0
                               Power Managed : 0
                            Hot Plug Capable : 0
[057h 0087   1]                     Reserved : 00
[058h 0088   2]                      Node ID : 0000
[05Ah 0090   4]                       Length : 00000000
[05Eh 0094   8]                Range Address : 0000000000000000
[066h 0102   8]                 Range Length : 0000000000000000
[06Eh 0110   4]             Num Power States : 00000001
[072h 0114   4]      Num Physical Components : 00000001

[076h 0118   1]                  Power State : 00
[077h 0119   1]                    InfoIndex : 00

[078h 0120   2]                 Component Id : 0000

[07Ah 0122   2]        Characteristics Count : 0002
[07Ch 0124   2]                     Reserved : 0000

[07Eh 0126   1]                 Structure ID : 01
[07Fh 0127   1]        Flags (decoded below) : 00
                            Memory Preserved : 0
                                  Auto Entry : 0
                                   Auto Exit : 0
[080h 0128   2]                     Reserved : 0000
[082h 0130   4]                Average Power : 00000000
[086h 0134   4]                 Power Saving : 00000000
[08Ah 0138   8]                 Exit Latency : 0000000000000000
[092h 0146   8]                     Reserved : 0000000000000000

[09Ah 0154   1]                 Structure ID : 01
[09Bh 0155   1]        Flags (decoded below) : 00
                            Memory Preserved : 0
                                  Auto Entry : 0
                                   Auto Exit : 0
[09Ch 0156   2]                     Reserved : 0000
[09Eh 0158   4]                Average Power : 00000000
[0A2h 0162   4]                 Power Saving : 00000000
[0A6h 0166   8]                 Exit Latency : 0000000000000000
[0AEh 0174   8]                     Reserved : 0000000000000000

Raw Table Data: Length 182 (0xB6)

    0000: 4D 50 53 54 B6 00 00 00 01 82 49 4E 54 45 4C 20  // MPST......INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 02 00 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 02 00 00 00 03 00 00 00 00 00 00 00  // ................
    0050: 00 00 01 00 02 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00  // ................
    0070: 00 00 01 00 00 00 00 00 00 00 02 00 00 00 01 00  // ................
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00                                // ......
