/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of hest.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [HEST]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "HEST"    [Hardware Error Source Table]
[004h 0004   4]                 Table Length : 0000027C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 91
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]           Error Source Count : 00000004

[028h 0040   2]                Subtable Type : 0000 [IA-32 Machine Check Exception]
[02Ah 0042   2]                    Source Id : 0000
[02Ch 0044   2]                    Reserved1 : 0000
[02Eh 0046   1]        Flags (decoded below) : 00
                              Firmware First : 0
                                 GHES Assist : 0
[02Fh 0047   1]                      Enabled : 01
[030h 0048   4]       Records To Preallocate : 00000001
[034h 0052   4]      Max Sections Per Record : 00000001
[038h 0056   8]       Global Capability Data : 0000000000000000
[040h 0064   8]          Global Control Data : 0000000000000000
[048h 0072   1]           Num Hardware Banks : 02
[049h 0073   7]                    Reserved2 : 00000000000000

[050h 0080   1]                  Bank Number : 00
[051h 0081   1]         Clear Status On Init : 00
[052h 0082   1]                Status Format : 00
[053h 0083   1]                     Reserved : 00
[054h 0084   4]             Control Register : 00000000
[058h 0088   8]                 Control Data : 0000000000000000
[060h 0096   4]              Status Register : 00000000
[064h 0100   4]             Address Register : 00000000
[068h 0104   4]                Misc Register : 00000000

[06Ch 0108   1]                  Bank Number : 01
[06Dh 0109   1]         Clear Status On Init : 00
[06Eh 0110   1]                Status Format : 00
[06Fh 0111   1]                     Reserved : 00
[070h 0112   4]             Control Register : 00000000
[074h 0116   8]                 Control Data : 0000000000000000
[07Ch 0124   4]              Status Register : 00000000
[080h 0128   4]             Address Register : 00000000
[084h 0132   4]                Misc Register : 00000000

[088h 0136   2]                Subtable Type : 0001 [IA-32 Corrected Machine Check]
[08Ah 0138   2]                    Source Id : 0001
[08Ch 0140   2]                    Reserved1 : 0000
[08Eh 0142   1]        Flags (decoded below) : 00
                              Firmware First : 0
                                 GHES Assist : 0
[08Fh 0143   1]                      Enabled : 01
[090h 0144   4]       Records To Preallocate : 00000001
[094h 0148   4]      Max Sections Per Record : 00000001

[098h 0152  28]                       Notify : [Hardware Error Notification Structure]
[098h 0152   1]                  Notify Type : 00 [Polled]
[099h 0153   1]                Notify Length : 1C
[09Ah 0154   2]   Configuration Write Enable : 0000
[09Ch 0156   4]                 PollInterval : 00000000
[0A0h 0160   4]                       Vector : 00000000
[0A4h 0164   4]      Polling Threshold Value : 00000000
[0A8h 0168   4]     Polling Threshold Window : 00000000
[0ACh 0172   4]        Error Threshold Value : 00000000
[0B0h 0176   4]       Error Threshold Window : 00000000

[0B4h 0180   1]           Num Hardware Banks : 02
[0B5h 0181   3]                    Reserved2 : 000000

[0B8h 0184   1]                  Bank Number : 00
[0B9h 0185   1]         Clear Status On Init : 00
[0BAh 0186   1]                Status Format : 00
[0BBh 0187   1]                     Reserved : 00
[0BCh 0188   4]             Control Register : 00000000
[0C0h 0192   8]                 Control Data : 0000000000000000
[0C8h 0200   4]              Status Register : 00000000
[0CCh 0204   4]             Address Register : 00000000
[0D0h 0208   4]                Misc Register : 00000000

