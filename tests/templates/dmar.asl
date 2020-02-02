/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [DMAR] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "DMAR"    [DMA Remapping table]
[0004]                       Table Length : 0000008C
[0001]                           Revision : 01
[0001]                           Checksum : 03
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "TEMPLATE"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20130517

[0001]                 Host Address Width : 2F
[0001]                              Flags : 01
[0010]                           Reserved : 00 00 00 00 00 00 00 00 00 00

[0002]                      Subtable Type : 0000 [Hardware Unit Definition]
[0002]                             Length : 0018

[0001]                              Flags : 01
[0001]                           Reserved : 00
[0002]                 PCI Segment Number : 0000
[0008]              Register Base Address : 0000000000000000

[0001]                  Device Scope Type : 03 [IOAPIC Device]
[0001]                       Entry Length : 08
[0002]                           Reserved : 0000
[0001]                     Enumeration ID : 08
[0001]                     PCI Bus Number : 00

[0002]                           PCI Path : 00,01


[0002]                      Subtable Type : 0001 [Reserved Memory Region]
[0002]                             Length : 0020

[0002]                           Reserved : 0000
[0002]                 PCI Segment Number : 0000
[0008]                       Base Address : 0000000000000000
[0008]                End Address (limit) : 0000000000000FFF

[0001]                  Device Scope Type : 01 [PCI Endpoint Device]
[0001]                       Entry Length : 08
[0002]                           Reserved : 0000
[0001]                     Enumeration ID : 00
[0001]                     PCI Bus Number : 00

[0002]                           PCI Path : 00,02


[0002]                      Subtable Type : 0002 [Root Port ATS Capability]
[0002]                             Length : 0010

[0001]                              Flags : 00
[0001]                           Reserved : 00
[0002]                 PCI Segment Number : 0000

[0001]                  Device Scope Type : 02 [PCI Bridge Device]
[0001]                       Entry Length : 08
[0002]                           Reserved : 0000
[0001]                     Enumeration ID : 00
[0001]                     PCI Bus Number : 00

[0002]                           PCI Path : 00,03


[0002]                      Subtable Type : 0003 [Remapping Hardware Static Affinity]
[0002]                             Length : 0014

[0004]                           Reserved : 00000000
[0008]                       Base Address : 0000000000000000
[0004]                   Proximity Domain : 00000000
