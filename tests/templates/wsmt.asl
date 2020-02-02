/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [WSMT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "WSMT"    [Windows SMM Security Migrations Table]
[0004]                       Table Length : 00000028
[0001]                           Revision : 00
[0001]                           Checksum : 08
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000000
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20170119

[0004]                   Protection Flags : 00000005
                       FIXED_COMM_BUFFERS : 1
        COMM_BUFFER_NESTED_PTR_PROTECTION : 0
               SYSTEM_RESOURCE_PROTECTION : 1