[0D4h 0212   1]                  Bank Number : 01
[0D5h 0213   1]         Clear Status On Init : 00
[0D6h 0214   1]                Status Format : 00
[0D7h 0215   1]                     Reserved : 00
[0D8h 0216   4]             Control Register : 00000000
[0DCh 0220   8]                 Control Data : 0000000000000000
[0E4h 0228   4]              Status Register : 00000000
[0E8h 0232   4]             Address Register : 00000000
[0ECh 0236   4]                Misc Register : 00000000

[0F0h 0240   2]                Subtable Type : 0007 [PCI Express AER (AER Endpoint)]
[0F2h 0242   2]                    Source Id : 0000
[0F4h 0244   2]                     Reserved : 0000
[0F6h 0246   1]        Flags (decoded below) : 00
                              Firmware First : 0
                                      Global : 0
[0F7h 0247   1]                      Enabled : 01
[0F8h 0248   4]       Records To Preallocate : 00000001
[0FCh 0252   4]      Max Sections Per Record : 00000001
[100h 0256   4]                          Bus : 00000000
[104h 0260   2]                       Device : 0000
[106h 0262   2]                     Function : 0000
[108h 0264   2]                DeviceControl : 0000
[10Ah 0266   2]                     Reserved : 0000
[10Ch 0268   4]           Uncorrectable Mask : 00000000
[110h 0272   4]       Uncorrectable Severity : 00000000
[114h 0276   4]             Correctable Mask : 00000000
[118h 0280   4]        Advanced Capabilities : 00000000

[11Ch 0284   2]                Subtable Type : 0008 [PCI Express/PCI-X Bridge AER]
[11Eh 0286   2]                    Source Id : 0000
[120h 0288   2]                     Reserved : 0000
[122h 0290   1]        Flags (decoded below) : 00
                              Firmware First : 0
                                      Global : 0
[123h 0291   1]                      Enabled : 01
[124h 0292   4]       Records To Preallocate : 00000001
[128h 0296   4]      Max Sections Per Record : 00000001
[12Ch 0300   4]                          Bus : 00000000
[130h 0304   2]                       Device : 0000
[132h 0306   2]                     Function : 0000
[134h 0308   2]                DeviceControl : 0000
[136h 0310   2]                     Reserved : 0000
[138h 0312   4]           Uncorrectable Mask : 00000000
[13Ch 0316   4]       Uncorrectable Severity : 00000000
[140h 0320   4]             Correctable Mask : 00000000
[144h 0324   4]        Advanced Capabilities : 00000000
[148h 0328   4]       2nd Uncorrectable Mask : 00000000
[14Ch 0332   4]   2nd Uncorrectable Severity : 00000000
[150h 0336   4]    2nd Advanced Capabilities : 00000000

[154h 0340   2]                Subtable Type : 0009 [Generic Hardware Error Source]
[156h 0342   2]                    Source Id : 0002
[158h 0344   2]            Related Source Id : FFFF
[15Ah 0346   1]                     Reserved : 00
[15Bh 0347   1]                      Enabled : 01
[15Ch 0348   4]       Records To Preallocate : 00000001
[160h 0352   4]      Max Sections Per Record : 00000001
[164h 0356   4]          Max Raw Data Length : 00001000

[168h 0360  12]         Error Status Address : [Generic Address Structure]
[168h 0360   1]                     Space ID : 00 [SystemMemory]
[169h 0361   1]                    Bit Width : 40
[16Ah 0362   1]                   Bit Offset : 00
[16Bh 0363   1]         Encoded Access Width : 04 [QWord Access:64]
[16Ch 0364   8]                      Address : 0000000000000000

[174h 0372  28]                       Notify : [Hardware Error Notification Structure]
[174h 0372   1]                  Notify Type : 03 [SCI]
[175h 0373   1]                Notify Length : 1C
[176h 0374   2]   Configuration Write Enable : 0000
[178h 0376   4]                 PollInterval : 00000000
[17Ch 0380   4]                       Vector : 00000000
[180h 0384   4]      Polling Threshold Value : 00000000
[184h 0388   4]     Polling Threshold Window : 00000000
[188h 0392   4]        Error Threshold Value : 00000000
[18Ch 0396   4]       Error Threshold Window : 00000000

