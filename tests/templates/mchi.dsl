/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of mchi.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [MCHI]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "MCHI"    [Management Controller Host Interface table]
[004h 0004   4]                 Table Length : 00000045
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : FE
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 02000715
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]               Interface Type : 01
[025h 0037   1]                     Protocol : 00
[026h 0038   8]                Protocol Data : 0000000000000000
[02Eh 0046   1]               Interrupt Type : 00
[02Fh 0047   1]                          Gpe : 00
[030h 0048   1]              Pci Device Flag : 00
[031h 0049   4]             Global Interrupt : 00000000

[035h 0053  12]             Control Register : [Generic Address Structure]
[035h 0053   1]                     Space ID : 02 [PCI_Config]
[036h 0054   1]                    Bit Width : 08
[037h 0055   1]                   Bit Offset : 00
[038h 0056   1]         Encoded Access Width : 00 [Undefined/Legacy]
[039h 0057   8]                      Address : 0000000000000000

[041h 0065   1]                  Pci Segment : 00
[042h 0066   1]                      Pci Bus : 00
[043h 0067   1]                   Pci Device : 00
[044h 0068   1]                 Pci Function : 00

Raw Table Data: Length 69 (0x45)

    0000: 4D 43 48 49 45 00 00 00 01 FE 49 4E 54 45 4C 20  // MCHIE.....INTEL 
    0010: 54 45 4D 50 4C 41 54 45 15 07 00 02 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 01 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 00 02 08 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00                                   // .....
