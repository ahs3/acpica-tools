/*
 * Intel ACPI Component Architecture
 * iASL Compiler/Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 *
 * Template for [GTDT] ACPI Table (static data table)
 * Format: [ByteLength]  FieldName : HexFieldValue
 */
[0004]                          Signature : "GTDT"    [Generic Timer Description Table]
[0004]                       Table Length : 000000E8
[0001]                           Revision : 03
[0001]                           Checksum : 5D
[0006]                             Oem ID : "LINARO"
[0008]                       Oem Table ID : "RTSMVEV8"
[0004]                       Oem Revision : 00000001
[0004]                    Asl Compiler ID : "INTL"
[0004]              Asl Compiler Revision : 20190108

[0008]              Counter Block Address : 0000000000000000
[0004]                           Reserved : 00000000

[0004]               Secure EL1 Interrupt : 0000001D
[0004]          EL1 Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
                                Always On : 0

[0004]           Non-Secure EL1 Interrupt : 0000001E
[0004]         NEL1 Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
                                Always On : 0

[0004]            Virtual Timer Interrupt : 0000001B
[0004]           VT Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
                                Always On : 0

[0004]           Non-Secure EL2 Interrupt : 0000001A
[0004]         NEL2 Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
                                Always On : 0
[0008]         Counter Read Block Address : 0000000000000000

[0004]               Platform Timer Count : 00000002
[0004]              Platform Timer Offset : 00000060
[0004]             Virtual EL2 Timer GSIV : 00000043
[0004]            Virtual EL2 Timer Flags : 00000021

[0001]                      Subtable Type : 00 [Generic Timer Block]
[0002]                             Length : 0064
[0001]                           Reserved : 00
[0008]                      Block Address : 0000000000000000
[0004]                        Timer Count : 00000002
[0004]                       Timer Offset : 00000014

[0001]                       Frame Number : 00
[0003]                           Reserved : 000000
[0008]                       Base Address : 0000000000000000
[0008]                   EL0 Base Address : 0000000000000000
[0004]                    Timer Interrupt : 00000000
[0004]        Timer Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
[0004]            Virtual Timer Interrupt : 00000000
[0004] Virtual Timer Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
[0004]       Common Flags (decoded below) : 00000000
                                   Secure : 0
                                Always On : 0

[0001]                       Frame Number : 01
[0003]                           Reserved : 000000
[0008]                       Base Address : 0000000000000000
[0008]                   EL0 Base Address : 0000000000000000
[0004]                    Timer Interrupt : 00000000
[0004]        Timer Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
[0004]            Virtual Timer Interrupt : 00000000
[0004] Virtual Timer Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
[0004]       Common Flags (decoded below) : 00000000
                                   Secure : 0
                                Always On : 0

[0001]                      Subtable Type : 01 [Generic Watchdog Timer]
[0002]                             Length : 001C
[0001]                           Reserved : 00
[0008]              Refresh Frame Address : 0000000000000000
[0008]              Control Frame Address : 0000000000000000
[0004]                    Timer Interrupt : 00000000
[0004]        Timer Flags (decoded below) : 00000001
                             Trigger Mode : 1
                                 Polarity : 0
                                 Security : 0
