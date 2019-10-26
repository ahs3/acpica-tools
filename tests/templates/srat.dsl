/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of srat.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [SRAT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "SRAT"    [System Resource Affinity Table]
[004h 0004   4]                 Table Length : 000000BE
[008h 0008   1]                     Revision : 03
[009h 0009   1]                     Checksum : 0A
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]               Table Revision : 00000001
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 00 [Processor Local APIC/SAPIC Affinity]
[031h 0049   1]                       Length : 10

[032h 0050   1]      Proximity Domain Low(8) : 00
[033h 0051   1]                      Apic ID : 00
[034h 0052   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
[038h 0056   1]              Local Sapic EID : 00
[039h 0057   3]    Proximity Domain High(24) : 000000
[03Ch 0060   4]                 Clock Domain : 00000000

[040h 0064   1]                Subtable Type : 01 [Memory Affinity]
[041h 0065   1]                       Length : 28

[042h 0066   4]             Proximity Domain : 00000000
[046h 0070   2]                    Reserved1 : 0000
[048h 0072   8]                 Base Address : 0000000000000000
[050h 0080   8]               Address Length : 000000000009FC00
[058h 0088   4]                    Reserved2 : 00000000
[05Ch 0092   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
                               Hot Pluggable : 0
                                Non-Volatile : 0
[060h 0096   8]                    Reserved3 : 0000000000000000

[068h 0104   1]                Subtable Type : 02 [Processor Local x2APIC Affinity]
[069h 0105   1]                       Length : 18

[06Ah 0106   2]                    Reserved1 : 0000
[06Ch 0108   4]             Proximity Domain : 00000000
[070h 0112   4]                      Apic ID : 00000000
[074h 0116   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
[078h 0120   4]                 Clock Domain : 00000000
[07Ch 0124   4]                    Reserved2 : 00000000

[080h 0128   1]                Subtable Type : 03 [GICC Affinity]
[081h 0129   1]                       Length : 12

[082h 0130   4]             Proximity Domain : 00000000
[086h 0134   4]           Acpi Processor UID : 00000000
[08Ah 0138   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
[08Eh 0142   4]                 Clock Domain : 00000000

[092h 0146   1]                Subtable Type : 04 [GIC ITS Affinity]
[093h 0147   1]                       Length : 0C

[094h 0148   4]             Proximity Domain : 00000000
[098h 0152   2]                     Reserved : 0000
[09Ah 0154   4]                       ITS ID : 00000001

[09Eh 0158   1]                Subtable Type : 05 [Generic Initiator Affinity]
[09Fh 0159   1]                       Length : 20

[0A0h 0160   1]                    Reserved1 : 00
[0A1h 0161   1]           Device Handle Type : 00
[0A2h 0162   4]             Proximity Domain : 00000000
[0A6h 0166  16]                Device Handle : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[0B6h 0182   4]        Flags (decoded below) : 00000000
                                     Enabled : 0
[0BAh 0186   4]                    Reserved2 : 00000000

Raw Table Data: Length 190 (0xBE)

    0000: 53 52 41 54 BE 00 00 00 03 0A 49 4E 54 45 4C 20  // SRAT......INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 01 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 10 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 01 28 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // .(..............
    0050: 00 FC 09 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 02 18 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 03 12 00 00 00 00 00 00 00 00 01 00 00 00 00 00  // ................
    0090: 00 00 04 0C 00 00 00 00 00 00 01 00 00 00 05 20  // ............... 
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00        // ..............
