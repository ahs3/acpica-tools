/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of pcct.aml, Tue Aug  6 10:34:05 2019
 *
 * ACPI Data Table [PCCT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "PCCT"    [Platform Communications Channel Table]
[004h 0004   4]                 Table Length : 0000024E
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 41
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]        Flags (decoded below) : 00000001
                                    Platform : 1
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 00 [Generic Communications Subspace]
[031h 0049   1]                       Length : 3E

[032h 0050   6]                     Reserved : 000000000000
[038h 0056   8]                 Base Address : 1111111111111111
[040h 0064   8]               Address Length : 2222222222222222

[048h 0072  12]            Doorbell Register : [Generic Address Structure]
[048h 0072   1]                     Space ID : 01 [SystemIO]
[049h 0073   1]                    Bit Width : 32
[04Ah 0074   1]                   Bit Offset : 00
[04Bh 0075   1]         Encoded Access Width : 03 [DWord Access:32]
[04Ch 0076   8]                      Address : 3333333333333333

[054h 0084   8]                Preserve Mask : 4444444444444444
[05Ch 0092   8]                   Write Mask : 5555555555555555
[064h 0100   4]              Command Latency : 66666666
[068h 0104   4]          Maximum Access Rate : 77777777
[06Ch 0108   2]      Minimum Turnaround Time : 8888

[06Eh 0110   1]                Subtable Type : 01 [HW-Reduced Comm Subspace]
[06Fh 0111   1]                       Length : 3E

[070h 0112   4]           Platform Interrupt : 00000001
[074h 0116   1]        Flags (Decoded Below) : 01
                                    Polarity : 1
                                        Mode : 0
[075h 0117   1]                     Reserved : 00
[076h 0118   8]                 Base Address : 0000000000000000
[07Eh 0126   8]               Address Length : 0000000000000000

[086h 0134  12]            Doorbell Register : [Generic Address Structure]
[086h 0134   1]                     Space ID : 01 [SystemIO]
[087h 0135   1]                    Bit Width : 32
[088h 0136   1]                   Bit Offset : 00
[089h 0137   1]         Encoded Access Width : 03 [DWord Access:32]
[08Ah 0138   8]                      Address : 4444444444444444

[092h 0146   8]                Preserve Mask : 4444444444444444
[09Ah 0154   8]                   Write Mask : 5555555555555555
[0A2h 0162   4]              Command Latency : 66666666
[0A6h 0166   4]          Maximum Access Rate : 77777777
[0AAh 0170   2]      Minimum Turnaround Time : 8888

[0ACh 0172   1]                Subtable Type : 02 [HW-Reduced Comm Subspace Type2]
[0ADh 0173   1]                       Length : 5A

[0AEh 0174   4]           Platform Interrupt : 00000001
[0B2h 0178   1]        Flags (Decoded Below) : 01
                                    Polarity : 1
                                        Mode : 0
[0B3h 0179   1]                     Reserved : 00
[0B4h 0180   8]                 Base Address : 0000000000000000
[0BCh 0188   8]               Address Length : 0000000000000000

[0C4h 0196  12]            Doorbell Register : [Generic Address Structure]
[0C4h 0196   1]                     Space ID : 01 [SystemIO]
[0C5h 0197   1]                    Bit Width : 32
[0C6h 0198   1]                   Bit Offset : 00
[0C7h 0199   1]         Encoded Access Width : 03 [DWord Access:32]
[0C8h 0200   8]                      Address : 4444444444444444

[0D0h 0208   8]                Preserve Mask : 4444444444444444
[0D8h 0216   8]                   Write Mask : 5555555555555555
[0E0h 0224   4]              Command Latency : 66666666
[0E4h 0228   4]          Maximum Access Rate : 77777777
[0E8h 0232   2]      Minimum Turnaround Time : 8888
[0EAh 0234  12]        Platform ACK Register : [Generic Address Structure]
[0EAh 0234   1]                     Space ID : 01 [SystemIO]
[0EBh 0235   1]                    Bit Width : 32
[0ECh 0236   1]                   Bit Offset : 00
[0EDh 0237   1]         Encoded Access Width : 03 [DWord Access:32]
[0EEh 0238   8]                      Address : 3333333333333333

[0F6h 0246   8]            ACK Preserve Mask : 4444444444444444
[0FEh 0254   8]               ACK Write Mask : 5555555555555555

[106h 0262   1]                Subtable Type : 03 [Extended PCC Master Subspace]
[107h 0263   1]                       Length : A4

[108h 0264   4]           Platform Interrupt : 00000001
[10Ch 0268   1]        Flags (Decoded Below) : 01
                                    Polarity : 1
                                        Mode : 0
[10Dh 0269   1]                     Reserved : 00
[10Eh 0270   8]                 Base Address : 0000000000000000
[116h 0278   4]               Address Length : 00000000

[11Ah 0282  12]            Doorbell Register : [Generic Address Structure]
[11Ah 0282   1]                     Space ID : 01 [SystemIO]
[11Bh 0283   1]                    Bit Width : 32
[11Ch 0284   1]                   Bit Offset : 00
[11Dh 0285   1]         Encoded Access Width : 03 [DWord Access:32]
[11Eh 0286   8]                      Address : 3333333333333333