[190h 0400   4]    Error Status Block Length : 00001000

[194h 0404   2]                Subtable Type : 0009 [Generic Hardware Error Source]
[196h 0406   2]                    Source Id : 0003
[198h 0408   2]            Related Source Id : 0000
[19Ah 0410   1]                     Reserved : 00
[19Bh 0411   1]                      Enabled : 01
[19Ch 0412   4]       Records To Preallocate : 00000001
[1A0h 0416   4]      Max Sections Per Record : 00000001
[1A4h 0420   4]          Max Raw Data Length : 00001000

[1A8h 0424  12]         Error Status Address : [Generic Address Structure]
[1A8h 0424   1]                     Space ID : 00 [SystemMemory]
[1A9h 0425   1]                    Bit Width : 40
[1AAh 0426   1]                   Bit Offset : 00
[1ABh 0427   1]         Encoded Access Width : 04 [QWord Access:64]
[1ACh 0428   8]                      Address : 0000000000000000

[1B4h 0436  28]                       Notify : [Hardware Error Notification Structure]
[1B4h 0436   1]                  Notify Type : 04 [NMI]
[1B5h 0437   1]                Notify Length : 1C
[1B6h 0438   2]   Configuration Write Enable : 0000
[1B8h 0440   4]                 PollInterval : 00000000
[1BCh 0444   4]                       Vector : 00000000
[1C0h 0448   4]      Polling Threshold Value : 00000000
[1C4h 0452   4]     Polling Threshold Window : 00000000
[1C8h 0456   4]        Error Threshold Value : 00000000
[1CCh 0460   4]       Error Threshold Window : 00000000

[1D0h 0464   4]    Error Status Block Length : 00001000

[1D4h 0468   2]                Subtable Type : 000A [Generic Hardware Error Source V2]
[1D6h 0470   2]                    Source Id : 0003
[1D8h 0472   2]            Related Source Id : 0000
[1DAh 0474   1]                     Reserved : 00
[1DBh 0475   1]                      Enabled : 01
[1DCh 0476   4]       Records To Preallocate : 00000001
[1E0h 0480   4]      Max Sections Per Record : 00000001
[1E4h 0484   4]          Max Raw Data Length : 00001000

[1E8h 0488  12]         Error Status Address : [Generic Address Structure]
[1E8h 0488   1]                     Space ID : 00 [SystemMemory]
[1E9h 0489   1]                    Bit Width : 40
[1EAh 0490   1]                   Bit Offset : 00
[1EBh 0491   1]         Encoded Access Width : 04 [QWord Access:64]
[1ECh 0492   8]                      Address : 0000000000000000

[1F4h 0500  28]                       Notify : [Hardware Error Notification Structure]
[1F4h 0500   1]                  Notify Type : 04 [NMI]
[1F5h 0501   1]                Notify Length : 1C
[1F6h 0502   2]   Configuration Write Enable : 0000
[1F8h 0504   4]                 PollInterval : 00000000
[1FCh 0508   4]                       Vector : 00000000
[200h 0512   4]      Polling Threshold Value : 00000000
[204h 0516   4]     Polling Threshold Window : 00000000
[208h 0520   4]        Error Threshold Value : 00000000
[20Ch 0524   4]       Error Threshold Window : 00000000

[210h 0528   4]    Error Status Block Length : 00001000
[214h 0532  12]            Read Ack Register : [Generic Address Structure]
[214h 0532   1]                     Space ID : 00 [SystemMemory]
[215h 0533   1]                    Bit Width : 40
[216h 0534   1]                   Bit Offset : 00
[217h 0535   1]         Encoded Access Width : 04 [QWord Access:64]
[218h 0536   8]                      Address : 0000000000000000

