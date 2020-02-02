/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [PDTT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "PDTT"    [Platform Debug Trigger Table]
[0004]                       Table Length : 00000034
[0001]                           Revision : 01
[0001]                           Checksum : CB
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20170831

[0001]                      Trigger Count : 04
[0003]                           Reserved : 000000
[0004]                       Array Offset : 0000002C

[0001]                      Subchannel Id : AA
[0001]              Flags (Decoded Below) : 03
                          Runtime Trigger : 1
                      Wait for Completion : 1
                            Trigger Order : 0

[0001]                      Subchannel Id : BB
[0001]              Flags (Decoded Below) : 02
                          Runtime Trigger : 0
                      Wait for Completion : 1
                            Trigger Order : 0

[0001]                      Subchannel Id : CC
[0001]              Flags (Decoded Below) : 01
                          Runtime Trigger : 1
                      Wait for Completion : 0
                            Trigger Order : 0

[0001]                      Subchannel Id : DD
[0001]              Flags (Decoded Below) : 00
                          Runtime Trigger : 0
                      Wait for Completion : 0
                            Trigger Order : 0
