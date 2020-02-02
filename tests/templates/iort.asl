/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [IORT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "IORT"    [IO Remapping Table]
[0004]                       Table Length : 000001F8
[0001]                           Revision : 00
[0001]                           Checksum : 72
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000000
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20180313

[0004]                         Node Count : 00000006
[0004]                        Node Offset : 00000034
[0004]                           Reserved : 00000000
[0004]                   Optional Padding : 00 00 00 00

[0001]                               Type : 00
[0002]                             Length : 0018
[0001]                           Revision : 00
[0004]                           Reserved : 00000000
[0004]                      Mapping Count : 00000000
[0004]                     Mapping Offset : 00000000

[0004]                           ItsCount : 00000001
[0004]                        Identifiers : 00000000

[0001]                               Type : 01
[0002]                             Length : 0080
[0001]                           Revision : 00
[0004]                           Reserved : 00000000
[0004]                      Mapping Count : 00000001
[0004]                     Mapping Offset : 0000006C

[0004]                         Node Flags : 00000000
[0008]                  Memory Properties : [IORT Memory Access Properties]
[0004]                    Cache Coherency : 00000000
[0001]              Hints (decoded below) : 00
                                Transient : 0
                           Write Allocate : 0
                            Read Allocate : 0
                                 Override : 0
[0002]                           Reserved : 0000
[0001]       Memory Flags (decoded below) : 00
                                Coherency : 0
                         Device Attribute : 0
[0001]                  Memory Size Limit : 00
[0015]                        Device Name : "\_SB.PCI0.DEV0"
[0084]                            Padding : \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 \
    00 00 00 00

[0004]                         Input base : 00000000
[0004]                           ID Count : 00000000
[0004]                        Output Base : 00000000
[0004]                   Output Reference : 00000000
[0004]              Flags (decoded below) : 00000000
                           Single Mapping : 0

[0001]                               Type : 02
[0002]                             Length : 0038
[0001]                           Revision : 00
[0004]                           Reserved : 00000000
[0004]                      Mapping Count : 00000001
[0004]                     Mapping Offset : 00000024

[0008]                  Memory Properties : [IORT Memory Access Properties]
[0004]                    Cache Coherency : 00000000
[0001]              Hints (decoded below) : 00
                                Transient : 0
                           Write Allocate : 0
                            Read Allocate : 0
                                 Override : 0
[0002]                           Reserved : 0000
[0001]       Memory Flags (decoded below) : 00
                                Coherency : 0
                         Device Attribute : 0
[0004]                      ATS Attribute : 00000000
[0004]                 PCI Segment Number : 00000000
[0001]                  Memory Size Limit : 00
[0003]                           Reserved : 000000

[0004]                         Input base : 00000000
[0004]                           ID Count : 00000000
[0004]                        Output Base : 00000000
[0004]                   Output Reference : 00000000
[0004]              Flags (decoded below) : 00000000
                           Single Mapping : 0

[0001]                               Type : 03
[0002]                             Length : 0060
[0001]                           Revision : 01
[0004]                           Reserved : 00000000
[0004]                      Mapping Count : 00000001
[0004]                     Mapping Offset : 0000004C

[0008]                       Base Address : 0000000000000000
[0008]                               Span : 0000000000000000
[0004]                              Model : 00000000
[0004]              Flags (decoded below) : 00000000
                            DVM Supported : 0
                            Coherent Walk : 0
[0004]            Global Interrupt Offset : 0000003C
[0004]            Context Interrupt Count : 00000000
[0004]           Context Interrupt Offset : 0000004C
[0004]                PMU Interrupt Count : 00000000
[0004]               PMU Interrupt Offset : 0000004C

[0004]                            NSgIrpt : 00000000
[0004]      NSgIrpt Flags (decoded below) : 00000000
                           Edge Triggered : 0
[0004]                         NSgCfgIrpt : 00000000
[0004]   NSgCfgIrpt Flags (decoded below) : 00000000
                           Edge Triggered : 0

[0004]                         Input base : 00000000
[0004]                           ID Count : 00000000
[0004]                        Output Base : 00000000
[0004]                   Output Reference : 00000000
[0004]              Flags (decoded below) : 00000000
                           Single Mapping : 0

[0001]                               Type : 04
[0002]                             Length : 0058
[0001]                           Revision : 01
[0004]                           Reserved : 00000000
[0004]                      Mapping Count : 00000001
[0004]                     Mapping Offset : 00000044

[0008]                       Base Address : 0000000000000000
[0004]              Flags (decoded below) : 00000000
                          COHACC Override : 0
                            HTTU Override : 0
                   Proximity Domain Valid : 0
[0004]                           Reserved : 00000000
[0008]                      VATOS Address : 0000000000000000
[0004]                              Model : 00000000
[0004]                         Event GSIV : 00000000
[0004]                           PRI GSIV : 00000000
[0004]                          GERR GSIV : 00000000
[0004]                          Sync GSIV : 00000000
[0004]                   Proximity Domain : 00000000
[0004]            Device ID Mapping Index : 00000000

[0004]                         Input base : 00000000
[0004]                           ID Count : 00000000
[0004]                        Output Base : 00000000
[0004]                   Output Reference : 00000000
[0004]              Flags (decoded below) : 00000000
                           Single Mapping : 0

[0001]                               Type : 05
[0002]                             Length : 003C
[0001]                           Revision : 01
[0004]                           Reserved : 00000000
[0004]                      Mapping Count : 00000001
[0004]                     Mapping Offset : 00000028

[0008]                Page 0 Base Address : 0000000000000000
[0004]            Overflow Interrupt GSIV : 00000000
[0004]                     Node Reference : 00000000
[0008]                Page 1 Base Address : 0000000000000000

[0004]                         Input base : 00000000
[0004]                           ID Count : 00000000
[0004]                        Output Base : 00000000
[0004]                   Output Reference : 00000000
[0004]              Flags (decoded below) : 00000001
                           Single Mapping : 1
