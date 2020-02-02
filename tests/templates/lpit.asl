/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [LPIT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "LPIT"    [Low Power Idle Table]
[0004]                       Table Length : 00000094
[0001]                           Revision : 00
[0001]                           Checksum : D8
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20150410

[0004]                      Subtable Type : 00000000 [Native C-state Idle Structure]
[0004]                             Length : 00000038
[0002]                          Unique ID : 0000
[0002]                           Reserved : 0000
[0004]              Flags (decoded below) : 00000000
                           State Disabled : 0
                               No Counter : 0

[0012]                      Entry Trigger : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 08
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 01 [Byte Access:8]
[0008]                            Address : 0000000000000000

[0004]                          Residency : 00000000
[0004]                            Latency : 00000000
[0012]                  Residency Counter : [Generic Address Structure]
[0001]                           Space ID : 7F [FunctionalFixedHW]
[0001]                          Bit Width : 40
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 00 [Undefined/Legacy]
[0008]                            Address : 0000000000000000

[0008]                  Counter Frequency : 0000000000000000

[0004]                      Subtable Type : 00000000 [Native C-state Idle Structure]
[0004]                             Length : 00000038
[0002]                          Unique ID : 0000
[0002]                           Reserved : 0000
[0004]              Flags (decoded below) : 00000000
                           State Disabled : 0
                               No Counter : 0

[0012]                      Entry Trigger : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 08
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 01 [Byte Access:8]
[0008]                            Address : 0000000000000000

[0004]                          Residency : 00000000
[0004]                            Latency : 00000000
[0012]                  Residency Counter : [Generic Address Structure]
[0001]                           Space ID : 7F [FunctionalFixedHW]
[0001]                          Bit Width : 40
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 00 [Undefined/Legacy]
[0008]                            Address : 0000000000000000

[0008]                  Counter Frequency : 0000000000000000

