/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [SDEV] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "SDEV"    [Secure Devices table]
[0004]                       Table Length : 00000072
[0001]                           Revision : 01
[0001]                           Checksum : 2F
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20170831


[0001]                      Subtable Type : 00 [Namespace Device]
[0001]              Flags (decoded below) : 01
             Allow handoff to unsecure OS : 1
[0002]                             Length : 002A

[0002]                   Device ID Offset : 000C
[0002]                   Device ID Length : 0016
[0002]                 Vendor Data Offset : 0022
[0002]                 Vendor Data Length : 0008
[0022]                           Namepath : "\\_SB_.PCI0.USB1.SUB1"
[0008]                        Vendor Data : 00 11 22 33 44 55 66 77

[0001]                      Subtable Type : 01 [PCIe Endpoint Device]
[0001]              Flags (decoded below) : 01
             Allow handoff to unsecure OS : 1
[0002]                             Length : 0024

[0002]                            Segment : 0010
[0002]                          Start Bus : 0020
[0002]                        Path Offset : 0010
[0002]                        Path Length : 0004
[0002]                 Vendor Data Offset : 0014
[0002]                 Vendor Data Length : 0010
[0001]                             Device : 11
[0001]                           Function : 22
[0001]                             Device : 33
[0001]                           Function : 44
[0016]                        Vendor Data : EE DD CC BB AA 55 66 77 88 99 AA BB CC DD EE FF
