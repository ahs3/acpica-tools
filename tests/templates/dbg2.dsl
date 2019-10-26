/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of dbg2.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [DBG2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "DBG2"    [Debug Port table type 2]
[004h 0004   4]                 Table Length : 000000B2
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : D0
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000000
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]                  Info Offset : 0000002C
[028h 0040   4]                   Info Count : 00000002

[02Ch 0044   1]                     Revision : EE
[02Dh 0045   2]                       Length : 003F
[02Fh 0047   1]               Register Count : 02
[030h 0048   2]              Namepath Length : 0009
[032h 0050   2]              Namepath Offset : 0036
[034h 0052   2]              OEM Data Length : 0000 [Optional field not present]
[036h 0054   2]              OEM Data Offset : 0000 [Optional field not present]
[038h 0056   2]                    Port Type : 8000
[03Ah 0058   2]                 Port Subtype : 0000
[03Ch 0060   2]                     Reserved : 0000
[03Eh 0062   2]          Base Address Offset : 0016
[040h 0064   2]          Address Size Offset : 002E

[042h 0066  12]        Base Address Register : [Generic Address Structure]
[042h 0066   1]                     Space ID : 01 [SystemIO]
[043h 0067   1]                    Bit Width : 32
[044h 0068   1]                   Bit Offset : 00
[045h 0069   1]         Encoded Access Width : 03 [DWord Access:32]
[046h 0070   8]                      Address : 1122334455667788


[04Eh 0078  12]        Base Address Register : [Generic Address Structure]
[04Eh 0078   1]                     Space ID : 01 [SystemIO]
[04Fh 0079   1]                    Bit Width : 64
[050h 0080   1]                   Bit Offset : 00
[051h 0081   1]         Encoded Access Width : 04 [QWord Access:64]
[052h 0082   8]                      Address : AABBCCDDEEFF0011

[05Ah 0090   4]                 Address Size : 76543210
[05Eh 0094   4]                 Address Size : FEDCBA98

[062h 0098   9]                     Namepath : "MyDevice"

[06Bh 0107   1]                     Revision : EE
[06Ch 0108   2]                       Length : 0047
[06Eh 0110   1]               Register Count : 01
[06Fh 0111   2]              Namepath Length : 0011
[071h 0113   2]              Namepath Offset : 0026
[073h 0115   2]              OEM Data Length : 0010
[075h 0117   2]              OEM Data Offset : 0037
[077h 0119   2]                    Port Type : 8000
[079h 0121   2]                 Port Subtype : 0000
[07Bh 0123   2]                     Reserved : 0000
[07Dh 0125   2]          Base Address Offset : 0016
[07Fh 0127   2]          Address Size Offset : 0022

[081h 0129  12]        Base Address Register : [Generic Address Structure]
[081h 0129   1]                     Space ID : 01 [SystemIO]
[082h 0130   1]                    Bit Width : 64
[083h 0131   1]                   Bit Offset : 00
[084h 0132   1]         Encoded Access Width : 04 [QWord Access:64]
[085h 0133   8]                      Address : AABBCCDDEEFF0011

[08Dh 0141   4]                 Address Size : FEDCBA98

[091h 0145  17]                     Namepath : "\\_SB_.PCI0.DBGP"
[0A2h 0162  16]                     OEM Data : 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 

Raw Table Data: Length 178 (0xB2)

    0000: 44 42 47 32 B2 00 00 00 01 D0 49 4E 54 45 4C 20  // DBG2......INTEL 
    0010: 54 45 4D 50 4C 41 54 45 00 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 2C 00 00 00 02 00 00 00 EE 3F 00 02  // ... ,........?..
    0030: 09 00 36 00 00 00 00 00 00 80 00 00 00 00 16 00  // ..6.............
    0040: 2E 00 01 32 00 03 88 77 66 55 44 33 22 11 01 64  // ...2...wfUD3"..d
    0050: 00 04 11 00 FF EE DD CC BB AA 10 32 54 76 98 BA  // ...........2Tv..
    0060: DC FE 4D 79 44 65 76 69 63 65 00 EE 47 00 01 11  // ..MyDevice..G...
    0070: 00 26 00 10 00 37 00 00 80 00 00 00 00 16 00 22  // .&...7........."
    0080: 00 01 64 00 04 11 00 FF EE DD CC BB AA 98 BA DC  // ..d.............
    0090: FE 5C 5C 5F 53 42 5F 2E 50 43 49 30 2E 44 42 47  // .\\_SB_.PCI0.DBG
    00A0: 50 00 41 42 43 44 45 46 47 48 49 50 51 52 53 54  // P.ABCDEFGHIPQRST
    00B0: 55 56                                            // UV
