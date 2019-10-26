/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of dmar.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [DMAR]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "DMAR"    [DMA Remapping table]
[004h 0004   4]                 Table Length : 0000008C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 0F
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]           Host Address Width : 2F
[025h 0037   1]                        Flags : 01
[026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

[030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
[032h 0050   2]                       Length : 0018

[034h 0052   1]                        Flags : 01
[035h 0053   1]                     Reserved : 00
[036h 0054   2]           PCI Segment Number : 0000
[038h 0056   8]        Register Base Address : 0000000000000000

[040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
[041h 0065   1]                 Entry Length : 08
[042h 0066   2]                     Reserved : 0000
[044h 0068   1]               Enumeration ID : 08
[045h 0069   1]               PCI Bus Number : 00

[046h 0070   2]                     PCI Path : 00,01


[048h 0072   2]                Subtable Type : 0001 [Reserved Memory Region]
[04Ah 0074   2]                       Length : 0020

[04Ch 0076   2]                     Reserved : 0000
[04Eh 0078   2]           PCI Segment Number : 0000
[050h 0080   8]                 Base Address : 0000000000000000
[058h 0088   8]          End Address (limit) : 0000000000000FFF

[060h 0096   1]            Device Scope Type : 01 [PCI Endpoint Device]
[061h 0097   1]                 Entry Length : 08
[062h 0098   2]                     Reserved : 0000
[064h 0100   1]               Enumeration ID : 00
[065h 0101   1]               PCI Bus Number : 00

[066h 0102   2]                     PCI Path : 00,02


[068h 0104   2]                Subtable Type : 0002 [Root Port ATS Capability]
[06Ah 0106   2]                       Length : 0010

[06Ch 0108   1]                        Flags : 00
[06Dh 0109   1]                     Reserved : 00
[06Eh 0110   2]           PCI Segment Number : 0000

[070h 0112   1]            Device Scope Type : 02 [PCI Bridge Device]
[071h 0113   1]                 Entry Length : 08
[072h 0114   2]                     Reserved : 0000
[074h 0116   1]               Enumeration ID : 00
[075h 0117   1]               PCI Bus Number : 00

[076h 0118   2]                     PCI Path : 00,03


[078h 0120   2]                Subtable Type : 0003 [Remapping Hardware Static Affinity]
[07Ah 0122   2]                       Length : 0014

[07Ch 0124   4]                     Reserved : 00000000
[080h 0128   8]                 Base Address : 0000000000000000
[088h 0136   4]             Proximity Domain : 00000000

Raw Table Data: Length 140 (0x8C)

    0000: 44 4D 41 52 8C 00 00 00 01 0F 49 4E 54 45 4C 20  // DMAR......INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 2F 01 00 00 00 00 00 00 00 00 00 00  // ... /...........
    0030: 00 00 18 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 03 08 00 00 08 00 00 01 01 00 20 00 00 00 00 00  // .......... .....
    0050: 00 00 00 00 00 00 00 00 FF 0F 00 00 00 00 00 00  // ................
    0060: 01 08 00 00 00 00 00 02 02 00 10 00 00 00 00 00  // ................
    0070: 02 08 00 00 00 00 00 03 03 00 14 00 00 00 00 00  // ................
    0080: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
