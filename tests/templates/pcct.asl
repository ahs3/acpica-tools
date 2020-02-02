/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [PCCT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "PCCT"    [Platform Communications Channel Table]
[0004]                       Table Length : 0000024E
[0001]                           Revision : 01
[0001]                           Checksum : 47
[0006]                             Oem ID : "INTEL "
[0008]                       Oem Table ID : "Template"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20170303

[0004]              Flags (decoded below) : 00000001
                                 Platform : 1
[0008]                           Reserved : 0000000000000000

[0001]                      Subtable Type : 00 [Generic Communications Subspace]
[0001]                             Length : 3E

[0006]                           Reserved : 000000000000
[0008]                       Base Address : 1111111111111111
[0008]                     Address Length : 2222222222222222

[0012]                  Doorbell Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                      Preserve Mask : 4444444444444444
[0008]                         Write Mask : 5555555555555555
[0004]                    Command Latency : 66666666
[0004]                Maximum Access Rate : 77777777
[0002]            Minimum Turnaround Time : 8888

[0001]                      Subtable Type : 01 [HW-Reduced Comm Subspace]
[0001]                             Length : 3E

[0004]                 Platform Interrupt : 00000001
[0001]              Flags (Decoded Below) : 01
                                 Polarity : 1
                                     Mode : 0
[0001]                           Reserved : 00
[0008]                       Base Address : 0000000000000000
[0008]                     Address Length : 0000000000000000

[0012]                  Doorbell Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 4444444444444444

[0008]                      Preserve Mask : 4444444444444444
[0008]                         Write Mask : 5555555555555555
[0004]                    Command Latency : 66666666
[0004]                Maximum Access Rate : 77777777
[0002]            Minimum Turnaround Time : 8888

[0001]                      Subtable Type : 02 [HW-Reduced Comm Subspace Type2]
[0001]                             Length : 5A

[0004]                 Platform Interrupt : 00000001
[0001]              Flags (Decoded Below) : 01
                                 Polarity : 1
                                     Mode : 0
[0001]                           Reserved : 00
[0008]                       Base Address : 0000000000000000
[0008]                     Address Length : 0000000000000000

[0012]                  Doorbell Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 4444444444444444

[0008]                      Preserve Mask : 4444444444444444
[0008]                         Write Mask : 5555555555555555
[0004]                    Command Latency : 66666666
[0004]                Maximum Access Rate : 77777777
[0002]            Minimum Turnaround Time : 8888
[0012]              Platform ACK Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                  ACK Preserve Mask : 4444444444444444
[0008]                     ACK Write Mask : 5555555555555555

[0001]                      Subtable Type : 03 [Extended PCC Master Subspace]
[0001]                             Length : A4

[0004]                 Platform Interrupt : 00000001
[0001]              Flags (Decoded Below) : 01
                                 Polarity : 1
                                     Mode : 0
[0001]                           Reserved : 00
[0008]                       Base Address : 0000000000000000
[0004]                     Address Length : 00000000

[0012]                  Doorbell Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                      Preserve Mask : 4444444444444444
[0008]                         Write Mask : 5555555555555555
[0004]                    Command Latency : 66666666
[0004]                Maximum Access Rate : 77777777
[0004]            Minimum Turnaround Time : 88888888
[0012]              Platform ACK Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                  ACK Preserve Mask : 9999999999999999
[0008]                       ACK Set Mask : 0000000000000000
[0008]                           Reserved : 0000000000000000
[0012]          Command Complete Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]        Command Complete Check Mask : 2222222222222222
[0012]            Command Update Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]       Command Update Preserve Mask : 3333333333333333
[0008]            Command Update Set Mask : 4444444444444444
[0012]              Error Status Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                  Error Status Mask : 5555555555555555

[0001]                      Subtable Type : 04 [Extended PCC Slave Subspace]
[0001]                             Length : A4

[0004]                 Platform Interrupt : 00000001
[0001]              Flags (Decoded Below) : 01
                                 Polarity : 1
                                     Mode : 0
[0001]                           Reserved : 00
[0008]                       Base Address : 0000000000000000
[0004]                     Address Length : 00000000

[0012]                  Doorbell Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                      Preserve Mask : 4444444444444444
[0008]                         Write Mask : 5555555555555555
[0004]                    Command Latency : 66666666
[0004]                Maximum Access Rate : 77777777
[0004]            Minimum Turnaround Time : 88888888
[0012]              Platform ACK Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                  ACK Preserve Mask : 9999999999999999
[0008]                       ACK Set Mask : 0000000000000000
[0008]                           Reserved : 0000000000000000
[0012]          Command Complete Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]        Command Complete Check Mask : 2222222222222222
[0012]            Command Update Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]       Command Update Preserve Mask : 3333333333333333
[0008]            Command Update Set Mask : 4444444444444444
[0012]              Error Status Register : [Generic Address Structure]
[0001]                           Space ID : 01 [SystemIO]
[0001]                          Bit Width : 32
[0001]                         Bit Offset : 00
[0001]               Encoded Access Width : 03 [DWord Access:32]
[0008]                            Address : 3333333333333333

[0008]                  Error Status Mask : 5555555555555555
