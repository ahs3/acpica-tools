/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [DBG2] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "DBG2"    [Debug Port table type 2]
[0004]                       Table Length : 000000B2
[0001]                           Revision : 01
[0001]                           Checksum : BA
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000000
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20131115

[0004]                        Info Offset : 0000002C
[0004]                         Info Count : 00000002

[0001]                           Revision : EE
[0002]                             Length : 003F
[0001]                     Register Count : 02
[0002]                    Namepath Length : 0009
[0002]                    Namepath Offset : 0036
[0002]                    OEM Data Length : 0000 [Optional field not present]
[0002]                    OEM Data Offset : 0000 [Optional field not present]
[0002]                          Port Type : 8000
[0002]                       Port Subtype : 0000
[0002]                           Reserved : 0000
[0002]                Base Address Offset : 0016
[0002]                Address Size Offset : 002E

[0012]              Base Address Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 1122334455667788


[0012]              Base Address Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 64
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 04 [QWord Access:64]
[0008]                            Address : AABBCCDDEEFF0011

[0004]                       Address Size : 76543210
[0004]                       Address Size : FEDCBA98

[0009]                           Namepath : "MyDevice"

[0001]                           Revision : EE
[0002]                             Length : 0047
[0001]                     Register Count : 01
[0002]                    Namepath Length : 0011
[0002]                    Namepath Offset : 0026
[0002]                    OEM Data Length : 0010
[0002]                    OEM Data Offset : 0037
[0002]                          Port Type : 8000
[0002]                       Port Subtype : 0000
[0002]                           Reserved : 0000
[0002]                Base Address Offset : 0016
[0002]                Address Size Offset : 0022

[0012]              Base Address Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 64
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 04 [QWord Access:64]
[0008]                            Address : AABBCCDDEEFF0011

[0004]                       Address Size : FEDCBA98

[0017]                           Namepath : "\\_SB_.PCI0.DBGP"
[0016]                           OEM Data : 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56
