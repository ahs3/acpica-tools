/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [FPDT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "FPDT"    [Firmware Performance Data Table]
[0004]                       Table Length : 00000064
[0001]                           Revision : 01
[0001]                           Checksum : BD
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20110804


[0002]                      Subtable Type : 0000
[0001]                             Length : 30
[0001]                           Revision : 01
[0004]                           Reserved : 00000000
[0008]           FPDT Boot Record Address : 0000000000000000

[0002]                      Subtable Type : 0001
[0001]                             Length : 10
[0001]                           Revision : 01
[0004]                           Reserved : 00000000
[0008]                S3PT Record Address : 0000000000000000
