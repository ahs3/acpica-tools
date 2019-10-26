/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Template for [MPST] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "MPST"    [Memory Power State Table]
[0004]                       Table Length : 000000B6
[0001]                           Revision : 01
[0001]                           Checksum : 77
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20120913

[0001]                         Channel ID : 00
[0003]                           Reserved : 000000
[0002]                   Power Node Count : 0002
[0002]                           Reserved : 0000

[0001]              Flags (decoded below) : 00
                             Node Enabled : 0
                            Power Managed : 0
                         Hot Plug Capable : 0
[0001]                           Reserved : 00
[0002]                            Node ID : 0000
[0004]                             Length : 00000000
[0008]                      Range Address : 0000000000000000
[0008]                       Range Length : 0000000000000000
[0004]                   Num Power States : 00000002
[0004]            Num Physical Components : 00000003

[0001]                        Power State : 00
[0001]                          InfoIndex : 00

[0001]                        Power State : 00
[0001]                          InfoIndex : 00

[0002]                       Component Id : 0000
[0002]                       Component Id : 0001
[0002]                       Component Id : 0002

[0001]              Flags (decoded below) : 00
                             Node Enabled : 0
                            Power Managed : 0
                         Hot Plug Capable : 0
[0001]                           Reserved : 00
[0002]                            Node ID : 0000
[0004]                             Length : 00000000
[0008]                      Range Address : 0000000000000000
[0008]                       Range Length : 0000000000000000
[0004]                   Num Power States : 00000001
[0004]            Num Physical Components : 00000001

[0001]                        Power State : 00
[0001]                          InfoIndex : 00

[0002]                       Component Id : 0000

[0002]              Characteristics Count : 0002
[0002]                           Reserved : 0000

[0001]                       Structure ID : 01
[0001]              Flags (decoded below) : 00
                         Memory Preserved : 0
                               Auto Entry : 0
                                Auto Exit : 0
[0002]                           Reserved : 0000
[0004]                      Average Power : 00000000
[0004]                       Power Saving : 00000000
[0008]                       Exit Latency : 0000000000000000
[0008]                           Reserved : 0000000000000000

[0001]                       Structure ID : 01
[0001]              Flags (decoded below) : 00
                         Memory Preserved : 0
                               Auto Entry : 0
                                Auto Exit : 0
[0002]                           Reserved : 0000
[0004]                      Average Power : 00000000
[0004]                       Power Saving : 00000000
[0008]                       Exit Latency : 0000000000000000
[0008]                           Reserved : 0000000000000000
