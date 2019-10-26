/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of spmi.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [SPMI]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "SPMI"    [Server Platform Management Interface table]
[004h 0004   4]                 Table Length : 00000041
[008h 0008   1]                     Revision : 04
[009h 0009   1]                     Checksum : 06
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]               Interface Type : 00
[025h 0037   1]                     Reserved : 01
[026h 0038   2]            IPMI Spec Version : 0000
[028h 0040   1]               Interrupt Type : 00
[029h 0041   1]                   GPE Number : 00
[02Ah 0042   1]                     Reserved : 00
[02Bh 0043   1]              PCI Device Flag : 00
[02Ch 0044   4]                    Interrupt : 00000000

[030h 0048  12]                IPMI Register : [Generic Address Structure]
[030h 0048   1]                     Space ID : 00 [SystemMemory]
[031h 0049   1]                    Bit Width : 08
[032h 0050   1]                   Bit Offset : 00
[033h 0051   1]         Encoded Access Width : 01 [Byte Access:8]
[034h 0052   8]                      Address : 0000000000000000

[03Ch 0060   1]                  PCI Segment : 00
[03Dh 0061   1]                      PCI Bus : 00
[03Eh 0062   1]                   PCI Device : 00
[03Fh 0063   1]                 PCI Function : 00
[040h 0064   1]                     Reserved : 00

Raw Table Data: Length 65 (0x41)

    0000: 53 50 4D 49 41 00 00 00 04 06 49 4E 54 45 4C 20  // SPMIA.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 01 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 08 00 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00                                               // .
