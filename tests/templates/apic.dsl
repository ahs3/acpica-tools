/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (32-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembly of apic.aml, Tue Aug  6 10:34:04 2019
 *
 * ACPI Data Table [APIC]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
[004h 0004   4]                 Table Length : 0000015A
[008h 0008   1]                     Revision : 05
[009h 0009   1]                     Checksum : EE
[00Ah 0010   6]                       Oem ID : "INTEL "
[010h 0016   8]                 Oem Table ID : "Template"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20190703

[024h 0036   4]           Local Apic Address : 00000000
[028h 0040   4]        Flags (decoded below) : 00000001
                         PC-AT Compatibility : 1

[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
[02Dh 0045   1]                       Length : 08
[02Eh 0046   1]                 Processor ID : 00
[02Fh 0047   1]                Local Apic ID : 00
[030h 0048   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
                      Runtime Online Capable : 0

[034h 0052   1]                Subtable Type : 01 [I/O APIC]
[035h 0053   1]                       Length : 0C
[036h 0054   1]                  I/O Apic ID : 01
[037h 0055   1]                     Reserved : 00
[038h 0056   4]                      Address : 00000000
[03Ch 0060   4]                    Interrupt : 00000000

[040h 0064   1]                Subtable Type : 02 [Interrupt Source Override]
[041h 0065   1]                       Length : 0A
[042h 0066   1]                          Bus : 00
[043h 0067   1]                       Source : 00
[044h 0068   4]                    Interrupt : 00000000
[048h 0072   2]        Flags (decoded below) : 0000
                                    Polarity : 0
                                Trigger Mode : 0

[04Ah 0074   1]                Subtable Type : 03 [NMI Source]
[04Bh 0075   1]                       Length : 08
[04Ch 0076   2]        Flags (decoded below) : 000D
                                    Polarity : 1
                                Trigger Mode : 3
[04Eh 0078   4]                    Interrupt : 00000001

[052h 0082   1]                Subtable Type : 04 [Local APIC NMI]
[053h 0083   1]                       Length : 06
[054h 0084   1]                 Processor ID : 00
[055h 0085   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[057h 0087   1]         Interrupt Input LINT : 01

[058h 0088   1]                Subtable Type : 05 [Local APIC Address Override]
[059h 0089   1]                       Length : 0C
[05Ah 0090   2]                     Reserved : 0000
[05Ch 0092   8]                 APIC Address : 0000000000000000

[064h 0100   1]                Subtable Type : 06 [I/O SAPIC]
[065h 0101   1]                       Length : 10
[066h 0102   1]                 I/O Sapic ID : 00
[067h 0103   1]                     Reserved : 00
[068h 0104   4]               Interrupt Base : 00000000
[06Ch 0108   8]                      Address : 0000000000000000

[074h 0116   1]                Subtable Type : 07 [Local SAPIC]
[075h 0117   1]                       Length : 16
[076h 0118   1]                 Processor ID : 00
[077h 0119   1]               Local Sapic ID : 00
[078h 0120   1]              Local Sapic EID : 00
[079h 0121   3]                     Reserved : 000000
[07Ch 0124   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
[080h 0128   4]                Processor UID : 00000000
[084h 0132   6]         Processor UID String : "\CPU0"

[08Ah 0138   1]                Subtable Type : 08 [Platform Interrupt Sources]
[08Bh 0139   1]                       Length : 10
[08Ch 0140   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[08Eh 0142   1]                InterruptType : 00
[08Fh 0143   1]                 Processor ID : 00
[090h 0144   1]                Processor EID : 00
[091h 0145   1]             I/O Sapic Vector : 00
[092h 0146   4]                    Interrupt : 00000001
[096h 0150   4]        Flags (decoded below) : 00000001
                               CPEI Override : 1

[09Ah 0154   1]                Subtable Type : 09 [Processor Local x2APIC]
[09Bh 0155   1]                       Length : 10
[09Ch 0156   2]                     Reserved : 0000
[09Eh 0158   4]          Processor x2Apic ID : 00000000
[0A2h 0162   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
[0A6h 0166   4]                Processor UID : 00000000

[0AAh 0170   1]                Subtable Type : 0A [Local x2APIC NMI]
[0ABh 0171   1]                       Length : 0C
[0ACh 0172   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[0AEh 0174   4]                Processor UID : 00000000
[0B2h 0178   1]         Interrupt Input LINT : 00
[0B3h 0179   3]                     Reserved : 000000

[0B6h 0182   1]                Subtable Type : 0B [Generic Interrupt Controller]
[0B7h 0183   1]                       Length : 50
[0B8h 0184   2]                     Reserved : 0000
[0BAh 0186   4]         CPU Interface Number : 00000000
[0BEh 0190   4]                Processor UID : 00000000
[0C2h 0194   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1
          Performance Interrupt Trigger Mode : 0
          Virtual GIC Interrupt Trigger Mode : 0
[0C6h 0198   4]     Parking Protocol Version : 00000000
[0CAh 0202   4]        Performance Interrupt : 00000000
[0CEh 0206   8]               Parked Address : 0000000000000000
[0D6h 0214   8]                 Base Address : 0000000000000000
[0DEh 0222   8]     Virtual GIC Base Address : 0000000000000000
[0E6h 0230   8]  Hypervisor GIC Base Address : 0000000000000000
[0EEh 0238   4]        Virtual GIC Interrupt : 00000000
[0F2h 0242   8]   Redistributor Base Address : 0000000000000000
[0FAh 0250   8]                    ARM MPIDR : 0000000000000000
[102h 0258   1]             Efficiency Class : 00
[103h 0259   1]                     Reserved : 00
[104h 0260   2]       SPE Overflow Interrupt : 0000

[106h 0262   1]                Subtable Type : 0C [Generic Interrupt Distributor]
[107h 0263   1]                       Length : 18
[108h 0264   2]                     Reserved : 0000
[10Ah 0266   4]        Local GIC Hardware ID : 00000000
[10Eh 0270   8]                 Base Address : 0000000000000000
[116h 0278   4]               Interrupt Base : 00000000
[11Ah 0282   1]                      Version : 01
[11Bh 0283   3]                     Reserved : 000000

[11Eh 0286   1]                Subtable Type : 0D [Generic MSI Frame]
[11Fh 0287   1]                       Length : 18
[120h 0288   2]                     Reserved : 0000
[122h 0290   4]                 MSI Frame ID : 00000000
[126h 0294   8]                 Base Address : 0000000000000000
[12Eh 0302   4]        Flags (decoded below) : 00000001
                                  Select SPI : 1
[132h 0306   2]                    SPI Count : 0000
[134h 0308   2]                     SPI Base : 0000

[136h 0310   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
[137h 0311   1]                       Length : 10
[138h 0312   2]                     Reserved : 0000
[13Ah 0314   8]                 Base Address : 0000000000000000
[142h 0322   4]                       Length : 00000000

[146h 0326   1]                Subtable Type : 0F [Generic Interrupt Translator]
[147h 0327   1]                       Length : 14
[148h 0328   2]                     Reserved : 0000
[14Ah 0330   4]               Translation ID : 00000000
[14Eh 0334   8]                 Base Address : 0000000000000000
[156h 0342   4]                     Reserved : 00000000

Raw Table Data: Length 346 (0x15A)

    0000: 41 50 49 43 5A 01 00 00 05 EE 49 4E 54 45 4C 20  // APICZ.....INTEL 
    0010: 54 65 6D 70 6C 61 74 65 01 00 00 00 49 4E 54 4C  // Template....INTL
    0020: 03 07 19 20 00 00 00 00 01 00 00 00 00 08 00 00  // ... ............
    0030: 01 00 00 00 01 0C 01 00 00 00 00 00 00 00 00 00  // ................
    0040: 02 0A 00 00 00 00 00 00 00 00 03 08 0D 00 01 00  // ................
    0050: 00 00 04 06 00 05 00 01 05 0C 00 00 00 00 00 00  // ................
    0060: 00 00 00 00 06 10 00 00 00 00 00 00 00 00 00 00  // ................
    0070: 00 00 00 00 07 16 00 00 00 00 00 00 01 00 00 00  // ................
    0080: 00 00 00 00 5C 43 50 55 30 00 08 10 05 00 00 00  // ....\CPU0.......
    0090: 00 00 01 00 00 00 01 00 00 00 09 10 00 00 00 00  // ................
    00A0: 00 00 01 00 00 00 00 00 00 00 0A 0C 05 00 00 00  // ................
    00B0: 00 00 00 00 00 00 0B 50 00 00 00 00 00 00 00 00  // .......P........
    00C0: 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0100: 00 00 00 00 00 00 0C 18 00 00 00 00 00 00 00 00  // ................
    0110: 00 00 00 00 00 00 00 00 00 00 01 00 00 00 0D 18  // ................
    0120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00  // ................
    0130: 00 00 00 00 00 00 0E 10 00 00 00 00 00 00 00 00  // ................
    0140: 00 00 00 00 00 00 0F 14 00 00 00 00 00 00 00 00  // ................
    0150: 00 00 00 00 00 00 00 00 00 00                    // ..........
