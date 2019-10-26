/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of spcr.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [SPCR]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection table]
[004h 0004   4]                 Table Length : 00000050
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : FD
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]               Interface Type : 00
[025h 0037   3]                     Reserved : 000000

[028h 0040  12]         Serial Port Register : [Generic Address Structure]
[028h 0040   1]                     Space ID : 00 [SystemMemory]
[029h 0041   1]                    Bit Width : 08
[02Ah 0042   1]                   Bit Offset : 00
[02Bh 0043   1]         Encoded Access Width : 00 [Undefined/Legacy]
[02Ch 0044   8]                      Address : 0000000000000000

[034h 0052   1]               Interrupt Type : 00
[035h 0053   1]          PCAT-compatible IRQ : 00
[036h 0054   4]                    Interrupt : 00000000
[03Ah 0058   1]                    Baud Rate : 00
[03Bh 0059   1]                       Parity : 00
[03Ch 0060   1]                    Stop Bits : 00
[03Dh 0061   1]                 Flow Control : 00
[03Eh 0062   1]                Terminal Type : 00
[04Ch 0076   1]                     Reserved : 00
[040h 0064   2]                PCI Device ID : 0000
[042h 0066   2]                PCI Vendor ID : 0000
[044h 0068   1]                      PCI Bus : 00
[045h 0069   1]                   PCI Device : 00
[046h 0070   1]                 PCI Function : 00
[047h 0071   4]                    PCI Flags : 00000000
[04Bh 0075   1]                  PCI Segment : 00
[04Ch 0076   4]                     Reserved : 00000000

Raw Table Data: Length 80 (0x50)

    0000: 53 50 43 52 50 00 00 00 01 FD 49 4E 54 45 4C 20  // SPCRP.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 00 00 00 08 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
