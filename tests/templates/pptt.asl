/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [PPTT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "PPTT"    [Processor Properties Topology Table]
[0004]                       Table Length : 00000072
[0001]                           Revision : 01
[0001]                           Checksum : 86
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20170303


[0001]                      Subtable Type : 00 [Processor Hierarchy Node]
[0001]                             Length : 18
[0002]                           Reserved : 0000
[0004]              Flags (decoded below) : 00000000
                         Physical package : 0
                  ACPI Processor ID valid : 0
                    Processor is a thread : 0
                           Node is a leaf : 0
                 Identical Implementation : 0
[0004]                             Parent : 00000000
[0004]                  ACPI Processor ID : 00000000
[0004]            Private Resource Number : 00000001
[0004]                   Private Resource : 00000000

[0001]                      Subtable Type : 01 [Cache Type]
[0001]                             Length : 18
[0002]                           Reserved : 0000
[0004]              Flags (decoded below) : 00000000
                               Size valid : 0
                     Number of Sets valid : 0
                      Associativity valid : 0
                    Allocation Type valid : 0
                         Cache Type valid : 0
                       Write Policy valid : 0
                          Line Size valid : 0
[0004]                Next Level of Cache : 00000000
[0004]                               Size : 00000000
[0004]                     Number of Sets : 00000000
[0001]                      Associativity : 00
[0001]                         Attributes : 00
                          Allocation Type : 0
                               Cache Type : 0
                             Write Policy : 0
[0002]                          Line Size : 0000

[0001]                      Subtable Type : 02 [ID]
[0001]                             Length : 1E
[0002]                           Reserved : 0000
[0004]                          Vendor ID : 00000000
[0008]                          Level1 ID : 0000000000000000
[0008]                          Level2 ID : 0000000000000000
[0002]                     Major revision : 0000
[0002]                     Minor revision : 0000
[0002]                      Spin revision : 0000
