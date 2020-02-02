/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [NFIT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "NFIT"    [NVDIMM Firmware Interface Table]
[0004]                       Table Length : 00000180
[0001]                           Revision : 01
[0001]                           Checksum : 07
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20170929

[0004]                           Reserved : 00000000

[0002]                      Subtable Type : 0000 [System Physical Address Range]
[0002]                             Length : 0038

[0002]                        Range Index : 0001
[0002]              Flags (decoded below) : 0000
                Add/Online Operation Only : 0
                   Proximity Domain Valid : 0
[0004]                           Reserved : 00000000
[0004]                   Proximity Domain : 00000000
[0016]                   Region Type GUID : 91AF0530-5D86-470E-A6B0-0A2DB9408249
[0008]                 Address Range Base : 000000037C000000
[0008]               Address Range Length : 000000000C000000
[0008]               Memory Map Attribute : 0000000000000008

[0002]                      Subtable Type : 0001 [Memory Range Map]
[0002]                             Length : 0030

[0004]                      Device Handle : 00000001
[0002]                        Physical Id : 0004
[0002]                          Region Id : 0000
[0002]                        Range Index : 0001
[0002]               Control Region Index : 0001
[0008]                        Region Size : 0000000004000000
[0008]                      Region Offset : 0000000000000000
[0008]                Address Region Base : 0000000008000000
[0002]                   Interleave Index : 0001
[0002]                    Interleave Ways : 0003
[0002]                              Flags : 002A
                    Save to device failed : 0
               Restore from device failed : 1
                    Platform flush failed : 0
                         Device not armed : 1
                   Health events observed : 0
                    Health events enabled : 1
                           Mapping failed : 0
[0002]                           Reserved : 0000

[0002]                      Subtable Type : 0002 [Interleave Info]
[0002]                             Length : 0020

[0002]                   Interleave Index : 0001
[0002]                           Reserved : 0000
[0004]                         Line Count : 00000004
[0004]                          Line Size : 00000100
[0004]                        Line Offset : 00000000
[0004]                        Line Offset : 00000003
[0004]                        Line Offset : 00000006
[0004]                        Line Offset : 00000009

[0002]                      Subtable Type : 0003 [SMBIOS Information]
[0002]                             Length : 0028

[0004]                           Reserved : 00000000
[0032]               SMBIOS Table Entries : \
    B4 13 5D 40 91 0B 29 93 67 E8 23 4C 00 00 00 88 \
    00 11 22 33 44 55 66 77 88 99 AA BB CC DD EE FF

[0002]                      Subtable Type : 0004 [NVDIMM Control Region]
[0002]                             Length : 0050

[0002]                       Region Index : 0001
[0002]                          Vendor Id : 8086
[0002]                          Device Id : 2017
[0002]                        Revision Id : 0001
[0002]                Subsystem Vendor Id : 8086
[0002]                Subsystem Device Id : 2017
[0002]              Subsystem Revision Id : 0001
[0001]                       Valid Fields : 00
[0001]             Manufacturing Location : 00
[0002]                 Manufacturing Date : 0000
[0002]                           Reserved : 0000
[0004]                      Serial Number : 76540089
[0002]                               Code : 0301
[0002]                       Window Count : 0100
[0008]                        Window Size : 0000000000002000
[0008]                     Command Offset : 0000000000800000
[0008]                       Command Size : 0000000000000008
[0008]                      Status Offset : 0000000000801000
[0008]                        Status Size : 0000000000000004
[0002]                              Flags : 0000
                         Windows buffered : 0
[0006]                          Reserved1 : 000000000000

[0002]                      Subtable Type : 0005 [NVDIMM Block Data Window Region]
[0002]                             Length : 0028

[0002]                       Region Index : 0001
[0002]                       Window Count : 0100
[0008]                             Offset : 0000000000000000
[0008]                               Size : 0000000000002000
[0008]                           Capacity : 0000000FE0000000
[0008]                      Start Address : 0000000010000000

[0002]                      Subtable Type : 0006 [Flush Hint Address]
[0002]                             Length : 0020

[0004]                      Device Handle : 00000001
[0002]                         Hint Count : 0002
[0006]                           Reserved : 000000000000
[0008]                       Hint Address : 0000000418000000
[0008]                       Hint Address : 0000000618000000

[0002]                      Subtable Type : 0007 [Platform Capabilities]
[0002]                             Length : 0010

[0001]                 Highest Capability : 00
[0003]                           Reserved : 000000
[0004]       Capabilities (decoded below) : 00000005
                    Cache Flush to NVDIMM : 1
                   Memory Flush to NVDIMM : 0
                         Memory Mirroring : 1
[0004]                           Reserved : 00000000
