/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of lpit.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [LPIT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "LPIT"    [Low Power Idle Table]
[004h 0004   4]                 Table Length : 00000094
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : DE
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                Subtable Type : 00000000 [Native C-state Idle Structure]
[028h 0040   4]                       Length : 00000038
[02Ch 0044   2]                    Unique ID : 0000
[02Eh 0046   2]                     Reserved : 0000
[030h 0048   4]        Flags (decoded below) : 00000000
                              State Disabled : 0
                                  No Counter : 0

[034h 0052  12]                Entry Trigger : [Generic Address Structure]
[034h 0052   1]                     Space ID : 01 [SystemIO]
[035h 0053   1]                    Bit Width : 08
[036h 0054   1]                   Bit Offset : 00
[037h 0055   1]         Encoded Access Width : 01 [Byte Access:8]
[038h 0056   8]                      Address : 0000000000000000

[040h 0064   4]                    Residency : 00000000
[044h 0068   4]                      Latency : 00000000
[048h 0072  12]            Residency Counter : [Generic Address Structure]
[048h 0072   1]                     Space ID : 7F [FunctionalFixedHW]
[049h 0073   1]                    Bit Width : 40
[04Ah 0074   1]                   Bit Offset : 00
[04Bh 0075   1]         Encoded Access Width : 00 [Undefined/Legacy]
[04Ch 0076   8]                      Address : 0000000000000000

[054h 0084   8]            Counter Frequency : 0000000000000000

[05Ch 0092   4]                Subtable Type : 00000000 [Native C-state Idle Structure]
[060h 0096   4]                       Length : 00000038
[064h 0100   2]                    Unique ID : 0000
[066h 0102   2]                     Reserved : 0000
[068h 0104   4]        Flags (decoded below) : 00000000
                              State Disabled : 0
                                  No Counter : 0

[06Ch 0108  12]                Entry Trigger : [Generic Address Structure]
[06Ch 0108   1]                     Space ID : 01 [SystemIO]
[06Dh 0109   1]                    Bit Width : 08
[06Eh 0110   1]                   Bit Offset : 00
[06Fh 0111   1]         Encoded Access Width : 01 [Byte Access:8]
[070h 0112   8]                      Address : 0000000000000000

[078h 0120   4]                    Residency : 00000000
[07Ch 0124   4]                      Latency : 00000000
[080h 0128  12]            Residency Counter : [Generic Address Structure]
[080h 0128   1]                     Space ID : 7F [FunctionalFixedHW]
[081h 0129   1]                    Bit Width : 40
[082h 0130   1]                   Bit Offset : 00
[083h 0131   1]         Encoded Access Width : 00 [Undefined/Legacy]
[084h 0132   8]                      Address : 0000000000000000

[08Ch 0140   8]            Counter Frequency : 0000000000000000


Raw Table Data: Length 148 (0x94)

    0000: 4C 50 49 54 94 00 00 00 00 DE 49 4E 54 45 4C 20  // LPIT......INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 00 00 00 00 38 00 00 00 00 00 00 00  // ... ....8.......
    0030: 00 00 00 00 01 08 00 01 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 7F 40 00 00 00 00 00 00  // .........@......
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 38 00 00 00 00 00 00 00 00 00 00 00 01 08 00 01  // 8...............
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 7F 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // .@..............
    0090: 00 00 00 00                                      // ....