[220h 0544   8]            Read Ack Preserve : 0000000000000000
[228h 0552   8]               Read Ack Write : 0000000000000000

[230h 0560   2]                Subtable Type : 000B [IA-32 Deferred Machine Check]
[232h 0562   2]                    Source Id : 0001
[234h 0564   2]                    Reserved1 : 0000
[236h 0566   1]        Flags (decoded below) : 00
                              Firmware First : 0
                                 GHES Assist : 0
[237h 0567   1]                      Enabled : 01
[238h 0568   4]       Records To Preallocate : 00000001
[23Ch 0572   4]      Max Sections Per Record : 00000001

[240h 0576  28]                       Notify : [Hardware Error Notification Structure]
[240h 0576   1]                  Notify Type : 00 [Polled]
[241h 0577   1]                Notify Length : 1C
[242h 0578   2]   Configuration Write Enable : 0000
[244h 0580   4]                 PollInterval : 00000000
[248h 0584   4]                       Vector : 00000000
[24Ch 0588   4]      Polling Threshold Value : 00000000
[250h 0592   4]     Polling Threshold Window : 00000000
[254h 0596   4]        Error Threshold Value : 00000000
[258h 0600   4]       Error Threshold Window : 00000000

[25Ch 0604   1]           Num Hardware Banks : 01
[25Dh 0605   3]                    Reserved2 : 000000

[260h 0608   1]                  Bank Number : 00
[261h 0609   1]         Clear Status On Init : 00
[262h 0610   1]                Status Format : 00
[263h 0611   1]                     Reserved : 00
[264h 0612   4]             Control Register : 00000000
[268h 0616   8]                 Control Data : 0000000000000000
[270h 0624   4]              Status Register : 00000000
[274h 0628   4]             Address Register : 00000000
[278h 0632   4]                Misc Register : 00000000

Raw Table Data: Length 636 (0x27C)

    0000: 48 45 53 54 7C 02 00 00 01 91 49 4E 54 45 4C 20  // HEST|.....INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 04 00 00 00 00 00 00 00 00 00 00 01  // ... ............
    0030: 01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  // ................
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
    0070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 00 00 00 00 00 00 00 00 01 00 01 00 00 00 00 01  // ................
    0090: 01 00 00 00 01 00 00 00 00 1C 00 00 00 00 00 00  // ................
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00B0: 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00D0: 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 07 00 00 00 00 00 00 01 01 00 00 00 01 00 00 00  // ................
    0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00  // ................
    0120: 00 00 00 01 01 00 00 00 01 00 00 00 00 00 00 00  // ................
    0130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0150: 00 00 00 00 09 00 02 00 FF FF 00 01 01 00 00 00  // ................
    0160: 01 00 00 00 00 10 00 00 00 40 00 04 00 00 00 00  // .........@......
    0170: 00 00 00 00 03 1C 00 00 00 00 00 00 00 00 00 00  // ................
    0180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0190: 00 10 00 00 09 00 03 00 00 00 00 01 01 00 00 00  // ................
    01A0: 01 00 00 00 00 10 00 00 00 40 00 04 00 00 00 00  // .........@......
    01B0: 00 00 00 00 04 1C 00 00 00 00 00 00 00 00 00 00  // ................
    01C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    01D0: 00 10 00 00 0A 00 03 00 00 00 00 01 01 00 00 00  // ................
    01E0: 01 00 00 00 00 10 00 00 00 40 00 04 00 00 00 00  // .........@......
    01F0: 00 00 00 00 04 1C 00 00 00 00 00 00 00 00 00 00  // ................
    0200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0210: 00 10 00 00 00 40 00 04 00 00 00 00 00 00 00 00  // .....@..........
    0220: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0230: 0B 00 01 00 00 00 00 01 01 00 00 00 01 00 00 00  // ................
    0240: 00 1C 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0250: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00  // ................
    0260: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0270: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