[126h 0294   8]                Preserve Mask : 4444444444444444
[12Eh 0302   8]                   Write Mask : 5555555555555555
[136h 0310   4]              Command Latency : 66666666
[13Ah 0314   4]          Maximum Access Rate : 77777777
[13Eh 0318   4]      Minimum Turnaround Time : 88888888
[142h 0322  12]        Platform ACK Register : [Generic Address Structure]
[142h 0322   1]                     Space ID : 01 [SystemIO]
[143h 0323   1]                    Bit Width : 32
[144h 0324   1]                   Bit Offset : 00
[145h 0325   1]         Encoded Access Width : 03 [DWord Access:32]
[146h 0326   8]                      Address : 3333333333333333

[14Eh 0334   8]            ACK Preserve Mask : 9999999999999999
[156h 0342   8]                 ACK Set Mask : 0000000000000000
[15Eh 0350   8]                     Reserved : 0000000000000000
[166h 0358  12]    Command Complete Register : [Generic Address Structure]
[166h 0358   1]                     Space ID : 01 [SystemIO]
[167h 0359   1]                    Bit Width : 32
[168h 0360   1]                   Bit Offset : 00
[169h 0361   1]         Encoded Access Width : 03 [DWord Access:32]
[16Ah 0362   8]                      Address : 3333333333333333

[172h 0370   8]  Command Complete Check Mask : 2222222222222222
[17Ah 0378  12]      Command Update Register : [Generic Address Structure]
[17Ah 0378   1]                     Space ID : 01 [SystemIO]
[17Bh 0379   1]                    Bit Width : 32
[17Ch 0380   1]                   Bit Offset : 00
[17Dh 0381   1]         Encoded Access Width : 03 [DWord Access:32]
[17Eh 0382   8]                      Address : 3333333333333333

[186h 0390   8] Command Update Preserve Mask : 3333333333333333
[18Eh 0398   8]      Command Update Set Mask : 4444444444444444
[196h 0406  12]        Error Status Register : [Generic Address Structure]
[196h 0406   1]                     Space ID : 01 [SystemIO]
[197h 0407   1]                    Bit Width : 32
[198h 0408   1]                   Bit Offset : 00
[199h 0409   1]         Encoded Access Width : 03 [DWord Access:32]
[19Ah 0410   8]                      Address : 3333333333333333

[1A2h 0418   8]            Error Status Mask : 5555555555555555

[1AAh 0426   1]                Subtable Type : 04 [Extended PCC Slave Subspace]
[1ABh 0427   1]                       Length : A4

[1ACh 0428   4]           Platform Interrupt : 00000001
[1B0h 0432   1]        Flags (Decoded Below) : 01
                                    Polarity : 1
                                        Mode : 0
[1B1h 0433   1]                     Reserved : 00
[1B2h 0434   8]                 Base Address : 0000000000000000
[1BAh 0442   4]               Address Length : 00000000

[1BEh 0446  12]            Doorbell Register : [Generic Address Structure]
[1BEh 0446   1]                     Space ID : 01 [SystemIO]
[1BFh 0447   1]                    Bit Width : 32
[1C0h 0448   1]                   Bit Offset : 00
[1C1h 0449   1]         Encoded Access Width : 03 [DWord Access:32]
[1C2h 0450   8]                      Address : 3333333333333333

[1CAh 0458   8]                Preserve Mask : 4444444444444444
[1D2h 0466   8]                   Write Mask : 5555555555555555
[1DAh 0474   4]              Command Latency : 66666666
[1DEh 0478   4]          Maximum Access Rate : 77777777
[1E2h 0482   4]      Minimum Turnaround Time : 88888888
[1E6h 0486  12]        Platform ACK Register : [Generic Address Structure]
[1E6h 0486   1]                     Space ID : 01 [SystemIO]
[1E7h 0487   1]                    Bit Width : 32
[1E8h 0488   1]                   Bit Offset : 00
[1E9h 0489   1]         Encoded Access Width : 03 [DWord Access:32]
[1EAh 0490   8]                      Address : 3333333333333333

[1F2h 0498   8]            ACK Preserve Mask : 9999999999999999
[1FAh 0506   8]                 ACK Set Mask : 0000000000000000
[202h 0514   8]                     Reserved : 0000000000000000
[20Ah 0522  12]    Command Complete Register : [Generic Address Structure]
[20Ah 0522   1]                     Space ID : 01 [SystemIO]
[20Bh 0523   1]                    Bit Width : 32
[20Ch 0524   1]                   Bit Offset : 00
[20Dh 0525   1]         Encoded Access Width : 03 [DWord Access:32]
[20Eh 0526   8]                      Address : 3333333333333333

