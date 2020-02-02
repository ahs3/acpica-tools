/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [SRAT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "SRAT"    [System Resource Affinity Table]
[0004]                       Table Length : 000000BE
[0001]                           Revision : 03
[0001]                           Checksum : E6
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20180629

[0004]                     Table Revision : 00000001
[0008]                           Reserved : 0000000000000000

[0001]                      Subtable Type : 00 [Processor Local APIC/SAPIC Affinity]
[0001]                             Length : 10

[0001]            Proximity Domain Low(8) : 00
[0001]                            Apic ID : 00
[0004]              Flags (decoded below) : 00000001
                                  Enabled : 1
[0001]                    Local Sapic EID : 00
[0003]          Proximity Domain High(24) : 000000
[0004]                       Clock Domain : 00000000

[0001]                      Subtable Type : 01 [Memory Affinity]
[0001]                             Length : 28

[0004]                   Proximity Domain : 00000000
[0002]                          Reserved1 : 0000
[0008]                       Base Address : 0000000000000000
[0008]                     Address Length : 000000000009FC00
[0004]                          Reserved2 : 00000000
[0004]              Flags (decoded below) : 00000001
                                  Enabled : 1
                            Hot Pluggable : 0
                             Non-Volatile : 0
[0008]                          Reserved3 : 0000000000000000

[0001]                      Subtable Type : 02 [Processor Local x2APIC Affinity]
[0001]                             Length : 18

[0002]                          Reserved1 : 0000
[0004]                   Proximity Domain : 00000000
[0004]                            Apic ID : 00000000
[0004]              Flags (decoded below) : 00000001
                                  Enabled : 1
[0004]                       Clock Domain : 00000000
[0004]                          Reserved2 : 00000000

[0001]                      Subtable Type : 03 [GICC Affinity]
[0001]                             Length : 12

[0004]                   Proximity Domain : 00000000
[0004]                 Acpi Processor UID : 00000000
[0004]              Flags (decoded below) : 00000001
                                  Enabled : 1
[0004]                       Clock Domain : 00000000

[0001]                      Subtable Type : 04 [GIC ITS Affinity]
[0001]                             Length : 0C

[0004]                   Proximity Domain : 00000000
[0002]                           Reserved : 0000
[0004]                             ITS ID : 00000001

[0001]                      Subtable Type : 05 [Generic Initiator Affinity]
[0001]                             Length : 20

[0001]                          Reserved1 : 00
[0001]                 Device Handle Type : 00
[0004]                   Proximity Domain : 00000000
[0016]                      Device Handle : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[0004]              Flags (decoded below) : 00000000
                                  Enabled : 0
[0004]                          Reserved2 : 00000000
