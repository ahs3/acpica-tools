/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of asf!.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [ASF!]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "ASF!"    [Alert Standard Format table]
[004h 0004   4]                 Table Length : 00000072
[008h 0008   1]                     Revision : 10
[009h 0009   1]                     Checksum : 25
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "TEMPLATE"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   1]                Subtable Type : 00 [ASF Information]
[025h 0037   1]                     Reserved : 00
[026h 0038   2]                       Length : 0010
[028h 0040   1]          Minimum Reset Value : 00
[029h 0041   1]     Minimum Polling Interval : 00
[02Ah 0042   2]                    System ID : 0000
[02Ch 0044   4]              Manufacturer ID : 00000000
[030h 0048   1]                        Flags : 00
[031h 0049   3]                     Reserved : 000000

[034h 0052   1]                Subtable Type : 01 [ASF Alerts]
[035h 0053   1]                     Reserved : 00
[036h 0054   2]                       Length : 0014
[038h 0056   1]                   AssertMask : 00
[039h 0057   1]                 DeassertMask : 00
[03Ah 0058   1]                  Alert Count : 01
[03Bh 0059   1]            Alert Data Length : 0C

[03Ch 0060   1]                      Address : 00
[03Dh 0061   1]                      Command : 00
[03Eh 0062   1]                         Mask : 00
[03Fh 0063   1]                        Value : 00
[040h 0064   1]                   SensorType : 00
[041h 0065   1]                         Type : 00
[042h 0066   1]                       Offset : 00
[043h 0067   1]                   SourceType : 00
[044h 0068   1]                     Severity : 00
[045h 0069   1]                 SensorNumber : 00
[046h 0070   1]                       Entity : 00
[047h 0071   1]                     Instance : 00

[048h 0072   1]                Subtable Type : 02 [ASF Remote Control]
[049h 0073   1]                     Reserved : 00
[04Ah 0074   2]                       Length : 000C
[04Ch 0076   1]                Control Count : 01
[04Dh 0077   1]          Control Data Length : 04
[04Eh 0078   2]                     Reserved : 0000

[050h 0080   1]                     Function : 00
[051h 0081   1]                      Address : 00
[052h 0082   1]                      Command : 00
[053h 0083   1]                        Value : 00

[054h 0084   1]                Subtable Type : 03 [ASF RMCP Boot Options]
[055h 0085   1]                     Reserved : 00
[056h 0086   2]                       Length : 0017
[058h 0088   7]                 Capabilities : 00 00 00 00 00 00 00
[05Fh 0095   1]              Completion Code : 00
[060h 0096   4]                Enterprise ID : 00000000
[064h 0100   1]                      Command : 00
[065h 0101   2]                    Parameter : 0000
[067h 0103   2]                 Boot Options : 0000
[069h 0105   2]               Oem Parameters : 0000

[06Bh 0107   1]                Subtable Type : 84 [ASF Address]
[06Ch 0108   1]                     Reserved : 00
[06Dh 0109   2]                       Length : 0007
[06Fh 0111   1]                Eprom Address : 00
[070h 0112   1]                 Device Count : 01
[071h 0113   1]                    Addresses : 00 


Raw Table Data: Length 114 (0x72)

    0000: 41 53 46 21 72 00 00 00 10 25 49 4E 54 45 4C 20  // ASF!r....%INTEL 
    0010: 54 45 4D 50 4C 41 54 45 01 00 00 00 49 4E 54 4C  // TEMPLATE....INTL
    0020: 03 07 19 20 00 00 10 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 00 00 00 01 00 14 00 00 00 01 0C 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 02 00 0C 00 01 04 00 00  // ................
    0050: 00 00 00 00 03 00 17 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 00 84 00 07 00 00  // ................
    0070: 01 00                                            // ..