[216h 0534   8]  Command Complete Check Mask : 2222222222222222
[21Eh 0542  12]      Command Update Register : [Generic Address Structure]
[21Eh 0542   1]                     Space ID : 01 [SystemIO]
[21Fh 0543   1]                    Bit Width : 32
[220h 0544   1]                   Bit Offset : 00
[221h 0545   1]         Encoded Access Width : 03 [DWord Access:32]
[222h 0546   8]                      Address : 3333333333333333

[22Ah 0554   8] Command Update Preserve Mask : 3333333333333333
[232h 0562   8]      Command Update Set Mask : 4444444444444444
[23Ah 0570  12]        Error Status Register : [Generic Address Structure]
[23Ah 0570   1]                     Space ID : 01 [SystemIO]
[23Bh 0571   1]                    Bit Width : 32
[23Ch 0572   1]                   Bit Offset : 00
[23Dh 0573   1]         Encoded Access Width : 03 [DWord Access:32]
[23Eh 0574   8]                      Address : 3333333333333333

[246h 0582   8]            Error Status Mask : 5555555555555555

Raw Table Data: Length 590 (0x24E)

    0000: 50 43 43 54 4E 02 00 00 01 41 49 4E 54 45 4C 20  // PCCTN....AINTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 01 00 00 00 00 00 00 00 00 00 00 00  // ... ............
    0030: 00 3E 00 00 00 00 00 00 11 11 11 11 11 11 11 11  // .>..............
    0040: 22 22 22 22 22 22 22 22 01 32 00 03 33 33 33 33  // """""""".2..3333
    0050: 33 33 33 33 44 44 44 44 44 44 44 44 55 55 55 55  // 3333DDDDDDDDUUUU
    0060: 55 55 55 55 66 66 66 66 77 77 77 77 88 88 01 3E  // UUUUffffwwww...>
    0070: 01 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  // ................
    0080: 00 00 00 00 00 00 01 32 00 03 44 44 44 44 44 44  // .......2..DDDDDD
    0090: 44 44 44 44 44 44 44 44 44 44 55 55 55 55 55 55  // DDDDDDDDDDUUUUUU
    00A0: 55 55 66 66 66 66 77 77 77 77 88 88 02 5A 01 00  // UUffffwwww...Z..
    00B0: 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00C0: 00 00 00 00 01 32 00 03 44 44 44 44 44 44 44 44  // .....2..DDDDDDDD
    00D0: 44 44 44 44 44 44 44 44 55 55 55 55 55 55 55 55  // DDDDDDDDUUUUUUUU
    00E0: 66 66 66 66 77 77 77 77 88 88 01 32 00 03 33 33  // ffffwwww...2..33
    00F0: 33 33 33 33 33 33 44 44 44 44 44 44 44 44 55 55  // 333333DDDDDDDDUU
    0100: 55 55 55 55 55 55 03 A4 01 00 00 00 01 00 00 00  // UUUUUU..........
    0110: 00 00 00 00 00 00 00 00 00 00 01 32 00 03 33 33  // ...........2..33
    0120: 33 33 33 33 33 33 44 44 44 44 44 44 44 44 55 55  // 333333DDDDDDDDUU
    0130: 55 55 55 55 55 55 66 66 66 66 77 77 77 77 88 88  // UUUUUUffffwwww..
    0140: 88 88 01 32 00 03 33 33 33 33 33 33 33 33 99 99  // ...2..33333333..
    0150: 99 99 99 99 99 99 00 00 00 00 00 00 00 00 00 00  // ................
    0160: 00 00 00 00 00 00 01 32 00 03 33 33 33 33 33 33  // .......2..333333
    0170: 33 33 22 22 22 22 22 22 22 22 01 32 00 03 33 33  // 33"""""""".2..33
    0180: 33 33 33 33 33 33 33 33 33 33 33 33 33 33 44 44  // 33333333333333DD
    0190: 44 44 44 44 44 44 01 32 00 03 33 33 33 33 33 33  // DDDDDD.2..333333
    01A0: 33 33 55 55 55 55 55 55 55 55 04 A4 01 00 00 00  // 33UUUUUUUU......
    01B0: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 01 32  // ...............2
    01C0: 00 03 33 33 33 33 33 33 33 33 44 44 44 44 44 44  // ..33333333DDDDDD
    01D0: 44 44 55 55 55 55 55 55 55 55 66 66 66 66 77 77  // DDUUUUUUUUffffww
    01E0: 77 77 88 88 88 88 01 32 00 03 33 33 33 33 33 33  // ww.....2..333333
    01F0: 33 33 99 99 99 99 99 99 99 99 00 00 00 00 00 00  // 33..............
    0200: 00 00 00 00 00 00 00 00 00 00 01 32 00 03 33 33  // ...........2..33
    0210: 33 33 33 33 33 33 22 22 22 22 22 22 22 22 01 32  // 333333"""""""".2
    0220: 00 03 33 33 33 33 33 33 33 33 33 33 33 33 33 33  // ..33333333333333
    0230: 33 33 44 44 44 44 44 44 44 44 01 32 00 03 33 33  // 33DDDDDDDD.2..33
    0240: 33 33 33 33 33 33 55 55 55 55 55 55 55 55        // 333333UUUUUUUU
