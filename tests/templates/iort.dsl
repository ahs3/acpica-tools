/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of iort.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [IORT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
[004h 0004   4]                 Table Length : 00000220
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 04
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                   Node Count : 00000006
[028h 0040   4]                  Node Offset : 00000034
[02Ch 0044   4]                     Reserved : 00000000
[030h 0048   4]             Optional Padding : 00 00 00 00 

[034h 0052   1]                         Type : 00
[035h 0053   2]                       Length : 0018
[037h 0055   1]                     Revision : 00
[038h 0056   4]                     Reserved : 00000000
[03Ch 0060   4]                Mapping Count : 00000000
[040h 0064   4]               Mapping Offset : 00000000

[044h 0068   4]                     ItsCount : 00000001
[048h 0072   4]                  Identifiers : 00000000

[04Ch 0076   1]                         Type : 01
[04Dh 0077   2]                       Length : 00A8
[04Fh 0079   1]                     Revision : 00
[050h 0080   4]                     Reserved : 00000000
[054h 0084   4]                Mapping Count : 00000001
[058h 0088   4]               Mapping Offset : 00000094

[05Ch 0092   4]                   Node Flags : 00000000
[060h 0096   8]            Memory Properties : [IORT Memory Access Properties]
[060h 0096   4]              Cache Coherency : 00000000
[064h 0100   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[065h 0101   2]                     Reserved : 0000
[067h 0103   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[068h 0104   1]            Memory Size Limit : 00
[069h 0105  15]                  Device Name : "\_SB.PCI0.DEV0"
[078h 0120 124]                      Padding : \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 

[0E0h 0224   4]                   Input base : 00000000
[0E4h 0228   4]                     ID Count : 00000000
[0E8h 0232   4]                  Output Base : 00000000
[0ECh 0236   4]             Output Reference : 00000000
[0F0h 0240   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[0F4h 0244   1]                         Type : 02
[0F5h 0245   2]                       Length : 0038
[0F7h 0247   1]                     Revision : 00
[0F8h 0248   4]                     Reserved : 00000000
[0FCh 0252   4]                Mapping Count : 00000001
[100h 0256   4]               Mapping Offset : 00000024

[104h 0260   8]            Memory Properties : [IORT Memory Access Properties]
[104h 0260   4]              Cache Coherency : 00000000
[108h 0264   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[109h 0265   2]                     Reserved : 0000
[10Bh 0267   1] Memory Flags (decoded below) : 00
                                   Coherency : 0
                            Device Attribute : 0
[10Ch 0268   4]                ATS Attribute : 00000000
[110h 0272   4]           PCI Segment Number : 00000000
[114h 0276   1]            Memory Size Limit : 00
[115h 0277   3]                     Reserved : 000000

[118h 0280   4]                   Input base : 00000000
[11Ch 0284   4]                     ID Count : 00000000
[120h 0288   4]                  Output Base : 00000000
[124h 0292   4]             Output Reference : 00000000
[128h 0296   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[12Ch 0300   1]                         Type : 03
[12Dh 0301   2]                       Length : 0060
[12Fh 0303   1]                     Revision : 01
[130h 0304   4]                     Reserved : 00000000
[134h 0308   4]                Mapping Count : 00000001
[138h 0312   4]               Mapping Offset : 0000004C

[13Ch 0316   8]                 Base Address : 0000000000000000
[144h 0324   8]                         Span : 0000000000000000
[14Ch 0332   4]                        Model : 00000000
[150h 0336   4]        Flags (decoded below) : 00000000
                               DVM Supported : 0
                               Coherent Walk : 0
[154h 0340   4]      Global Interrupt Offset : 0000003C
[158h 0344   4]      Context Interrupt Count : 00000000
[15Ch 0348   4]     Context Interrupt Offset : 0000004C
[160h 0352   4]          PMU Interrupt Count : 00000000
[164h 0356   4]         PMU Interrupt Offset : 0000004C

[168h 0360   4]                      NSgIrpt : 00000000
[16Ch 0364   4] NSgIrpt Flags (decoded below) : 00000000
                              Edge Triggered : 0
[170h 0368   4]                   NSgCfgIrpt : 00000000
[174h 0372   4] NSgCfgIrpt Flags (decoded below) : 00000000
                              Edge Triggered : 0

[178h 0376   4]                   Input base : 00000000
[17Ch 0380   4]                     ID Count : 00000000
[180h 0384   4]                  Output Base : 00000000
[184h 0388   4]             Output Reference : 00000000
[188h 0392   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[18Ch 0396   1]                         Type : 04
[18Dh 0397   2]                       Length : 0058
[18Fh 0399   1]                     Revision : 01
[190h 0400   4]                     Reserved : 00000000
[194h 0404   4]                Mapping Count : 00000001
[198h 0408   4]               Mapping Offset : 00000044

[19Ch 0412   8]                 Base Address : 0000000000000000
[1A4h 0420   4]        Flags (decoded below) : 00000000
                             COHACC Override : 0
                               HTTU Override : 0
                      Proximity Domain Valid : 0
[1A8h 0424   4]                     Reserved : 00000000
[1ACh 0428   8]                VATOS Address : 0000000000000000
[1B4h 0436   4]                        Model : 00000000
[1B8h 0440   4]                   Event GSIV : 00000000
[1BCh 0444   4]                     PRI GSIV : 00000000
[1C0h 0448   4]                    GERR GSIV : 00000000
[1C4h 0452   4]                    Sync GSIV : 00000000
[1C8h 0456   4]             Proximity Domain : 00000000
[1CCh 0460   4]      Device ID Mapping Index : 00000000

[1D0h 0464   4]                   Input base : 00000000
[1D4h 0468   4]                     ID Count : 00000000
[1D8h 0472   4]                  Output Base : 00000000
[1DCh 0476   4]             Output Reference : 00000000
[1E0h 0480   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

[1E4h 0484   1]                         Type : 05
[1E5h 0485   2]                       Length : 003C
[1E7h 0487   1]                     Revision : 01
[1E8h 0488   4]                     Reserved : 00000000
[1ECh 0492   4]                Mapping Count : 00000001
[1F0h 0496   4]               Mapping Offset : 00000028

[1F4h 0500   8]          Page 0 Base Address : 0000000000000000
[1FCh 0508   4]      Overflow Interrupt GSIV : 00000000
[200h 0512   4]               Node Reference : 00000000
[204h 0516   8]          Page 1 Base Address : 0000000000000000

[20Ch 0524   4]                   Input base : 00000000
[210h 0528   4]                     ID Count : 00000000
[214h 0532   4]                  Output Base : 00000000
[218h 0536   4]             Output Reference : 00000000
[21Ch 0540   4]        Flags (decoded below) : 00000001
                              Single Mapping : 1

Raw Table Data: Length 544 (0x220)

    0000: 49 4F 52 54 20 02 00 00 00 04 49 4E 54 45 4C 20  // IORT .....INTEL 
    0010: 54 65 6D 70 6C 61 74 65 00 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 06 00 00 00 34 00 00 00 00 00 00 00  // ... ....4.......
    0030: 00 00 00 00 00 18 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 01 00 00 00 00 00 00 00 01 A8 00 00  // ................
    0050: 00 00 00 00 01 00 00 00 94 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 5C 5F 53 42 2E 50 43  // .........\_SB.PC
    0070: 49 30 2E 44 45 56 30 00 00 00 00 00 00 00 00 00  // I0.DEV0.........
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 00 00 00 00 02 38 00 00 00 00 00 00 01 00 00 00  // .....8..........
    0100: 24 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // $...............
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0120: 00 00 00 00 00 00 00 00 00 00 00 00 03 60 00 01  // .............`..
    0130: 00 00 00 00 01 00 00 00 4C 00 00 00 00 00 00 00  // ........L.......
    0140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0150: 00 00 00 00 3C 00 00 00 00 00 00 00 4C 00 00 00  // ....<.......L...
    0160: 00 00 00 00 4C 00 00 00 00 00 00 00 00 00 00 00  // ....L...........
    0170: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0180: 00 00 00 00 00 00 00 00 00 00 00 00 04 58 00 01  // .............X..
    0190: 00 00 00 00 01 00 00 00 44 00 00 00 00 00 00 00  // ........D.......
    01A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01E0: 00 00 00 00 05 3C 00 01 00 00 00 00 01 00 00 00  // .....<..........
    01F0: 28 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // (...............
    0200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0210: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
