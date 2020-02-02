/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [HMAT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "HMAT"    [Heterogeneous Memory Attributes Table]
[0004]                       Table Length : 0000009C
[0001]                           Revision : 02
[0001]                           Checksum : 4D
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000000
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20190108

[0004]                           Reserved : 00000000

[0002]                     Structure Type : 0000 [Memory Proximity Domain Attributes]
[0002]                           Reserved : 0000
[0004]                             Length : 00000028
[0002]              Flags (decoded below) : 0000
         Processor Proximity Domain Valid : 0
[0002]                          Reserved1 : 0000
[0004]         Processor Proximity Domain : 00000000
[0004]            Memory Proximity Domain : 00000000
[0004]                          Reserved2 : 00000000
[0008]                          Reserved3 : 0000000000000000
[0008]                          Reserved4 : 0000000000000000

[0002]                     Structure Type : 0001 [System Locality Latency and Bandwidth Information]
[0002]                           Reserved : 0000
[0004]                             Length : 0000002A
[0001]              Flags (decoded below) : 00
                         Memory Hierarchy : 0
[0001]                          Data Type : 00
[0002]                          Reserved1 : 0000
[0004]      Initiator Proximity Domains # : 00000001
[0004]         Target Proximity Domains # : 00000001
[0004]                          Reserved2 : 00000000
[0008]                    Entry Base Unit : 0000000000000000
[0004]    Initiator Proximity Domain List : 00000000
[0004]       Target Proximity Domain List : 00000000
[0002]                              Entry : 0000

[0002]                     Structure Type : 0002 [Memory Side Cache Information]
[0002]                           Reserved : 0000
[0004]                             Length : 00000022
[0004]            Memory Proximity Domain : 00000000
[0004]                          Reserved1 : 00000000
[0008]             Memory Side Cache Size : 0000000000000000
[0004]   Cache Attributes (decoded below) : 00000000
                       Total Cache Levels : 0
                              Cache Level : 0
                      Cache Associativity : 0
                             Write Policy : 0
                          Cache Line Size : 0000
[0002]                          Reserved2 : 0000
[0002]                    SMBIOS Handle # : 0001
[0002]                      SMBIOS Handle : 0000
