/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130725-32 [Aug  1 2013]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of grammar.aml, Fri Aug 02 12:13:57 2013
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000A9D4 (43476)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xA1
 *     OEM ID           "Intel"
 *     OEM Table ID     "GRMTEST"
 *     OEM Revision     0x20090511 (537462033)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20130725 (538117925)
 */
DefinitionBlock ("grammar.aml", "DSDT", 1, "Intel", "GRMTEST", 0x20090511)
{
    Device (A1)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Return (Zero)
        }
    }

    Device (A2)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Return (Zero)
        }
    }

    Device (A3)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }

    Device (A4)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (Zero)
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Return (Zero)
        }
    }

    Device (IRES)
    {
        Name (PRT0, ResourceTemplate ()
        {
            IRQ (Edge, ActiveHigh, Exclusive, )
                {3,4,5,6,7,9,10,11,14,15}
            StartDependentFn (0x01, 0x01)
            {
                IRQNoFlags ()
                    {0,1,2}
            }
            EndDependentFn ()
        })
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Store ("_CRS:", Debug)
            Store (PRT0, Debug)
            Return (PRT0)
        }

        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
        {
            Store ("_SRS:", Debug)
            Store (Arg0, Debug)
            Return (Zero)
        }
    }

    Name (_NPK, Package (0x04)
    {
        0x1111, 
        0x2222, 
        0x3333, 
        0x4444
    })
    Device (RES)
    {
        Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
        {
            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                Zero, 
                Zero
            }
        })
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Name (PRT0, ResourceTemplate ()
            {
                WordBusNumber (ResourceConsumer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0xFFF2,             // Range Minimum
                    0xFFF3,             // Range Maximum
                    0x0032,             // Translation Offset
                    0x0002,             // Length
                    ,, _Y00)
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                WordSpace (0xC3, ResourceConsumer, PosDecode, MinFixed, MaxFixed, 0xA5,
                    0x0000,             // Granularity
                    0xA000,             // Range Minimum
                    0xBFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x2000,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CFF,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00028000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordSpace (0xC3, ResourceConsumer, PosDecode, MinFixed, MaxFixed, 0xA5,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00028000,         // Length
                    ,, )
                QWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    0x44, "This is a ResouceSource string", , TypeStatic)
                QWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    ,, , TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000100000, // Range Minimum
                    0x00000000FFDFFFFF, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x00000000FFD00000, // Length
                    ,, , AddressRangeMemory, TypeStatic)
                QWordSpace (0xC3, ResourceConsumer, PosDecode, MinFixed, MaxFixed, 0xA5,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    ,, )
                ExtendedIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000CF7, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000CF8, // Length
                    0x0000000000000000, // Type-Specific Attributes
                    , TypeStatic)
                ExtendedMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000100000, // Range Minimum
                    0x00000000FFDFFFFF, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x00000000FFD00000, // Length
                    0x0000000000000000, // Type-Specific Attributes
                    , AddressRangeMemory, TypeStatic)
                ExtendedSpace (0xC3, ResourceProducer, PosDecode, MinFixed, MaxFixed, 0xA3,
                    0x0000000000000000, // Granularity
                    0x0000000000100000, // Range Minimum
                    0x00000000FFDFFFFF, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x00000000FFD00000, // Length
                    0x0000000000000000, // Type-Specific Attributes
                    )
                IO (Decode16,
                    0x0010,             // Range Minimum
                    0x0020,             // Range Maximum
                    0x01,               // Alignment
                    0x10,               // Length
                    )
                IO (Decode16,
                    0x0090,             // Range Minimum
                    0x00A0,             // Range Maximum
                    0x01,               // Alignment
                    0x10,               // Length
                    )
                FixedIO (
                    0x0061,             // Address
                    0x01,               // Length
                    )
                IRQNoFlags ()
                    {2}
                DMA (Compatibility, BusMaster, Transfer8_16, )
                    {4}
                DMA (Compatibility, BusMaster, Transfer8, )
                    {2,5,7}
                Memory32Fixed (ReadWrite,
                    0x00100000,         // Address Base
                    0x00000000,         // Address Length
                    )
                Memory32Fixed (ReadOnly,
                    0xFFFE0000,         // Address Base
                    0x00020000,         // Address Length
                    )
                Memory32 (ReadOnly,
                    0x00020000,         // Range Minimum
                    0xFFFE0000,         // Range Maximum
                    0x00000004,         // Alignment
                    0x00000200,         // Length
                    )
                Memory24 (ReadOnly,
                    0x1111,             // Range Minimum
                    0x2222,             // Range Maximum
                    0x0004,             // Alignment
                    0x0200,             // Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveLow, Exclusive, 0x0E, "\\_SB_.TEST", )
                {
                    0x00000E01,
                }
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, 0x06, "xxxx", )
                {
                    0x00000601,
                    0x00000003,
                    0x00000002,
                    0x00000001,
                }
                Interrupt (ResourceProducer, Edge, ActiveHigh, Exclusive, ,, )
                {
                    0xFFFF0000,
                    0x00000003,
                    0x00000002,
                    0x00000001,
                    0x00000005,
                    0x00000007,
                    0x00000009,
                }
                VendorShort ()      // Length = 0x03
                {
                     0x01, 0x02, 0x03
                }
                VendorLong  ()      // Length = 0x09
                {
                    /* 0000 */   0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                    /* 0008 */   0x09
                }
                Register (SystemIO, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000000000B2, // Address
                    ,_Y01)
                Register (SystemMemory, 
                    0x08,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000000000B2, // Address
                    ,)
                StartDependentFnNoPri ()
                {
                    IRQNoFlags ()
                        {0,1,2}
                    IRQ (Level, ActiveLow, Shared, )
                        {3,4,5,6,7,9,10,11,14,15}
                }
                EndDependentFn ()
            })
            CreateWordField (PRT0, \RES._CRS._Y00._MIN, BMIN)  // _MIN: Minimum Base Address
            CreateByteField (PRT0, \RES._CRS._Y01._ASZ, RSIZ)  // _ASZ: Access Size
            Store (0x03, BMIN)
            Return (PRT0)
        }

        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
        {
            Name (BUF0, ResourceTemplate ()
            {
                StartDependentFn (0x01, 0x02)
                {
                    IO (Decode16,
                        0x03D8,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {4}
                }
                StartDependentFn (0x02, 0x01)
                {
                    IO (Decode16,
                        0x03D8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {4}
                }
                StartDependentFn (0x00, 0x02)
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3}
                }
                StartDependentFn (0x00, 0x02)
                {
                    IO (Decode16,
                        0x02D8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {3}
                }
                StartDependentFn (0x02, 0x00)
                {
                    IO (Decode16,
                        0x0100,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x08,               // Alignment
                        0x08,               // Length
                        )
                    IRQNoFlags ()
                        {1,3,4,5,6,7,8,10,11,12,13,14,15}
                }
                EndDependentFn ()
            })
            Return (BUF0)
        }

        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
        {
            Return (Zero)
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        Zero, 
        Zero
    })
    Name (SIZE, Zero)
    OperationRegion (MYOP, 0x80, 0xFD60, 0x06)
    Field (MYOP, ByteAcc, NoLock, Preserve)
    {
        MFLD,   8
    }

    Method (TCOP, 0, NotSerialized)
    {
        Name (_STR, Unicode ("test"))  // _STR: Description String
        Store (0x04, MFLD)
        Store (MFLD, Local0)
    }

    Name (ERRS, Zero)
    Name (ESC1, "abcdefghijklmn")
    Name (ESC2, "abcdefghijklmn")
    Name (ESC3, "abc\a\bdef\f\n\r\t\v\x03ffff\x1A")
    Name (CRSA, ResourceTemplate ()
    {
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0019,             // Range Minimum
            0x001D,             // Range Maximum
            0x0000,             // Translation Offset
            0x0005,             // Length
            ,, )
        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, NonISAOnlyRanges,
            0x0000,             // Granularity
            0xC000,             // Range Minimum
            0xCFFF,             // Range Maximum
            0x0000,             // Translation Offset
            0x1000,             // Length
            ,, , TypeStatic)
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0xD8000000,         // Range Minimum
            0xDBFFFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x04000000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
    })
    Name (CRSB, ResourceTemplate ()
    {
        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
            0x00000000,         // Granularity
            0xD8000000,         // Range Minimum
            0xDBFFFFFF,         // Range Maximum
            0x00000000,         // Translation Offset
            0x04000000,         // Length
            ,, , AddressRangeMemory, TypeStatic)
    })
    Name (CRSC, ResourceTemplate ()
    {
        VendorShort ()      // Length = 0x03
        {
             0x01, 0x02, 0x03
        }
    })
    Name (CRSD, ResourceTemplate ()
    {
        VendorLong  ()      // Length = 0x09
        {
            /* 0000 */   0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
            /* 0008 */   0x09
        }
    })
    Name (CRSE, ResourceTemplate ()
    {
        IRQNoFlags ()
            {3,4,10,11}
        IRQNoFlags ()
            {3,4,10,11}
    })
    Name (CRSR, Buffer (Add (SizeOf (CRSA), SizeOf (CRSB))) {})
    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Return (CRSR)
    }

    Scope (\)
    {
        Name (BXXX, Ones)
    }

    Name (LANS, Zero)
    PowerResource (LANP, 0x01, 0x0000)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LEqual (And (LANS, 0x30), 0x30))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_ON, 0, NotSerialized)  // _ON_: Power On
        {
            If (LNot (_STA ()))
            {
                Store (0x30, LANS)
            }
        }

        Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
        {
            If (_STA ())
            {
                Store (Zero, LANS)
            }
        }
    }

    Method (RCIV, 1, NotSerialized)
    {
        Store (Arg0, Debug)
        If (LEqual (Arg0, Zero))
        {
            Return (Zero)
        }

        RCIV (Subtract (Arg0, One))
    }

    Method (RTOP, 0, NotSerialized)
    {
        RCIV (0x64)
    }

    Scope (_PR)
    {
        Processor (CPU0, 0x00, 0xFFFFFFFF, 0x00) {}
    }

    Name (B1TP, Ones)
    Name (B2TP, Ones)
    Name (ADPS, Ones)
    Name (B1PS, Ones)
    Name (B1RS, Ones)
    Name (B1CS, Ones)
    Name (B2PS, Ones)
    Name (B2RS, Ones)
    Name (B2CS, Ones)
    Name (B1DC, 0x0BB8)
    Name (B2DC, 0x0A28)
    Name (B1LF, 0x0BB8)
    Name (B2LF, 0x0A28)
    Name (BPIF, Zero)
    Name (PBLL, Zero)
    Name (RBIF, Package (0x0D)
    {
        One, 
        0x0898, 
        0x0898, 
        One, 
        0x2A30, 
        Zero, 
        Zero, 
        One, 
        One, 
        "CA54200-5003/5", 
        "1", 
        "LION", 
        "Fujitsu"
    })
    Method (SMWE, 4, NotSerialized)
    {
        Return (Ones)
    }

    Method (SMRE, 4, NotSerialized)
    {
        Return (Ones)
    }

    Scope (_SB)
    {
        Name (SBUF, Buffer (0x80) {})
        CreateBitField (SBUF, 0x03, BITY)
        CreateByteField (SBUF, One, BYTY)
        CreateWordField (SBUF, 0x02, WRDZ)
        CreateDWordField (SBUF, 0x04, DWDZ)
        CreateQWordField (SBUF, 0x08, QWDZ)
        CreateField (SBUF, 0x80, 0x0C, FLDZ)
        CreateField (SBUF, 0x94, 0x60, FLDY)
        CreateField (SBUF, 0x94, 0x60, FLDW)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            CreateField (SBUF, 0x94, 0x60, FLDV)
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))  // _HID: Hardware ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (PRT0, ResourceTemplate ()
                {
                    WordBusNumber (ResourceConsumer, MinFixed, MaxFixed, SubDecode,
                        0x0000,             // Granularity
                        0xFFF1,             // Range Minimum
                        0xFFF2,             // Range Maximum
                        0x0032,             // Translation Offset
                        0x0002,             // Length
                        ,, _Y02)
                })
                CreateWordField (PRT0, \_SB.PCI0._CRS._Y02._MIN, BMIN)  // _MIN: Minimum Base Address
                Store (0x03, BMIN)
                Return (PRT0)
            }

            Method (_SRS, 0, NotSerialized)  // _SRS: Set Resource Settings
            {
                Return (Zero)
            }

            Device (EIO)
            {
                OperationRegion (FJIO, SystemIO, 0xFD60, 0x06)
                Field (FJIO, ByteAcc, NoLock, Preserve)
                {
                    GIDX,   8, 
                    GDTA,   8, 
                    PIDX,   8, 
                    PDTA,   8, 
                    SIDX,   8, 
                    SDTA,   8
                }

                IndexField (GIDX, GDTA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                        ,   5, 
                    VGAS,   2, 
                    Offset (0x04), 
                        ,   4, 
                    DCKE,   1, 
                    Offset (0x05), 
                        ,   6, 
                    ACPW,   1, 
                    Offset (0x0A), 
                    B1P,    1, 
                    B2P,    1, 
                    B1C,    1, 
                    B2C,    1, 
                    B1ER,   1, 
                    B2ER,   1, 
                    Offset (0x0B), 
                    B1CP,   8, 
                    B2CP,   8, 
                    BCP,    8, 
                    B1VH,   8, 
                    B1VL,   8, 
                    B2VH,   8, 
                    B2VL,   8, 
                    B1TM,   8, 
                    B2TM,   8, 
                    B1CH,   8, 
                    B1CL,   8, 
                    B2CH,   8, 
                    B2CL,   8
                }
            }
        }
    }

    Method (RDBT, 3, Serialized)
    {
        Store (0x1FFF, Local1)
        If (Arg0)
        {
            Store (0x2FFF, Local1)
        }

        Store (0x18, Local2)
        If (Arg1)
        {
            Store (0x10, Local2)
        }

        If (LNot (SMRE (0x09, 0x15, One, RefOf (Local0))))
        {
            If (LNot (SMWE (0x08, 0x14, One, Local1)))
            {
                If (LNot (SMRE (0x09, 0x17, Local2, RefOf (Local3))))
                {
                    Store (Local1, Arg2)
                }
            }

            Or (Local0, 0x0FFF, Local0)
            SMWE (0x08, 0x14, One, Local0)
        }
    }

    Method (MKWD, 2, NotSerialized)
    {
        If (And (Arg1, 0x80))
        {
            Or (0xFFFF0000, Arg0, Local0)
            Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
            Subtract (Zero, Local0, Local0)
        }
        Else
        {
            Store (Arg0, Local0)
            Or (Local0, ShiftLeft (Arg1, 0x08), Local0)
        }

        Return (Local0)
    }

    Device (CMB1)
    {
        Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
        Alias (\_SB.PCI0.EIO.B1P, \_SB.PCI0.XXXX)
        Alias (\_SB.PCI0.EIO.B1P, B1P)
        Alias (\_SB.PCI0.EIO.B1C, B1C)
        Alias (\_SB.PCI0.EIO.B1CH, B1CH)
        Alias (\_SB.PCI0.EIO.B1CL, B1CL)
        Alias (\_SB.PCI0.EIO.B1VH, B1VH)
        Alias (\_SB.PCI0.EIO.B1VL, B1VL)
        Alias (\_SB.PCI0.EIO.B1CP, B1CP)
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (B1P, B1PS)
            Store (B1CP, B1RS)
            Store (B1C, B1CS)
        }

        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
        {
            RDBT (Zero, Zero, RefOf (B1DC))
            RDBT (Zero, One, RefOf (B1LF))
            Store (B1DC, Index (RBIF, One))
            Store (B1LF, Index (RBIF, 0x02))
            Store ("CA54200-5003/5", Index (RBIF, 0x09))
            Store ("1", Index (RBIF, 0x0A))
            Return (RBIF)
        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            _INI ()
            Store (Zero, Local0)
            If (LAnd (B1P, LNot (B1C)))
            {
                Or (Local0, One, Local0)
            }

            If (LAnd (B1P, B1C))
            {
                Or (Local0, 0x02, Local0)
            }

            If (LLessEqual (B1CP, One))
            {
                Or (Local0, 0x04, Local0)
            }

            Store (MKWD (B1CL, B1CH), Local1)
            Store (Divide (Add (Multiply (B1CP, B1LF), 0x63), 0x64, 
                ), Local2)
            Store (MKWD (B1VL, B1VH), Local3)
            Name (STAT, Package (0x04) {})
            Store (Local0, Index (STAT, Zero))
            Store (Local1, Index (STAT, One))
            Store (Local2, Index (STAT, 0x02))
            Store (Local3, Index (STAT, 0x03))
            If (LNot (BPIF))
            {
                Store (One, BPIF)
            }

            Return (STAT)
        }
    }

    Device (DEV1)
    {
    }

    Scope (_TZ)
    {
        ThermalZone (TZ1)
        {
            Name (_PSL, Package (0x01)  // _PSL: Passive List
            {
                \_PR.CPU0
            })
        }
    }

    Method (TZ2, 0, Serialized)
    {
        Name (_PSL, Package (0x01)  // _PSL: Passive List
        {
            \_PR.CPU0
        })
        Return (_PSL)
    }

    ThermalZone (THM1)
    {
    }

    Method (NOTI, 0, NotSerialized)
    {
        Notify (DEV1, Zero)
        Notify (THM1, Zero)
        Notify (\_PR.CPU0, Zero)
    }

    Method (_ERR, 3, NotSerialized)
    {
        Increment (ERRS)
        Store ("Run-time exception:", Debug)
        Store (Arg0, Debug)
        Store (Arg1, Debug)
        Return (Zero)
    }

    Method (DIV0, 0, NotSerialized)
    {
        Store (One, Local0)
        Store (Zero, Local1)
        Divide (Local0, Local1, Local3)
        Store ("DIV0 - noabort", Debug)
    }

    Method (ERR, 1, NotSerialized)
    {
        If (LEqual (Arg0, Zero))
        {
            Store ("+*+*+*+* MTHD_ERROR: Results not equal!", Debug)
        }

        If (LEqual (Arg0, One))
        {
            Store ("+*+*+*+* MTHD_ERROR: Numeric result is incorrect!", Debug)
        }

        If (LEqual (Arg0, 0x02))
        {
            Store ("+*+*+*+* MTHD_ERROR: Operand was clobbered!", Debug)
        }

        Notify (DEV1, Arg0)
        Increment (ERRS)
    }

    Method (R226, 2, NotSerialized)
    {
    }

    Method (R225, 2, NotSerialized)
    {
        R226 (Arg0, Arg1)
    }

    Method (R224, 2, NotSerialized)
    {
        R225 (Arg1, Arg0)
    }

    Method (R223, 2, NotSerialized)
    {
        R224 (Arg0, Arg1)
    }

    Method (R222, 2, NotSerialized)
    {
        R223 (Arg1, Arg0)
    }

    Method (R111, 0, NotSerialized)
    {
        Store (0x01010101, Local0)
        R222 (0xABAB, Local0)
        Store (Local0, Local1)
    }

    Method (MAIN, 0, NotSerialized)
    {
        Store (NUM1 (), Local0)
        \CMB1._BST ()
        RDBT (One, 0x02, 0x03)
        OBJ1 (One)
        OBJ2 (0x02)
        CHEK ()
        RETZ ()
        BITZ ()
        LOGS ()
        REFS ()
        COND ()
        TZ2 ()
        Store (\IFEL.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\NOSV.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\IDXF.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.NSTL.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\RTBF.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.RTLV.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.RETP.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\WHLR.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\ANDO.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\BRKP.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\ADSU.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\INDC.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\LOPS.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\FDSO.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\MLDV.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\NBIT.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\SHFT.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\XORD.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\CRBF.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\IDX4.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\EVNT.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\SZLV.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.BYTF.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\DWDF.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\DVAX.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\IDX6.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\IDX5.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.IDX0.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.IDX3.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\IDX7.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\MTCH.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\WHLB.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.IDX2.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\SIZO.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        Store (\_SB.SMIS.TEST (), Local0)
        If (LGreater (Local0, Zero))
        {
            ERR (One)
            Return (Local0)
        }

        If (LGreater (ERRS, Zero))
        {
            Store ("****** There were errors during the execution of the test ******", Debug)
        }

        Return (Zero)
    }

    Method (OBJ1, 1, Serialized)
    {
        Store (0x03, Local0)
        Name (BUFR, Buffer (Local0) {})
        Name (BUF1, Buffer (0x04)
        {
             0x01, 0x02, 0x03, 0x04
        })
        Name (BUF2, Buffer (0x04) {})
        Store (BUF1, BUF2)
        Mutex (MTX1, 0x04)
        Alias (MTX1, MTX2)
    }

    Mutex (MTXT, 0x00)
    Mutex (MTXX, 0x00)
    Method (FLDS, 0, NotSerialized)
    {
        Store ("++++++++ Creating BufferFields", Debug)
        Name (BUF2, Buffer (0x80) {})
        CreateBitField (BUF2, 0x03, BIT2)
        CreateByteField (BUF2, One, BYT2)
        CreateWordField (BUF2, 0x02, WRD2)
        CreateDWordField (BUF2, 0x04, DWD2)
        CreateQWordField (BUF2, 0x08, QWD2)
        CreateField (BUF2, 0x80, 0x0C, FLD2)
        CreateField (BUF2, 0x94, 0x60, FLD3)
        Store (One, BIT2)
        Store (BIT2, Local0)
        If (LNotEqual (Local0, One))
        {
            ERR (One)
        }
        Else
        {
            Store (DerefOf (Index (BUF2, Zero)), Local0)
            If (LNotEqual (Local0, 0x08))
            {
                ERR (One)
            }
            Else
            {
                Store ("++++++++ Bit BufferField I/O PASS", Debug)
            }
        }

        Store (0x1A, BYT2)
        Store (BYT2, Local0)
        If (LNotEqual (Local0, 0x1A))
        {
            ERR (One)
        }
        Else
        {
            Store ("++++++++ Byte BufferField I/O PASS", Debug)
        }

        Store (0x1234, WRD2)
        Store (WRD2, Local0)
        If (LNotEqual (Local0, 0x1234))
        {
            ERR (One)
        }
        Else
        {
            Store ("++++++++ Word BufferField I/O PASS", Debug)
        }

        Store (0x0123, FLD2)
        Store (FLD2, Local0)
        If (LNotEqual (Local0, 0x0123))
        {
            ERR (One)
        }
        Else
        {
            Store ("++++++++ 12-bit BufferField I/O PASS", Debug)
        }

        Store (0x12345678, DWD2)
        Store (DWD2, Local0)
        If (LNotEqual (Local0, 0x12345678))
        {
            ERR (One)
        }
        Else
        {
            Store ("++++++++ Dword BufferField I/O PASS", Debug)
        }

        Store (0x1234567887654321, QWD2)
        Store (QWD2, Local0)
        If (LNotEqual (Local0, 0x1234567887654321))
        {
            ERR (One)
        }
        Else
        {
            Store ("++++++++ Qword BufferField I/O PASS", Debug)
        }
    }

    Method (FLDX, 0, NotSerialized)
    {
        Field (\_SB.MEM.SMEM, AnyAcc, NoLock, Preserve)
        {
            SMD0,   32, 
            SMD1,   32, 
            SMD2,   32, 
            SMD3,   32
        }

        Field (\_SB.MEM.SMEM, AnyAcc, NoLock, Preserve)
        {
            SME0,   69, 
            SME1,   97
        }
    }

    Method (MTX, 0, NotSerialized)
    {
        Acquire (MTXT, 0xFFFF)
        Acquire (MTXX, 0xFFFF)
        Store ("++++++++ Acquiring Mutex MTX2", Debug)
        Acquire (_GL, 0xFFFF)
        Store ("++++++++ Releasing Mutex MTX2", Debug)
        Release (_GL)
    }

    Method (OBJ2, 1, NotSerialized)
    {
        Store ("++++++++ Creating Buffer BUFO", Debug)
        Name (BUFO, Buffer (0x20) {})
        Store ("++++++++ Creating OpRegion OPR2", Debug)
        OperationRegion (OPR2, SystemMemory, Arg0, 0x0100)
        Store ("++++++++ Creating Field(s) in OpRegion OPR2", Debug)
        Field (OPR2, ByteAcc, NoLock, Preserve)
        {
            IDX2,   8, 
            DAT2,   8, 
            BNK2,   4
        }

        Store ("++++++++ Creating BankField BNK2 in OpRegion OPR2", Debug)
        BankField (OPR2, BNK2, Zero, ByteAcc, NoLock, Preserve)
        {
            FET0,   4, 
            FET1,   3
        }

        Store ("++++++++ Creating IndexField", Debug)
        IndexField (IDX2, DAT2, ByteAcc, NoLock, Preserve)
        {
            FET2,   4, 
            FET3,   3
        }

        Store ("++++++++ SizeOf (BUFO)", Debug)
        SizeOf (BUFO)
        Store ("++++++++ Store (SizeOf (BUFO), Local0)", Debug)
        Store (SizeOf (BUFO), Local0)
        Store ("++++++++ Concatenate (\"abd\", \"def\", Local0)", Debug)
        Concatenate ("abd", "def", Local0)
        Store (Local0, Debug)
        Store ("++++++++ Concatenate (\"abd\", 0x7B, Local0)", Debug)
        Concatenate ("abd", 0x7B, Local0)
        Store (Local0, Debug)
        Store ("++++++++ Creating Event EVT2", Debug)
        Event (EVT2)
        Store ("++++++++ Creating Mutex MTX2", Debug)
        Mutex (MTX2, 0x00)
        Store ("++++++++ Creating Alias MTXA to MTX2", Debug)
        Alias (MTX2, MTXA)
        Store ("++++++++ Acquiring Mutex MTX2", Debug)
        Acquire (MTX2, 0xFFFF)
        Store ("++++++++ Acquiring Mutex MTX2 (2nd acquire)", Debug)
        Acquire (MTX2, 0x0001)
        Store ("++++++++ Releasing Mutex MTX2", Debug)
        Release (MTX2)
        Store ("++++++++ Signalling Event EVT2", Debug)
        Signal (EVT2)
        Store ("++++++++ Resetting Event EVT2", Debug)
        Reset (EVT2)
        Store ("++++++++ Signalling Event EVT2", Debug)
        Signal (EVT2)
        Store ("++++++++ Waiting Event EVT2", Debug)
        Wait (EVT2, 0xFFFF)
        Store ("++++++++ Sleep", Debug)
        Sleep (0x64)
        Store ("++++++++ Stall", Debug)
        Stall (0xFE)
        Store ("++++++++ NoOperation", Debug)
        Noop
        Store ("++++++++ Return from Method OBJ2", Debug)
        Return (0x04)
    }

    Method (NUM1, 0, NotSerialized)
    {
        Store ("++++++++ Add (0x12345678, 0x11111111, Local0)", Debug)
        Add (0x12345678, 0x11111111, Local0)
        Store ("++++++++ Store (Add (0x12345678, 0x11111111), Local1)", Debug)
        Store (Add (0x12345678, 0x11111111), Local1)
        Store ("++++++++ Checking result from ADD", Debug)
        If (LNotEqual (Local0, Local1))
        {
            ERR (Zero)
        }

        Store ("++++++++ Subtract (0x87654321, 0x11111111, Local4)", Debug)
        Subtract (0x87654321, 0x11111111, Local4)
        Store ("++++++++ Store (Subtract (0x87654321, 0x11111111), Local5)", Debug)
        Store (Subtract (0x87654321, 0x11111111), Local5)
        Store ("++++++++ Checking result from SUBTRACT", Debug)
        If (LNotEqual (Local4, Local5))
        {
            ERR (Zero)
        }

        Store ("++++++++ Multiply (33, 10, Local6)", Debug)
        Multiply (0x21, 0x0A, Local6)
        Store ("++++++++ Store (Multiply (33, 10), Local7)", Debug)
        Store (Multiply (0x21, 0x0A), Local7)
        Store ("++++++++ Checking result from MULTIPLY", Debug)
        If (LNotEqual (Local6, Local7))
        {
            ERR (Zero)
        }

        Store ("++++++++ Divide (100, 9, Local1, Local2)", Debug)
        Divide (0x64, 0x09, Local1, Local2)
        Store ("++++++++ Store (Divide (100, 9), Local3)", Debug)
        Store (Divide (0x64, 0x09, ), Local3)
        Store ("++++++++ Checking (quotient) result from DIVIDE", Debug)
        If (LNotEqual (Local2, Local3))
        {
            ERR (Zero)
        }

        Store ("++++++++ Increment (Local0)", Debug)
        Store (One, Local0)
        Store (0x02, Local1)
        Increment (Local0)
        Store ("++++++++ Checking result from INCREMENT", Debug)
        If (LNotEqual (Local0, Local1))
        {
            ERR (Zero)
        }

        Store ("++++++++ Decrement (Local0)", Debug)
        Store (0x02, Local0)
        Store (One, Local1)
        Decrement (Local0)
        Store ("++++++++ Checking result from DECREMENT", Debug)
        If (LNotEqual (Local0, Local1))
        {
            ERR (Zero)
        }

        Store ("++++++++ ToBCD (0x1234, Local5)", Debug)
        ToBCD (0x1234, Local5)
        Store ("++++++++ FromBCD (Local5, Local6)", Debug)
        FromBCD (Local5, Local6)
        Store ("++++++++ Return (Local6)", Debug)
        Return (Local6)
    }

    Method (CHEK, 0, NotSerialized)
    {
        Store (0x03, Local0)
        Store (0x03, Debug)
        Store (Local0, Debug)
        Store (0x07, Local1)
        Add (Local0, Local1)
        If (LNotEqual (Local0, 0x03))
        {
            ERR (0x02)
        }

        If (LNotEqual (Local1, 0x07))
        {
            ERR (0x02)
        }

        Add (Local0, Local1, Local2)
        If (LNotEqual (Local0, 0x03))
        {
            ERR (0x02)
        }

        If (LNotEqual (Local1, 0x07))
        {
            ERR (0x02)
        }
    }

    Method (RET1, 0, NotSerialized)
    {
        Store (0x03, Local0)
        Return (Local0)
    }

    Method (RET2, 0, NotSerialized)
    {
        Return (RET1 ())
    }

    Method (RETZ, 0, NotSerialized)
    {
        RET2 ()
    }

    Method (BITZ, 0, NotSerialized)
    {
        Store ("++++++++ FindSetLeftBit (0x00100100, Local0)", Debug)
        FindSetLeftBit (0x00100100, Local0)
        If (LNotEqual (Local0, 0x15))
        {
            ERR (One)
        }

        Store ("++++++++ FindSetRightBit (0x00100100, Local1)", Debug)
        FindSetRightBit (0x00100100, Local1)
        If (LNotEqual (Local1, 0x09))
        {
            ERR (One)
        }

        Store ("++++++++ And (0xF0F0F0F0, 0x11111111, Local2)", Debug)
        And (0xF0F0F0F0, 0x11111111, Local2)
        If (LNotEqual (Local2, 0x10101010))
        {
            ERR (One)
        }

        Store ("++++++++ NAnd (0xF0F0F0F0, 0x11111111, Local3)", Debug)
        NAnd (0xF0F0F0F0, 0x11111111, Local3)
        If (LNotEqual (Local3, 0xEFEFEFEF))
        {
            ERR (One)
        }

        Store ("++++++++ Or (0x11111111, 0x22222222, Local4)", Debug)
        Or (0x11111111, 0x22222222, Local4)
        If (LNotEqual (Local4, 0x33333333))
        {
            ERR (One)
        }

        Store ("++++++++ NOr (0x11111111, 0x22222222, Local5)", Debug)
        NOr (0x11111111, 0x22222222, Local5)
        If (LNotEqual (Local5, 0xCCCCCCCC))
        {
            ERR (One)
        }

        Store ("++++++++ XOr (0x11113333, 0x22222222, Local6)", Debug)
        XOr (0x11113333, 0x22222222, Local6)
        If (LNotEqual (Local6, 0x33331111))
        {
            ERR (One)
        }

        Store ("++++++++ ShiftLeft (0x11112222, 2, Local7)", Debug)
        ShiftLeft (0x11112222, 0x02, Local7)
        If (LNotEqual (Local7, 0x44448888))
        {
            ERR (One)
        }

        Store ("++++++++ ShiftRight (Local7, 2, Local7)", Debug)
        ShiftRight (Local7, 0x02, Local7)
        If (LNotEqual (Local7, 0x11112222))
        {
            ERR (One)
        }

        Store ("++++++++ Not (Local0, Local1)", Debug)
        Store (0x22224444, Local0)
        Not (Local0, Local1)
        If (LNotEqual (Local0, 0x22224444))
        {
            ERR (0x02)
        }

        If (LNotEqual (Local1, 0xDDDDBBBB))
        {
            ERR (One)
        }

        Return (Local7)
    }

    Method (LOGS, 0, NotSerialized)
    {
        Store ("++++++++ Store (LAnd (0xFFFFFFFF, 0x11111111), Local0)", Debug)
        Store (LAnd (Ones, 0x11111111), Local0)
        Store ("++++++++ Store (LEqual (0xFFFFFFFF, 0x11111111), Local)", Debug)
        Store (LEqual (Ones, 0x11111111), Local1)
        Store ("++++++++ Store (LGreater (0xFFFFFFFF, 0x11111111), Local2)", Debug)
        Store (LGreater (Ones, 0x11111111), Local2)
        Store ("++++++++ Store (LGreaterEqual (0xFFFFFFFF, 0x11111111), Local3)", Debug)
        Store (LGreaterEqual (Ones, 0x11111111), Local3)
        Store ("++++++++ Store (LLess (0xFFFFFFFF, 0x11111111), Local4)", Debug)
        Store (LLess (Ones, 0x11111111), Local4)
        Store ("++++++++ Store (LLessEqual (0xFFFFFFFF, 0x11111111), Local5)", Debug)
        Store (LLessEqual (Ones, 0x11111111), Local5)
        Store ("++++++++ Store (LNot (0x31313131), Local6)", Debug)
        Store (0x1111, Local6)
        Store (LNot (Local6), Local7)
        If (LNotEqual (Local6, 0x1111))
        {
            ERR (0x02)
        }

        If (LNotEqual (Local7, Zero))
        {
            ERR (One)
        }

        Store ("++++++++ Store (LNotEqual (0xFFFFFFFF, 0x11111111), Local7)", Debug)
        Store (LNotEqual (Ones, 0x11111111), Local7)
        Store ("++++++++ Lor (0x0, 0x1)", Debug)
        If (LOr (Zero, One))
        {
            Store ("+_+_+_+_+ Lor (0x0, 0x1) returned TRUE", Debug)
        }

        Return (Local7)
    }

    Method (COND, 0, NotSerialized)
    {
        Store ("++++++++ Store (0x4, Local0)", Debug)
        Store (0x04, Local0)
        Store ("++++++++ While (Local0)", Debug)
        While (Local0)
        {
            Store ("++++++++ Decrement (Local0)", Debug)
            Decrement (Local0)
        }

        Store ("++++++++ Store (0x3, Local6)", Debug)
        Store (0x03, Local6)
        Store ("++++++++ While (Subtract (Local6, 1))", Debug)
        While (Subtract (Local6, One))
        {
            Store ("++++++++ Decrement (Local6)", Debug)
            Decrement (Local6)
        }

        Store ("++++++++ [LVL1] If (LGreater (0x2, 0x1))", Debug)
        If (LGreater (0x02, One))
        {
            Store ("++++++++ [LVL2] If (LEqual (0x11111111, 0x22222222))", Debug)
            If (LEqual (0x11111111, 0x22222222))
            {
                Store ("++++++++ ERROR: If (LEqual (0x11111111, 0x22222222)) returned TRUE", Debug)
            }
            Else
            {
                Store ("++++++++ [LVL3] If (LNot (0x0))", Debug)
                If (LNot (Zero))
                {
                    Store ("++++++++ [LVL4] If (LAnd (0xEEEEEEEE, 0x2))", Debug)
                    If (LAnd (0xEEEEEEEE, 0x02))
                    {
                        Store ("++++++++ [LVL5] If (LLess (0x44444444, 0x3))", Debug)
                        If (LLess (0x44444444, 0x03))
                        {
                            Store ("++++++++ ERROR: If (LLess (0x44444444, 0x3)) returned TRUE", Debug)
                        }
                        Else
                        {
                            Store ("++++++++ Exiting from nested IF/ELSE statements", Debug)
                        }
                    }
                }
            }
        }

        Store ("++++++++ [LVL1] If (LGreater (0x2, 0x1))", Debug)
        If (LGreater (0x02, One))
        {
            Store ("++++++++ [LVL2] If (LEqual (0x11111111, 0x22222222))", Debug)
            If (LEqual (0x11111111, 0x22222222))
            {
                Store ("++++++++ ERROR: If (LEqual (0x11111111, 0x22222222)) returned TRUE", Debug)
            }
            Else
            {
                Store ("++++++++ [LVL3] If (LNot (0x0))", Debug)
                If (LNot (Zero))
                {
                    Store ("++++++++ [LVL4] If (LAnd (0xEEEEEEEE, 0x2))", Debug)
                    If (LAnd (0xEEEEEEEE, 0x02))
                    {
                        Store ("++++++++ [LVL5] If (LLess (0x44444444, 0x3))", Debug)
                        If (LLess (0x44444444, 0x03))
                        {
                            Store ("++++++++ ERROR: If (LLess (0x44444444, 0x3)) returned TRUE", Debug)
                        }
                        Else
                        {
                            Store ("++++++++ Returning from nested IF/ELSE statements", Debug)
                            Return (Local6)
                        }
                    }
                }
            }
        }
    }

    Method (REFS, 0, NotSerialized)
    {
        Name (BBUF, Buffer (0x08)
        {
             0xB0, 0xB1, 0xB2, 0xB3, 0xB4, 0xB5, 0xB6, 0xB7
        })
        Name (NEST, Package (0x02)
        {
            Package (0x06)
            {
                One, 
                0x02, 
                0x03, 
                0x04, 
                0x05, 
                0x06
            }, 

            Package (0x06)
            {
                0x11, 
                0x12, 
                0x12, 
                0x14, 
                0x15, 
                0x16
            }
        })
        Store (RefOf (MAIN ()), Local5)
        Store (CondRefOf (ABCD, Local0), Local1)
        If (LNotEqual (Local1, Zero))
        {
            ERR (0x02)
        }

        Store (CondRefOf (BBUF, Local0), Local1)
        If (LNotEqual (Local1, Ones))
        {
            ERR (0x02)
        }

        Store (DerefOf (Index (BBUF, 0x03)), Local6)
        If (LNotEqual (Local6, 0xB3))
        {
            ERR (0x02)
        }

        Store (DerefOf (Index (DerefOf (Index (NEST, One)), 0x03)), 
            Local0)
        If (LNotEqual (Local0, 0x14))
        {
            ERR (0x02)
        }

        Store (0x11223344, Local0)
        Store (RefOf (Local0), Local1)
        Store (DerefOf (Local1), Local2)
        If (LNotEqual (Local2, 0x11223344))
        {
            ERR (0x02)
        }
    }

    Method (INDX, 0, NotSerialized)
    {
        Name (STAT, Package (0x04) {})
        Store (0x44443333, Index (STAT, Zero))
    }

    Device (IFEL)
    {
        Name (DWRD, One)
        Name (RSLT, Zero)
        Method (IFNR, 0, NotSerialized)
        {
            Store (DWRD, RSLT)
            If (LEqual (DWRD, One))
            {
                Store (Zero, RSLT)
            }
        }

        Method (NINR, 0, NotSerialized)
        {
            Store (Zero, RSLT)
            If (LNotEqual (DWRD, One))
            {
                Store (DWRD, RSLT)
            }
        }

        Method (IENR, 0, NotSerialized)
        {
            If (LEqual (DWRD, One))
            {
                Store (Zero, RSLT)
            }
            Else
            {
                Store (DWRD, RSLT)
            }
        }

        Method (ELNR, 0, NotSerialized)
        {
            If (LNotEqual (DWRD, One))
            {
                Store (DWRD, RSLT)
            }
            Else
            {
                Store (Zero, RSLT)
            }
        }

        Method (IFRT, 0, NotSerialized)
        {
            If (LEqual (DWRD, One))
            {
                Return (Zero)
            }

            Return (DWRD)
        }

        Method (IERT, 0, NotSerialized)
        {
            If (LEqual (DWRD, One))
            {
                Return (Zero)
            }
            Else
            {
                Return (DWRD)
            }
        }

        Method (ELRT, 0, NotSerialized)
        {
            If (LNotEqual (DWRD, One))
            {
                Return (DWRD)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IfElseOp Test", Debug)
            IFNR ()
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            NINR ()
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            IENR ()
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            ELNR ()
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (IFRT (), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (IERT (), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (ELRT (), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Return (Zero)
        }
    }

    Device (NOSV)
    {
        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ NoSave Test", Debug)
            Name (WRD, 0x1234)
            If (And (0x03, One))
            {
                Store (One, WRD)
            }
            Else
            {
                Return (One)
            }

            If (And (0x04, One))
            {
                Return (0x02)
            }
            Else
            {
                Store (0x02, WRD)
            }

            If (NAnd (0x03, One))
            {
                Store (0x03, WRD)
            }
            Else
            {
                Return (0x03)
            }

            If (NAnd (Ones, Ones))
            {
                Return (0x04)
            }
            Else
            {
                Store (0x04, WRD)
            }

            If (NOr (Zero, One))
            {
                Store (0x05, WRD)
            }
            Else
            {
                Return (0x05)
            }

            If (NOr (0xFFFFFFFE, One))
            {
                Return (0x06)
            }
            Else
            {
                Store (0x06, WRD)
            }

            If (Not (One))
            {
                Store (0x07, WRD)
            }
            Else
            {
                Return (0x07)
            }

            If (Not (Ones))
            {
                Return (0x08)
            }
            Else
            {
                Store (0x08, WRD)
            }

            If (Or (0x03, One))
            {
                Store (0x09, WRD)
            }
            Else
            {
                Return (0x09)
            }

            If (Or (Zero, Zero))
            {
                Return (0x0A)
            }
            Else
            {
                Store (0x0A, WRD)
            }

            If (XOr (0x03, One))
            {
                Store (0x0B, WRD)
            }
            Else
            {
                Return (0x0B)
            }

            If (XOr (0x03, 0x03))
            {
                Return (0x0C)
            }
            Else
            {
                Store (0x0C, WRD)
            }

            If (LAnd (0x03, 0x03))
            {
                Store (0x15, WRD)
            }
            Else
            {
                Return (0x15)
            }

            If (LAnd (0x03, Zero))
            {
                Return (0x16)
            }
            Else
            {
                Store (0x16, WRD)
            }

            If (LAnd (Zero, 0x03))
            {
                Return (0x17)
            }
            Else
            {
                Store (0x17, WRD)
            }

            If (LAnd (Zero, Zero))
            {
                Return (0x18)
            }
            Else
            {
                Store (0x18, WRD)
            }

            If (LEqual (0x03, 0x03))
            {
                Store (0x1F, WRD)
            }
            Else
            {
                Return (0x1F)
            }

            If (LEqual (One, 0x03))
            {
                Return (0x20)
            }
            Else
            {
                Store (0x20, WRD)
            }

            If (LGreater (0x03, One))
            {
                Store (0x29, WRD)
            }
            Else
            {
                Return (0x29)
            }

            If (LGreater (0x04, 0x04))
            {
                Return (0x2A)
            }
            Else
            {
                Store (0x2A, WRD)
            }

            If (LGreater (One, 0x04))
            {
                Return (0x2B)
            }
            Else
            {
                Store (0x2B, WRD)
            }

            If (LGreaterEqual (0x03, One))
            {
                Store (0x2C, WRD)
            }
            Else
            {
                Return (0x2C)
            }

            If (LGreaterEqual (0x03, 0x03))
            {
                Store (0x2D, WRD)
            }
            Else
            {
                Return (0x2D)
            }

            If (LGreaterEqual (0x03, 0x04))
            {
                Return (0x2E)
            }
            Else
            {
                Store (0x2E, WRD)
            }

            If (LLess (One, 0x03))
            {
                Store (0x33, WRD)
            }
            Else
            {
                Return (0x33)
            }

            If (LLess (0x02, 0x02))
            {
                Return (0x34)
            }
            Else
            {
                Store (0x34, WRD)
            }

            If (LLess (0x04, 0x02))
            {
                Return (0x35)
            }
            Else
            {
                Store (0x35, WRD)
            }

            If (LLessEqual (One, 0x03))
            {
                Store (0x36, WRD)
            }
            Else
            {
                Return (0x36)
            }

            If (LLessEqual (0x02, 0x02))
            {
                Store (0x37, WRD)
            }
            Else
            {
                Return (0x37)
            }

            If (LLessEqual (0x04, 0x02))
            {
                Return (0x38)
            }
            Else
            {
                Store (0x38, WRD)
            }

            If (LNot (Zero))
            {
                Store (0x3D, WRD)
            }
            Else
            {
                Return (0x3D)
            }

            If (LNot (One))
            {
                Return (0x3E)
            }
            Else
            {
                Store (0x3E, WRD)
            }

            If (LNotEqual (0x03, 0x03))
            {
                Return (0x3F)
            }
            Else
            {
                Store (0x3F, WRD)
            }

            If (LNotEqual (One, 0x03))
            {
                Store (0x40, WRD)
            }
            Else
            {
                Return (0x40)
            }

            If (LOr (0x03, One))
            {
                Store (0x47, WRD)
            }
            Else
            {
                Return (0x47)
            }

            If (LOr (Zero, One))
            {
                Store (0x48, WRD)
            }
            Else
            {
                Return (0x48)
            }

            If (LOr (0x03, Zero))
            {
                Store (0x49, WRD)
            }
            Else
            {
                Return (0x49)
            }

            If (LOr (Zero, Zero))
            {
                Return (0x4A)
            }
            Else
            {
                Store (0x4A, WRD)
            }

            Return (Zero)
        }
    }

    Device (IDXF)
    {
        OperationRegion (SIO, SystemIO, 0x0100, 0x02)
        Field (SIO, ByteAcc, NoLock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        IndexField (INDX, DATA, AnyAcc, NoLock, WriteAsOnes)
        {
            AccessAs (ByteAcc, 0x00), 
            IFE0,   8, 
            IFE1,   8, 
            IFE2,   8, 
            IFE3,   8, 
            IFE4,   8, 
            IFE5,   8, 
            IFE6,   8, 
            IFE7,   8, 
            IFE8,   8, 
            IFE9,   8
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IndxFld Test", Debug)
            Store (IFE0, Local0)
            Store (IFE1, Local1)
            Store (IFE2, Local2)
            Return (Zero)
        }
    }

    Scope (_SB)
    {
        Name (ZER0, Zero)
        Name (ZER1, Zero)
        Name (ZER2, Zero)
        Name (ONE0, One)
        Device (NSTL)
        {
            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ NestdLor Test", Debug)
                If (LOr (ZER0, LOr (ZER1, LOr (ZER2, ONE0))))
                {
                    Store (Zero, Local0)
                }
                Else
                {
                    Store (One, Local0)
                }

                Return (Local0)
            }
        }
    }

    Device (RTBF)
    {
        Method (SUBR, 1, NotSerialized)
        {
            Return (Arg0)
        }

        Method (RBUF, 0, NotSerialized)
        {
            Name (ABUF, Buffer (0x11)
            {
                "ARBITRARY_BUFFER"
            })
            Store (ABUF, Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (One)
            }

            Store (SUBR (ABUF), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x02)
            }

            Store (0x05, Local1)
            Name (BUFR, Buffer (Local1) {})
            Store (SUBR (BUFR), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x03)
            }

            Store (BUFR, Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x04)
            }

            Return (Local0)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ RetBuf Test", Debug)
            Store (RBUF (), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x0A)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Device (GPE2)
    {
        Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store ("Method GPE2._L03 invoked", Debug)
            Return (Zero)
        }

        Method (_E05, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Store ("Method GPE2._E05 invoked", Debug)
            Return (Zero)
        }
    }

    Device (PRW2)
    {
        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
        {
            Package (0x02)
            {
                GPE2, 
                0x05
            }, 

            0x03
        })
    }

    Scope (_GPE)
    {
        Name (ACST, 0xFF)
        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store ("Method _GPE._L08 invoked", Debug)
            Return (Zero)
        }

        Method (_E09, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Store ("Method _GPE._E09 invoked", Debug)
            Return (Zero)
        }

        Method (_E11, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Store ("Method _GPE._E11 invoked", Debug)
            Notify (PRW1, 0x02)
        }

        Method (_L22, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store ("Method _GPE._L22 invoked", Debug)
            Return (Zero)
        }

        Method (_L33, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store ("Method _GPE._L33 invoked", Debug)
            Return (Zero)
        }

        Method (_E64, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
        {
            Store ("Method _GPE._E64 invoked", Debug)
            Return (Zero)
        }
    }

    Device (PRW1)
    {
        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
        {
            0x11, 
            0x03
        })
    }

    Device (PWRB)
    {
        Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
        Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
        {
            0x33, 
            0x03
        })
    }

    Scope (_SB)
    {
        Device (ACAD)
        {
            Name (_HID, "ACPI0003")  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            OperationRegion (AREG, SystemIO, 0x0372, 0x02)
            Field (AREG, ByteAcc, NoLock, Preserve)
            {
                AIDX,   8, 
                ADAT,   8
            }

            IndexField (AIDX, ADAT, ByteAcc, NoLock, Preserve)
            {
                    ,   1, 
                ACIN,   1, 
                    ,   2, 
                CHAG,   1, 
                Offset (0x01), 
                    ,   7, 
                ABAT,   1
            }

            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Store (\_GPE.ACST, Local0)
                Store (ACIN, Local1)
                If (LNotEqual (\_GPE.ACST, Local1))
                {
                    Store (Local1, \_GPE.ACST)
                }

                Return (Local0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (ACIN, \_GPE.ACST)
            }
        }

        Method (DIS, 1, NotSerialized)
        {
            Store (Arg0, Local0)
        }

        Device (RTLV)
        {
            Method (_DCK, 1, NotSerialized)  // _DCK: Dock Present
            {
                If (Arg0)
                {
                    Store (0x87, Local0)
                    If (Local0)
                    {
                        DIS (0x23)
                        Return (One)
                    }

                    Return (Zero)
                }
                Else
                {
                    Store (Arg0, Local0)
                    If (Local0)
                    {
                        DIS (0x23)
                        Return (One)
                    }

                    Return (Zero)
                }
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ RetLVal Test", Debug)
                Store (^^ACAD._PSR (), Local0)
                Store (ObjectType (Local0), Local1)
                If (LNotEqual (Local1, One))
                {
                    Return (One)
                }

                Store (_DCK (One), Local2)
                Store (ObjectType (Local2), Local3)
                If (LNotEqual (Local3, One))
                {
                    Return (0x02)
                }

                If (LNotEqual (Local2, One))
                {
                    Return (0x03)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB)
    {
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
        }

        Device (PCI1)
        {
            Name (_HID, "PNP0A03")  // _HID: Hardware ID
            Name (_ADR, Zero)  // _ADR: Address
            Name (_CRS, Zero)  // _CRS: Current Resource Settings
            Name (_PRT, Package (0x0C)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    Zero, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    One, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    0x02, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }
            })
            Device (PX40)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
            }
        }

        Device (RETP)
        {
            Method (RPKG, 0, NotSerialized)
            {
                Store (^^PCI1._PRT, Local0)
                Return (Local0)
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ RetPkg Test", Debug)
                Store (RPKG (), Local0)
                Store (ObjectType (Local0), Local1)
                If (LNotEqual (Local1, 0x04))
                {
                    Return (One)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }

    Device (WHLR)
    {
        Name (LCNT, Zero)
        Method (WIR, 0, NotSerialized)
        {
            While (LLess (LCNT, 0x04))
            {
                If (LEqual (LCNT, 0x02))
                {
                    Return (Zero)
                }

                Increment (LCNT)
            }

            Return (LCNT)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ WhileRet Test", Debug)
            Store (WIR (), Local0)
            Return (Local0)
        }
    }

    Device (ANDO)
    {
        OperationRegion (TMEM, SystemMemory, 0xC4, 0x02)
        Field (TMEM, ByteAcc, NoLock, Preserve)
        {
                ,   3, 
            TOUD,   13
        }

        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Name (BYT1, 0xFF)
        Name (BYT2, 0xFF)
        Name (BRSL, Zero)
        Name (WRD1, 0xFFFF)
        Name (WRD2, 0xFFFF)
        Name (WRSL, Zero)
        Name (DWD1, Ones)
        Name (DWD2, Ones)
        Name (DRSL, Zero)
        Method (ANDP, 0, NotSerialized)
        {
            And (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, 0xFF))
            {
                Return (One)
            }

            And (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, 0xFFFF))
            {
                Return (One)
            }

            And (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Ones))
            {
                Return (One)
            }

            Store (Zero, BYT1)
            Store (Zero, BYT2)
            Store (Zero, BRSL)
            And (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, Zero))
            {
                Return (One)
            }

            Store (Zero, WRD1)
            Store (Zero, WRD2)
            Store (Zero, WRSL)
            And (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, Zero))
            {
                Return (One)
            }

            Store (Zero, DWD1)
            Store (Zero, DWD2)
            Store (Zero, DRSL)
            And (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (One)
            }

            Store (0x55, BYT1)
            Store (0xAA, BYT2)
            Store (Zero, BRSL)
            And (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, Zero))
            {
                Return (One)
            }

            Store (0x5555, WRD1)
            Store (0xAAAA, WRD2)
            Store (Zero, WRSL)
            And (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, Zero))
            {
                Return (One)
            }

            Store (0x55555555, DWD1)
            Store (0xAAAAAAAA, DWD2)
            Store (Zero, DRSL)
            And (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (One)
            }

            Store (0x1FFF, TOUD)
            Store (TOUD, Local0)
            If (LNotEqual (Local0, 0x1FFF))
            {
                Return (One)
            }

            Return (Zero)
        }

        Method (OROP, 0, NotSerialized)
        {
            Store (0xFF, BYT1)
            Store (0xFF, BYT2)
            Store (Zero, BRSL)
            Or (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, 0xFF))
            {
                Return (One)
            }

            Store (0xFFFF, WRD1)
            Store (0xFFFF, WRD2)
            Store (Zero, WRSL)
            Or (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, 0xFFFF))
            {
                Return (One)
            }

            Store (Ones, DWD1)
            Store (Ones, DWD2)
            Store (Zero, DRSL)
            Or (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Ones))
            {
                Return (One)
            }

            Store (Zero, BYT1)
            Store (Zero, BYT2)
            Store (Zero, BRSL)
            Or (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, Zero))
            {
                Return (One)
            }

            Store (Zero, WRD1)
            Store (Zero, WRD2)
            Store (Zero, WRSL)
            Or (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, Zero))
            {
                Return (One)
            }

            Store (Zero, DWD1)
            Store (Zero, DWD2)
            Store (Zero, DRSL)
            Or (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (One)
            }

            Store (0x55, BYT1)
            Store (0xAA, BYT2)
            Store (Zero, BRSL)
            Or (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, 0xFF))
            {
                Return (One)
            }

            Store (0x5555, WRD1)
            Store (0xAAAA, WRD2)
            Store (Zero, WRSL)
            Or (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, 0xFFFF))
            {
                Return (One)
            }

            Store (0x55555555, DWD1)
            Store (0xAAAAAAAA, DWD2)
            Store (Zero, DRSL)
            Or (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Ones))
            {
                Return (One)
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ AndOrOp Test", Debug)
            Name (RSLT, One)
            Store (ANDP (), RSLT)
            If (LEqual (RSLT, One))
            {
                Return (RSLT)
            }

            Store (OROP (), RSLT)
            If (LEqual (RSLT, One))
            {
                Return (RSLT)
            }

            Store (0xFF, BYT1)
            Store (0xFF, BYT2)
            Store (Zero, BRSL)
            Store (0xFFFF, WRD1)
            Store (0xFFFF, WRD2)
            Store (Zero, WRSL)
            Store (Ones, DWD1)
            Store (Ones, DWD2)
            Store (Zero, DRSL)
            Return (Zero)
        }
    }

    Device (BRKP)
    {
        Name (CNT0, Zero)
        Method (BK1, 0, NotSerialized)
        {
            BreakPoint
            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ BreakPnt Test", Debug)
            Store (Zero, CNT0)
            While (LLess (CNT0, 0x0A))
            {
                Increment (CNT0)
            }

            If (LEqual (CNT0, 0x0A))
            {
                Return (Zero)
            }

            Return (One)
        }
    }

    Device (ADSU)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ AddSubOp Test", Debug)
            Name (DWRD, 0x12345678)
            Name (WRD, 0x1234)
            Name (BYT, 0x12)
            Store (0x12345678, DWRD)
            Add (DWRD, 0x07, DWRD)
            If (LNotEqual (DWRD, 0x1234567F))
            {
                Return (DWRD)
            }

            Add (WRD, 0x05, WRD)
            If (LNotEqual (WRD, 0x1239))
            {
                Return (WRD)
            }

            Add (BYT, 0x03, BYT)
            If (LNotEqual (BYT, 0x15))
            {
                Return (BYT)
            }

            Subtract (DWRD, 0x07, DWRD)
            If (LNotEqual (DWRD, 0x12345678))
            {
                Return (DWRD)
            }

            Subtract (WRD, 0x03, WRD)
            If (LNotEqual (WRD, 0x1236))
            {
                Return (WRD)
            }

            Subtract (BYT, 0x03, BYT)
            If (LNotEqual (BYT, 0x12))
            {
                Return (BYT)
            }

            Store (0x01234567, SMDW)
            Add (SMDW, 0x08, SMDW)
            If (LNotEqual (SMDW, 0x0123456F))
            {
                Return (SMDW)
            }

            Subtract (SMDW, 0x07, SMDW)
            If (LNotEqual (SMDW, 0x01234568))
            {
                Return (SMDW)
            }

            Store (0x0123, SMWD)
            Add (SMWD, 0x06, SMWD)
            If (LNotEqual (SMWD, 0x0129))
            {
                Return (SMWD)
            }

            Subtract (SMWD, 0x05, SMWD)
            If (LNotEqual (SMWD, 0x0124))
            {
                Return (SMWD)
            }

            Store (One, SMBY)
            Add (SMBY, 0x04, SMBY)
            If (LNotEqual (SMBY, 0x05))
            {
                Return (SMBY)
            }

            Subtract (SMBY, 0x03, SMBY)
            If (LNotEqual (SMBY, 0x02))
            {
                Return (SMBY)
            }

            Return (Zero)
        }
    }

    Device (INDC)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IncDecOp Test", Debug)
            Name (DWRD, 0x12345678)
            Name (WRD, 0x1234)
            Name (BYT, 0x12)
            Store (0x12345678, DWRD)
            Increment (DWRD)
            If (LNotEqual (DWRD, 0x12345679))
            {
                Return (DWRD)
            }

            Increment (WRD)
            If (LNotEqual (WRD, 0x1235))
            {
                Return (WRD)
            }

            Increment (BYT)
            If (LNotEqual (BYT, 0x13))
            {
                Return (BYT)
            }

            Decrement (DWRD)
            If (LNotEqual (DWRD, 0x12345678))
            {
                Return (DWRD)
            }

            Decrement (WRD)
            If (LNotEqual (WRD, 0x1234))
            {
                Return (WRD)
            }

            Decrement (BYT)
            If (LNotEqual (BYT, 0x12))
            {
                Return (BYT)
            }

            Store (0x01234567, SMDW)
            Increment (SMDW)
            If (LNotEqual (SMDW, 0x01234568))
            {
                Return (SMDW)
            }

            Decrement (SMDW)
            If (LNotEqual (SMDW, 0x01234567))
            {
                Return (SMDW)
            }

            Store (0x0123, SMWD)
            Increment (SMWD)
            If (LNotEqual (SMWD, 0x0124))
            {
                Return (SMWD)
            }

            Decrement (SMWD)
            If (LNotEqual (SMWD, 0x0123))
            {
                Return (SMWD)
            }

            Store (One, SMBY)
            Increment (SMBY)
            If (LNotEqual (SMBY, 0x02))
            {
                Return (SMBY)
            }

            Decrement (SMBY)
            If (LNotEqual (SMBY, One))
            {
                Return (SMBY)
            }

            Return (Zero)
        }
    }

    Device (LOPS)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Name (BYT1, 0xFF)
        Name (BYT2, 0xFF)
        Name (BRSL, Zero)
        Name (WRD1, 0xFFFF)
        Name (WRD2, 0xFFFF)
        Name (WRSL, Zero)
        Name (DWD1, Ones)
        Name (DWD2, Ones)
        Name (DRSL, Zero)
        Name (RSLT, One)
        Method (ANDL, 2, NotSerialized)
        {
            If (LEqual (Arg0, Arg1))
            {
                Store (LAnd (Arg0, Arg1), RSLT)
                If (LNotEqual (Ones, RSLT))
                {
                    Return (0x0B)
                }
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LEqual (Local0, Local1))
            {
                Store (LAnd (Local0, Local1), RSLT)
                If (LNotEqual (Ones, RSLT))
                {
                    Return (0x0C)
                }
            }

            If (LEqual (BYT1, BYT2))
            {
                Store (LAnd (BYT1, BYT2), BRSL)
                If (LNotEqual (Ones, BRSL))
                {
                    Return (0x0D)
                }
            }

            If (LEqual (WRD1, WRD2))
            {
                Store (LAnd (WRD1, WRD2), WRSL)
                If (LNotEqual (Ones, WRSL))
                {
                    Return (0x0E)
                }
            }

            If (LEqual (DWD1, DWD2))
            {
                Store (LAnd (DWD1, DWD2), DRSL)
                If (LNotEqual (Ones, DRSL))
                {
                    Return (0x0F)
                }
            }

            Store (0xFF, BYT1)
            Store (0xFF, SMBY)
            Store (Zero, BRSL)
            If (LEqual (BYT1, SMBY))
            {
                Store (LAnd (BYT1, SMBY), BRSL)
                If (LNotEqual (Ones, BRSL))
                {
                    Return (0x10)
                }
            }

            Store (0xFFFF, WRD1)
            Store (0xFFFF, SMWD)
            Store (Zero, WRSL)
            If (LEqual (WRD1, SMWD))
            {
                Store (LAnd (WRD1, SMWD), WRSL)
                If (LNotEqual (Ones, WRSL))
                {
                    Return (0x11)
                }
            }

            Store (Zero, DRSL)
            Store (0x00FFFFFF, DWD1)
            Store (0x00FFFFFF, SMDW)
            If (LEqual (DWD1, SMDW))
            {
                Store (LAnd (DWD1, SMDW), DRSL)
                If (LNotEqual (Ones, DRSL))
                {
                    Return (0x12)
                }
            }

            Return (Zero)
        }

        Method (ORL, 2, NotSerialized)
        {
            If (LEqual (Arg0, Arg1))
            {
                Store (LOr (Arg0, Arg1), RSLT)
                If (LNotEqual (Ones, RSLT))
                {
                    Return (0x15)
                }
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LEqual (Local0, Local1))
            {
                Store (LOr (Local0, Local1), RSLT)
                If (LNotEqual (Ones, RSLT))
                {
                    Return (0x16)
                }
            }

            Store (0xFF, BYT1)
            Store (Zero, BYT2)
            Store (Zero, BRSL)
            If (LNotEqual (BYT1, BYT2))
            {
                Store (LOr (BYT1, BYT2), BRSL)
                If (LNotEqual (Ones, BRSL))
                {
                    Return (0x17)
                }
            }

            Store (0xFFFF, WRD1)
            Store (Zero, WRD2)
            Store (Zero, WRSL)
            If (LNotEqual (WRD1, WRD2))
            {
                Store (LOr (WRD1, WRD2), WRSL)
                If (LNotEqual (Ones, WRSL))
                {
                    Return (0x18)
                }
            }

            Store (Ones, DWD1)
            Store (Zero, DWD2)
            Store (Zero, DRSL)
            If (LNotEqual (DWD1, DWD2))
            {
                Store (LOr (DWD1, DWD2), DRSL)
                If (LNotEqual (Ones, DRSL))
                {
                    Return (0x19)
                }
            }

            Store (Zero, BYT1)
            Store (0xFF, SMBY)
            Store (Zero, BRSL)
            If (LEqual (BYT1, SMBY))
            {
                Store (LOr (BYT1, SMBY), BRSL)
                If (LNotEqual (Ones, BRSL))
                {
                    Return (0x1A)
                }
            }

            Store (Zero, WRD1)
            Store (0xFFFF, SMWD)
            Store (Zero, WRSL)
            If (LEqual (WRD1, SMWD))
            {
                Store (LOr (WRD1, SMWD), WRSL)
                If (LNotEqual (Ones, WRSL))
                {
                    Return (0x1B)
                }
            }

            Store (Zero, DWD1)
            Store (Ones, SMDW)
            Store (Zero, DRSL)
            If (LEqual (DWD1, SMDW))
            {
                Store (LAnd (DWD1, SMDW), DRSL)
                If (LNotEqual (Ones, DRSL))
                {
                    Return (0x1C)
                }
            }

            Return (Zero)
        }

        Method (LSGR, 2, NotSerialized)
        {
            If (LEqual (Ones, LLessEqual (Arg1, Arg0)))
            {
                Return (0x1F)
            }

            If (LEqual (Ones, LNot (LGreaterEqual (Arg1, Arg0))))
            {
                Return (0x20)
            }

            If (LEqual (Ones, LLess (Arg1, Arg0)))
            {
                Return (0x21)
            }

            If (LEqual (Ones, LLessEqual (Arg1, Arg0)))
            {
                Return (0x22)
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LLessEqual (Local1, Local0))
            {
                Return (0x23)
            }

            Store (0x12, BYT1)
            Store (0x21, BYT2)
            If (LLessEqual (BYT2, BYT1))
            {
                Return (0x24)
            }

            If (LGreaterEqual (BYT1, BYT2))
            {
                Return (0x25)
            }

            If (LNot (LGreaterEqual (BYT2, BYT1)))
            {
                Return (0x26)
            }

            If (LNot (LLessEqual (BYT1, BYT2)))
            {
                Return (0x27)
            }

            Store (0x1212, WRD1)
            Store (0x2121, WRD2)
            If (LLessEqual (WRD2, WRD1))
            {
                Return (0x0136)
            }

            If (LGreaterEqual (WRD1, WRD2))
            {
                Return (0x0137)
            }

            If (LNot (LGreaterEqual (WRD2, WRD1)))
            {
                Return (0x0138)
            }

            If (LNot (LLessEqual (WRD1, WRD2)))
            {
                Return (0x0139)
            }

            Store (0x12121212, DWD1)
            Store (0x21212121, DWD2)
            If (LLessEqual (DWD2, DWD1))
            {
                Return (0x013A)
            }

            If (LGreaterEqual (DWD1, DWD2))
            {
                Return (0x013B)
            }

            If (LNot (LGreaterEqual (DWD2, DWD1)))
            {
                Return (0x013C)
            }

            If (LNot (LLessEqual (DWD1, DWD2)))
            {
                Return (0x013D)
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ LOps Test", Debug)
            Store (Zero, RSLT)
            Store (ANDL (0x02, 0x02), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (ORL (0x05, 0x05), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (LSGR (0x05, 0x07), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Return (Zero)
        }
    }

    Device (FDSO)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Name (BYT1, One)
        Name (BRSL, Zero)
        Name (WRD1, 0x0100)
        Name (WRSL, Zero)
        Name (DWD1, 0x00010000)
        Name (DRSL, Zero)
        Name (RSLT, One)
        Name (CNTR, One)
        Method (SHFT, 2, NotSerialized)
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            FindSetLeftBit (Arg0, BRSL)
            If (LNotEqual (BRSL, Arg1))
            {
                Return (0x11)
            }

            If (LNotEqual (Arg0, Local0))
            {
                Return (0x12)
            }

            FindSetLeftBit (Local0, BRSL)
            If (LNotEqual (BRSL, Local1))
            {
                Return (0x13)
            }

            If (LNotEqual (Arg0, Local0))
            {
                Return (0x14)
            }

            Store (0x07, BYT1)
            FindSetLeftBit (BYT1, BRSL)
            If (LNotEqual (BRSL, 0x03))
            {
                Return (0x15)
            }

            If (LNotEqual (BYT1, 0x07))
            {
                Return (0x16)
            }

            Store (One, BYT1)
            Store (One, CNTR)
            While (LLessEqual (CNTR, 0x08))
            {
                FindSetLeftBit (BYT1, BRSL)
                If (LNotEqual (BRSL, CNTR))
                {
                    Return (0x17)
                }

                ShiftLeft (BYT1, One, BYT1)
                Increment (CNTR)
            }

            Store (0x07, BYT1)
            FindSetRightBit (BYT1, BRSL)
            If (LNotEqual (BRSL, One))
            {
                Return (0x21)
            }

            If (LNotEqual (BYT1, 0x07))
            {
                Return (0x22)
            }

            Store (One, CNTR)
            Store (0xFF, BYT1)
            While (LLessEqual (CNTR, 0x08))
            {
                FindSetRightBit (BYT1, BRSL)
                If (LNotEqual (BRSL, CNTR))
                {
                    Return (0x23)
                }

                ShiftLeft (BYT1, One, BYT1)
                Increment (CNTR)
            }

            Store (0x09, CNTR)
            Store (0x0100, WRD1)
            While (LLessEqual (CNTR, 0x10))
            {
                FindSetLeftBit (WRD1, WRSL)
                If (LNotEqual (WRSL, CNTR))
                {
                    Return (0x31)
                }

                ShiftLeft (WRD1, One, WRD1)
                Increment (CNTR)
            }

            Store (0x09, CNTR)
            Store (0xFF00, WRD1)
            While (LLessEqual (CNTR, 0x10))
            {
                FindSetRightBit (WRD1, WRSL)
                If (LNotEqual (WRSL, CNTR))
                {
                    Return (0x32)
                }

                ShiftLeft (WRD1, One, WRD1)
                Increment (CNTR)
            }

            Store (0x11, CNTR)
            Store (0x00010000, DWD1)
            While (LLessEqual (CNTR, 0x20))
            {
                FindSetLeftBit (DWD1, DRSL)
                If (LNotEqual (DRSL, CNTR))
                {
                    Return (0x41)
                }

                ShiftLeft (DWD1, One, DWD1)
                Increment (CNTR)
            }

            Store (0x11, CNTR)
            Store (0xFFFF0000, DWD1)
            While (LLessEqual (CNTR, 0x20))
            {
                FindSetRightBit (DWD1, DRSL)
                If (LNotEqual (DRSL, CNTR))
                {
                    Return (0x42)
                }

                ShiftLeft (DWD1, One, DWD1)
                Increment (CNTR)
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ FdSetOps Test", Debug)
            Store (SHFT (0x80, 0x08), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Return (Zero)
        }
    }

    Device (MLDV)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ MulDivOp Test", Debug)
            Name (RMDR, Zero)
            Name (DWRD, 0x12345678)
            Name (WRD, 0x1234)
            Name (BYT, 0x12)
            Store (0x12345678, DWRD)
            Multiply (DWRD, 0x03, DWRD)
            If (LNotEqual (DWRD, 0x369D0368))
            {
                Return (DWRD)
            }

            Multiply (WRD, 0x04, WRD)
            If (LNotEqual (WRD, 0x48D0))
            {
                Return (WRD)
            }

            Multiply (BYT, 0x05, BYT)
            If (LNotEqual (BYT, 0x5A))
            {
                Return (BYT)
            }

            Divide (DWRD, 0x03, DWRD, RMDR)
            If (LNotEqual (DWRD, 0x12345678))
            {
                Return (DWRD)
            }

            If (LNotEqual (RMDR, Zero))
            {
                Return (RMDR)
            }

            Divide (WRD, 0x04, WRD, RMDR)
            If (LNotEqual (WRD, 0x1234))
            {
                Return (WRD)
            }

            If (LNotEqual (RMDR, Zero))
            {
                Return (RMDR)
            }

            Divide (BYT, 0x05, BYT, RMDR)
            If (LNotEqual (BYT, 0x12))
            {
                Return (BYT)
            }

            If (LNotEqual (RMDR, Zero))
            {
                Return (RMDR)
            }

            Store (0x01234567, SMDW)
            Multiply (SMDW, 0x02, SMDW)
            If (LNotEqual (SMDW, 0x02468ACE))
            {
                Return (SMDW)
            }

            Divide (SMDW, 0x03, SMDW, RMDR)
            If (LNotEqual (SMDW, 0x00C22E44))
            {
                Return (SMDW)
            }

            If (LNotEqual (RMDR, 0x02))
            {
                Return (RMDR)
            }

            Store (0x0123, SMWD)
            Multiply (SMWD, 0x03, SMWD)
            If (LNotEqual (SMWD, 0x0369))
            {
                Return (SMWD)
            }

            Divide (SMWD, 0x02, SMWD, RMDR)
            If (LNotEqual (SMWD, 0x01B4))
            {
                Return (SMWD)
            }

            If (LNotEqual (RMDR, One))
            {
                Return (RMDR)
            }

            Store (One, SMBY)
            Multiply (SMBY, 0x07, SMBY)
            If (LNotEqual (SMBY, 0x07))
            {
                Return (SMBY)
            }

            Divide (SMBY, 0x04, SMBY, RMDR)
            If (LNotEqual (SMBY, One))
            {
                Return (SMBY)
            }

            If (LNotEqual (RMDR, 0x03))
            {
                Return (RMDR)
            }

            Return (Zero)
        }
    }

    Device (NBIT)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Name (BYT1, 0xFF)
        Name (BYT2, 0xFF)
        Name (BRSL, Zero)
        Name (WRD1, 0xFFFF)
        Name (WRD2, 0xFFFF)
        Name (WRSL, Zero)
        Name (DWD1, Ones)
        Name (DWD2, Ones)
        Name (DRSL, Zero)
        Name (RSLT, One)
        Name (ARSL, Zero)
        Name (LRSL, Zero)
        Method (NNDB, 2, NotSerialized)
        {
            Store (Ones, SMDW)
            Store (0xFFFF, SMWD)
            Store (0xFF, SMBY)
            NAnd (Arg0, Arg1, ARSL)
            If (LNotEqual (ARSL, 0xFFFFFFFD))
            {
                Return (0x0B)
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            NAnd (Local0, Local1, LRSL)
            If (LNotEqual (LRSL, 0xFFFFFFFD))
            {
                Return (0x0C)
            }

            NAnd (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, 0xFFFFFF00))
            {
                Return (0x0D)
            }

            NAnd (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, 0xFFFF0000))
            {
                Return (0x0E)
            }

            NAnd (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (0x0F)
            }

            NAnd (SMBY, 0xFF, BRSL)
            If (LNotEqual (BRSL, 0xFFFFFF00))
            {
                Return (0x10)
            }

            NAnd (SMWD, 0xFFFF, WRSL)
            If (LNotEqual (WRSL, 0xFFFF0000))
            {
                Return (0x11)
            }

            NAnd (SMDW, Ones, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (0x12)
            }

            Return (Zero)
        }

        Method (NNOR, 2, NotSerialized)
        {
            NOr (Arg0, Arg1, ARSL)
            If (LNotEqual (ARSL, 0xFFFFFFFD))
            {
                Return (0x15)
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            NOr (Local0, Local1, LRSL)
            If (LNotEqual (LRSL, 0xFFFFFFFD))
            {
                Return (0x16)
            }

            NOr (BYT1, BYT2, BRSL)
            If (LNotEqual (BRSL, 0xFFFFFF00))
            {
                Return (0x17)
            }

            NOr (WRD1, WRD2, WRSL)
            If (LNotEqual (WRSL, 0xFFFF0000))
            {
                Return (0x18)
            }

            NOr (DWD1, DWD2, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (0x19)
            }

            NOr (SMBY, 0xFF, BRSL)
            If (LNotEqual (BRSL, 0xFFFFFF00))
            {
                Return (0x1A)
            }

            NOr (SMWD, 0xFFFF, WRSL)
            If (LNotEqual (WRSL, 0xFFFF0000))
            {
                Return (0x1B)
            }

            NOr (SMDW, Ones, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (0x1C)
            }

            Return (Zero)
        }

        Method (NNOT, 2, NotSerialized)
        {
            Or (Arg0, Arg1, ARSL)
            Not (ARSL, ARSL)
            If (LNotEqual (ARSL, 0xFFFFFFFD))
            {
                Return (0x1F)
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            Or (Local0, Local1, LRSL)
            Not (LRSL, LRSL)
            If (LNotEqual (LRSL, 0xFFFFFFFD))
            {
                Return (0x20)
            }

            Or (BYT1, BYT2, BRSL)
            Not (BRSL, BRSL)
            If (LNotEqual (BRSL, 0xFFFFFF00))
            {
                Return (0x21)
            }

            Or (WRD1, WRD2, WRSL)
            Not (WRSL, WRSL)
            If (LNotEqual (WRSL, 0xFFFF0000))
            {
                Return (0x22)
            }

            Or (DWD1, DWD2, DRSL)
            Not (DRSL, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (0x23)
            }

            Or (SMBY, 0xFF, BRSL)
            Not (BRSL, BRSL)
            If (LNotEqual (BRSL, 0xFFFFFF00))
            {
                Return (0x24)
            }

            Or (SMWD, 0xFFFF, WRSL)
            Not (WRSL, WRSL)
            If (LNotEqual (WRSL, 0xFFFF0000))
            {
                Return (0x25)
            }

            Or (SMDW, Ones, DRSL)
            Not (DRSL, DRSL)
            If (LNotEqual (DRSL, Zero))
            {
                Return (0x26)
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ NBitOps Test", Debug)
            Store (NNDB (0x02, 0x02), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (NNOR (0x02, 0x02), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (NNOT (0x02, 0x02), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Return (Zero)
        }
    }

    Device (SHFT)
    {
        OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            SMDW,   32, 
            SMWD,   16, 
            SMBY,   8
        }

        Name (SHFC, Zero)
        Name (BYT1, 0xFF)
        Name (BRSL, Zero)
        Name (WRD1, 0xFFFF)
        Name (WRSL, Zero)
        Name (DWD1, Ones)
        Name (DRSL, Zero)
        Name (RSLT, One)
        Name (ARSL, Zero)
        Name (LRSL, Zero)
        Method (SLFT, 2, NotSerialized)
        {
            Store (Ones, SMDW)
            Store (0xFFFF, SMWD)
            Store (0xFF, SMBY)
            ShiftLeft (Arg0, Arg1, ARSL)
            If (LNotEqual (ARSL, 0x08))
            {
                Return (0x0B)
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            ShiftLeft (Local0, Local1, LRSL)
            If (LNotEqual (LRSL, 0x08))
            {
                Return (0x0C)
            }

            Store (0x02, SHFC)
            ShiftLeft (BYT1, SHFC, BRSL)
            If (LNotEqual (BRSL, 0x03FC))
            {
                Return (0x0D)
            }

            Store (0x04, SHFC)
            ShiftLeft (WRD1, SHFC, WRSL)
            If (LNotEqual (WRSL, 0x000FFFF0))
            {
                Return (0x0E)
            }

            Store (0x08, SHFC)
            ShiftLeft (DWD1, SHFC, DRSL)
            If (LNotEqual (DRSL, 0xFFFFFF00))
            {
                Return (0x0F)
            }

            Store (0x04, SHFC)
            ShiftLeft (SMBY, SHFC, BRSL)
            If (LNotEqual (BRSL, 0x0FF0))
            {
                Return (0x10)
            }

            Store (0x04, SHFC)
            ShiftLeft (SMWD, SHFC, WRSL)
            If (LNotEqual (WRSL, 0x000FFFF0))
            {
                Return (0x11)
            }

            Store (0x08, SHFC)
            ShiftLeft (SMDW, SHFC, DRSL)
            If (LNotEqual (DRSL, 0xFFFFFF00))
            {
                Return (0x12)
            }

            Return (Zero)
        }

        Method (SRGT, 2, NotSerialized)
        {
            Store (0xFF, BYT1)
            Store (Zero, BRSL)
            Store (0xFFFF, WRD1)
            Store (Zero, WRSL)
            Store (Ones, DWD1)
            Store (Zero, DRSL)
            Store (Zero, ARSL)
            Store (Zero, LRSL)
            Store (Ones, SMDW)
            Store (0xFFFF, SMWD)
            Store (0xFF, SMBY)
            ShiftRight (Arg0, Arg1, ARSL)
            If (LNotEqual (ARSL, Zero))
            {
                Return (0x15)
            }

            Store (Arg0, Local0)
            Store (Arg1, Local1)
            ShiftRight (Local0, Local1, LRSL)
            If (LNotEqual (LRSL, Zero))
            {
                Return (0x16)
            }

            Store (0x02, SHFC)
            ShiftRight (BYT1, SHFC, BRSL)
            If (LNotEqual (BRSL, 0x3F))
            {
                Return (0x17)
            }

            Store (0x04, SHFC)
            ShiftRight (WRD1, SHFC, WRSL)
            If (LNotEqual (WRSL, 0x0FFF))
            {
                Return (0x18)
            }

            Store (0x08, SHFC)
            ShiftRight (DWD1, SHFC, DRSL)
            If (LNotEqual (DRSL, 0x00FFFFFF))
            {
                Return (0x19)
            }

            Store (0x04, SHFC)
            ShiftRight (SMBY, SHFC, BRSL)
            If (LNotEqual (BRSL, 0x0F))
            {
                Return (0x1A)
            }

            Store (0x04, SHFC)
            ShiftRight (SMWD, SHFC, WRSL)
            If (LNotEqual (WRSL, 0x0FFF))
            {
                Return (0x1B)
            }

            Store (0x08, SHFC)
            ShiftRight (SMDW, SHFC, DRSL)
            If (LNotEqual (DRSL, 0x00FFFFFF))
            {
                Return (0x1C)
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ ShftOp Test", Debug)
            Store (SLFT (0x02, 0x02), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Store (SRGT (0x02, 0x02), RSLT)
            If (LNotEqual (RSLT, Zero))
            {
                Return (RSLT)
            }

            Return (Zero)
        }
    }

    Device (XORD)
    {
        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ Xor Test", Debug)
            OperationRegion (RAM, SystemMemory, 0x00800000, 0x0100)
            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                RES1,   1, 
                BYT1,   8, 
                BYT2,   8, 
                RBYT,   8, 
                RES2,   1, 
                WRD1,   16, 
                WRD2,   16, 
                RWRD,   16, 
                RES3,   1, 
                DWD1,   32, 
                DWD2,   32, 
                RDWD,   32, 
                RES4,   1
            }

            Store (One, RES1)
            Store (One, RES2)
            Store (One, RES3)
            Store (One, RES4)
            If (LNotEqual (RES1, One))
            {
                Return (One)
            }

            If (LNotEqual (RES2, One))
            {
                Return (One)
            }

            If (LNotEqual (RES3, One))
            {
                Return (One)
            }

            If (LNotEqual (RES4, One))
            {
                Return (One)
            }

            Store (Zero, BYT1)
            Store (Zero, BYT2)
            XOr (BYT1, BYT2, Local0)
            Store (Local0, RBYT)
            If (LNotEqual (RBYT, Zero))
            {
                Return (One)
            }

            Store (0xFF, BYT1)
            Store (0xFF, BYT2)
            XOr (BYT1, BYT2, Local0)
            Store (Local0, RBYT)
            If (LNotEqual (RBYT, Zero))
            {
                Return (One)
            }

            Store (0x55, BYT1)
            Store (0xAA, BYT2)
            XOr (BYT1, BYT2, Local0)
            Store (Local0, RBYT)
            If (LNotEqual (RBYT, 0xFF))
            {
                Return (One)
            }

            Store (0xAA, BYT1)
            Store (0x55, BYT2)
            XOr (BYT1, BYT2, Local0)
            Store (Local0, RBYT)
            If (LNotEqual (RBYT, 0xFF))
            {
                Return (One)
            }

            Store (0x12, BYT1)
            Store (0xED, BYT2)
            XOr (BYT1, BYT2, Local0)
            Store (Local0, RBYT)
            If (LNotEqual (RBYT, 0xFF))
            {
                Return (One)
            }

            Store (0x12, BYT1)
            If (LNotEqual (BYT1, 0x12))
            {
                Return (One)
            }

            Store (0xFE, BYT2)
            If (LNotEqual (BYT2, 0xFE))
            {
                Return (One)
            }

            Store (0xAB, RBYT)
            If (LNotEqual (RBYT, 0xAB))
            {
                Return (One)
            }

            Store (Zero, WRD1)
            Store (Zero, WRD2)
            XOr (WRD1, WRD2, RWRD)
            If (LNotEqual (RWRD, Zero))
            {
                Return (One)
            }

            Store (0xFFFF, WRD1)
            Store (0xFFFF, WRD2)
            XOr (WRD1, WRD2, RWRD)
            If (LNotEqual (RWRD, Zero))
            {
                Return (One)
            }

            Store (0x5555, WRD1)
            Store (0xAAAA, WRD2)
            XOr (WRD1, WRD2, RWRD)
            If (LNotEqual (RWRD, 0xFFFF))
            {
                Return (One)
            }

            Store (0xAAAA, WRD1)
            Store (0x5555, WRD2)
            XOr (WRD1, WRD2, RWRD)
            If (LNotEqual (RWRD, 0xFFFF))
            {
                Return (One)
            }

            Store (0x1234, WRD1)
            Store (0xEDCB, WRD2)
            XOr (WRD1, WRD2, RWRD)
            If (LNotEqual (RWRD, 0xFFFF))
            {
                Return (One)
            }

            Store (0x1234, WRD1)
            If (LNotEqual (WRD1, 0x1234))
            {
                Return (One)
            }

            Store (0xFEDC, WRD2)
            If (LNotEqual (WRD2, 0xFEDC))
            {
                Return (One)
            }

            Store (0x87AB, RWRD)
            If (LNotEqual (RWRD, 0x87AB))
            {
                Return (One)
            }

            Store (Zero, DWD1)
            Store (Zero, DWD2)
            XOr (DWD1, DWD2, RDWD)
            If (LNotEqual (RDWD, Zero))
            {
                Return (One)
            }

            Store (Ones, DWD1)
            Store (Ones, DWD2)
            XOr (DWD1, DWD2, RDWD)
            If (LNotEqual (RDWD, Zero))
            {
                Return (One)
            }

            Store (0x55555555, DWD1)
            Store (0xAAAAAAAA, DWD2)
            XOr (DWD1, DWD2, RDWD)
            If (LNotEqual (RDWD, Ones))
            {
                Return (One)
            }

            Store (0xAAAAAAAA, DWD1)
            Store (0x55555555, DWD2)
            XOr (DWD1, DWD2, RDWD)
            If (LNotEqual (RDWD, Ones))
            {
                Return (One)
            }

            Store (0x12345678, DWD1)
            Store (0xEDCBA987, DWD2)
            XOr (DWD1, DWD2, RDWD)
            If (LNotEqual (RDWD, Ones))
            {
                Return (One)
            }

            Store (0x12345678, DWD1)
            If (LNotEqual (DWD1, 0x12345678))
            {
                Return (One)
            }

            Store (0xFEDCBA98, DWD2)
            If (LNotEqual (DWD2, 0xFEDCBA98))
            {
                Return (One)
            }

            Store (0x91827364, RDWD)
            If (LNotEqual (RDWD, 0x91827364))
            {
                Return (One)
            }

            If (LNotEqual (RES1, One))
            {
                Return (One)
            }

            If (LNotEqual (RES2, One))
            {
                Return (One)
            }

            If (LNotEqual (RES3, One))
            {
                Return (One)
            }

            If (LNotEqual (RES4, One))
            {
                Return (One)
            }

            Store (Zero, RES1)
            Store (Zero, RES2)
            Store (Zero, RES3)
            Store (Zero, RES4)
            If (LNotEqual (BYT1, 0x12))
            {
                Return (One)
            }

            If (LNotEqual (BYT2, 0xFE))
            {
                Return (One)
            }

            If (LNotEqual (RBYT, 0xAB))
            {
                Return (One)
            }

            If (LNotEqual (WRD1, 0x1234))
            {
                Return (One)
            }

            If (LNotEqual (WRD2, 0xFEDC))
            {
                Return (One)
            }

            If (LNotEqual (RWRD, 0x87AB))
            {
                Return (One)
            }

            If (LNotEqual (DWD1, 0x12345678))
            {
                Return (One)
            }

            If (LNotEqual (DWD2, 0xFEDCBA98))
            {
                Return (One)
            }

            If (LNotEqual (RDWD, 0x91827364))
            {
                Return (One)
            }

            If (LNotEqual (RES1, Zero))
            {
                Return (One)
            }

            If (LNotEqual (RES2, Zero))
            {
                Return (One)
            }

            If (LNotEqual (RES3, Zero))
            {
                Return (One)
            }

            If (LNotEqual (RES4, Zero))
            {
                Return (One)
            }

            Return (Zero)
        }
    }

    Device (CRBF)
    {
        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ CrBytFld Test", Debug)
            Store (Buffer (0x04) {}, Local0)
            CreateByteField (Local0, Zero, BF0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x02)
            }

            Store (One, BF0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x03)
            }

            If (LNotEqual (BF0, One))
            {
                Return (0x04)
            }

            CreateByteField (Local0, One, BF1)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x0A)
            }

            Store (0x05, BF1)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x0B)
            }

            If (LNotEqual (BF1, 0x05))
            {
                Return (0x0C)
            }

            If (LNotEqual (BF0, One))
            {
                Return (0x0D)
            }

            Store (0xFFFF, BF0)
            If (LNotEqual (BF0, 0xFF))
            {
                Return (0x14)
            }

            If (LNotEqual (BF1, 0x05))
            {
                Return (0x15)
            }

            Return (Zero)
        }
    }

    Device (IDX4)
    {
        Method (MADM, 1, NotSerialized)
        {
            OperationRegion (RAM, SystemMemory, Arg0, 0x0100)
            Field (RAM, DWordAcc, NoLock, Preserve)
            {
                DWD0,   32, 
                DWD1,   32
            }

            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                BIT0,   1, 
                BIT1,   1, 
                BIT2,   1, 
                BIT3,   1, 
                BIT4,   1, 
                BIT5,   1, 
                BIT6,   1, 
                BIT7,   1, 
                BIT8,   1, 
                BIT9,   1, 
                BITA,   1, 
                BITB,   1, 
                BITC,   1, 
                BITD,   1, 
                BITE,   1, 
                BITF,   1, 
                BI10,   1, 
                BI11,   1, 
                BI12,   1, 
                BI13,   1, 
                BI14,   1, 
                BI15,   1, 
                BI16,   1, 
                BI17,   1, 
                BI18,   1, 
                BI19,   1, 
                BI1A,   1, 
                BI1B,   1, 
                BI1C,   1, 
                BI1D,   1, 
                BI1E,   1, 
                BI1F,   1
            }

            Field (RAM, ByteAcc, NoLock, Preserve)
            {
                B2_0,   2, 
                B2_1,   2, 
                B2_2,   2, 
                B2_3,   2, 
                B2_4,   2, 
                B2_5,   2, 
                B2_6,   2, 
                B2_7,   2, 
                B2_8,   2, 
                B2_9,   2, 
                B2_A,   2, 
                B2_B,   2, 
                B2_C,   2, 
                B2_D,   2, 
                B2_E,   2, 
                B2_F,   2
            }

            Store (0x5AA55AA5, DWD0)
            Store (0x5AA55AA5, DWD1)
            Store (Zero, BIT0)
            If (LNotEqual (BIT0, Zero))
            {
                Return (One)
            }

            If (LNotEqual (DWD0, 0x5AA55AA4))
            {
                Return (0x02)
            }

            Store (One, BIT1)
            If (LNotEqual (BIT1, One))
            {
                Return (0x03)
            }

            If (LNotEqual (DWD0, 0x5AA55AA6))
            {
                Return (0x04)
            }

            Store (Zero, BIT2)
            If (LNotEqual (BIT2, Zero))
            {
                Return (0x05)
            }

            If (LNotEqual (DWD0, 0x5AA55AA2))
            {
                Return (0x06)
            }

            Store (One, BIT3)
            If (LNotEqual (BIT3, One))
            {
                Return (0x07)
            }

            If (LNotEqual (DWD0, 0x5AA55AAA))
            {
                Return (0x08)
            }

            Store (One, BIT4)
            If (LNotEqual (BIT4, One))
            {
                Return (0x09)
            }

            If (LNotEqual (DWD0, 0x5AA55ABA))
            {
                Return (0x0A)
            }

            Store (Zero, BIT5)
            If (LNotEqual (BIT5, Zero))
            {
                Return (0x0B)
            }

            If (LNotEqual (DWD0, 0x5AA55A9A))
            {
                Return (0x0C)
            }

            Store (One, BIT6)
            If (LNotEqual (BIT6, One))
            {
                Return (0x0D)
            }

            If (LNotEqual (DWD0, 0x5AA55ADA))
            {
                Return (0x0E)
            }

            Store (Zero, BIT7)
            If (LNotEqual (BIT7, Zero))
            {
                Return (0x0F)
            }

            If (LNotEqual (DWD0, 0x5AA55A5A))
            {
                Return (0x10)
            }

            Store (One, BIT8)
            If (LNotEqual (BIT8, One))
            {
                Return (0x11)
            }

            If (LNotEqual (DWD0, 0x5AA55B5A))
            {
                Return (0x12)
            }

            Store (Zero, BIT9)
            If (LNotEqual (BIT9, Zero))
            {
                Return (0x13)
            }

            If (LNotEqual (DWD0, 0x5AA5595A))
            {
                Return (0x14)
            }

            Store (One, BITA)
            If (LNotEqual (BITA, One))
            {
                Return (0x15)
            }

            If (LNotEqual (DWD0, 0x5AA55D5A))
            {
                Return (0x16)
            }

            Store (Zero, BITB)
            If (LNotEqual (BITB, Zero))
            {
                Return (0x17)
            }

            If (LNotEqual (DWD0, 0x5AA5555A))
            {
                Return (0x18)
            }

            Store (Zero, BITC)
            If (LNotEqual (BITC, Zero))
            {
                Return (0x19)
            }

            If (LNotEqual (DWD0, 0x5AA5455A))
            {
                Return (0x1A)
            }

            Store (One, BITD)
            If (LNotEqual (BITD, One))
            {
                Return (0x1B)
            }

            If (LNotEqual (DWD0, 0x5AA5655A))
            {
                Return (0x1C)
            }

            Store (Zero, BITE)
            If (LNotEqual (BITE, Zero))
            {
                Return (0x1D)
            }

            If (LNotEqual (DWD0, 0x5AA5255A))
            {
                Return (0x1E)
            }

            Store (One, BITF)
            If (LNotEqual (BITF, One))
            {
                Return (0x1F)
            }

            If (LNotEqual (DWD0, 0x5AA5A55A))
            {
                Return (0x20)
            }

            Store (Zero, BI10)
            If (LNotEqual (BI10, Zero))
            {
                Return (0x21)
            }

            If (LNotEqual (DWD0, 0x5AA4A55A))
            {
                Return (0x22)
            }

            Store (One, BI11)
            If (LNotEqual (BI11, One))
            {
                Return (0x23)
            }

            If (LNotEqual (DWD0, 0x5AA6A55A))
            {
                Return (0x24)
            }

            Store (Zero, BI12)
            If (LNotEqual (BI12, Zero))
            {
                Return (0x25)
            }

            If (LNotEqual (DWD0, 0x5AA2A55A))
            {
                Return (0x26)
            }

            Store (One, BI13)
            If (LNotEqual (BI13, One))
            {
                Return (0x27)
            }

            If (LNotEqual (DWD0, 0x5AAAA55A))
            {
                Return (0x28)
            }

            Store (One, BI14)
            If (LNotEqual (BI14, One))
            {
                Return (0x29)
            }

            If (LNotEqual (DWD0, 0x5ABAA55A))
            {
                Return (0x2A)
            }

            Store (Zero, BI15)
            If (LNotEqual (BI15, Zero))
            {
                Return (0x2B)
            }

            If (LNotEqual (DWD0, 0x5A9AA55A))
            {
                Return (0x2C)
            }

            Store (One, BI16)
            If (LNotEqual (BI16, One))
            {
                Return (0x2D)
            }

            If (LNotEqual (DWD0, 0x5ADAA55A))
            {
                Return (0x2E)
            }

            Store (Zero, BI17)
            If (LNotEqual (BI17, Zero))
            {
                Return (0x2F)
            }

            If (LNotEqual (DWD0, 0x5A5AA55A))
            {
                Return (0x30)
            }

            Store (One, BI18)
            If (LNotEqual (BI18, One))
            {
                Return (0x31)
            }

            If (LNotEqual (DWD0, 0x5B5AA55A))
            {
                Return (0x32)
            }

            Store (Zero, BI19)
            If (LNotEqual (BI19, Zero))
            {
                Return (0x33)
            }

            If (LNotEqual (DWD0, 0x595AA55A))
            {
                Return (0x34)
            }

            Store (One, BI1A)
            If (LNotEqual (BI1A, One))
            {
                Return (0x35)
            }

            If (LNotEqual (DWD0, 0x5D5AA55A))
            {
                Return (0x36)
            }

            Store (Zero, BI1B)
            If (LNotEqual (BI1B, Zero))
            {
                Return (0x37)
            }

            If (LNotEqual (DWD0, 0x555AA55A))
            {
                Return (0x38)
            }

            Store (Zero, BI1C)
            If (LNotEqual (BI1C, Zero))
            {
                Return (0x39)
            }

            If (LNotEqual (DWD0, 0x455AA55A))
            {
                Return (0x3A)
            }

            Store (One, BI1D)
            If (LNotEqual (BI1D, One))
            {
                Return (0x3B)
            }

            If (LNotEqual (DWD0, 0x655AA55A))
            {
                Return (0x3C)
            }

            Store (Zero, BI1E)
            If (LNotEqual (BI1E, Zero))
            {
                Return (0x3D)
            }

            If (LNotEqual (DWD0, 0x255AA55A))
            {
                Return (0x3E)
            }

            Store (One, BI1F)
            If (LNotEqual (BI1F, One))
            {
                Return (0x3F)
            }

            If (LNotEqual (DWD0, 0xA55AA55A))
            {
                Return (0x40)
            }

            Store (0x03, B2_0)
            If (LNotEqual (B2_0, 0x03))
            {
                Return (0x41)
            }

            If (LNotEqual (DWD0, 0xA55AA55B))
            {
                Return (0x42)
            }

            Store (One, B2_1)
            If (LNotEqual (B2_1, One))
            {
                Return (0x43)
            }

            If (LNotEqual (DWD0, 0xA55AA557))
            {
                Return (0x44)
            }

            Store (Zero, B2_2)
            If (LNotEqual (B2_2, Zero))
            {
                Return (0x45)
            }

            If (LNotEqual (DWD0, 0xA55AA547))
            {
                Return (0x46)
            }

            Store (0x03, B2_3)
            If (LNotEqual (B2_3, 0x03))
            {
                Return (0x47)
            }

            If (LNotEqual (DWD0, 0xA55AA5C7))
            {
                Return (0x48)
            }

            Store (0x03, B2_4)
            If (LNotEqual (B2_4, 0x03))
            {
                Return (0x49)
            }

            If (LNotEqual (DWD0, 0xA55AA7C7))
            {
                Return (0x4A)
            }

            Store (Zero, B2_5)
            If (LNotEqual (B2_5, Zero))
            {
                Return (0x4B)
            }

            If (LNotEqual (DWD0, 0xA55AA3C7))
            {
                Return (0x4C)
            }

            Store (One, B2_6)
            If (LNotEqual (B2_6, One))
            {
                Return (0x4D)
            }

            If (LNotEqual (DWD0, 0xA55A93C7))
            {
                Return (0x4E)
            }

            Store (One, B2_7)
            If (LNotEqual (B2_7, One))
            {
                Return (0x4F)
            }

            If (LNotEqual (DWD0, 0xA55A53C7))
            {
                Return (0x50)
            }

            Store (Zero, B2_8)
            If (LNotEqual (B2_8, Zero))
            {
                Return (0x51)
            }

            If (LNotEqual (DWD0, 0xA55853C7))
            {
                Return (0x52)
            }

            Store (One, B2_9)
            If (LNotEqual (B2_9, One))
            {
                Return (0x53)
            }

            If (LNotEqual (DWD0, 0xA55453C7))
            {
                Return (0x54)
            }

            Store (0x02, B2_A)
            If (LNotEqual (B2_A, 0x02))
            {
                Return (0x55)
            }

            If (LNotEqual (DWD0, 0xA56453C7))
            {
                Return (0x56)
            }

            Store (0x02, B2_B)
            If (LNotEqual (B2_B, 0x02))
            {
                Return (0x57)
            }

            If (LNotEqual (DWD0, 0xA5A453C7))
            {
                Return (0x58)
            }

            Store (0x03, B2_C)
            If (LNotEqual (B2_C, 0x03))
            {
                Return (0x59)
            }

            If (LNotEqual (DWD0, 0xA7A453C7))
            {
                Return (0x5A)
            }

            Store (0x03, B2_D)
            If (LNotEqual (B2_D, 0x03))
            {
                Return (0x5B)
            }

            If (LNotEqual (DWD0, 0xAFA453C7))
            {
                Return (0x5C)
            }

            Store (One, B2_E)
            If (LNotEqual (B2_E, One))
            {
                Return (0x5D)
            }

            If (LNotEqual (DWD0, 0x9FA453C7))
            {
                Return (0x5E)
            }

            Store (Zero, B2_F)
            If (LNotEqual (B2_F, Zero))
            {
                Return (0x5F)
            }

            If (LNotEqual (DWD0, 0x1FA453C7))
            {
                Return (0x60)
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IndexOp4 Test", Debug)
            Store (MADM (0x00800000), Local0)
            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Return (Local0)
        }
    }

    Device (EVNT)
    {
        Event (EVNT)
        Method (TEVN, 1, NotSerialized)
        {
            Reset (EVNT)
            Signal (EVNT)
            Signal (EVNT)
            Store (Wait (EVNT, Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x21)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (0x22)
            }

            Store ("Acquire 1st existing signal PASS", Debug)
            Store (Wait (EVNT, Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x31)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (0x32)
            }

            Store ("Acquire 2nd existing signal PASS", Debug)
            If (LEqual (Arg0, 0xFFFF))
            {
                Store (0xFFFE, Arg0)
            }

            Store (Wait (EVNT, Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x41)
            }

            If (LEqual (Local0, Zero))
            {
                Return (0x42)
            }

            Store ("Acquire signal timeout PASS", Debug)
            Signal (EVNT)
            Signal (EVNT)
            Reset (EVNT)
            Store (Wait (EVNT, Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x51)
            }

            If (LEqual (Local0, Zero))
            {
                Return (0x52)
            }

            Store ("Reset signal PASS", Debug)
            Store (Wait (EVNT, Zero), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x61)
            }

            If (LEqual (Local0, Zero))
            {
                Return (0x62)
            }

            Store ("Zero Lvalue PASS", Debug)
            Store (Wait (EVNT, One), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x71)
            }

            If (LEqual (Local0, Zero))
            {
                Return (0x72)
            }

            Store ("One Lvalue PASS", Debug)
            Store (ObjectType (EVNT), Local1)
            If (LNotEqual (Local1, 0x07))
            {
                Return (0x81)
            }

            Reset (EVNT)
            Signal (EVNT)
            Store (Wait (EVNT, Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x82)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (0x83)
            }

            Store ("Acquire Lvalue existing signal PASS", Debug)
            Store (Wait (EVNT, Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x84)
            }

            If (LEqual (Local0, Zero))
            {
                Return (0x85)
            }

            Store ("Acquire Lvalue signal timeout PASS", Debug)
            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ Event Test", Debug)
            Store (TEVN (0x64), Local0)
            Return (Local0)
        }
    }

    Name (PKG0, Package (0x03)
    {
        0x0123, 
        0x4567, 
        0x89AB
    })
    Name (PKG1, Package (0x03)
    {
        Package (0x03)
        {
            0x0123, 
            0x4567, 
            0x89AB
        }, 

        Package (0x03)
        {
            0xCDEF, 
            0xFEDC, 
            0xBA98
        }, 

        Package (0x03)
        {
            0x7654, 
            0x3210, 
            0x1234
        }
    })
    Name (PKG2, Package (0x04)
    {
        0x0123, 
        0x4567, 
        0x89AB, 
        0x8888
    })
    Name (PKG3, Package (0x05)
    {
        0x0123, 
        0x4567, 
        0x89AB, 
        0x8888, 
        0x7777
    })
    Name (STR0, "ACPI permits very flexible methods of expressing a system")
    Name (STR1, "MIKE permits very flexible methods of expressing a system")
    Name (STR2, "Needless to say, Mike and ACPI are frequently at odds")
    Name (STR3, "12345")
    Name (BUF0, Buffer (0x0A) {})
    Name (BUF1, Buffer (0x0A) {})
    Name (BUF2, Buffer (0x08) {})
    Name (BUF3, Buffer (0x05) {})
    Device (SZLV)
    {
        Method (CMPR, 2, NotSerialized)
        {
            Store (One, Local0)
            If (LEqual (SizeOf (Arg0), SizeOf (Arg1)))
            {
                Store (Zero, Local0)
            }

            Return (Local0)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ SizeOfLv Test", Debug)
            If (LNotEqual (Zero, CMPR (STR0, STR1)))
            {
                Return (One)
            }

            If (LNotEqual (Zero, CMPR (STR3, BUF3)))
            {
                Return (0x02)
            }

            If (LNotEqual (Zero, CMPR (STR3, PKG3)))
            {
                Return (0x03)
            }

            Store (STR0, Local0)
            Store (STR1, Local1)
            If (LNotEqual (SizeOf (Local0), SizeOf (Local1)))
            {
                Return (0x04)
            }

            Store (STR2, Local1)
            If (LEqual (SizeOf (Local0), SizeOf (Local1)))
            {
                Return (0x05)
            }

            If (LNotEqual (0x05, SizeOf (BUF3)))
            {
                Return (0x06)
            }

            Return (Zero)
        }
    }

    Scope (_SB)
    {
        Device (BYTF)
        {
            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ BytField Test", Debug)
                Return (\_TZ.C19B.RSLT)
            }
        }

        Device (C005)
        {
            Device (C013)
            {
            }
        }

        Method (C115, 0, NotSerialized)
        {
            Acquire (_GL, 0xFFFF)
            Store (^C005.C013.C058.C07E, Local0)
            Release (_GL)
            And (Local0, 0x10, Local0)
            Store (ShiftRight (Local0, 0x04), Local1)
            If (LEqual (Local1, Zero))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    OperationRegion (C018, SystemIO, 0x5028, 0x04)
    Field (C018, AnyAcc, NoLock, Preserve)
    {
        C019,   32
    }

    OperationRegion (C01A, SystemIO, 0x5030, 0x04)
    Field (C01A, ByteAcc, NoLock, Preserve)
    {
        C01B,   8, 
        C01C,   8, 
        C01D,   8, 
        C01E,   8
    }

    Mutex (C01F, 0x00)
    Name (C020, Zero)
    Name (C021, Zero)
    Method (C022, 0, NotSerialized)
    {
        Acquire (C01F, 0xFFFF)
        If (LEqual (C021, Zero))
        {
            Store (C019, Local0)
            And (Local0, 0xFFFEFFFE, Local0)
            Store (Local0, C019)
            Increment (C021)
        }

        Release (C01F)
    }

    Scope (_SB.C005.C013)
    {
        Device (C058)
        {
            Name (_HID, "*PNP0A06")  // _HID: Hardware ID
            OperationRegion (C059, SystemIO, 0xE0, 0x02)
            Field (C059, ByteAcc, NoLock, Preserve)
            {
                C05A,   8, 
                C05B,   8
            }

            OperationRegion (C05C, SystemIO, 0xE2, 0x02)
            Field (C05C, ByteAcc, NoLock, Preserve)
            {
                C05D,   8, 
                C05E,   8
            }

            IndexField (C05D, C05E, ByteAcc, NoLock, Preserve)
            {
                Offset (0x82), 
                C05F,   8, 
                C060,   8, 
                C061,   8, 
                C062,   8, 
                C063,   8, 
                C064,   8, 
                C065,   8, 
                C066,   8, 
                C067,   8, 
                C068,   8, 
                C069,   8, 
                C06A,   8, 
                C06B,   8, 
                C06C,   8, 
                C06D,   8, 
                C06E,   8, 
                Offset (0xA0), 
                C06F,   8, 
                C070,   8, 
                C071,   8, 
                C072,   8, 
                C073,   8, 
                C074,   8, 
                C075,   8, 
                C076,   8, 
                C077,   8, 
                C078,   8, 
                C079,   8, 
                C07A,   8, 
                C07B,   8, 
                C07C,   8, 
                C07D,   8, 
                C07E,   8
            }

            OperationRegion (C07F, SystemIO, 0xE4, 0x02)
            Field (C07F, ByteAcc, NoLock, Preserve)
            {
                C080,   8, 
                C081,   8
            }

            OperationRegion (C082, SystemIO, 0xE0, One)
            Field (C082, ByteAcc, NoLock, Preserve)
            {
                C083,   8
            }

            OperationRegion (C084, SystemIO, 0xFF, One)
            Field (C084, ByteAcc, NoLock, Preserve)
            {
                C085,   8
            }

            OperationRegion (C086, SystemIO, 0xFD, One)
            Field (C086, ByteAcc, NoLock, Preserve)
            {
                C087,   8
            }

            Mutex (C088, 0x00)
            Mutex (C089, 0x00)
            Mutex (C08A, 0x00)
            Mutex (C08B, 0x00)
            Mutex (C08C, 0x00)
            Mutex (C08D, 0x00)
            Name (C08E, 0xFFFFFFFD)
            Name (C08F, Zero)
            Method (C0AA, 4, NotSerialized)
            {
                Store (Buffer (0x04) {}, Local7)
                CreateByteField (Local7, Zero, C0AB)
                CreateByteField (Local7, One, C0AC)
                CreateByteField (Local7, 0x02, C0AD)
                CreateByteField (Local7, 0x03, C0AE)
                Acquire (C08B, 0xFFFF)
                Acquire (_GL, 0xFFFF)
                C022 ()
                Store (One, C06B)
                While (LNotEqual (Zero, C06B))
                {
                    Stall (0x64)
                }

                Store (Arg3, C06E)
                Store (Arg2, C06D)
                Store (Arg1, C06C)
                Store (Arg0, C06B)
                While (LNotEqual (Zero, C06B))
                {
                    Stall (0x64)
                }

                Store (C06E, C0AB)
                Store (C06D, C0AC)
                Store (C06C, C0AD)
                Store (C06B, C0AE)
                If (LNotEqual (Arg0, 0x17))
                {
                    Store (0x02, C06B)
                    Stall (0x64)
                }

                Release (_GL)
                Release (C08B)
                Return (Local7)
            }
        }
    }

    Scope (_TZ)
    {
        Name (C18B, Package (0x02)
        {
            Package (0x02)
            {
                Package (0x05)
                {
                    0x05AC, 
                    0x0CD2, 
                    0x0D68, 
                    0x0DE0, 
                    0x0E4E
                }, 

                Package (0x05)
                {
                    0x0D04, 
                    0x0D9A, 
                    0x0DFE, 
                    0x0E80, 
                    0x0FA2
                }
            }, 

            Package (0x02)
            {
                Package (0x05)
                {
                    0x05AC, 
                    0x0CD2, 
                    0x0D68, 
                    0x0DE0, 
                    0x0E4E
                }, 

                Package (0x05)
                {
                    0x0D04, 
                    0x0D9A, 
                    0x0DFE, 
                    0x0E80, 
                    0x0FA2
                }
            }
        })
        Name (C18C, Package (0x02)
        {
            Package (0x02)
            {
                Package (0x03)
                {
                    0x64, 
                    0x4B, 
                    0x32
                }, 

                Package (0x03)
                {
                    0x64, 
                    0x4B, 
                    0x32
                }
            }
        })
        Name (C18D, Zero)
        Name (C18E, Zero)
        Name (C18F, Zero)
        Name (C190, Zero)
        Name (C191, 0x03)
        Name (C192, Zero)
        Name (C193, One)
        Name (C194, 0x02)
        Mutex (C195, 0x00)
        Name (C196, One)
        Name (C197, 0x0B9C)
        Name (C198, 0x0B9C)
        Name (C199, 0xFFFFFFFD)
        Name (C19A, Zero)
        Device (C19B)
        {
            Name (RSLT, Zero)
            Method (XINI, 0, NotSerialized)
            {
                Store (\_SB.C115 (), C19A)
                ^^C19C._SCP (Zero)
                Subtract (0x0EB2, 0x0AAC, Local1)
                Divide (Local1, 0x0A, Local0, Local2)
                \_SB.C005.C013.C058.C0AA (0x0E, Local2, Zero, Zero)
                Store (DerefOf (Index (DerefOf (Index (C18C, C19A)), Zero)), 
                    C18D)
                Store (DerefOf (Index (DerefOf (Index (C18C, C19A)), One)), 
                    C18E)
                Store (DerefOf (Index (DerefOf (Index (C18C, C19A)), 0x02)), 
                    C18F)
                Store (One, RSLT)
            }
        }

        ThermalZone (C19C)
        {
            Method (_SCP, 1, NotSerialized)  // _SCP: Set Cooling Policy
            {
                Store (Arg0, Local0)
                If (LEqual (Local0, Zero))
                {
                    Store (Zero, C192)
                    Store (One, C193)
                    Store (0x02, C194)
                    Store (0x03, C191)
                }
                Else
                {
                    Store (Zero, C191)
                    Store (One, C192)
                    Store (0x02, C193)
                    Store (0x03, C194)
                }
            }
        }
    }

    Name (BUFR, Buffer (0x0A)
    {
        /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        /* 0008 */   0x00, 0x00
    })
    Device (DWDF)
    {
        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ DwrdFld Test", Debug)
            CreateByteField (BUFR, Zero, BYTE)
            Store (0xAA, BYTE)
            CreateWordField (BUFR, One, WORD)
            Store (0xBBCC, WORD)
            CreateDWordField (BUFR, 0x03, DWRD)
            Store (0xDDEEFF00, DWRD)
            CreateByteField (BUFR, 0x07, BYT2)
            Store (0x11, BYT2)
            CreateWordField (BUFR, 0x08, WRD2)
            Store (0x2233, WRD2)
            Return (Zero)
        }
    }

    Name (B1LO, 0xAA)
    Name (B1HI, 0xBB)
    Method (MKW, 2, NotSerialized)
    {
        Multiply (B1HI, 0x0100, Local0)
        Or (Local0, B1LO, Local0)
        Return (Local0)
    }

    Device (DVAX)
    {
        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ DivAddx Test", Debug)
            Store (0x19, B1LO)
            Store (Zero, B1HI)
            Divide (Add (Multiply (0x03, MKW (B1LO, B1HI)), 0x63), 
                0x64, Local4, Local2)
            If (LAnd (LEqual (0x4A, Local4), LEqual (One, Local2)))
            {
                Store (Zero, Local0)
            }
            Else
            {
                Store (One, Local0)
            }

            Return (Local0)
        }
    }

    Device (IDX6)
    {
        OperationRegion (SIO, SystemIO, 0x0100, 0x02)
        Field (SIO, ByteAcc, NoLock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        IndexField (INDX, DATA, AnyAcc, NoLock, WriteAsOnes)
        {
            AccessAs (ByteAcc, 0x00), 
            IFE0,   8, 
            IFE1,   8, 
            IFE2,   8, 
            IFE3,   8, 
            IFE4,   8, 
            IFE5,   8, 
            IFE6,   8, 
            IFE7,   8, 
            IFE8,   8, 
            IFE9,   8
        }

        Device (TST)
        {
            OperationRegion (SIO2, SystemIO, 0x0100, 0x02)
            Field (SIO2, ByteAcc, NoLock, Preserve)
            {
                IND2,   8, 
                DAT2,   8
            }

            IndexField (IND2, DAT2, AnyAcc, NoLock, WriteAsOnes)
            {
                IFE0,   8, 
                IFE1,   8
            }
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IndexOp6 Test", Debug)
            Store (IFE0, Local0)
            Store (IFE1, Local1)
            Store (IFE2, Local2)
            Store (IFE0, Local3)
            Store (IFE1, Local4)
            Store (^TST.IFE0, Local5)
            Store (^TST.IFE1, Local6)
            Return (Zero)
        }
    }

    Device (IDX5)
    {
        Name (OSFL, Zero)
        Method (MCTH, 2, NotSerialized)
        {
            If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Add (SizeOf (Arg0), One, Local0)
            Name (BUF0, Buffer (Local0) {})
            Name (BUF1, Buffer (Local0) {})
            Store (Arg0, BUF0)
            Store (Arg1, BUF1)
            Store (ObjectType (BUF0), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x14)
            }

            Store (ObjectType (BUF1), Local1)
            If (LNotEqual (Local1, 0x03))
            {
                Return (0x15)
            }

            Decrement (Local0)
            While (Local0)
            {
                Decrement (Local0)
                If (LEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (BUF1, 
                    Local0)))) {}
                Else
                {
                    Return (Zero)
                }
            }

            Return (One)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IndexOp5 Test", Debug)
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (One, OSFL)
            }

            If (LNotEqual (OSFL, One))
            {
                Return (0x0B)
            }

            Return (Zero)
        }
    }

    Scope (_SB)
    {
        Method (C097, 0, NotSerialized)
        {
            Return (One)
        }

        Device (PCI2)
        {
            Name (_HID, EisaId ("PNP0A03"))  // _HID: Hardware ID
            Name (_ADR, Zero)  // _ADR: Address
            Name (_CRS, Buffer (0x1A)  // _CRS: Current Resource Settings
            {
                "_SB_.PCI2._CRS..........."
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Device (ISA)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Device (EC0)
                {
                    Name (_GPE, Zero)  // _GPE: General Purpose Events
                    Name (_ADR, 0x00030000)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    OperationRegion (RAM, SystemMemory, 0x00400000, 0x0100)
                    Field (RAM, AnyAcc, NoLock, Preserve)
                    {
                        ADP,    1, 
                        AFLT,   1, 
                        BAT0,   1, 
                            ,   1, 
                        Offset (0x04), 
                        BPU0,   32, 
                        BDC0,   32, 
                        BFC0,   32, 
                        BTC0,   32, 
                        BDV0,   32, 
                        BST0,   32, 
                        BPR0,   32, 
                        BRC0,   32, 
                        BPV0,   32, 
                        BTP0,   32, 
                        BCW0,   32, 
                        BCL0,   32, 
                        BCG0,   32, 
                        BG20,   32, 
                        BMO0,   32, 
                        BIF0,   32, 
                        BSN0,   32, 
                        BTY0,   32, 
                        BTY1,   32
                    }
                }
            }
        }

        Device (IDX0)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (^^PCI2.ISA.EC0.BAT0)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Name (BUFR, Package (0x0D) {})
                Store (^^PCI2.ISA.EC0.BPU0, Index (BUFR, Zero))
                Store (^^PCI2.ISA.EC0.BDC0, Index (BUFR, One))
                Store (^^PCI2.ISA.EC0.BFC0, Index (BUFR, 0x02))
                Store (^^PCI2.ISA.EC0.BTC0, Index (BUFR, 0x03))
                Store (^^PCI2.ISA.EC0.BDV0, Index (BUFR, 0x04))
                Store (^^PCI2.ISA.EC0.BCW0, Index (BUFR, 0x05))
                Store (^^PCI2.ISA.EC0.BCL0, Index (BUFR, 0x06))
                Store (^^PCI2.ISA.EC0.BCG0, Index (BUFR, 0x07))
                Store (^^PCI2.ISA.EC0.BG20, Index (BUFR, 0x08))
                Store ("", Index (BUFR, 0x09))
                Store ("", Index (BUFR, 0x0A))
                Store ("LiOn", Index (BUFR, 0x0B))
                Store ("Chicony", Index (BUFR, 0x0C))
                Return (BUFR)
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Name (BUFR, Package (0x04)
                {
                    One, 
                    0x0100, 
                    0x76543210, 
                    0x0180
                })
                Return (BUFR)
            }

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                Store (Arg0, ^^PCI2.ISA.EC0.BTP0)
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ IndexOp Test", Debug)
                Name (PBUF, Package (0x04) {})
                Store (0x01234567, Index (PBUF, Zero))
                Store (0x89ABCDEF, Index (PBUF, One))
                Store (0xFEDCBA98, Index (PBUF, 0x02))
                Store (0x76543210, Index (PBUF, 0x03))
                If (LNotEqual (DerefOf (Index (PBUF, Zero)), 0x01234567))
                {
                    Return (0x10)
                }

                If (LNotEqual (DerefOf (Index (PBUF, One)), 0x89ABCDEF))
                {
                    Return (0x11)
                }

                If (LNotEqual (DerefOf (Index (PBUF, 0x02)), 0xFEDCBA98))
                {
                    Return (0x12)
                }

                If (LNotEqual (DerefOf (Index (PBUF, 0x03)), 0x76543210))
                {
                    Return (0x13)
                }

                Store (_BIF (), Local0)
                Store (ObjectType (Local0), Local1)
                If (LNotEqual (Local1, 0x04))
                {
                    Return (0x21)
                }

                Name (BUFR, Buffer (0x10)
                {
                    /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Store (0x01234567, Index (BUFR, Zero))
                Store (0x89ABCDEF, Index (BUFR, 0x04))
                Store (0xFEDCBA98, Index (BUFR, 0x08))
                Store (0x76543210, Index (BUFR, 0x0C))
                If (LNotEqual (DerefOf (Index (BUFR, Zero)), 0x67))
                {
                    Return (0x30)
                }

                If (LNotEqual (DerefOf (Index (BUFR, One)), Zero))
                {
                    Return (0x31)
                }

                If (LNotEqual (DerefOf (Index (BUFR, 0x04)), 0xEF))
                {
                    Return (0x34)
                }

                If (LNotEqual (DerefOf (Index (BUFR, 0x08)), 0x98))
                {
                    Return (0x38)
                }

                If (LNotEqual (DerefOf (Index (BUFR, 0x0C)), 0x10))
                {
                    Return (0x3C)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB)
    {
        OperationRegion (RAM, SystemMemory, 0x00800000, 0x0100)
        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            TREE,   3, 
            WRD0,   16, 
            WRD1,   16, 
            WRD2,   16, 
            WRD3,   16, 
            WRD4,   16, 
            DWRD,   32
        }

        Field (RAM, AnyAcc, NoLock, Preserve)
        {
            THRE,   3, 
            WD00,   16, 
            WD01,   16, 
            WD02,   16, 
            WD03,   16, 
            WD04,   16, 
            BYT0,   8, 
            BIT0,   1, 
            BIT1,   1, 
            BIT2,   1, 
            BIT3,   1, 
            BIT4,   1, 
            BIT5,   1, 
            BIT6,   1, 
            BIT7,   1, 
            BIT8,   1, 
            BIT9,   1, 
            BITA,   1, 
            BITB,   1, 
            BITC,   1, 
            BITD,   1, 
            BITE,   1, 
            BITF,   1, 
            BYTZ,   8
        }

        Device (BITI)
        {
            Method (MBIT, 0, NotSerialized)
            {
                If (LNotEqual (DWRD, Zero))
                {
                    Store (0xFF00, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                    Store (0x5A5A5A5A, DWRD)
                    If (BIT0)
                    {
                        Or (Local0, One, Local0)
                    }

                    If (LNot (BIT1))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    If (BIT2)
                    {
                        Or (Local0, 0x04, Local0)
                    }

                    If (LNot (BIT3))
                    {
                        Or (Local0, 0x08, Local0)
                    }

                    If (LNot (BIT4))
                    {
                        Or (Local0, 0x10, Local0)
                    }

                    If (BIT5)
                    {
                        Or (Local0, 0x20, Local0)
                    }

                    If (LNot (BIT6))
                    {
                        Or (Local0, 0x40, Local0)
                    }

                    If (BIT7)
                    {
                        Or (Local0, 0x80, Local0)
                    }
                }

                Return (Local0)
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ BitIndex Test", Debug)
                Store (Zero, DWRD)
                Store (MBIT (), Local0)
                Return (Local0)
            }
        }
    }

    Scope (_SB)
    {
        Name (C174, 0x0D)
        Name (C175, 0x08)
        Device (C158)
        {
            Name (_HID, "ACPI0003")  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Acquire (_GL, 0xFFFF)
                Release (_GL)
                And (Local0, One, Local0)
                Return (Local0)
            }
        }

        Name (C176, Package (0x04)
        {
            "Primary", 
            "MultiBay", 
            "DockRight", 
            "DockLeft"
        })
        Name (C177, Package (0x04)
        {
            0x99F5, 
            0x99F5, 
            0x995F, 
            0x995F
        })
        Name (C178, Package (0x04)
        {
            Package (0x04)
            {
                Zero, 
                Zero, 
                0x966B, 
                0x4190
            }, 

            Package (0x04)
            {
                Zero, 
                Zero, 
                0x966B, 
                0x4190
            }, 

            Package (0x04)
            {
                Zero, 
                Zero, 
                0x966B, 
                0x4190
            }, 

            Package (0x04)
            {
                Zero, 
                Zero, 
                0x966B, 
                0x4190
            }
        })
        Name (C179, Package (0x04)
        {
            Zero, 
            Zero, 
            0x966B, 
            0x4190
        })
        Name (C17A, Package (0x04)
        {
            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }, 

            Package (0x03)
            {
                Zero, 
                Zero, 
                Zero
            }
        })
        Method (C17B, 1, NotSerialized)
        {
            Name (C17C, Package (0x0D)
            {
                Zero, 
                0x99F5, 
                0x99F5, 
                One, 
                0x3840, 
                0x1280, 
                0x0AC7, 
                One, 
                One, 
                "2891", 
                "(-Unknown-)", 
                "LIon", 
                Zero
            })
            And (Arg0, 0x07, Local0)
            ShiftRight (Local0, One, Local4)
            Store (C179, Index (C178, Local4))
            Store (0x1234, Index (C179, 0x02))
            Store (DerefOf (Index (C179, 0x02)), Local2)
            If (LNotEqual (Local2, 0x1234))
            {
                Return (0x1234)
            }

            Store (DerefOf (Index (DerefOf (Index (C178, Zero)), 0x02)), 
                Local2)
            If (LNotEqual (Local2, 0x966B))
            {
                Return (0x1234)
            }

            Store (0x966B, Index (C179, 0x02))
            Store (0x5678, Index (DerefOf (Index (C178, Zero)), 0x03))
            Store (DerefOf (Index (DerefOf (Index (C178, Zero)), 0x03)), 
                Local2)
            If (LNotEqual (Local2, 0x5678))
            {
                Return (0x5678)
            }

            Store (DerefOf (Index (C179, 0x03)), Local2)
            If (LNotEqual (Local2, 0x4190))
            {
                Return (0x5678)
            }

            Store (0x4190, Index (DerefOf (Index (C178, Zero)), 0x03))
            Return (C17C)
        }

        Device (C154)
        {
            Name (_HID, "*PNP0C0A")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (C17B (0x30))
            }
        }

        Device (IDX3)
        {
            Method (LCLB, 0, NotSerialized)
            {
                Name (BUFR, Buffer (0x0A)
                {
                    /* 0000 */   0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
                    /* 0008 */   0x08, 0x09
                })
                Store (BUFR, Local1)
                Store (ObjectType (Local1), Local3)
                If (LNotEqual (Local3, 0x03))
                {
                    Return (0x9F)
                }

                Store (Zero, Local0)
                While (LLess (Local0, 0x05))
                {
                    Store (DerefOf (Index (Local1, Local0)), Local2)
                    Store (ObjectType (Local2), Local3)
                    If (LNotEqual (Local3, One))
                    {
                        Return (0x9E)
                    }

                    If (LNotEqual (Local0, Local2))
                    {
                        Add (0x90, Local0, Local4)
                        Return (Local4)
                    }

                    Increment (Local0)
                }

                Store ("DerefOf(Index(LocalBuffer,,)) PASS", Debug)
                Return (Zero)
            }

            Method (LCLP, 0, NotSerialized)
            {
                Name (PKG, Package (0x0A)
                {
                    Zero, 
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09
                })
                Store (PKG, Local1)
                Store (ObjectType (Local1), Local3)
                If (LNotEqual (Local3, 0x04))
                {
                    Return (0x8F)
                }

                Store (Zero, Local0)
                While (LLess (Local0, 0x05))
                {
                    Store (DerefOf (Index (Local1, Local0)), Local2)
                    Store (ObjectType (Local2), Local3)
                    If (LNotEqual (Local3, One))
                    {
                        Return (0x8E)
                    }

                    If (LNotEqual (Local0, Local2))
                    {
                        Add (0x80, Local0, Local4)
                        Return (Local4)
                    }

                    Increment (Local0)
                }

                Store ("DerefOf(Index(LocalPackage,,)) PASS", Debug)
                Return (Zero)
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ IndexOp3 Test", Debug)
                Store (^^C154._BIF (), Local0)
                Store (ObjectType (Local0), Local1)
                If (LNotEqual (Local1, 0x04))
                {
                    If (LEqual (Local1, One))
                    {
                        Return (Local0)
                    }
                    Else
                    {
                        Return (One)
                    }
                }

                Store (LCLB (), Local2)
                If (LNotEqual (Local2, Zero))
                {
                    Return (Local2)
                }

                Store (LCLP (), Local2)
                If (LNotEqual (Local2, Zero))
                {
                    Return (Local2)
                }

                Return (Zero)
            }
        }
    }

    Device (IDX7)
    {
        Name (PKG4, Package (0x05)
        {
            0x02, 
            "A short string", 
            Buffer (0x04)
            {
                 0x0A, 0x0B, 0x0C, 0x0D
            }, 

            0x1234, 
            Package (0x02)
            {
                IDX7, 
                0x03
            }
        })
        Method (TST1, 0, NotSerialized)
        {
            Name (DEST, Buffer (0x3F)
            {
                "Destination buffer that is longer than the short source buffer"
            })
            Store (Index (DEST, 0x02), Local1)
            Store (ObjectType (Local1), Local2)
            If (LEqual (Local2, 0x0E))
            {
                Return (Zero)
            }
            Else
            {
                Return (One)
            }
        }

        Method (TST2, 0, NotSerialized)
        {
            Name (BUF0, Buffer (0x05)
            {
                 0x01, 0x02, 0x03, 0x04, 0x05
            })
            Store (0x55, Index (BUF0, 0x02))
            Store (DerefOf (Index (BUF0, 0x02)), Local0)
            If (LEqual (Local0, 0x55))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x02)
            }
        }

        Method (TST3, 0, NotSerialized)
        {
            Name (BUF1, Buffer (0x05)
            {
                 0x01, 0x02, 0x03, 0x04, 0x05
            })
            Store (Index (BUF1, One), Local0)
            Store (DerefOf (Local0), Local1)
            If (LEqual (Local1, 0x02))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x03)
            }
        }

        Method (TST4, 0, NotSerialized)
        {
            Store (Index (PKG4, Zero), Local0)
            Store (ObjectType (Local0), Local1)
            If (LEqual (Local1, One))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x04)
            }
        }

        Method (TST5, 0, NotSerialized)
        {
            Store (Index (PKG4, One), Local0)
            Store (ObjectType (Local0), Local1)
            If (LEqual (Local1, 0x02))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x05)
            }
        }

        Method (TST6, 0, NotSerialized)
        {
            Store (Index (PKG4, 0x02), Local0)
            Store (ObjectType (Local0), Local1)
            If (LEqual (Local1, 0x03))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x06)
            }
        }

        Method (TST7, 0, NotSerialized)
        {
            Store (Index (PKG4, 0x03), Local0)
            Store (ObjectType (Local0), Local1)
            If (LEqual (Local1, One))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x07)
            }
        }

        Method (TST8, 0, NotSerialized)
        {
            Store (Index (PKG4, 0x04), Local0)
            Store (ObjectType (Local0), Local1)
            If (LEqual (Local1, 0x04))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x08)
            }
        }

        Method (TST9, 0, NotSerialized)
        {
            Store (DerefOf (Index (PKG4, Zero)), Local0)
            If (LEqual (Local0, 0x02))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x09)
            }
        }

        Method (TSTA, 0, NotSerialized)
        {
            Store (DerefOf (Index (PKG4, One)), Local0)
            Store (SizeOf (Local0), Local1)
            If (LEqual (Local1, 0x0E))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0A)
            }
        }

        Method (TSTB, 0, NotSerialized)
        {
            Store (DerefOf (Index (PKG4, 0x02)), Local0)
            Store (SizeOf (Local0), Local1)
            If (LEqual (Local1, 0x04))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0B)
            }
        }

        Method (TSTC, 0, NotSerialized)
        {
            Store (DerefOf (Index (PKG4, 0x03)), Local0)
            If (LEqual (Local0, 0x1234))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0C)
            }
        }

        Method (TSTD, 0, NotSerialized)
        {
            Store (DerefOf (Index (PKG4, 0x04)), Local0)
            Store (SizeOf (Local0), Local1)
            If (LEqual (Local1, 0x02))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0D)
            }
        }

        Method (TSTE, 0, NotSerialized)
        {
            Store (DerefOf (Index (PKG4, 0x02)), Local0)
            Store (DerefOf (Index (Local0, One)), Local1)
            If (LEqual (Local1, 0x0B))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0E)
            }
        }

        Method (TSTF, 0, NotSerialized)
        {
            Name (SRCB, Buffer (0x0C) {})
            Store ("Short Buffer", SRCB)
            Name (DEST, Buffer (0x3F)
            {
                "Destination buffer that is longer than the short source buffer"
            })
            Store (SRCB, Index (DEST, 0x02))
            Store (DerefOf (Index (DEST, 0x02)), Local0)
            If (LNotEqual (Local0, 0x72))
            {
                Return (Or (Local0, 0x1000))
            }

            Return (Zero)
        }

        Method (TSTG, 0, NotSerialized)
        {
            Name (SRCB, Buffer (0x0C) {})
            Store ("Short Buffer", SRCB)
            Name (DEST, Buffer (0x3F)
            {
                "Destination buffer that is longer than the short source buffer"
            })
            Store (SRCB, Index (DEST, 0x02))
            Store (DerefOf (Index (DEST, 0x03)), Local0)
            If (LNotEqual (Local0, 0x74))
            {
                Return (Or (Local0, 0x2000))
            }

            Store (DerefOf (Index (DEST, 0x04)), Local0)
            If (LNotEqual (Local0, 0x69))
            {
                Return (Or (Local0, 0x2100))
            }

            Store (DerefOf (Index (DEST, 0x05)), Local0)
            If (LNotEqual (Local0, 0x6E))
            {
                Return (Or (Local0, 0x2200))
            }

            Store (DerefOf (Index (DEST, 0x06)), Local0)
            If (LNotEqual (Local0, 0x61))
            {
                Return (Or (Local0, 0x2300))
            }

            Store (DerefOf (Index (DEST, 0x07)), Local0)
            If (LNotEqual (Local0, 0x74))
            {
                Return (Or (Local0, 0x2400))
            }

            Store (DerefOf (Index (DEST, 0x0E)), Local0)
            If (LNotEqual (Local0, 0x66))
            {
                Return (Or (Local0, 0x2400))
            }

            Return (Zero)
        }

        Method (TSTH, 0, NotSerialized)
        {
            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            Store (0x12345678, Index (DBUF, 0x02))
            Store (DerefOf (Index (DBUF, 0x02)), Local0)
            If (LNotEqual (Local0, 0x78))
            {
                Return (Or (Local0, 0x3000))
            }

            Store (DerefOf (Index (DBUF, 0x03)), Local0)
            If (LNotEqual (Local0, 0x64))
            {
                Return (Or (Local0, 0x3100))
            }

            Store (DerefOf (Index (DBUF, 0x04)), Local0)
            If (LNotEqual (Local0, 0x65))
            {
                Return (Or (Local0, 0x3200))
            }

            Store (DerefOf (Index (DBUF, 0x05)), Local0)
            If (LNotEqual (Local0, 0x66))
            {
                Return (Or (Local0, 0x3300))
            }

            Return (Zero)
        }

        Method (TSTI, 0, NotSerialized)
        {
            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            Store ("ABCDEFGH", Index (DBUF, 0x02))
            Store (DerefOf (Index (DBUF, 0x02)), Local0)
            If (LNotEqual (Local0, 0x48))
            {
                Return (Or (Local0, 0x4000))
            }

            Store (DerefOf (Index (DBUF, 0x03)), Local0)
            If (LNotEqual (Local0, 0x64))
            {
                Return (Or (Local0, 0x4100))
            }

            Store (DerefOf (Index (DBUF, 0x04)), Local0)
            If (LNotEqual (Local0, 0x65))
            {
                Return (Or (Local0, 0x4200))
            }

            Store (DerefOf (Index (DBUF, 0x05)), Local0)
            If (LNotEqual (Local0, 0x66))
            {
                Return (Or (Local0, 0x4300))
            }

            Return (Zero)
        }

        Method (TSTJ, 0, NotSerialized)
        {
            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            Store (0x1234, Index (DBUF, 0x02))
            Store (DerefOf (Index (DBUF, 0x02)), Local0)
            If (LNotEqual (Local0, 0x34))
            {
                Return (Or (Local0, 0x3000))
            }

            Store (DerefOf (Index (DBUF, 0x03)), Local0)
            If (LNotEqual (Local0, 0x64))
            {
                Return (Or (Local0, 0x3100))
            }

            Store (DerefOf (Index (DBUF, 0x04)), Local0)
            If (LNotEqual (Local0, 0x65))
            {
                Return (Or (Local0, 0x3200))
            }

            Store (DerefOf (Index (DBUF, 0x05)), Local0)
            If (LNotEqual (Local0, 0x66))
            {
                Return (Or (Local0, 0x3300))
            }

            Return (Zero)
        }

        Method (TSTK, 0, NotSerialized)
        {
            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            Store (0x00123456, Index (DBUF, 0x02))
            Store (DerefOf (Index (DBUF, 0x02)), Local0)
            If (LNotEqual (Local0, 0x56))
            {
                Return (Or (Local0, 0x3000))
            }

            Store (DerefOf (Index (DBUF, 0x03)), Local0)
            If (LNotEqual (Local0, 0x64))
            {
                Return (Or (Local0, 0x3100))
            }

            Store (DerefOf (Index (DBUF, 0x04)), Local0)
            If (LNotEqual (Local0, 0x65))
            {
                Return (Or (Local0, 0x3200))
            }

            Store (DerefOf (Index (DBUF, 0x05)), Local0)
            If (LNotEqual (Local0, 0x66))
            {
                Return (Or (Local0, 0x3300))
            }

            Return (Zero)
        }

        Method (TSTL, 0, NotSerialized)
        {
            Name (DBUF, Buffer (0x1B)
            {
                "abcdefghijklmnopqrstuvwxyz"
            })
            Store (0x12, Index (DBUF, 0x02))
            Store (DerefOf (Index (DBUF, 0x02)), Local0)
            If (LNotEqual (Local0, 0x12))
            {
                Return (Or (Local0, 0x3000))
            }

            Store (DerefOf (Index (DBUF, 0x03)), Local0)
            If (LNotEqual (Local0, 0x64))
            {
                Return (Or (Local0, 0x3100))
            }

            Store (DerefOf (Index (DBUF, 0x04)), Local0)
            If (LNotEqual (Local0, 0x65))
            {
                Return (Or (Local0, 0x3200))
            }

            Store (DerefOf (Index (DBUF, 0x05)), Local0)
            If (LNotEqual (Local0, 0x66))
            {
                Return (Or (Local0, 0x3300))
            }

            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ IndexOp7 Test", Debug)
            Store (TST1 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST2 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST3 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST4 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST5 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST6 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST7 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST8 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TST9 (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTA (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTB (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTC (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTD (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTE (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTG (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTH (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTJ (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTK (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Store (TSTL (), Local0)
            If (LGreater (Local0, Zero))
            {
                Return (Local0)
            }

            Return (Local0)
        }
    }

    Device (MTCH)
    {
        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ MatchOp Test", Debug)
            Name (TIM0, Package (0x08)
            {
                Package (0x04)
                {
                    0x78, 
                    0xB4, 
                    0xF0, 
                    0x0384
                }, 

                Package (0x04)
                {
                    0x23, 
                    0x21, 
                    0x10, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0B, 
                    0x09, 
                    0x04, 
                    Zero
                }, 

                Package (0x05)
                {
                    0x70, 
                    0x49, 
                    0x36, 
                    0x27, 
                    0x19
                }, 

                Package (0x05)
                {
                    Zero, 
                    One, 
                    0x02, 
                    One, 
                    0x02
                }, 

                Package (0x05)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    One
                }, 

                Package (0x04)
                {
                    0x04, 
                    0x03, 
                    0x02, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x02, 
                    One, 
                    Zero, 
                    Zero
                }
            })
            Name (TMD0, Buffer (0x14)
            {
                 0xFF, 0xFF, 0xFF, 0xFF
            })
            CreateDWordField (TMD0, Zero, PIO0)
            CreateDWordField (TMD0, 0x04, DMA0)
            CreateDWordField (TMD0, 0x08, PIO1)
            CreateDWordField (TMD0, 0x0C, DMA1)
            CreateDWordField (TMD0, 0x10, CHNF)
            Store (PIO0, Local3)
            Store (ObjectType (Local3), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x02)
            }

            If (LNotEqual (Local3, Ones))
            {
                Return (0x03)
            }

            Store ("DWordField PASS", Debug)
            Store (Zero, Local5)
            Store (Match (DerefOf (Index (TIM0, One)), MLE, Local5, MTR, 
                Zero, Zero), Local6)
            Store (ObjectType (Local6), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x04)
            }

            Store ("Match(DerefOf(Index(TIM0,1)),... PASS", Debug)
            Store (DerefOf (Index (TIM0, One)), Local4)
            Store (ObjectType (Local4), Local2)
            If (LNotEqual (Local2, 0x04))
            {
                Return (0x05)
            }

            Store ("DerefOf(Index(TIM0,1)),... PASS", Debug)
            And (Match (DerefOf (Index (TIM0, Zero)), MGE, PIO0, MTR, 
                Zero, Zero), 0x03, Local0)
            Store (ObjectType (Local0), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x06)
            }

            If (LNotEqual (Local0, 0x03))
            {
                Return (0x07)
            }

            Store ("And(Match(DerefOf(Index(TIM0,0)),... PASS", Debug)
            Store (DerefOf (Index (TIM0, One)), Local4)
            Store (ObjectType (Local4), Local2)
            If (LNotEqual (Local2, 0x04))
            {
                Return (0x08)
            }

            Store ("DerefOf(Index(TIM0,1)),... PASS again", Debug)
            Store (DerefOf (Index (TIM0, One)), Local4)
            Store (ObjectType (Local4), Local2)
            If (LNotEqual (Local2, 0x04))
            {
                Return (0x09)
            }

            Store ("DerefOf(Index(TIM0,1)),... PASS again", Debug)
            Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                Local1)
            Store (ObjectType (Local1), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x0A)
            }

            If (LNotEqual (Local1, Zero))
            {
                Return (0x0B)
            }

            Store ("DerefOf(Index(DerefOf(Index(TIM0,1)),... PASS", Debug)
            Store (DerefOf (Index (TIM0, One)), Local4)
            Store (ObjectType (Local4), Local2)
            If (LNotEqual (Local2, 0x04))
            {
                Return (0x0C)
            }

            Store ("DerefOf(Index(TIM0,1)),... PASS again", Debug)
            Store (DerefOf (Index (DerefOf (Index (TIM0, One)), Local0)), 
                Local1)
            Store (ObjectType (Local1), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x0D)
            }

            If (LNotEqual (Local1, Zero))
            {
                Return (0x0E)
            }

            Store ("DerefOf(Index(DerefOf(Index(TIM0,1)),... PASS again", Debug)
            Store (DerefOf (Index (TIM0, One)), Local4)
            Store (ObjectType (Local4), Local2)
            If (LNotEqual (Local2, 0x04))
            {
                Return (0x0F)
            }

            Store ("DerefOf(Index(TIM0,1)),... PASS again", Debug)
            Return (Zero)
        }
    }

    Device (WHLB)
    {
        Name (CNT0, Zero)
        Name (CNT1, Zero)
        Method (TEST, 0, NotSerialized)
        {
            Store (Zero, CNT0)
            While (LLess (CNT0, 0x04))
            {
                Store (Zero, CNT1)
                While (LLess (CNT1, 0x0A))
                {
                    If (LEqual (CNT1, One))
                    {
                        Break
                    }

                    Increment (CNT1)
                }

                If (LNotEqual (CNT1, One))
                {
                    Return (0x07)
                }

                Increment (CNT0)
            }

            If (LNotEqual (CNT0, 0x04))
            {
                Return (0x08)
            }

            Store ("While/While/If/Break PASS", Debug)
            Store ("++++++++ WhileBrk Test", Debug)
            Store (Zero, CNT0)
            While (LLess (CNT0, 0x0A))
            {
                Break
                Increment (CNT0)
            }

            If (LNotEqual (CNT0, Zero))
            {
                Return (0x04)
            }

            Store (Zero, CNT0)
            While (LLess (CNT0, 0x0A))
            {
                Increment (CNT0)
            }

            If (LNotEqual (CNT0, 0x0A))
            {
                Return (One)
            }

            While (LGreater (CNT0, Zero))
            {
                Decrement (CNT0)
            }

            If (LNotEqual (CNT0, Zero))
            {
                Return (0x02)
            }

            Store ("While/Break PASS", Debug)
            Store (Zero, CNT0)
            While (LLess (CNT0, 0x0A))
            {
                If (LEqual (CNT0, 0x05))
                {
                    Break
                    Store (0x14, CNT0)
                }

                Increment (CNT0)
            }

            If (LGreater (CNT0, 0x13))
            {
                Return (0x05)
            }

            If (LNotEqual (CNT0, 0x05))
            {
                Return (0x06)
            }

            Store ("While/If/Break PASS", Debug)
            Return (Zero)
        }
    }

    Scope (_SB)
    {
        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
            Name (_STA, 0x0F)  // _STA: Status
            OperationRegion (SMEM, SystemMemory, 0x00800000, 0x0100)
            Field (SMEM, AnyAcc, NoLock, Preserve)
            {
                SMD0,   32, 
                SMD1,   32, 
                SMD2,   32, 
                SMD3,   32
            }

            Field (SMEM, AnyAcc, NoLock, Preserve)
            {
                SME0,   69, 
                SME1,   97
            }

            OperationRegion (SRAM, SystemMemory, 0x100B0000, 0xF000)
            Field (SRAM, AnyAcc, NoLock, Preserve)
            {
                Offset (0x6800), 
                IEAX,   32, 
                IEBX,   32, 
                IECX,   32, 
                IEDX,   32, 
                IESI,   32, 
                IEDI,   32, 
                IEBP,   32, 
                Offset (0x6820), 
                OEAX,   32, 
                OEBX,   32, 
                OECX,   32, 
                OEDX,   32, 
                OESI,   32, 
                OEDI,   32, 
                OEBP,   32, 
                Offset (0x68FF), 
                ACST,   1, 
                BES1,   1, 
                BES2,   1, 
                Offset (0x6900), 
                BMN1,   104, 
                BSN1,   88, 
                BTP1,   72, 
                BPU1,   32, 
                BDC1,   32, 
                BLF1,   32, 
                BTC1,   32, 
                BDV1,   32, 
                BST1,   32, 
                BPR1,   32, 
                BRC1,   32, 
                BPV1,   32, 
                Offset (0x6949), 
                BCW1,   32, 
                BCL1,   32, 
                BG11,   32, 
                BG21,   32, 
                BOI1,   32, 
                Offset (0x6A03), 
                BMN2,   104, 
                BSN2,   88, 
                BTP2,   72, 
                BPU2,   32, 
                BDC2,   32, 
                BLF2,   32, 
                BTC2,   32, 
                BDV2,   32, 
                BST2,   32, 
                BPR2,   32, 
                BRC2,   32, 
                BPV2,   32, 
                Offset (0x6A4C), 
                BCW2,   32, 
                BCL2,   32, 
                BG12,   32, 
                BG22,   32, 
                BOI2,   32, 
                Offset (0x6B03), 
                AC01,   16, 
                AC11,   16, 
                PSV1,   16, 
                CRT1,   16, 
                TMP1,   16, 
                AST1,   16, 
                AC21,   16, 
                AC31,   16, 
                AC02,   16, 
                AC12,   16, 
                PSV2,   16, 
                CRT2,   16, 
                TMP2,   16, 
                AST2,   16, 
                AC22,   16, 
                AC32,   16, 
                AC03,   16, 
                AC13,   16, 
                PSV3,   16, 
                CRT3,   16, 
                TMP3,   16, 
                AST3,   16, 
                AC23,   16, 
                AC33,   16, 
                Offset (0x6B43), 
                TMPF,   16, 
                Offset (0x6BF3), 
                FANH,   1, 
                FANL,   7, 
                TF11,   1, 
                TF21,   1, 
                TF31,   1, 
                    ,   1, 
                TF10,   1, 
                TF20,   1, 
                TF30,   1, 
                Offset (0x6BF5), 
                TP11,   1, 
                TP21,   1, 
                TP31,   1, 
                Offset (0x6C03), 
                GP50,   1, 
                GP51,   1, 
                GP52,   1, 
                GP53,   1, 
                Offset (0x6C04), 
                GP60,   1, 
                GP61,   1, 
                GP62,   1, 
                GP63,   1, 
                GP64,   1, 
                GP65,   1, 
                GP66,   1, 
                Offset (0x6C05), 
                GP70,   1, 
                GP71,   1, 
                GP72,   1, 
                GP73,   1, 
                GP74,   1, 
                GP75,   1, 
                GP76,   1, 
                Offset (0x6C06), 
                WED0,   1, 
                WED1,   1, 
                WED2,   1, 
                WED3,   1, 
                WED4,   1, 
                Offset (0x6C07), 
                SBL0,   1, 
                SBL1,   1, 
                SBL2,   1, 
                SBL3,   1, 
                Offset (0x6C08), 
                LIDS,   1, 
                VALF,   1, 
                    ,   2, 
                DCKI,   1, 
                DCKF,   1, 
                BT1F,   1, 
                BT2F,   1, 
                Offset (0x6D03), 
                HKCD,   8, 
                Offset (0x6D05), 
                DLID,   32, 
                DSRN,   32, 
                Offset (0x6D11), 
                BDID,   32, 
                DSPW,   1, 
                VGAF,   1, 
                VWE0,   1, 
                VWE1,   1, 
                PPSC,   1, 
                SPSC,   1, 
                EWLD,   1, 
                EWPS,   1, 
                Offset (0x7003), 
                PRES,   32768
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (^^MEM.BES1)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Name (BUFR, Package (0x0D) {})
                Store (^^MEM.BPU1, Index (BUFR, Zero))
                Store (^^MEM.BDC1, Index (BUFR, One))
                Store (^^MEM.BLF1, Index (BUFR, 0x02))
                Store (^^MEM.BTC1, Index (BUFR, 0x03))
                Store (^^MEM.BDV1, Index (BUFR, 0x04))
                Store (^^MEM.BCW1, Index (BUFR, 0x05))
                Store (^^MEM.BCL1, Index (BUFR, 0x06))
                Store (^^MEM.BG11, Index (BUFR, 0x07))
                Store (^^MEM.BG21, Index (BUFR, 0x08))
                Store (^^MEM.BMN1, Index (BUFR, 0x09))
                Store (^^MEM.BSN1, Index (BUFR, 0x0A))
                Store (^^MEM.BTP1, Index (BUFR, 0x0B))
                Store (^^MEM.BOI1, Index (BUFR, 0x0C))
                Return (BUFR)
            }
        }

        Device (IDX2)
        {
            Method (B2IB, 0, NotSerialized)
            {
                Name (SRCB, Buffer (0x0D)
                {
                    "Short Buffer"
                })
                Name (DEST, Buffer (0x3F)
                {
                    "Destination buffer that is longer than the short source buffer"
                })
                Store (Index (DEST, 0x02), Local1)
                Store (ObjectType (Local1), Local2)
                If (LNotEqual (Local2, 0x0E))
                {
                    Return (0x61)
                }

                Store (DerefOf (Local1), Local3)
                Store (ObjectType (Local3), Local4)
                If (LNotEqual (Local4, One))
                {
                    Return (0x62)
                }
                Else
                {
                    If (LNotEqual (Local3, 0x73))
                    {
                        Return (0x63)
                    }
                }

                Store ("DerefOf(Index(Buffer,,)) PASS", Debug)
                Store (SRCB, Index (DEST, 0x02))
                Store (DerefOf (Index (DEST, 0x03)), Local0)
                If (LNotEqual (Local0, 0x74))
                {
                    If (LEqual (Local0, 0x68))
                    {
                        Return (0x68)
                    }
                    Else
                    {
                        Return (0x69)
                    }
                }

                Store (DerefOf (Index (DEST, 0x0E)), Local0)
                If (LNotEqual (Local0, 0x66))
                {
                    If (LEqual (Local0, Zero))
                    {
                        Return (0x6A)
                    }
                    Else
                    {
                        Return (0x6B)
                    }
                }

                Store ("Store(SRCB,Index(Buffer,,)) PASS", Debug)
                Store (0x6A, Index (SRCB, One))
                Store (DerefOf (Index (SRCB, One)), Local0)
                If (LNotEqual (Local0, 0x6A))
                {
                    Return (0x71)
                }

                Store (DerefOf (Index (DEST, 0x03)), Local0)
                If (LNotEqual (Local0, 0x74))
                {
                    If (LEqual (Local0, 0x6A))
                    {
                        Return (0x72)
                    }
                    Else
                    {
                        Return (0x73)
                    }
                }

                Store (0x6B, Index (DEST, 0x04))
                Store (DerefOf (Index (DEST, 0x04)), Local0)
                If (LNotEqual (Local0, 0x6B))
                {
                    Return (0x74)
                }

                Store (DerefOf (Index (SRCB, 0x02)), Local0)
                If (LNotEqual (Local0, 0x6F))
                {
                    If (LEqual (Local0, 0x6B))
                    {
                        Return (0x75)
                    }
                    Else
                    {
                        Return (0x76)
                    }
                }

                Store ("SRCB and DEST independent PASS", Debug)
                Store ("New Buff", Index (DEST, 0x02))
                Store (DerefOf (Index (DEST, 0x02)), Local0)
                If (LNotEqual (Local0, 0x4E))
                {
                    Return (0x81)
                }

                Store (DerefOf (Index (DEST, 0x06)), Local0)
                If (LNotEqual (Local0, 0x61))
                {
                    Return (0x82)
                }

                Store (DerefOf (Index (DEST, 0x0A)), Local0)
                If (LNotEqual (Local0, 0x6E))
                {
                    Return (0x83)
                }

                Store ("Store(String,Index) PASS", Debug)
                Return (Zero)
            }

            Method (FB2P, 0, NotSerialized)
            {
                Name (DEST, Package (0x02) {})
                Store (0x01234567, ^^MEM.SMD0)
                Store (0x89ABCDEF, ^^MEM.SMD1)
                Store (0xFEDCBA98, ^^MEM.SMD2)
                Store (0x76543210, ^^MEM.SMD3)
                Store (^^MEM.SME0, Index (DEST, Zero))
                Store (^^MEM.SME1, Index (DEST, One))
                Store (DerefOf (Index (DEST, Zero)), Local0)
                Store (DerefOf (Index (DEST, One)), Local1)
                Store (ObjectType (Local0), Local2)
                If (LNotEqual (Local2, 0x03))
                {
                    Return (0x11)
                }

                Store (ObjectType (Local1), Local3)
                If (LNotEqual (Local3, 0x03))
                {
                    Return (0x12)
                }

                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), Zero)), 
                    Local4)
                If (LNotEqual (Local4, 0x67))
                {
                    Return (0x13)
                }

                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), One)), 
                    Local4)
                If (LNotEqual (Local4, 0x45))
                {
                    Return (0x14)
                }

                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), 0x04)), 
                    Local4)
                If (LNotEqual (Local4, 0xEF))
                {
                    Return (0x15)
                }

                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), 0x05)), 
                    Local4)
                If (LNotEqual (Local4, 0xCD))
                {
                    Return (0x16)
                }

                Store ("Store(Mem,PkgElement) PASS", Debug)
                Store (0x12345678, ^^MEM.SMD0)
                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), Zero)), 
                    Local5)
                If (LNotEqual (Local5, 0x67))
                {
                    Return (0x21)
                }

                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), One)), 
                    Local5)
                If (LNotEqual (Local5, 0x45))
                {
                    Return (0x22)
                }

                Store (0x30, Index (DerefOf (Index (DEST, Zero)), Zero))
                Store (DerefOf (Index (DerefOf (Index (DEST, Zero)), Zero)), 
                    Local5)
                If (LNotEqual (Local5, 0x30))
                {
                    Return (0x23)
                }

                Store (^^MEM.SMD0, Local5)
                If (LNotEqual (Local5, 0x12345678))
                {
                    Return (0x24)
                }

                Store ("Mem and Pkg independent PASS", Debug)
                Return (Zero)
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ IndexOp2 Test", Debug)
                Store (^^BAT1._BIF (), Local0)
                Store (ObjectType (Local0), Local1)
                If (LNotEqual (Local1, 0x04))
                {
                    Return (0x02)
                }

                Store (B2IB (), Local2)
                Store (ObjectType (Local2), Local3)
                If (LNotEqual (Local3, One))
                {
                    Return (0x04)
                }

                If (LNotEqual (Local2, Zero))
                {
                    Return (Local2)
                }

                Store (FB2P (), Local2)
                Store (ObjectType (Local2), Local3)
                If (LNotEqual (Local3, One))
                {
                    Return (0x05)
                }

                If (LNotEqual (Local2, Zero))
                {
                    Return (Local2)
                }

                Return (Zero)
            }
        }
    }

    Device (SIZO)
    {
        Method (SAR0, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x21)
            }

            If (LNotEqual (Local0, Arg1))
            {
                Return (0x22)
            }

            Return (Zero)
        }

        Method (SARG, 0, NotSerialized)
        {
            Name (BUFR, Buffer (0x0C) {})
            Name (BUF1, Buffer (0x05)
            {
                 0x01, 0x02, 0x03, 0x04, 0x05
            })
            Name (PKG0, Package (0x04) {})
            Name (STR0, "String")
            Name (PKG1, Package (0x04)
            {
                BUFR, 
                "String2", 
                STR0, 
                PKG0
            })
            Name (PKG2, Package (0x04)
            {
                Buffer (0x0F) {}, 
                "String 1", 
                Package (0x02) {}
            })
            Store (SAR0 (BUFR, 0x0C), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x23)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=BUFR) PASS", Debug)
            Store (SAR0 (PKG0, 0x04), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x24)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=PKG0) PASS", Debug)
            Store (SAR0 (STR0, 0x06), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x25)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=STR0) PASS", Debug)
            Store (SAR0 ("String", 0x06), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x26)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=String) PASS", Debug)
            Store (0x55, Index (BUF1, 0x02))
            Store (SAR0 (Index (PKG1, Zero), 0x0C), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x28)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=PackageBuffer NTE Reference Element) PASS", Debug)
            Store (SAR0 (Index (PKG1, One), 0x07), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x29)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=Package String Element) PASS", Debug)
            Store (SAR0 (Index (PKG1, 0x02), 0x06), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x2A)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=Package String NTE Reference Element) PASS", Debug)
            Store (SAR0 (Index (PKG1, 0x03), 0x04), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x2B)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=Package Package NTE Reference Element) PASS", Debug)
            Store (SAR0 (Index (PKG2, Zero), 0x0F), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x2B)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=Package Buffer Element) PASS", Debug)
            Store (SAR0 (Index (PKG2, One), 0x08), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x2B)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=Package String Element) PASS", Debug)
            Store (SAR0 (Index (PKG2, 0x02), 0x02), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x2B)
            }

            If (LNotEqual (Local0, Zero))
            {
                Return (Local0)
            }

            Store ("SizeOf(Arg=Package Package Element) PASS", Debug)
            Store ("SizeOf(Arg) PASS", Debug)
            Return (Zero)
        }

        Method (SBUF, 0, NotSerialized)
        {
            Name (BUFR, Buffer (0x0C) {})
            Store (SizeOf (BUFR), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x31)
            }

            If (LNotEqual (Local0, 0x0C))
            {
                Return (0x32)
            }

            Store ("SizeOf(BUFR) PASS", Debug)
            Return (Zero)
        }

        Method (SLOC, 0, NotSerialized)
        {
            Name (BUFR, Buffer (0x0C) {})
            Name (STR0, "String")
            Name (PKG0, Package (0x04) {})
            Store (BUFR, Local2)
            Store (SizeOf (Local2), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x51)
            }

            If (LNotEqual (Local0, 0x0C))
            {
                Return (0x52)
            }

            Store ("SizeOf(Local2=Buffer) PASS", Debug)
            Store (STR0, Local2)
            Store (SizeOf (Local2), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x53)
            }

            If (LNotEqual (Local0, 0x06))
            {
                Return (0x54)
            }

            Store ("SizeOf(Local2=String) PASS", Debug)
            Store (PKG0, Local2)
            Store (SizeOf (Local2), Local0)
            Store (ObjectType (Local0), Local1)
            If (LNotEqual (Local1, One))
            {
                Return (0x55)
            }

            If (LNotEqual (Local0, 0x04))
            {
                Return (0x56)
            }

            Store ("SizeOf(Local2=Package) PASS", Debug)
            Return (Zero)
        }

        Method (TEST, 0, NotSerialized)
        {
            Store ("++++++++ SizeOf Test", Debug)
            Store (_OS, Local0)
            Store (SizeOf (_OS), Local3)
            Store (ObjectType (Local3), Local4)
            If (LNotEqual (Local4, One))
            {
                Return (0x61)
            }

            Store (_OS, Local0)
            Store (SARG (), Local1)
            Store (ObjectType (Local1), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x62)
            }

            If (LNotEqual (Local1, Zero))
            {
                Return (Local1)
            }

            Store (SBUF (), Local1)
            Store (ObjectType (Local1), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x63)
            }

            If (LNotEqual (Local1, Zero))
            {
                Return (Local1)
            }

            Store (SLOC (), Local1)
            Store (ObjectType (Local1), Local2)
            If (LNotEqual (Local2, One))
            {
                Return (0x65)
            }

            If (LNotEqual (Local1, Zero))
            {
                Return (Local1)
            }

            Return (Zero)
        }
    }

    Scope (_SB)
    {
        OperationRegion (RAM1, SystemMemory, 0x00400000, 0x0A)
        Field (RAM1, AnyAcc, NoLock, Preserve)
        {
            BI1T,   1, 
            BI2T,   2, 
            BI3T,   3, 
            LST2,   2
        }

        Field (RAM1, WordAcc, NoLock, WriteAsZeros)
        {
            WRD,    16
        }

        Field (RAM1, ByteAcc, NoLock, WriteAsOnes)
        {
            BYTE,   8
        }

        Field (RAM1, ByteAcc, NoLock, Preserve)
        {
            SMIC,   8, 
            SMID,   8
        }

        Device (MBIT)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (Zero, BI1T)
                Store (0x03, BI2T)
                Store (0x07, BI3T)
                Store (Zero, LST2)
            }
        }

        Device (MWRD)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (Zero, WRD)
            }
        }

        Device (MBYT)
        {
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (Zero, BYTE)
                Store (0x0C, SMIC)
                Store (0x0D, SMID)
            }
        }

        Method (SMIX, 0, NotSerialized)
        {
            Return (BYTE)
        }

        Method (EVNT, 0, NotSerialized)
        {
            Store (SMIX (), Local0)
            Notify (_SB, 0x29)
            If (And (Local0, One))
            {
                Notify (SMIS, 0x21)
            }

            If (And (Local0, 0x02))
            {
                Notify (SMIS, 0x22)
            }

            If (And (Local0, 0x04))
            {
                Notify (SMIS, 0x24)
            }

            If (And (Local0, 0x08))
            {
                Notify (SMIS, 0x28)
            }
        }

        Method (NTFY, 0, NotSerialized)
        {
            Notify (_SB, One)
            Notify (\_TZ.TZ1, 0x02)
            Notify (\_PR.CPU0, 0x03)
            Notify (_SB, 0x81)
            Notify (\_TZ.TZ1, 0x82)
            Notify (\_PR.CPU0, 0x83)
        }

        Device (SMIS)
        {
            Method (BINK, 0, NotSerialized)
            {
                Store (Zero, Local0)
                If (LNotEqual (SMID, 0x0D))
                {
                    Or (0x80, Local0, Local0)
                }

                If (LNotEqual (SMIC, 0x0C))
                {
                    Or (0x40, Local0, Local0)
                }

                If (LNotEqual (BYTE, Zero))
                {
                    Or (0x20, Local0, Local0)
                }

                If (LNotEqual (WRD, Zero))
                {
                    Or (0x10, Local0, Local0)
                }

                If (LNotEqual (LST2, Zero))
                {
                    Or (0x08, Local0, Local0)
                }

                If (LNotEqual (BI3T, 0x07))
                {
                    Or (0x04, Local0, Local0)
                }

                If (LNotEqual (BI2T, 0x03))
                {
                    Or (0x02, Local0, Local0)
                }

                If (LNotEqual (BI1T, Zero))
                {
                    Or (One, Local0, Local0)
                }

                Return (Local0)
            }

            Method (TEST, 0, NotSerialized)
            {
                Store ("++++++++ SmiShare Test", Debug)
                Store (0x20, BYTE)
                EVNT ()
                Store (0x21, BYTE)
                EVNT ()
                Store (0x22, BYTE)
                EVNT ()
                Store (0x23, BYTE)
                EVNT ()
                NTFY ()
                Return (Zero)
            }
        }

        Device (CNDT)
        {
            Method (TEST, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    Return ("Broken")
                }
                Else
                {
                    Return ("Works")
                }
            }

            Method (ECOK, 0, NotSerialized)
            {
                Return (Zero)
            }
        }
    }

    Name (WQAB, Buffer (0x1A64)
    {
        /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
        /* 0008 */   0x54, 0x1A, 0x00, 0x00, 0xBA, 0xAD, 0x00, 0x00,
        /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
        /* 0018 */   0x98, 0xBD, 0x92, 0x00, 0x01, 0x06, 0x18, 0x42,
        /* 0020 */   0x10, 0x47, 0x10, 0x92, 0x46, 0x62, 0x02, 0x89,
        /* 0028 */   0x80, 0x90, 0x18, 0x18, 0x14, 0x81, 0x85, 0x00,
        /* 0030 */   0x49, 0x02, 0x88, 0xC4, 0x41, 0xE1, 0x20, 0xD4,
        /* 0038 */   0x9F, 0x40, 0x7E, 0x05, 0x20, 0x74, 0x28, 0x40,
        /* 0040 */   0xA6, 0x00, 0x83, 0x02, 0x9C, 0x22, 0x88, 0xA0,
        /* 0048 */   0x57, 0x01, 0x36, 0x05, 0x98, 0x14, 0x60, 0x51,
        /* 0050 */   0x80, 0x76, 0x01, 0x96, 0x05, 0xE8, 0x16, 0x20,
        /* 0058 */   0x1D, 0x96, 0x88, 0x04, 0x47, 0x89, 0x01, 0x47,
        /* 0060 */   0xE9, 0xC4, 0x16, 0x6E, 0xD8, 0xE0, 0x85, 0xA2,
        /* 0068 */   0x68, 0x06, 0x51, 0x12, 0x94, 0x8B, 0x20, 0x5D,
        /* 0070 */   0x10, 0x52, 0x2E, 0xC0, 0x37, 0x82, 0x06, 0x10,
        /* 0078 */   0xA5, 0x77, 0x01, 0xB6, 0x05, 0x98, 0x86, 0x27,
        /* 0080 */   0xD2, 0x20, 0xE4, 0x60, 0x08, 0x54, 0xCE, 0x80,
        /* 0088 */   0x20, 0x69, 0x44, 0x21, 0x1E, 0xA7, 0x44, 0x08,
        /* 0090 */   0x0A, 0x84, 0x90, 0xD4, 0xF1, 0xA0, 0xA0, 0x71,
        /* 0098 */   0x88, 0xAD, 0xCE, 0x46, 0x93, 0xA9, 0x74, 0x7E,
        /* 00A0 */   0x48, 0x82, 0x70, 0xC6, 0x2A, 0x7E, 0x3A, 0x9A,
        /* 00A8 */   0xD0, 0xD9, 0x9C, 0x60, 0xE7, 0x18, 0x72, 0x3C,
        /* 00B0 */   0x48, 0xF4, 0x20, 0xB8, 0x00, 0x0F, 0x1C, 0x2C,
        /* 00B8 */   0x34, 0x84, 0x22, 0x6B, 0x80, 0xC1, 0x8C, 0xDD,
        /* 00C0 */   0x63, 0xB1, 0x0B, 0x4E, 0x0A, 0xEC, 0x61, 0xB3,
        /* 00C8 */   0x01, 0x19, 0xA2, 0x24, 0x38, 0xD4, 0x11, 0xC0,
        /* 00D0 */   0x12, 0x05, 0x98, 0x1F, 0x87, 0x0C, 0x0F, 0x95,
        /* 00D8 */   0x8C, 0x25, 0x24, 0x1B, 0xAB, 0x87, 0xC2, 0xA5,
        /* 00E0 */   0x40, 0x68, 0x6C, 0x27, 0xED, 0x19, 0x45, 0x2C,
        /* 00E8 */   0x79, 0x4A, 0x82, 0x49, 0xE0, 0x51, 0x44, 0x36,
        /* 00F0 */   0x1A, 0x27, 0x28, 0x1B, 0x1A, 0x25, 0x03, 0x42,
        /* 00F8 */   0x9E, 0x05, 0x58, 0x07, 0x26, 0x04, 0x76, 0x2F,
        /* 0100 */   0xC0, 0x9A, 0x00, 0x73, 0xB3, 0x90, 0xB1, 0xB9,
        /* 0108 */   0xE8, 0xFF, 0x0F, 0x71, 0xB0, 0x31, 0xDA, 0x9A,
        /* 0110 */   0xAE, 0x90, 0xC2, 0xC4, 0x88, 0x12, 0x2C, 0x5E,
        /* 0118 */   0xC5, 0xC3, 0x10, 0xCA, 0x93, 0x42, 0xA8, 0x48,
        /* 0120 */   0x95, 0xA1, 0x68, 0xB4, 0x51, 0x2A, 0x14, 0xE0,
        /* 0128 */   0x4C, 0x80, 0x30, 0x5C, 0x1D, 0x03, 0x82, 0x46,
        /* 0130 */   0x88, 0x15, 0x29, 0x56, 0xFB, 0x83, 0x20, 0xF1,
        /* 0138 */   0x2D, 0x40, 0x54, 0x01, 0xA2, 0x48, 0xA3, 0x41,
        /* 0140 */   0x9D, 0x03, 0x3C, 0x5C, 0x0F, 0xF5, 0xF0, 0x3D,
        /* 0148 */   0xF6, 0x93, 0x0C, 0x72, 0x90, 0x67, 0xF1, 0xA8,
        /* 0150 */   0x70, 0x9C, 0x06, 0x49, 0xE0, 0x0B, 0x80, 0x4F,
        /* 0158 */   0x08, 0x1E, 0x38, 0xDE, 0x35, 0xA0, 0x66, 0x7C,
        /* 0160 */   0xBC, 0x4C, 0x10, 0x1C, 0x6A, 0x88, 0x1E, 0x68,
        /* 0168 */   0xB8, 0x13, 0x38, 0x44, 0x06, 0xE8, 0x49, 0x3D,
        /* 0170 */   0x52, 0x60, 0x07, 0x77, 0x32, 0xEF, 0x01, 0xAF,
        /* 0178 */   0x0A, 0xCD, 0x5E, 0x12, 0x08, 0xC1, 0xF1, 0xF8,
        /* 0180 */   0x7E, 0xC0, 0x26, 0x9C, 0xC0, 0xF2, 0x07, 0x81,
        /* 0188 */   0x1A, 0x99, 0xA1, 0x3D, 0xCA, 0xD3, 0x8A, 0x19,
        /* 0190 */   0xF2, 0x31, 0xC1, 0x04, 0x16, 0x0B, 0x21, 0x05,
        /* 0198 */   0x10, 0x1A, 0x0F, 0xF8, 0x6F, 0x00, 0x8F, 0x17,
        /* 01A0 */   0xBE, 0x12, 0xC4, 0xF6, 0x80, 0x12, 0x0C, 0x0B,
        /* 01A8 */   0x21, 0x23, 0xAB, 0xF0, 0x78, 0xE8, 0x28, 0x7C,
        /* 01B0 */   0x95, 0x38, 0x9C, 0xD3, 0x8A, 0x67, 0x82, 0xE1,
        /* 01B8 */   0x20, 0xF4, 0x05, 0x90, 0x00, 0x51, 0xE7, 0x0C,
        /* 01C0 */   0xD4, 0x61, 0xC1, 0xE7, 0x04, 0x76, 0x33, 0x38,
        /* 01C8 */   0x83, 0x47, 0x00, 0x8F, 0xE4, 0x84, 0xFC, 0x2B,
        /* 01D0 */   0xF1, 0xC0, 0xE0, 0x03, 0xE2, 0xEF, 0x1F, 0xA7,
        /* 01D8 */   0xEC, 0x11, 0x9C, 0xA9, 0x01, 0x7D, 0x1C, 0xF0,
        /* 01E0 */   0xFF, 0x7F, 0x28, 0x7C, 0x88, 0x1E, 0xDF, 0x29,
        /* 01E8 */   0x1F, 0xAF, 0x4F, 0x17, 0x96, 0x35, 0x4E, 0xE8,
        /* 01F0 */   0x77, 0x08, 0x9F, 0x38, 0x7C, 0x64, 0x71, 0x44,
        /* 01F8 */   0x08, 0x39, 0x39, 0x05, 0xA0, 0x81, 0x4F, 0xF7,
        /* 0200 */   0xEC, 0x22, 0x9C, 0xAE, 0x27, 0xE5, 0x40, 0xC3,
        /* 0208 */   0xA0, 0xE3, 0x04, 0xC7, 0x79, 0x00, 0x1C, 0xE3,
        /* 0210 */   0x84, 0x7F, 0x2E, 0x80, 0x3F, 0x40, 0x7E, 0xCA,
        /* 0218 */   0x78, 0xC5, 0x48, 0xE0, 0x98, 0x23, 0x44, 0x9F,
        /* 0220 */   0x6B, 0x3C, 0x42, 0x2C, 0xFC, 0x53, 0x45, 0xE1,
        /* 0228 */   0x03, 0x21, 0x63, 0x04, 0x17, 0xA0, 0xC7, 0x08,
        /* 0230 */   0x7C, 0x03, 0x8E, 0x11, 0x7D, 0x94, 0xE0, 0xEA,
        /* 0238 */   0x0F, 0x1A, 0x74, 0x80, 0xB8, 0xFF, 0xFF, 0x00,
        /* 0240 */   0xE1, 0x83, 0x7A, 0x80, 0xC0, 0x37, 0xFA, 0xD1,
        /* 0248 */   0x03, 0x3D, 0x2E, 0x8B, 0x3E, 0x0F, 0xC8, 0xF8,
        /* 0250 */   0x89, 0x46, 0xF3, 0xE2, 0xA7, 0x03, 0x7E, 0xF8,
        /* 0258 */   0x00, 0x0F, 0xA8, 0x87, 0x84, 0x03, 0xC5, 0x4C,
        /* 0260 */   0x9B, 0x83, 0x3E, 0xBB, 0x1C, 0x3A, 0x76, 0xB8,
        /* 0268 */   0xE0, 0x3F, 0x81, 0x80, 0x4B, 0xDE, 0x21, 0x0C,
        /* 0270 */   0x14, 0x23, 0xC6, 0x9F, 0x83, 0x7C, 0x0A, 0x03,
        /* 0278 */   0xFF, 0xFF, 0xFF, 0x14, 0x06, 0xFE, 0xE1, 0xF0,
        /* 0280 */   0x20, 0x4F, 0x07, 0x9F, 0xB6, 0xA8, 0x74, 0x18,
        /* 0288 */   0xD4, 0x81, 0x0B, 0xB0, 0x32, 0x89, 0x08, 0xCF,
        /* 0290 */   0x12, 0xB5, 0x41, 0xE8, 0xD4, 0xF0, 0x36, 0xF1,
        /* 0298 */   0xB6, 0xE5, 0x5B, 0x40, 0x9C, 0xD3, 0xEC, 0xED,
        /* 02A0 */   0xC0, 0x45, 0x30, 0x22, 0xD4, 0x0C, 0x45, 0x4E,
        /* 02A8 */   0x5A, 0x11, 0x63, 0x44, 0x79, 0xDC, 0x32, 0xCA,
        /* 02B0 */   0xDB, 0xD6, 0x0B, 0x40, 0xBC, 0x13, 0x7B, 0xDE,
        /* 02B8 */   0x32, 0x46, 0xF0, 0xC8, 0x0F, 0x5C, 0x2C, 0xC6,
        /* 02C0 */   0xEA, 0xF5, 0x5F, 0xF3, 0x81, 0x0B, 0x70, 0xF6,
        /* 02C8 */   0xFF, 0x3F, 0x70, 0x01, 0x1C, 0x0A, 0x7A, 0x18,
        /* 02D0 */   0x42, 0x0F, 0xC3, 0x53, 0x39, 0x97, 0x87, 0xC8,
        /* 02D8 */   0x53, 0x89, 0x18, 0x35, 0x4C, 0xD4, 0x67, 0x28,
        /* 02E0 */   0xDF, 0x2D, 0x7C, 0x20, 0x02, 0xDF, 0x99, 0x0B,
        /* 02E8 */   0xF8, 0xFD, 0xFF, 0x0F, 0x44, 0x70, 0x8E, 0x29,
        /* 02F0 */   0xB8, 0x33, 0x0D, 0x78, 0x7C, 0xCE, 0x40, 0x20,
        /* 02F8 */   0xA7, 0xE2, 0x43, 0x0D, 0x60, 0x41, 0xF4, 0x13,
        /* 0300 */   0xC2, 0x27, 0x1A, 0x2A, 0x13, 0x06, 0x75, 0xA8,
        /* 0308 */   0x01, 0xAC, 0x5C, 0x61, 0x9E, 0x46, 0xCF, 0xF9,
        /* 0310 */   0x59, 0xC6, 0xA7, 0x1A, 0x1F, 0x4A, 0x8D, 0x63,
        /* 0318 */   0x88, 0x97, 0x99, 0x87, 0x1A, 0x1F, 0x0B, 0x5E,
        /* 0320 */   0x49, 0x7D, 0xA8, 0x31, 0x54, 0x9C, 0x87, 0x1A,
        /* 0328 */   0x0F, 0x37, 0x50, 0xD4, 0x37, 0x9B, 0x67, 0x1B,
        /* 0330 */   0xA3, 0xC7, 0xF7, 0x0D, 0xD5, 0x10, 0x0F, 0x35,
        /* 0338 */   0x4C, 0xF2, 0x4A, 0x35, 0x16, 0x1F, 0x6A, 0xC0,
        /* 0340 */   0xF1, 0xFF, 0x3F, 0xD4, 0x00, 0xFC, 0xFF, 0xFF,
        /* 0348 */   0x1F, 0x6A, 0x00, 0x47, 0x47, 0x03, 0x38, 0x47,
        /* 0350 */   0x46, 0xDC, 0xD1, 0x00, 0x5C, 0x87, 0x52, 0xE0,
        /* 0358 */   0x70, 0x34, 0x00, 0x1E, 0x47, 0x21, 0x30, 0x5F,
        /* 0360 */   0x68, 0x7C, 0x14, 0x02, 0x16, 0xFF, 0xFF, 0xA3,
        /* 0368 */   0x10, 0xF8, 0x65, 0x9F, 0x83, 0x50, 0x42, 0x8F,
        /* 0370 */   0x42, 0x80, 0xA0, 0xDB, 0xCF, 0x53, 0xC4, 0xB3,
        /* 0378 */   0x8F, 0x2F, 0x3F, 0x0F, 0x04, 0x11, 0x5E, 0xF3,
        /* 0380 */   0x7D, 0x0A, 0xF2, 0x21, 0xDF, 0x47, 0x21, 0x06,
        /* 0388 */   0x63, 0x28, 0x5F, 0x83, 0x7C, 0x14, 0x62, 0x50,
        /* 0390 */   0xAF, 0x41, 0xBE, 0xEF, 0x1B, 0xE4, 0xF1, 0x22,
        /* 0398 */   0x48, 0xEC, 0x67, 0x02, 0x1F, 0x85, 0x98, 0xE8,
        /* 03A0 */   0xA3, 0x10, 0xA0, 0xF0, 0xFF, 0x7F, 0x14, 0x02,
        /* 03A8 */   0xF8, 0xFF, 0xFF, 0x3F, 0x0A, 0x01, 0xCE, 0x02,
        /* 03B0 */   0x1C, 0x0D, 0x40, 0x37, 0xAD, 0x47, 0x21, 0xF0,
        /* 03B8 */   0xDE, 0x59, 0x4E, 0xFB, 0x04, 0x7C, 0x16, 0x02,
        /* 03C0 */   0xCC, 0xFE, 0xFF, 0xCF, 0x42, 0xC0, 0xEC, 0x28,
        /* 03C8 */   0x74, 0x14, 0x67, 0xF9, 0x2A, 0xF4, 0x04, 0xF0,
        /* 03D0 */   0x02, 0x10, 0x23, 0xCC, 0x3B, 0xD0, 0x4B, 0x26,
        /* 03D8 */   0xBB, 0x8B, 0x1B, 0xE7, 0xC9, 0xE5, 0x2C, 0x9E,
        /* 03E0 */   0xC4, 0x7D, 0x09, 0xF2, 0x81, 0xE2, 0x59, 0xC8,
        /* 03E8 */   0x50, 0xA7, 0x1B, 0xF4, 0x8D, 0xDC, 0x03, 0x8B,
        /* 03F0 */   0x19, 0x3F, 0xC4, 0xF3, 0x90, 0x21, 0x9E, 0x85,
        /* 03F8 */   0x00, 0x76, 0xFD, 0xFF, 0xCF, 0x42, 0x00, 0xFF,
        /* 0400 */   0xFF, 0xFF, 0x47, 0x03, 0xF8, 0x2F, 0x00, 0x9F,
        /* 0408 */   0x85, 0x80, 0xE7, 0x09, 0xE0, 0x41, 0xDB, 0x67,
        /* 0410 */   0x21, 0x80, 0x33, 0x87, 0xCB, 0xF3, 0x7F, 0x05,
        /* 0418 */   0x3A, 0x96, 0xF7, 0x08, 0xCF, 0xFA, 0x24, 0x5F,
        /* 0420 */   0x2F, 0x3D, 0xD3, 0x87, 0x82, 0x67, 0x21, 0x86,
        /* 0428 */   0x75, 0x18, 0x3E, 0x0B, 0x31, 0x88, 0x17, 0x4D,
        /* 0430 */   0x43, 0xBC, 0x70, 0xFA, 0x30, 0xE0, 0xFF, 0x3F,
        /* 0438 */   0x5E, 0xE0, 0x57, 0x4E, 0x03, 0x05, 0x09, 0xF4,
        /* 0440 */   0x2C, 0x04, 0x30, 0xFE, 0xFF, 0x7F, 0x16, 0x02,
        /* 0448 */   0xC8, 0xB8, 0x46, 0x9D, 0x85, 0x80, 0xE5, 0x6D,
        /* 0450 */   0xE5, 0x19, 0xDB, 0xA7, 0x95, 0x04, 0xFF, 0xFF,
        /* 0458 */   0x67, 0x21, 0xC0, 0x41, 0x2E, 0x23, 0x07, 0x21,
        /* 0460 */   0x4C, 0xC4, 0x87, 0x83, 0x8F, 0x99, 0x80, 0x9E,
        /* 0468 */   0x29, 0xBE, 0xB8, 0x1B, 0xE3, 0x09, 0xE0, 0x45,
        /* 0470 */   0xE2, 0x31, 0x93, 0x1D, 0x35, 0x0D, 0xF3, 0x2C,
        /* 0478 */   0x64, 0xBC, 0xB3, 0x78, 0x0D, 0x78, 0x82, 0xF7,
        /* 0480 */   0xE4, 0x9F, 0x85, 0x18, 0xD8, 0x61, 0x05, 0x7B,
        /* 0488 */   0x14, 0x32, 0xA8, 0xC1, 0x63, 0x87, 0x08, 0x13,
        /* 0490 */   0xE8, 0x59, 0x88, 0xC5, 0x7D, 0xAE, 0xE8, 0x3C,
        /* 0498 */   0xE1, 0xB3, 0x10, 0xF0, 0xFE, 0xFF, 0x9F, 0x25,
        /* 04A0 */   0xE0, 0x5E, 0x0D, 0x9E, 0x85, 0x00, 0x13, 0x87,
        /* 04A8 */   0x0D, 0x9F, 0x35, 0xC0, 0x33, 0x7C, 0x8F, 0xEA,
        /* 04B0 */   0x1C, 0x1E, 0x8F, 0x81, 0x7F, 0x56, 0x1D, 0xE7,
        /* 04B8 */   0x04, 0x96, 0x7B, 0xD1, 0xB2, 0x71, 0xA0, 0xA1,
        /* 04C0 */   0x23, 0xB2, 0x3A, 0x20, 0x8D, 0x0D, 0x73, 0x29,
        /* 04C8 */   0x89, 0x7C, 0x72, 0x6C, 0xD4, 0x56, 0x04, 0xA7,
        /* 04D0 */   0x33, 0x93, 0x4F, 0x00, 0xD6, 0x42, 0x21, 0x05,
        /* 04D8 */   0x34, 0x1A, 0x8B, 0xE1, 0x9D, 0xF9, 0xE8, 0x44,
        /* 04E0 */   0x41, 0x0C, 0xE8, 0xE3, 0x90, 0x6D, 0x1C, 0x0A,
        /* 04E8 */   0x50, 0x7B, 0xD1, 0x14, 0xC8, 0x39, 0x07, 0xA3,
        /* 04F0 */   0x7F, 0x76, 0x74, 0x36, 0xBE, 0x13, 0x70, 0x0D,
        /* 04F8 */   0x10, 0x3A, 0x25, 0x18, 0xDA, 0x6A, 0x04, 0xFC,
        /* 0500 */   0xFF, 0x67, 0x89, 0x01, 0x33, 0xFE, 0x53, 0x8C,
        /* 0508 */   0x09, 0x7C, 0x8E, 0xC1, 0x1F, 0x0C, 0xF0, 0x03,
        /* 0510 */   0x7F, 0x31, 0xA8, 0xFA, 0x5E, 0xA0, 0xFB, 0x82,
        /* 0518 */   0xD5, 0xDD, 0x64, 0x20, 0xCC, 0xC8, 0x04, 0xF5,
        /* 0520 */   0x9D, 0x0E, 0x40, 0x01, 0xE4, 0x0B, 0x81, 0xCF,
        /* 0528 */   0x51, 0x0F, 0x05, 0x6C, 0x22, 0x21, 0xC2, 0x44,
        /* 0530 */   0x33, 0x3A, 0x62, 0xC2, 0xA8, 0xE8, 0x13, 0xA6,
        /* 0538 */   0x20, 0x9E, 0xB0, 0x63, 0x4D, 0x18, 0x3D, 0x13,
        /* 0540 */   0x5F, 0x74, 0xD8, 0x88, 0x31, 0x21, 0xAE, 0x1E,
        /* 0548 */   0xD0, 0x26, 0x18, 0xD4, 0x97, 0x22, 0x58, 0x43,
        /* 0550 */   0xE6, 0x63, 0xF1, 0x05, 0x02, 0x37, 0x65, 0x30,
        /* 0558 */   0xCE, 0x89, 0x5D, 0x13, 0x7C, 0xD9, 0xC1, 0xCD,
        /* 0560 */   0x19, 0x8C, 0xF0, 0x98, 0xBB, 0x18, 0xBF, 0x3A,
        /* 0568 */   0x79, 0x74, 0xFC, 0xA0, 0xE0, 0x1B, 0x0E, 0xC3,
        /* 0570 */   0x7E, 0x32, 0xF3, 0x8C, 0xDE, 0xCB, 0x7C, 0x8D,
        /* 0578 */   0xC3, 0xC0, 0x7A, 0xBC, 0x1C, 0xD6, 0x68, 0x61,
        /* 0580 */   0x0F, 0xED, 0x3D, 0xC4, 0xFF, 0xFF, 0x43, 0x8C,
        /* 0588 */   0xCF, 0x13, 0xC6, 0x08, 0xEB, 0xDB, 0x0B, 0x38,
        /* 0590 */   0xEE, 0x59, 0xF0, 0xEF, 0x1A, 0xE0, 0xB9, 0x84,
        /* 0598 */   0xF8, 0xAE, 0x01, 0x30, 0xF0, 0xFF, 0x7F, 0xD7,
        /* 05A0 */   0x00, 0x4E, 0xD7, 0x04, 0xDF, 0x35, 0x80, 0xF7,
        /* 05A8 */   0xD0, 0x7D, 0xD7, 0x00, 0xAE, 0xD9, 0xEF, 0x1A,
        /* 05B0 */   0xA8, 0x63, 0x80, 0x15, 0xDE, 0x35, 0xA0, 0x5D,
        /* 05B8 */   0xD9, 0xDE, 0xD7, 0x9E, 0xB0, 0xAC, 0xE9, 0xB2,
        /* 05C0 */   0x81, 0x52, 0x73, 0xD9, 0x00, 0x14, 0xFC, 0xFF,
        /* 05C8 */   0x2F, 0x1B, 0x80, 0x01, 0x29, 0x13, 0x46, 0x85,
        /* 05D0 */   0x9F, 0x30, 0x05, 0xF1, 0x84, 0x1D, 0xEC, 0xB2,
        /* 05D8 */   0x01, 0x8A, 0x18, 0x97, 0x0D, 0xD0, 0x8F, 0xED,
        /* 05E0 */   0x65, 0x03, 0x18, 0xDC, 0x13, 0xF8, 0x6D, 0x03,
        /* 05E8 */   0x78, 0x43, 0xFA, 0xB6, 0x01, 0xD6, 0xFF, 0xFF,
        /* 05F0 */   0x6D, 0x03, 0xAC, 0xF9, 0x6F, 0x1B, 0x28, 0x0E,
        /* 05F8 */   0xAB, 0xBC, 0x6D, 0x40, 0x3C, 0xC9, 0x33, 0x02,
        /* 0600 */   0xAB, 0xBA, 0x6E, 0xA0, 0xF4, 0x5C, 0x37, 0x00,
        /* 0608 */   0x12, 0x88, 0x99, 0x30, 0x2A, 0xFE, 0x84, 0x29,
        /* 0610 */   0x88, 0x27, 0xEC, 0x68, 0xD7, 0x0D, 0x50, 0x04,
        /* 0618 */   0xB9, 0x6E, 0x80, 0x7E, 0x5E, 0x09, 0xFE, 0xFF,
        /* 0620 */   0xAF, 0x1B, 0xC0, 0xE0, 0xA2, 0x80, 0xB9, 0x6F,
        /* 0628 */   0x00, 0x6F, 0x58, 0x7E, 0xDF, 0x00, 0x7C, 0xDC,
        /* 0630 */   0xC4, 0x31, 0xF7, 0x0D, 0xC0, 0xCC, 0xFF, 0xFF,
        /* 0638 */   0xBE, 0x01, 0xB0, 0xE7, 0xA2, 0x80, 0xBB, 0x6F,
        /* 0640 */   0x00, 0xEF, 0x8B, 0xB4, 0xEF, 0x1B, 0x60, 0xFE,
        /* 0648 */   0xFF, 0xDF, 0x37, 0xC0, 0x28, 0x6D, 0xFD, 0x1E,
        /* 0650 */   0x1C, 0x3D, 0x21, 0x78, 0x7C, 0xB8, 0xFB, 0xA5,
        /* 0658 */   0xC7, 0xE7, 0xBB, 0x39, 0x38, 0x06, 0x79, 0x8C,
        /* 0660 */   0x87, 0x76, 0xC0, 0xAF, 0xEF, 0x9E, 0x98, 0xEF,
        /* 0668 */   0xE6, 0xC0, 0xFF, 0x4C, 0x70, 0x3C, 0x18, 0x68,
        /* 0670 */   0x1C, 0x62, 0xAB, 0x97, 0x06, 0x72, 0x34, 0x38,
        /* 0678 */   0x3F, 0xDC, 0x19, 0x81, 0x61, 0x15, 0x7F, 0xF2,
        /* 0680 */   0x47, 0x38, 0xC7, 0xD0, 0xD9, 0xE1, 0x20, 0xB1,
        /* 0688 */   0x83, 0xE0, 0xC1, 0x56, 0x6D, 0x02, 0x85, 0x86,
        /* 0690 */   0x50, 0x14, 0x18, 0x14, 0x8B, 0x0F, 0x18, 0xF8,
        /* 0698 */   0x61, 0xB3, 0xB3, 0x00, 0x93, 0x04, 0x87, 0x3A,
        /* 06A0 */   0x02, 0xF8, 0x3E, 0xD1, 0xFC, 0x38, 0x74, 0x37,
        /* 06A8 */   0x38, 0x54, 0x8F, 0xE5, 0xA1, 0x80, 0x9E, 0x01,
        /* 06B0 */   0x71, 0xC7, 0x0C, 0x32, 0x69, 0xCF, 0x28, 0xE2,
        /* 06B8 */   0x53, 0xC2, 0x29, 0x85, 0x49, 0xE0, 0xF3, 0x03,
        /* 06C0 */   0x43, 0xE3, 0x04, 0xAF, 0x0D, 0xA1, 0xF9, 0xFF,
        /* 06C8 */   0xFF, 0xA4, 0xC0, 0x3C, 0xDF, 0x31, 0x04, 0x6C,
        /* 06D0 */   0x02, 0xBB, 0xBF, 0x64, 0xC8, 0xDA, 0xC0, 0x75,
        /* 06D8 */   0x4B, 0x32, 0x44, 0x6F, 0x38, 0xB2, 0x85, 0xA2,
        /* 06E0 */   0xE9, 0x44, 0x79, 0xDF, 0x88, 0x62, 0x67, 0x08,
        /* 06E8 */   0xC2, 0x88, 0x12, 0x2C, 0xC8, 0xA3, 0x42, 0xAC,
        /* 06F0 */   0x28, 0x2F, 0x05, 0x46, 0x88, 0x18, 0xE2, 0x95,
        /* 06F8 */   0x23, 0xD0, 0x09, 0x87, 0x0F, 0xF2, 0xD8, 0x14,
        /* 0700 */   0xA7, 0xFD, 0x41, 0x90, 0x58, 0x4F, 0x02, 0x8D,
        /* 0708 */   0xC5, 0x91, 0x46, 0x83, 0x3A, 0x07, 0x78, 0xB8,
        /* 0710 */   0x3E, 0xC4, 0x78, 0xF8, 0x0F, 0x21, 0x06, 0x39,
        /* 0718 */   0xC8, 0x73, 0x7B, 0x54, 0x38, 0x4E, 0x5F, 0x25,
        /* 0720 */   0x4C, 0xF0, 0x02, 0xE0, 0x83, 0x0A, 0x1C, 0xD7,
        /* 0728 */   0x80, 0x9A, 0xF1, 0x33, 0x06, 0x58, 0x8E, 0xE3,
        /* 0730 */   0x3E, 0xA9, 0xC0, 0x1D, 0x8F, 0xEF, 0x07, 0x6C,
        /* 0738 */   0xC2, 0x09, 0x2C, 0x7F, 0x10, 0xA8, 0xE3, 0x0C,
        /* 0740 */   0x9F, 0xE7, 0x0B, 0x8B, 0x21, 0x1F, 0x13, 0x4C,
        /* 0748 */   0x60, 0xB1, 0x27, 0x1B, 0x3A, 0x1E, 0xF0, 0xDF,
        /* 0750 */   0x63, 0x1E, 0x2F, 0x7C, 0x32, 0xF1, 0x7C, 0x4D,
        /* 0758 */   0x30, 0x22, 0x84, 0x9C, 0x8C, 0x07, 0x7D, 0x87,
        /* 0760 */   0xC0, 0x5C, 0x6F, 0xD8, 0xB9, 0x85, 0x8B, 0x3A,
        /* 0768 */   0x68, 0xA0, 0x4E, 0x0B, 0x3E, 0x28, 0xB0, 0x9B,
        /* 0770 */   0x11, 0xE6, 0xB8, 0xCE, 0xCF, 0x2A, 0x60, 0xF8,
        /* 0778 */   0xFF, 0x9F, 0x55, 0x60, 0x8F, 0x10, 0xFE, 0xED,
        /* 0780 */   0xC1, 0xF3, 0xF2, 0x95, 0xE1, 0xD5, 0x21, 0x81,
        /* 0788 */   0x43, 0x8E, 0x10, 0x3D, 0x2E, 0x8F, 0x10, 0x73,
        /* 0790 */   0x3E, 0xC2, 0x0C, 0x11, 0x5C, 0x67, 0x01, 0x70,
        /* 0798 */   0x0C, 0x11, 0xF8, 0x1C, 0x70, 0xC0, 0x71, 0x69,
        /* 07A0 */   0xE2, 0x03, 0xF5, 0x01, 0x07, 0x70, 0x70, 0x4D,
        /* 07A8 */   0xC3, 0x1D, 0x70, 0xC0, 0x71, 0x16, 0x60, 0xFF,
        /* 07B0 */   0xFF, 0xC3, 0x0D, 0x2C, 0x49, 0x26, 0x0E, 0x23,
        /* 07B8 */   0x18, 0x11, 0x30, 0x28, 0x02, 0x02, 0xA4, 0xB3,
        /* 07C0 */   0x80, 0x0F, 0x29, 0x00, 0x1F, 0xAE, 0x0C, 0x0F,
        /* 07C8 */   0x29, 0xD8, 0x93, 0x86, 0x07, 0x8E, 0x1B, 0x85,
        /* 07D0 */   0x07, 0x8D, 0x0B, 0x30, 0x68, 0x7A, 0xE2, 0x80,
        /* 07D8 */   0x7F, 0x4C, 0xF0, 0x19, 0x05, 0x1C, 0xE3, 0x06,
        /* 07E0 */   0xDF, 0x2A, 0x0C, 0xFC, 0xFF, 0x3F, 0x30, 0xCC,
        /* 07E8 */   0xE1, 0xC2, 0x63, 0x39, 0x8A, 0xA0, 0x07, 0x1E,
        /* 07F0 */   0xD4, 0xF7, 0x8C, 0x33, 0xF7, 0x24, 0x8F, 0xD1,
        /* 07F8 */   0x51, 0x0F, 0x27, 0xF4, 0xE4, 0x85, 0x3B, 0x57,
        /* 0800 */   0xF9, 0x0A, 0x71, 0x14, 0x18, 0xB8, 0x77, 0x29,
        /* 0808 */   0x8F, 0xCF, 0x17, 0x2B, 0xC3, 0x63, 0x46, 0xFB,
        /* 0810 */   0x1E, 0x72, 0xD6, 0x11, 0x02, 0xE2, 0x2F, 0x75,
        /* 0818 */   0x6C, 0xC0, 0x60, 0x39, 0x18, 0x00, 0x87, 0x01,
        /* 0820 */   0xE3, 0x13, 0x0D, 0x58, 0x67, 0x1B, 0x3C, 0xF4,
        /* 0828 */   0x69, 0x31, 0xC4, 0xE3, 0x0B, 0xFB, 0x56, 0x61,
        /* 0830 */   0x82, 0xEA, 0x41, 0x75, 0x12, 0xF4, 0xD0, 0xC0,
        /* 0838 */   0x01, 0xE8, 0xA1, 0xC1, 0x3F, 0xB9, 0x90, 0xFB,
        /* 0840 */   0x2B, 0x1D, 0x82, 0xB5, 0xE2, 0x69, 0xDE, 0x47,
        /* 0848 */   0x1E, 0xF3, 0xDC, 0xA2, 0xBC, 0x0D, 0x3C, 0x07,
        /* 0850 */   0xF0, 0xD3, 0x82, 0x87, 0xE3, 0x63, 0x81, 0xC7,
        /* 0858 */   0xE9, 0x4B, 0x58, 0x82, 0xF7, 0x1A, 0x9F, 0x6C,
        /* 0860 */   0x1E, 0x5C, 0x58, 0xB2, 0x21, 0xA0, 0x06, 0xEB,
        /* 0868 */   0x21, 0x60, 0xA6, 0x9A, 0xC0, 0x49, 0x46, 0x80,
        /* 0870 */   0xCA, 0x00, 0xA1, 0x1B, 0xCB, 0xE9, 0x3E, 0x8B,
        /* 0878 */   0x84, 0x38, 0xCD, 0x47, 0x99, 0xC7, 0x02, 0x8F,
        /* 0880 */   0xF5, 0xC1, 0xC0, 0xFF, 0x7F, 0xCD, 0x23, 0xD4,
        /* 0888 */   0x7D, 0xCD, 0x33, 0x7B, 0x3A, 0xC0, 0xAC, 0x22,
        /* 0890 */   0xDC, 0x7B, 0xCE, 0x1B, 0x86, 0xD1, 0x9E, 0x2D,
        /* 0898 */   0x7C, 0xCD, 0x78, 0xD6, 0x34, 0x42, 0x38, 0x76,
        /* 08A0 */   0x83, 0xF3, 0x48, 0x8C, 0xF0, 0x82, 0xC0, 0x4E,
        /* 08A8 */   0x0C, 0x0F, 0x30, 0xC6, 0x39, 0x79, 0xC3, 0xFA,
        /* 08B0 */   0xC2, 0xCB, 0x40, 0x83, 0x19, 0xDB, 0x97, 0x01,
        /* 08B8 */   0x36, 0x2A, 0xDF, 0x88, 0xC0, 0x97, 0xFC, 0x62,
        /* 08C0 */   0x00, 0x65, 0x16, 0xBE, 0x9E, 0xF8, 0xA0, 0xC4,
        /* 08C8 */   0x2E, 0x06, 0x2C, 0xE5, 0xC5, 0x00, 0x54, 0x37,
        /* 08D0 */   0x0C, 0x5F, 0x0C, 0xE0, 0x5F, 0x89, 0x5E, 0x0C,
        /* 08D8 */   0xC0, 0x70, 0x71, 0xF2, 0x3D, 0xC0, 0x1E, 0xEE,
        /* 08E0 */   0xA3, 0x74, 0x9C, 0xBE, 0xFD, 0xBD, 0x19, 0xF8,
        /* 08E8 */   0x6C, 0xC0, 0x60, 0x3C, 0xC3, 0x30, 0xC6, 0x08,
        /* 08F0 */   0xE3, 0x51, 0x86, 0x31, 0xC1, 0xDC, 0xB7, 0x03,
        /* 08F8 */   0xE8, 0x39, 0x87, 0x81, 0x4A, 0x78, 0x3B, 0x80,
        /* 0900 */   0x72, 0x0E, 0xE8, 0xF2, 0x68, 0x42, 0x4F, 0x01,
        /* 0908 */   0x4F, 0x07, 0x3E, 0x29, 0x1A, 0xA2, 0xAF, 0xB1,
        /* 0910 */   0x0A, 0x26, 0x50, 0xC4, 0x07, 0x0D, 0x3E, 0xB5,
        /* 0918 */   0x28, 0x3E, 0x15, 0x78, 0x2D, 0xCF, 0x4E, 0xE1,
        /* 0920 */   0xE2, 0x9C, 0x89, 0xA7, 0x6A, 0x38, 0x03, 0xBD,
        /* 0928 */   0xE6, 0x86, 0x63, 0xFF, 0x7F, 0x38, 0xFC, 0xA9,
        /* 0930 */   0xE0, 0x35, 0x80, 0x1D, 0x24, 0x3D, 0x2D, 0x23,
        /* 0938 */   0xC2, 0x38, 0xA4, 0x3C, 0x32, 0xF8, 0xB6, 0x18,
        /* 0940 */   0xC7, 0x90, 0x0F, 0x91, 0xBE, 0x13, 0x18, 0xF2,
        /* 0948 */   0x21, 0xEF, 0x79, 0xC7, 0xC0, 0xAF, 0x08, 0x71,
        /* 0950 */   0x9E, 0xB2, 0x7C, 0x67, 0xF0, 0x65, 0x01, 0x7C,
        /* 0958 */   0x91, 0x2E, 0x0B, 0x68, 0x68, 0x9F, 0x64, 0x7C,
        /* 0960 */   0x41, 0x30, 0xEC, 0x89, 0xB3, 0x00, 0x77, 0x05,
        /* 0968 */   0x50, 0x81, 0xFA, 0xAE, 0x00, 0xFF, 0x42, 0xF0,
        /* 0970 */   0xAE, 0x00, 0x86, 0x79, 0xF9, 0x56, 0xC0, 0x35,
        /* 0978 */   0x1D, 0x4A, 0xD0, 0x67, 0x12, 0x5F, 0x17, 0x70,
        /* 0980 */   0x53, 0x64, 0xA9, 0x8E, 0x0A, 0xD0, 0x53, 0x4C,
        /* 0988 */   0x02, 0x75, 0x47, 0xF7, 0x51, 0x01, 0xC6, 0x4D,
        /* 0990 */   0xD9, 0x07, 0x54, 0x76, 0x5A, 0x60, 0x67, 0x21,
        /* 0998 */   0x76, 0x1D, 0xC1, 0x5D, 0x49, 0x18, 0xCA, 0xB3,
        /* 09A0 */   0x81, 0x2F, 0x59, 0xFC, 0x70, 0x00, 0x03, 0xDC,
        /* 09A8 */   0xB3, 0x38, 0xC4, 0x08, 0xB1, 0xD9, 0x81, 0xEB,
        /* 09B0 */   0x75, 0xD2, 0x70, 0x2F, 0x44, 0xEC, 0xFF, 0x7F,
        /* 09B8 */   0x32, 0x00, 0xE3, 0x51, 0x1B, 0x1C, 0x27, 0x9D,
        /* 09C0 */   0xF0, 0x91, 0x9E, 0x59, 0xF8, 0x49, 0x19, 0x30,
        /* 09C8 */   0x71, 0xF2, 0x03, 0xE3, 0xC9, 0x1A, 0xC6, 0x00,
        /* 09D0 */   0xB8, 0xBC, 0x57, 0x95, 0x81, 0xFC, 0x43, 0x90,
        /* 09D8 */   0x20, 0x18, 0xD4, 0x29, 0x19, 0x38, 0x1C, 0xC5,
        /* 09E0 */   0x70, 0xA7, 0x64, 0x78, 0x50, 0xF8, 0xC3, 0x00,
        /* 09E8 */   0xE6, 0x46, 0xE8, 0x7B, 0x82, 0xA1, 0xDE, 0x93,
        /* 09F0 */   0x0E, 0xE3, 0x91, 0xD0, 0x04, 0x3E, 0x2D, 0xC3,
        /* 09F8 */   0xFA, 0xFF, 0x9F, 0x96, 0x81, 0xD5, 0xB1, 0xDD,
        /* 0A00 */   0x43, 0xF6, 0x59, 0x01, 0x77, 0x76, 0x80, 0x3B,
        /* 0A08 */   0x3D, 0x7E, 0x7A, 0x00, 0x9C, 0x00, 0x3D, 0x3D,
        /* 0A10 */   0x80, 0xED, 0xBC, 0x01, 0xF7, 0x40, 0x80, 0x38,
        /* 0A18 */   0xFE, 0xA3, 0x82, 0x5F, 0x59, 0x28, 0x1C, 0x3F,
        /* 0A20 */   0xB6, 0xF3, 0x63, 0x09, 0xEE, 0x70, 0xE0, 0x23,
        /* 0A28 */   0x83, 0x0F, 0x90, 0xB8, 0xA1, 0xF8, 0x50, 0x81,
        /* 0A30 */   0x3C, 0x0B, 0x80, 0x62, 0xF4, 0x6C, 0x04, 0xEC,
        /* 0A38 */   0x06, 0xF3, 0xD2, 0x12, 0xE5, 0xFF, 0xFF, 0xDE,
        /* 0A40 */   0xC0, 0x4E, 0x29, 0xB8, 0x83, 0x00, 0xF8, 0x8E,
        /* 0A48 */   0x01, 0xE0, 0x1D, 0x0C, 0x97, 0x35, 0x66, 0x94,
        /* 0A50 */   0x10, 0x18, 0x8D, 0x19, 0x77, 0x08, 0xE1, 0x27,
        /* 0A58 */   0x02, 0xDC, 0x98, 0x3D, 0x6E, 0x8F, 0x19, 0x77,
        /* 0A60 */   0x9C, 0xE5, 0xA3, 0x7A, 0xCA, 0x08, 0xE5, 0x03,
        /* 0A68 */   0x07, 0x3B, 0x67, 0xBC, 0x11, 0xF0, 0xA1, 0x03,
        /* 0A70 */   0x8F, 0x03, 0x0C, 0xEE, 0x48, 0x01, 0xC6, 0xCB,
        /* 0A78 */   0x01, 0x1B, 0x3B, 0xB8, 0x83, 0x90, 0x53, 0x20,
        /* 0A80 */   0x4B, 0x87, 0xD1, 0xD8, 0x71, 0xB2, 0x81, 0x74,
        /* 0A88 */   0x8C, 0xF1, 0x21, 0xD7, 0x63, 0xC7, 0x0D, 0xD6,
        /* 0A90 */   0x63, 0xC7, 0x1D, 0x5F, 0xB0, 0xFF, 0xFF, 0xE3,
        /* 0A98 */   0x0B, 0x18, 0xC6, 0xC0, 0xC5, 0x0F, 0x03, 0x7D,
        /* 0AA0 */   0xF3, 0xF3, 0xE8, 0x0C, 0xEE, 0x61, 0xFB, 0x04,
        /* 0AA8 */   0x13, 0xE3, 0xF9, 0x25, 0xC4, 0x23, 0xCC, 0x8B,
        /* 0AB0 */   0x4B, 0x84, 0xA3, 0x08, 0xF2, 0xE6, 0x12, 0xE7,
        /* 0AB8 */   0xD5, 0x20, 0xCC, 0x63, 0x4B, 0x94, 0x10, 0x11,
        /* 0AC0 */   0x0E, 0x26, 0xCE, 0x13, 0x8C, 0x11, 0x0E, 0x3C,
        /* 0AC8 */   0x8A, 0x21, 0x22, 0x9C, 0x40, 0x88, 0x93, 0x3E,
        /* 0AD0 */   0xD9, 0x20, 0xE1, 0x63, 0x84, 0x8D, 0xF6, 0x04,
        /* 0AD8 */   0xC3, 0xC7, 0xC2, 0xCF, 0x2B, 0x1E, 0x3C, 0x3F,
        /* 0AE0 */   0xAD, 0xF9, 0x2E, 0xE8, 0xC9, 0x9C, 0xE3, 0x43,
        /* 0AE8 */   0x96, 0xA7, 0xF6, 0x38, 0xE9, 0xC3, 0x2C, 0x6E,
        /* 0AF0 */   0x50, 0x0F, 0x8E, 0xEC, 0xAE, 0xE3, 0xE3, 0x35,
        /* 0AF8 */   0xF6, 0x14, 0xE4, 0x21, 0xF0, 0x13, 0x81, 0x2F,
        /* 0B00 */   0x88, 0x9E, 0xAC, 0xEF, 0x7A, 0xEC, 0x5E, 0x66,
        /* 0B08 */   0x8C, 0xEA, 0xA7, 0x80, 0x3A, 0xA6, 0x9C, 0xC1,
        /* 0B10 */   0x2B, 0x04, 0xBB, 0xE7, 0xF9, 0x90, 0xED, 0xBB,
        /* 0B18 */   0x24, 0x1B, 0x05, 0xEE, 0x90, 0xE0, 0x33, 0x12,
        /* 0B20 */   0x3F, 0x55, 0x78, 0x18, 0x1E, 0x05, 0x8C, 0x19,
        /* 0B28 */   0xBC, 0x23, 0x1C, 0x5A, 0x88, 0x03, 0x7E, 0xDF,
        /* 0B30 */   0x65, 0x43, 0x8D, 0x71, 0x7A, 0x3E, 0x7F, 0xB0,
        /* 0B38 */   0x41, 0xC0, 0x87, 0x3A, 0x54, 0x0F, 0xF3, 0xA8,
        /* 0B40 */   0x5E, 0x0A, 0x19, 0xCE, 0xD9, 0xC1, 0x1D, 0x04,
        /* 0B48 */   0xF6, 0xF8, 0xE1, 0x41, 0xF0, 0x9B, 0x25, 0x1F,
        /* 0B50 */   0x04, 0x3B, 0xDF, 0xBC, 0xC1, 0x19, 0xE4, 0xFF,
        /* 0B58 */   0x7F, 0x0C, 0xB0, 0xCF, 0x54, 0x3E, 0x9A, 0x20,
        /* 0B60 */   0x8E, 0x80, 0xE8, 0xF3, 0x87, 0xC7, 0xF0, 0x26,
        /* 0B68 */   0xC7, 0x87, 0x83, 0x3D, 0x7A, 0xE0, 0x4E, 0x22,
        /* 0B70 */   0x70, 0x8F, 0x5D, 0x07, 0xED, 0x6B, 0x9C, 0x2F,
        /* 0B78 */   0x5A, 0x30, 0xEE, 0x7B, 0xCF, 0x22, 0xE0, 0xC7,
        /* 0B80 */   0x78, 0x6C, 0x01, 0xC7, 0xA1, 0x04, 0xDC, 0xC1,
        /* 0B88 */   0x8E, 0x6B, 0x1C, 0x42, 0x51, 0x60, 0x74, 0x28,
        /* 0B90 */   0xC1, 0xC5, 0x00, 0x12, 0x8C, 0x63, 0x9C, 0xD1,
        /* 0B98 */   0xD0, 0x97, 0x48, 0x1F, 0xD2, 0xE0, 0x0C, 0x1A,
        /* 0BA0 */   0xF6, 0x3C, 0x9F, 0x50, 0xB8, 0x3D, 0x01, 0x8A,
        /* 0BA8 */   0x4E, 0x28, 0x20, 0xC3, 0x7D, 0x06, 0xC1, 0x9E,
        /* 0BB0 */   0x10, 0xF8, 0x19, 0x84, 0xFD, 0xFF, 0x0F, 0x8E,
        /* 0BB8 */   0x1E, 0xF7, 0x7B, 0xA3, 0x4F, 0x8D, 0x6C, 0xEE,
        /* 0BC0 */   0x0F, 0x01, 0x27, 0x70, 0xEE, 0xEC, 0xD4, 0x8C,
        /* 0BC8 */   0x3B, 0x33, 0x60, 0xCF, 0x1F, 0x1E, 0x02, 0x3F,
        /* 0BD0 */   0x17, 0x78, 0xF8, 0x1E, 0x02, 0x7E, 0xF0, 0x0F,
        /* 0BD8 */   0xCC, 0x06, 0x07, 0xE3, 0x29, 0xC2, 0xD7, 0x0E,
        /* 0BE0 */   0x0E, 0xCE, 0x4F, 0x03, 0x06, 0xE7, 0xAF, 0x50,
        /* 0BE8 */   0x9F, 0xE7, 0x19, 0x38, 0xF6, 0xD4, 0xEB, 0x7B,
        /* 0BF0 */   0x87, 0xE7, 0xEB, 0x43, 0x05, 0xFE, 0xA6, 0xE7,
        /* 0BF8 */   0x43, 0x05, 0x38, 0x0E, 0x0F, 0xFC, 0xB0, 0xC2,
        /* 0C00 */   0x86, 0xF0, 0x28, 0x80, 0x3F, 0xB5, 0xF8, 0xF8,
        /* 0C08 */   0x17, 0xE7, 0x29, 0x82, 0xDD, 0x46, 0xB0, 0x87,
        /* 0C10 */   0x0B, 0xC0, 0x51, 0xB4, 0xB3, 0x18, 0x2A, 0xCC,
        /* 0C18 */   0x59, 0x8C, 0xFC, 0xFF, 0xCF, 0x51, 0xA8, 0xB3,
        /* 0C20 */   0x18, 0x3D, 0x5C, 0x00, 0x2E, 0x04, 0x1F, 0x0F,
        /* 0C28 */   0x40, 0x73, 0x10, 0x78, 0x5C, 0xF0, 0x85, 0xE0,
        /* 0C30 */   0x48, 0x0E, 0xE4, 0xE9, 0x00, 0xF0, 0x19, 0x4A,
        /* 0C38 */   0xC3, 0xA1, 0x09, 0x13, 0x03, 0x06, 0x75, 0x3E,
        /* 0C40 */   0xF0, 0x09, 0xC5, 0xC7, 0x0E, 0x7E, 0x36, 0xF0,
        /* 0C48 */   0x8D, 0xDC, 0x43, 0xE5, 0xA7, 0x66, 0x5F, 0xF2,
        /* 0C50 */   0x11, 0xE0, 0x02, 0x75, 0xA0, 0x61, 0xA0, 0x46,
        /* 0C58 */   0xE4, 0x23, 0xD2, 0xFF, 0xFF, 0xB9, 0x0D, 0x1B,
        /* 0C60 */   0x60, 0x68, 0xF4, 0x1C, 0x0E, 0xE3, 0x80, 0xEB,
        /* 0C68 */   0x73, 0x38, 0x76, 0x40, 0x3E, 0x87, 0xC3, 0x3F,
        /* 0C70 */   0x47, 0xC3, 0x1F, 0x1B, 0x3B, 0xDD, 0xF3, 0x81,
        /* 0C78 */   0xC1, 0xBA, 0x7E, 0x63, 0x06, 0x06, 0xB6, 0x6F,
        /* 0C80 */   0x91, 0x07, 0x06, 0x1C, 0x51, 0xCF, 0xC6, 0x57,
        /* 0C88 */   0x08, 0x0F, 0x0C, 0x6C, 0x80, 0x1E, 0x18, 0xF0,
        /* 0C90 */   0x89, 0x05, 0x21, 0x27, 0x03, 0x43, 0x9D, 0x32,
        /* 0C98 */   0x8C, 0x1C, 0xF3, 0x89, 0xC3, 0xC3, 0xF0, 0xA1,
        /* 0CA0 */   0x22, 0xEA, 0x33, 0xC0, 0x23, 0x1E, 0x1B, 0x1B,
        /* 0CA8 */   0xFB, 0xFF, 0x8F, 0x0D, 0x2C, 0xC7, 0x16, 0x8F,
        /* 0CB0 */   0x0D, 0xFC, 0x47, 0x78, 0xFC, 0xD8, 0xE0, 0x8C,
        /* 0CB8 */   0xE5, 0xD1, 0xC4, 0x97, 0x99, 0x23, 0x3B, 0x8D,
        /* 0CC0 */   0x33, 0x7B, 0x0D, 0xF1, 0xD1, 0xEE, 0xF1, 0xDB,
        /* 0CC8 */   0x63, 0x03, 0x97, 0x85, 0xB1, 0x01, 0xA5, 0x90,
        /* 0CD0 */   0x63, 0x43, 0x1F, 0x52, 0x7C, 0x0A, 0xB0, 0x71,
        /* 0CD8 */   0x54, 0x32, 0x0F, 0x1F, 0xAF, 0x7C, 0x62, 0x38,
        /* 0CE0 */   0xBA, 0x20, 0x6F, 0xE8, 0xBE, 0x5C, 0xF8, 0x48,
        /* 0CE8 */   0x63, 0x30, 0x5F, 0x5A, 0x7C, 0x06, 0xE5, 0x43,
        /* 0CF0 */   0x04, 0xD7, 0x57, 0xC5, 0x43, 0x04, 0x3E, 0xA1,
        /* 0CF8 */   0x86, 0x88, 0x1E, 0xCF, 0xFF, 0xFF, 0x11, 0xCC,
        /* 0D00 */   0x43, 0x64, 0x43, 0x03, 0xAF, 0x87, 0xA1, 0x01,
        /* 0D08 */   0xA5, 0x98, 0xC0, 0x5E, 0x85, 0x87, 0x46, 0x4F,
        /* 0D10 */   0x3F, 0x3E, 0x04, 0x30, 0x08, 0xDF, 0x06, 0xD8,
        /* 0D18 */   0x55, 0xC0, 0x57, 0x21, 0x83, 0x24, 0x18, 0xE7,
        /* 0D20 */   0x64, 0x41, 0x07, 0x07, 0x8E, 0x21, 0x79, 0x70,
        /* 0D28 */   0xF0, 0x07, 0xE3, 0x21, 0x70, 0x60, 0xCF, 0xE0,
        /* 0D30 */   0xB9, 0xE8, 0x31, 0xD8, 0xA7, 0x1D, 0x9F, 0x4A,
        /* 0D38 */   0xC0, 0x77, 0xE6, 0x04, 0xC7, 0xE9, 0x1D, 0x7B,
        /* 0D40 */   0x29, 0xF0, 0x08, 0x1E, 0xAD, 0x3C, 0x02, 0x7E,
        /* 0D48 */   0xB4, 0x02, 0x66, 0xFF, 0xFF, 0xA3, 0x15, 0x30,
        /* 0D50 */   0x09, 0x7A, 0xE6, 0xA4, 0x03, 0x77, 0x34, 0x18,
        /* 0D58 */   0xD4, 0xD1, 0x0A, 0x5C, 0x11, 0xC0, 0x75, 0xDC,
        /* 0D60 */   0xF0, 0xD1, 0x02, 0xCE, 0x50, 0x0F, 0xDA, 0x07,
        /* 0D68 */   0x65, 0xCF, 0xDA, 0x97, 0x21, 0x76, 0xB4, 0x00,
        /* 0D70 */   0x97, 0x89, 0x43, 0x08, 0xD0, 0x04, 0x3E, 0x89,
        /* 0D78 */   0x67, 0xEF, 0x43, 0x03, 0xB3, 0x8A, 0xA1, 0x01,
        /* 0D80 */   0xA5, 0xA3, 0x01, 0xEE, 0x44, 0x81, 0xFD, 0xFF,
        /* 0D88 */   0x9F, 0x28, 0x60, 0xDE, 0x30, 0x70, 0x07, 0x0A,
        /* 0D90 */   0xC0, 0xCD, 0xE9, 0xDB, 0xE3, 0xE2, 0xD0, 0x38,
        /* 0D98 */   0xC4, 0xE7, 0xA7, 0x73, 0xF6, 0xD1, 0xE8, 0x4C,
        /* 0DA0 */   0x71, 0x67, 0x11, 0x30, 0x9C, 0x7D, 0x11, 0x8F,
        /* 0DA8 */   0x18, 0x03, 0xF9, 0x81, 0x21, 0x59, 0x30, 0x28,
        /* 0DB0 */   0x16, 0x0F, 0xC5, 0x07, 0x03, 0x0E, 0xEC, 0x23,
        /* 0DB8 */   0x02, 0x3B, 0x17, 0xB0, 0x73, 0xAD, 0xE1, 0xF8,
        /* 0DC0 */   0x59, 0xC0, 0xA7, 0x84, 0xB7, 0xA6, 0x17, 0x7B,
        /* 0DC8 */   0x9F, 0xD7, 0x7D, 0xD6, 0x08, 0xC9, 0xCE, 0xF4,
        /* 0DD0 */   0x3E, 0x89, 0xE2, 0x0E, 0xA2, 0x70, 0x4E, 0x9F,
        /* 0DD8 */   0xE0, 0x22, 0xF0, 0x65, 0xDF, 0xA3, 0xE0, 0xA7,
        /* 0DE0 */   0x07, 0xCF, 0xF1, 0x8D, 0xC1, 0xA7, 0x07, 0xE6,
        /* 0DE8 */   0x7E, 0xF8, 0x9A, 0xF1, 0x33, 0xC3, 0xE3, 0x43,
        /* 0DF0 */   0x88, 0x27, 0xE2, 0xDA, 0xA6, 0x20, 0x5B, 0x18,
        /* 0DF8 */   0x42, 0x09, 0xF4, 0xFF, 0x8F, 0x10, 0xE5, 0x6D,
        /* 0E00 */   0x20, 0xCA, 0x29, 0x44, 0x88, 0x12, 0xA4, 0xB1,
        /* 0E08 */   0xC9, 0x0B, 0x35, 0xCA, 0xD9, 0x45, 0x6E, 0x6D,
        /* 0E10 */   0xF6, 0x82, 0x0B, 0x14, 0x2A, 0x66, 0x9C, 0x28,
        /* 0E18 */   0xEF, 0x10, 0xB1, 0xDA, 0x1F, 0x04, 0x91, 0xF4,
        /* 0E20 */   0x32, 0xD0, 0x71, 0xC9, 0x91, 0x0E, 0x7D, 0xE8,
        /* 0E28 */   0x61, 0xFB, 0x04, 0x8C, 0x3F, 0x48, 0xE2, 0xAE,
        /* 0E30 */   0x2A, 0x3E, 0x28, 0xF8, 0x00, 0x80, 0x77, 0x09,
        /* 0E38 */   0xA8, 0x5B, 0x9D, 0xC7, 0xED, 0xF3, 0x06, 0xF8,
        /* 0E40 */   0xAF, 0x17, 0x58, 0x82, 0xF2, 0x07, 0x81, 0x1A,
        /* 0E48 */   0x99, 0xA1, 0x3D, 0xCC, 0xB7, 0x19, 0x43, 0xBE,
        /* 0E50 */   0x07, 0x1C, 0x16, 0x3B, 0x27, 0xF9, 0xF0, 0x08,
        /* 0E58 */   0x1C, 0x8E, 0x01, 0x4F, 0x1B, 0xBE, 0x51, 0x7B,
        /* 0E60 */   0xBE, 0x3E, 0x62, 0x01, 0x8E, 0xFE, 0xFF, 0x47,
        /* 0E68 */   0x2C, 0x30, 0x9D, 0xDF, 0x7D, 0x82, 0x01, 0xC7,
        /* 0E70 */   0xCD, 0x82, 0x9F, 0x61, 0x00, 0x67, 0x40, 0xCF,
        /* 0E78 */   0x30, 0x60, 0x1F, 0x2A, 0x6E, 0x08, 0x5C, 0xEE,
        /* 0E80 */   0x8A, 0x28, 0x90, 0x05, 0xC2, 0xA0, 0x0E, 0xFD,
        /* 0E88 */   0xE4, 0x08, 0x42, 0xCF, 0x9C, 0x70, 0x86, 0x72,
        /* 0E90 */   0xB2, 0xBD, 0x5F, 0x1D, 0xC8, 0x2D, 0xC2, 0x43,
        /* 0E98 */   0x3D, 0x8B, 0xC7, 0x04, 0x76, 0xDA, 0x02, 0x36,
        /* 0EA0 */   0xFF, 0xFF, 0xE3, 0x29, 0xB0, 0x98, 0xF7, 0xD3,
        /* 0EA8 */   0x69, 0x84, 0x63, 0x03, 0xFB, 0x71, 0x0B, 0x38,
        /* 0EB0 */   0x1D, 0xCC, 0xE0, 0xDC, 0x7F, 0xD8, 0x2D, 0x1A,
        /* 0EB8 */   0x37, 0x34, 0xB0, 0x0D, 0xCC, 0x43, 0x03, 0x3E,
        /* 0EC0 */   0x27, 0x47, 0x30, 0x9E, 0x98, 0xF8, 0x55, 0xE2,
        /* 0EC8 */   0xE1, 0x89, 0x1F, 0x43, 0xC0, 0xFA, 0xFF, 0x3F,
        /* 0ED0 */   0x99, 0x01, 0xF6, 0x84, 0x1E, 0xCB, 0x50, 0xD2,
        /* 0ED8 */   0x4E, 0x66, 0x80, 0xC0, 0xFB, 0xD8, 0x3B, 0xC3,
        /* 0EE0 */   0x4B, 0x83, 0xE7, 0x74, 0xD2, 0xCF, 0x62, 0x3E,
        /* 0EE8 */   0x99, 0x19, 0x21, 0x0A, 0xBB, 0x8F, 0x19, 0xAD,
        /* 0EF0 */   0x37, 0x14, 0xCD, 0x3C, 0xE8, 0x3B, 0x99, 0x51,
        /* 0EF8 */   0x62, 0x46, 0x6A, 0x0E, 0x4C, 0x48, 0x11, 0x0F,
        /* 0F00 */   0x27, 0x4A, 0x88, 0x60, 0xAF, 0x13, 0x6F, 0x67,
        /* 0F08 */   0x4F, 0x66, 0x4C, 0xD6, 0xC9, 0x0C, 0x24, 0xFF,
        /* 0F10 */   0xFF, 0x93, 0x19, 0x98, 0x5C, 0x9F, 0xCC, 0x80,
        /* 0F18 */   0xCA, 0x39, 0x0A, 0x7F, 0x32, 0x03, 0x78, 0x74,
        /* 0F20 */   0xC0, 0xC2, 0x9D, 0xCC, 0xC0, 0xF2, 0xFF, 0x3F,
        /* 0F28 */   0xC4, 0x00, 0xCE, 0xC7, 0x0A, 0x63, 0x0C, 0x3C,
        /* 0F30 */   0xDA, 0xC1, 0x0C, 0x15, 0xE6, 0x6C, 0x86, 0x0E,
        /* 0F38 */   0x72, 0x08, 0xA1, 0xC1, 0x0E, 0x21, 0x50, 0xE6,
        /* 0F40 */   0x72, 0xA0, 0xA7, 0xF0, 0x9A, 0xE0, 0x73, 0x14,
        /* 0F48 */   0xD8, 0x0F, 0x67, 0xC0, 0xE1, 0xD4, 0x80, 0x0F,
        /* 0F50 */   0x74, 0xE2, 0x42, 0x8F, 0xC2, 0x23, 0x0E, 0x58,
        /* 0F58 */   0xFD, 0xC0, 0xC8, 0xFF, 0xFF, 0x64, 0x06, 0x18,
        /* 0F60 */   0x78, 0x6A, 0xF8, 0x40, 0x82, 0x63, 0x31, 0xEA,
        /* 0F68 */   0x1B, 0xC4, 0x21, 0xBE, 0x8D, 0xF8, 0xE8, 0xFE,
        /* 0F70 */   0x6A, 0xE2, 0x4B, 0x00, 0xE6, 0x42, 0xE2, 0xD3,
        /* 0F78 */   0x09, 0xB3, 0x70, 0x38, 0x03, 0x5A, 0x43, 0x60,
        /* 0F80 */   0x57, 0x26, 0xCF, 0x9C, 0x0F, 0xE1, 0x6C, 0x3C,
        /* 0F88 */   0x7A, 0xDC, 0xE9, 0x04, 0xDE, 0x38, 0x7C, 0x3A,
        /* 0F90 */   0x01, 0x5E, 0x07, 0x0C, 0xCC, 0x0C, 0xC2, 0x3F,
        /* 0F98 */   0x84, 0xB0, 0x21, 0x9C, 0xAA, 0xC7, 0x70, 0xEE,
        /* 0FA0 */   0xAF, 0x38, 0x3E, 0x9D, 0x80, 0xF3, 0xFF, 0x7F,
        /* 0FA8 */   0x62, 0x03, 0x0C, 0x0A, 0x7E, 0x32, 0xF8, 0xB8,
        /* 0FB0 */   0x46, 0x25, 0xC2, 0xA0, 0x8E, 0xE6, 0x80, 0x7B,
        /* 0FB8 */   0x98, 0x27, 0x36, 0x26, 0x6F, 0xC5, 0x1A, 0x8B,
        /* 0FC0 */   0x4F, 0x6C, 0x30, 0xFF, 0xFF, 0x27, 0x36, 0x80,
        /* 0FC8 */   0xD1, 0x87, 0x20, 0xB0, 0xFD, 0xFF, 0x0F, 0x41,
        /* 0FD0 */   0x60, 0x1C, 0xA0, 0x0F, 0x41, 0x80, 0x9B, 0xD3,
        /* 0FD8 */   0x09, 0xEE, 0xC4, 0x07, 0xB6, 0x63, 0x10, 0x60,
        /* 0FE0 */   0x6D, 0xE8, 0x3E, 0x06, 0x81, 0xF9, 0xFF, 0x3F,
        /* 0FE8 */   0x5A, 0x98, 0xA3, 0xE0, 0xC2, 0x8E, 0x7C, 0x28,
        /* 0FF0 */   0x29, 0xA7, 0x3E, 0xB4, 0x0C, 0x20, 0x69, 0x38,
        /* 0FF8 */   0xC9, 0x01, 0x9D, 0xD3, 0x3D, 0x70, 0x92, 0x75,
        /* 1000 */   0xEA, 0x40, 0x8F, 0xC7, 0xA0, 0xAF, 0x1C, 0xBE,
        /* 1008 */   0x12, 0xF0, 0x23, 0x07, 0x93, 0x00, 0xAA, 0x41,
        /* 1010 */   0xFA, 0xCC, 0x07, 0x9C, 0x8E, 0x1C, 0xE0, 0x38,
        /* 1018 */   0x26, 0x05, 0xC6, 0xDE, 0x0E, 0xDE, 0x22, 0x3D,
        /* 1020 */   0x89, 0xA7, 0xA1, 0xE3, 0x0C, 0x51, 0x38, 0x26,
        /* 1028 */   0x39, 0x18, 0x44, 0x7A, 0x95, 0x62, 0x03, 0x7C,
        /* 1030 */   0xAB, 0xF1, 0xD9, 0xC8, 0x07, 0x10, 0x78, 0xE3,
        /* 1038 */   0xF6, 0xD8, 0x61, 0xFF, 0xFF, 0x0F, 0x75, 0xC0,
        /* 1040 */   0x01, 0xE2, 0xA4, 0xF8, 0x21, 0xC3, 0x98, 0x67,
        /* 1048 */   0xC5, 0x0F, 0x75, 0x80, 0xF5, 0x18, 0x27, 0x3A,
        /* 1050 */   0x94, 0xF0, 0x43, 0x1D, 0x20, 0xE8, 0xFF, 0x7F,
        /* 1058 */   0xA8, 0x03, 0x86, 0x38, 0x6F, 0x24, 0xD1, 0x1E,
        /* 1060 */   0xEA, 0x98, 0xE8, 0x43, 0x1D, 0x40, 0xC8, 0xFF,
        /* 1068 */   0xFF, 0xA1, 0x0E, 0x18, 0x9E, 0x87, 0x00, 0xAE,
        /* 1070 */   0x9C, 0xEF, 0xC0, 0x7C, 0x22, 0x02, 0xEF, 0xFF,
        /* 1078 */   0xFF, 0x7C, 0x07, 0xB8, 0x1B, 0x2D, 0xCC, 0x51,
        /* 1080 */   0x70, 0x41, 0xAF, 0x0E, 0x03, 0x51, 0x09, 0x30,
        /* 1088 */   0x28, 0x02, 0xC7, 0x5F, 0x9B, 0x60, 0x1C, 0xEA,
        /* 1090 */   0x7C, 0x87, 0x3E, 0x2F, 0x78, 0xD8, 0x4F, 0x05,
        /* 1098 */   0x9E, 0xC4, 0xA9, 0xFA, 0x5A, 0x70, 0x14, 0x4F,
        /* 10A0 */   0x00, 0x3E, 0xE1, 0x01, 0xFF, 0xA1, 0xC1, 0x9A,
        /* 10A8 */   0x44, 0xF1, 0x43, 0x03, 0xF5, 0x11, 0xE4, 0xFF,
        /* 10B0 */   0x7F, 0x68, 0xC0, 0x28, 0xEA, 0xF9, 0x06, 0x7D,
        /* 10B8 */   0xCC, 0xF2, 0xD9, 0x20, 0xE6, 0x0B, 0x48, 0x84,
        /* 10C0 */   0x07, 0x10, 0x5F, 0x1F, 0xD8, 0x71, 0xD2, 0x67,
        /* 10C8 */   0xA0, 0x40, 0x51, 0xDE, 0x37, 0xF8, 0x09, 0x07,
        /* 10D0 */   0x5C, 0x83, 0xF3, 0x09, 0x07, 0xBC, 0x87, 0x23,
        /* 10D8 */   0x1F, 0x4B, 0xC0, 0x77, 0xD0, 0x84, 0x73, 0x81,
        /* 10E0 */   0xF1, 0x8D, 0x8D, 0x9D, 0x06, 0xC0, 0x76, 0x00,
        /* 10E8 */   0x06, 0xDF, 0x69, 0x00, 0x1C, 0xC7, 0x24, 0x7E,
        /* 10F0 */   0x3A, 0x04, 0x13, 0xCC, 0xC1, 0xBC, 0x34, 0xFB,
        /* 10F8 */   0xFF, 0xEF, 0xFD, 0x94, 0x43, 0xCF, 0x86, 0x80,
        /* 1100 */   0x75, 0x49, 0x07, 0x43, 0x94, 0x88, 0xB3, 0x21,
        /* 1108 */   0x20, 0xFD, 0xFF, 0x7F, 0x36, 0xC4, 0x20, 0xC4,
        /* 1110 */   0x09, 0xFC, 0x12, 0xD1, 0xDC, 0xD9, 0x90, 0xAE,
        /* 1118 */   0xD8, 0x67, 0x43, 0x80, 0xE1, 0xFF, 0xFF, 0x23,
        /* 1120 */   0x00, 0xF6, 0x7C, 0x04, 0x38, 0x3D, 0x64, 0x83,
        /* 1128 */   0xE7, 0x14, 0x08, 0xE3, 0xE4, 0x03, 0x38, 0xFE,
        /* 1130 */   0xFF, 0x8F, 0x15, 0xE6, 0x18, 0x78, 0xEA, 0x97,
        /* 1138 */   0x9B, 0x8F, 0x03, 0x54, 0xD4, 0x2B, 0xC2, 0x30,
        /* 1140 */   0x94, 0xC5, 0x87, 0x05, 0x1F, 0x11, 0xF8, 0x61,
        /* 1148 */   0xC1, 0x23, 0xA8, 0x78, 0x9C, 0xF4, 0x74, 0xE3,
        /* 1150 */   0x33, 0x21, 0x3B, 0x24, 0x38, 0xFC, 0x20, 0xE9,
        /* 1158 */   0x41, 0x13, 0x3C, 0xE7, 0x23, 0x78, 0xB7, 0x1E,
        /* 1160 */   0x38, 0xA7, 0x02, 0xC0, 0x4D, 0xAE, 0x27, 0xA3,
        /* 1168 */   0x4E, 0x17, 0x0E, 0x70, 0x8E, 0x92, 0x8D, 0x63,
        /* 1170 */   0x08, 0xE5, 0x70, 0xCC, 0xB7, 0x87, 0xA6, 0xC9,
        /* 1178 */   0x4E, 0x56, 0x30, 0x63, 0x41, 0xEA, 0x24, 0xE0,
        /* 1180 */   0x01, 0x38, 0x10, 0x8C, 0xB4, 0x93, 0x68, 0x34,
        /* 1188 */   0x86, 0xB3, 0x5A, 0x18, 0xC1, 0x19, 0xC4, 0xC7,
        /* 1190 */   0x11, 0xE7, 0x3A, 0x19, 0xA1, 0x3F, 0x07, 0x3E,
        /* 1198 */   0x15, 0x61, 0x82, 0xDC, 0x4B, 0xE8, 0xBC, 0x7D,
        /* 11A0 */   0x37, 0xE0, 0x57, 0x61, 0x8F, 0xC5, 0xFF, 0x7F,
        /* 11A8 */   0x60, 0xDF, 0x4E, 0xC0, 0x31, 0x17, 0xAB, 0x01,
        /* 11B0 */   0x45, 0x0D, 0xC0, 0x68, 0x98, 0x53, 0xC0, 0x53,
        /* 11B8 */   0x09, 0xB8, 0x82, 0xCD, 0x0D, 0x7D, 0x61, 0xB1,
        /* 11C0 */   0xD6, 0xA9, 0xE8, 0x14, 0xF4, 0x3E, 0x70, 0x70,
        /* 11C8 */   0xC0, 0x63, 0xF6, 0x1E, 0x1C, 0x2C, 0x34, 0x0F,
        /* 11D0 */   0x0E, 0x6C, 0xD9, 0x06, 0x87, 0x56, 0x72, 0x17,
        /* 11D8 */   0x21, 0x87, 0x0F, 0xFC, 0xEC, 0x80, 0x03, 0xA0,
        /* 11E0 */   0x67, 0x07, 0x0B, 0xC9, 0xB3, 0x03, 0x9B, 0xBE,
        /* 11E8 */   0xB3, 0x08, 0x28, 0x70, 0xFE, 0xFF, 0x11, 0xDE,
        /* 11F0 */   0x3B, 0x7C, 0x6E, 0x79, 0xF6, 0x60, 0x63, 0x78,
        /* 11F8 */   0x74, 0x31, 0x9A, 0xD1, 0xB9, 0xA6, 0xDB, 0x04,
        /* 1200 */   0x4A, 0xC5, 0x6D, 0x82, 0x82, 0xF8, 0x06, 0xE0,
        /* 1208 */   0x84, 0x34, 0xBA, 0x75, 0xE2, 0x66, 0x62, 0xFC,
        /* 1210 */   0x47, 0x0C, 0x1F, 0x11, 0x0E, 0xE9, 0x6C, 0x4D,
        /* 1218 */   0x30, 0x0F, 0xA4, 0x9E, 0x81, 0xBE, 0xB3, 0xE1,
        /* 1220 */   0x67, 0x1F, 0xF2, 0xC1, 0xC5, 0xD3, 0xF0, 0xF5,
        /* 1228 */   0x86, 0xDC, 0x3B, 0xE8, 0xB4, 0x7D, 0x66, 0xC0,
        /* 1230 */   0x1C, 0x74, 0x7D, 0x9D, 0x7A, 0x83, 0x27, 0x57,
        /* 1238 */   0x09, 0xEA, 0xE1, 0x02, 0x42, 0x2F, 0x34, 0xBE,
        /* 1240 */   0xDC, 0x25, 0x78, 0xE0, 0xF4, 0xE9, 0xEE, 0xBD,
        /* 1248 */   0x84, 0x9D, 0xF1, 0x12, 0xBC, 0xE0, 0x25, 0x98,
        /* 1250 */   0x77, 0x10, 0xA8, 0x51, 0x79, 0x10, 0x98, 0xAB,
        /* 1258 */   0x3C, 0xCB, 0x37, 0x06, 0x54, 0xB2, 0x8B, 0x16,
        /* 1260 */   0x3D, 0xC3, 0xBC, 0xC3, 0xF8, 0x92, 0xE0, 0xEB,
        /* 1268 */   0x87, 0xCF, 0x2D, 0x5E, 0xC0, 0xEB, 0x16, 0x0C,
        /* 1270 */   0x82, 0x67, 0xA0, 0x57, 0x17, 0xDF, 0xD9, 0x0D,
        /* 1278 */   0xFC, 0x2A, 0xF0, 0x46, 0x13, 0x22, 0x98, 0x61,
        /* 1280 */   0x0F, 0xFF, 0xDD, 0xDD, 0xA8, 0xBE, 0xE9, 0x18,
        /* 1288 */   0xEB, 0x75, 0xC4, 0x23, 0xE5, 0xC7, 0x96, 0x03,
        /* 1290 */   0x8A, 0xF4, 0xF2, 0xE6, 0x09, 0xF8, 0x2C, 0xE3,
        /* 1298 */   0x53, 0xDD, 0x49, 0xF9, 0x7A, 0x68, 0xF4, 0x57,
        /* 12A0 */   0x08, 0x1F, 0x7E, 0x8C, 0xEC, 0x73, 0x0E, 0x3B,
        /* 12A8 */   0xDF, 0xB1, 0x41, 0x71, 0xC4, 0x07, 0x86, 0x97,
        /* 12B0 */   0x1A, 0x4F, 0x85, 0x9D, 0xBB, 0x60, 0x1C, 0x1C,
        /* 12B8 */   0xD8, 0xB1, 0x08, 0x73, 0x7C, 0x05, 0xD7, 0xC9,
        /* 12C0 */   0xE6, 0xFF, 0xFF, 0xE4, 0x00, 0x6E, 0x78, 0xCC,
        /* 12C8 */   0xC1, 0xD7, 0xE7, 0x0D, 0xDF, 0x0C, 0x3C, 0x2E,
        /* 12D0 */   0x7E, 0xE4, 0xF0, 0x49, 0xE3, 0xA5, 0xD3, 0xD8,
        /* 12D8 */   0xA7, 0xE9, 0xA3, 0xD1, 0xCB, 0x9B, 0x4F, 0x2F,
        /* 12E0 */   0x18, 0x58, 0x5F, 0x1A, 0x38, 0xAC, 0xD1, 0xC2,
        /* 12E8 */   0x3E, 0x06, 0x9C, 0xB9, 0x2F, 0x44, 0xB8, 0xC3,
        /* 12F0 */   0x23, 0x58, 0x00, 0xF1, 0xB7, 0x92, 0x47, 0x0E,
        /* 12F8 */   0x4F, 0xC0, 0x80, 0x4C, 0xD3, 0xBA, 0x74, 0x20,
        /* 1300 */   0xE2, 0xA7, 0x3C, 0x2B, 0x5F, 0x99, 0x2E, 0x43,
        /* 1308 */   0x0C, 0xE3, 0xA9, 0xF2, 0xF1, 0xC3, 0xB3, 0xF1,
        /* 1310 */   0x51, 0xC0, 0xC7, 0x28, 0xCF, 0xFC, 0x8C, 0x22,
        /* 1318 */   0xBD, 0x32, 0x10, 0x50, 0x9D, 0x88, 0xB8, 0x42,
        /* 1320 */   0x18, 0x89, 0xA1, 0xD1, 0x9D, 0x83, 0xC7, 0x1F,
        /* 1328 */   0x22, 0x05, 0x31, 0xA0, 0x6F, 0x2E, 0xC0, 0xF4,
        /* 1330 */   0x4C, 0x04, 0x5C, 0xFE, 0xFF, 0x37, 0x17, 0x80,
        /* 1338 */   0xFF, 0xFF, 0xFF, 0x9B, 0x0B, 0xE0, 0xE6, 0xFE,
        /* 1340 */   0xE0, 0x9B, 0x0B, 0x70, 0x8D, 0xB4, 0x2A, 0x7A,
        /* 1348 */   0x61, 0x77, 0x08, 0x18, 0xD4, 0x9D, 0x1D, 0x70,
        /* 1350 */   0x78, 0x2B, 0x78, 0x67, 0x87, 0xF5, 0xFF, 0xBF,
        /* 1358 */   0xB3, 0xC3, 0xC3, 0x8C, 0x13, 0xE5, 0x85, 0x21,
        /* 1360 */   0xC6, 0x3B, 0x3B, 0x0B, 0xF0, 0x26, 0xD0, 0x51,
        /* 1368 */   0xC6, 0x77, 0x76, 0x80, 0x1F, 0x67, 0xD8, 0x77,
        /* 1370 */   0x69, 0xF0, 0x5E, 0x75, 0x81, 0xF5, 0xFF, 0xFF,
        /* 1378 */   0xAA, 0x0B, 0x3C, 0x04, 0xDF, 0xA7, 0x41, 0x3E,
        /* 1380 */   0x5E, 0x30, 0x8C, 0x83, 0x2B, 0x27, 0xA1, 0xC7,
        /* 1388 */   0x02, 0x6B, 0x85, 0x41, 0xDD, 0xA9, 0xC1, 0xA5,
        /* 1390 */   0x09, 0x5C, 0x17, 0x5F, 0x1F, 0x6A, 0x7C, 0xA4,
        /* 1398 */   0xC5, 0x9F, 0x2F, 0x70, 0x01, 0x86, 0x4C, 0x4F,
        /* 13A0 */   0x65, 0x30, 0xAE, 0x29, 0x3E, 0x95, 0x61, 0xEE,
        /* 13A8 */   0x0E, 0x1E, 0x90, 0x8F, 0x18, 0xC0, 0x67, 0x15,
        /* 13B0 */   0x1E, 0x18, 0xEE, 0xB4, 0xE0, 0x9B, 0x92, 0x41,
        /* 13B8 */   0xCF, 0x31, 0xA8, 0x8F, 0x3C, 0x27, 0xEF, 0x7B,
        /* 13C0 */   0xC2, 0xE3, 0x84, 0xA3, 0x9E, 0x83, 0xE8, 0xD8,
        /* 13C8 */   0xC0, 0x71, 0xDC, 0xC0, 0xFD, 0xFF, 0xC7, 0x06,
        /* 13D0 */   0xEF, 0x70, 0x83, 0x3B, 0xE8, 0xF8, 0x62, 0x70,
        /* 13D8 */   0x5C, 0x18, 0xB8, 0xE7, 0x02, 0x0F, 0xC3, 0x37,
        /* 13E0 */   0x1D, 0x8F, 0x08, 0x33, 0xFE, 0xD7, 0x3F, 0x23,
        /* 13E8 */   0x04, 0xC4, 0x5F, 0x8C, 0xD8, 0x80, 0xC1, 0x78,
        /* 13F0 */   0x6B, 0xF3, 0xF5, 0x0D, 0x37, 0x60, 0x5F, 0x1D,
        /* 13F8 */   0x7C, 0xC1, 0xF0, 0x09, 0xCC, 0xE8, 0x2F, 0x30,
        /* 1400 */   0x4F, 0x62, 0x3E, 0x36, 0x90, 0x0B, 0x1C, 0x1D,
        /* 1408 */   0x30, 0x38, 0x00, 0x3D, 0x60, 0xF8, 0x87, 0x8B,
        /* 1410 */   0x77, 0x39, 0x30, 0x5C, 0x05, 0x7D, 0x5C, 0xF0,
        /* 1418 */   0xB1, 0xC7, 0x8A, 0xEE, 0x72, 0xE8, 0x9B, 0x9C,
        /* 1420 */   0x61, 0xE2, 0x18, 0xE2, 0x0D, 0x8C, 0xDD, 0x25,
        /* 1428 */   0xC8, 0x61, 0x0E, 0xEA, 0x5D, 0xC2, 0x73, 0xE0,
        /* 1430 */   0x67, 0x0B, 0x9F, 0xE0, 0x7C, 0xF3, 0x09, 0x71,
        /* 1438 */   0xAA, 0x8F, 0x56, 0xEF, 0x01, 0x3E, 0x7A, 0xBC,
        /* 1440 */   0x77, 0xF9, 0xEC, 0xC4, 0x2E, 0x02, 0x3E, 0x72,
        /* 1448 */   0x19, 0xC7, 0xD3, 0xF4, 0x15, 0xD0, 0x43, 0x36,
        /* 1450 */   0xD8, 0xAB, 0x86, 0x4F, 0x60, 0x3E, 0xBA, 0xE1,
        /* 1458 */   0x8E, 0x51, 0x9E, 0x89, 0xA7, 0xEF, 0x3B, 0x08,
        /* 1460 */   0x3B, 0x92, 0x1C, 0x75, 0xA8, 0x6B, 0x7A, 0x44,
        /* 1468 */   0xF9, 0xFF, 0x9F, 0xD0, 0x81, 0xF8, 0xD6, 0x06,
        /* 1470 */   0xCE, 0x68, 0xF7, 0x0F, 0xF4, 0x36, 0x3D, 0x32,
        /* 1478 */   0xCC, 0xD1, 0x00, 0xD6, 0x25, 0x04, 0x5C, 0x77,
        /* 1480 */   0x0C, 0x5F, 0x42, 0x80, 0x4F, 0xD0, 0x4B, 0x04,
        /* 1488 */   0xFA, 0x9A, 0xE1, 0xD1, 0x3D, 0x02, 0x60, 0xAE,
        /* 1490 */   0x18, 0xEC, 0x58, 0xE0, 0xC3, 0x86, 0xAF, 0x01,
        /* 1498 */   0xEC, 0x5E, 0xE0, 0x30, 0xF7, 0x08, 0x50, 0x81,
        /* 14A0 */   0x7A, 0x78, 0xF0, 0xD5, 0xDE, 0x23, 0x40, 0x71,
        /* 14A8 */   0xB2, 0xF4, 0xA1, 0xC1, 0x03, 0xB5, 0xAA, 0x33,
        /* 14B0 */   0x26, 0x94, 0x23, 0x26, 0x3F, 0x9B, 0xF9, 0x26,
        /* 14B8 */   0x81, 0xB9, 0x5D, 0xFA, 0x26, 0x01, 0x37, 0xCF,
        /* 14C0 */   0x2C, 0x50, 0x49, 0x20, 0xF4, 0xFF, 0xBF, 0x49,
        /* 14C8 */   0xC0, 0x85, 0xE9, 0xF2, 0x32, 0x43, 0xE7, 0x7F,
        /* 14D0 */   0xE0, 0xBE, 0xD5, 0x79, 0x84, 0x3E, 0x44, 0x30,
        /* 14D8 */   0x94, 0xF7, 0x3C, 0x9F, 0xC2, 0xF8, 0x19, 0xC2,
        /* 14E0 */   0x07, 0x4C, 0x76, 0xA6, 0xE0, 0x67, 0x4D, 0xDC,
        /* 14E8 */   0x1D, 0xC0, 0x28, 0x6F, 0x9E, 0x9E, 0x00, 0x3B,
        /* 14F0 */   0x7F, 0x1A, 0xF9, 0xDD, 0xE0, 0x5D, 0xC0, 0xD3,
        /* 14F8 */   0xF7, 0xBD, 0x88, 0x9F, 0x28, 0xC0, 0x17, 0xEC,
        /* 1500 */   0x4E, 0x07, 0x05, 0xFA, 0x84, 0x3C, 0x22, 0xA3,
        /* 1508 */   0xFA, 0x88, 0xC0, 0x2F, 0x49, 0x60, 0x3C, 0x92,
        /* 1510 */   0xF8, 0x40, 0x01, 0x84, 0xEE, 0x05, 0xA8, 0xD3,
        /* 1518 */   0x07, 0x47, 0x3D, 0xE3, 0x17, 0x54, 0x63, 0xBE,
        /* 1520 */   0x5B, 0x3D, 0xC2, 0x79, 0x72, 0x98, 0xCB, 0x01,
        /* 1528 */   0x8B, 0x73, 0x4D, 0x02, 0xD5, 0x71, 0x97, 0x8F,
        /* 1530 */   0x0E, 0xEE, 0xB5, 0x15, 0xFB, 0xFF, 0x27, 0x38,
        /* 1538 */   0xB8, 0x77, 0x96, 0x77, 0x3E, 0x43, 0x79, 0x90,
        /* 1540 */   0xE0, 0xBB, 0xB6, 0x82, 0xE3, 0xAA, 0x06, 0xE3,
        /* 1548 */   0xD8, 0xC2, 0x2F, 0x79, 0x80, 0x9D, 0x61, 0x71,
        /* 1550 */   0xC1, 0x7F, 0x0F, 0x03, 0x51, 0x89, 0x30, 0x28,
        /* 1558 */   0x02, 0xCB, 0xBB, 0xB7, 0x52, 0xF8, 0x43, 0x06,
        /* 1560 */   0xE3, 0x4D, 0x81, 0x4F, 0x1A, 0x3B, 0x6A, 0xE0,
        /* 1568 */   0xFB, 0xFF, 0x1F, 0x35, 0xD8, 0x86, 0x8A, 0xBB,
        /* 1570 */   0x29, 0x82, 0x75, 0xAA, 0x98, 0x21, 0xF0, 0x60,
        /* 1578 */   0x0F, 0x00, 0x9F, 0xAF, 0x7C, 0x06, 0x50, 0x14,
        /* 1580 */   0x18, 0xD4, 0xA1, 0x1D, 0xCE, 0x6D, 0x18, 0x70,
        /* 1588 */   0x30, 0x62, 0xDC, 0xA5, 0x10, 0xEE, 0x94, 0xDF,
        /* 1590 */   0x51, 0x62, 0x3F, 0x97, 0xB3, 0xE9, 0xE2, 0xAE,
        /* 1598 */   0xE6, 0x3E, 0x9D, 0xB0, 0x0B, 0x32, 0x8C, 0xB3,
        /* 15A0 */   0xC0, 0x23, 0xC0, 0xAB, 0x39, 0xBF, 0x20, 0x3F,
        /* 15A8 */   0x17, 0xBF, 0x10, 0x3C, 0x26, 0x85, 0x78, 0x53,
        /* 15B0 */   0x7A, 0x25, 0x36, 0xC6, 0x93, 0x71, 0x73, 0xB7,
        /* 15B8 */   0x62, 0x72, 0xDE, 0x79, 0x41, 0x36, 0xC6, 0xD1,
        /* 15C0 */   0x44, 0x8C, 0x72, 0x6E, 0x0F, 0x03, 0x91, 0x5F,
        /* 15C8 */   0x90, 0x7D, 0x3F, 0x79, 0x21, 0x88, 0x18, 0xCD,
        /* 15D0 */   0x10, 0x41, 0x9F, 0x97, 0x8D, 0x15, 0x28, 0xDE,
        /* 15D8 */   0x0B, 0x32, 0x13, 0xF8, 0x56, 0xD0, 0xC1, 0xC5,
        /* 15E0 */   0x17, 0x64, 0xEC, 0xFF, 0xFF, 0x82, 0x0C, 0x30,
        /* 15E8 */   0xE2, 0x64, 0x04, 0xF8, 0x3C, 0x71, 0xE0, 0xCE,
        /* 15F0 */   0x35, 0x30, 0xFE, 0xFF, 0x97, 0x6A, 0xD8, 0x27,
        /* 15F8 */   0x1B, 0xC0, 0xD9, 0xD0, 0x7D, 0xB2, 0x01, 0xF7,
        /* 1600 */   0x68, 0xE1, 0x1D, 0x4D, 0x10, 0x27, 0x1B, 0x0A,
        /* 1608 */   0xE4, 0xE0, 0xEB, 0xA2, 0x70, 0x3C, 0xF4, 0x49,
        /* 1610 */   0x84, 0x1E, 0x9D, 0x7C, 0x94, 0xC4, 0x9D, 0x19,
        /* 1618 */   0x3C, 0x91, 0x77, 0x16, 0x8F, 0xE2, 0x65, 0xD0,
        /* 1620 */   0xF7, 0x82, 0x13, 0x79, 0x7D, 0xB0, 0x9C, 0x63,
        /* 1628 */   0x24, 0xA8, 0x46, 0xE2, 0xE3, 0x03, 0xFC, 0xEB,
        /* 1630 */   0x8B, 0x8F, 0x91, 0xF0, 0xF9, 0xFC, 0xC3, 0xF2,
        /* 1638 */   0x60, 0x0C, 0xF9, 0xFF, 0x7F, 0x8A, 0xC4, 0x80,
        /* 1640 */   0x3C, 0xBB, 0x3C, 0x86, 0xF0, 0x0B, 0x24, 0xDC,
        /* 1648 */   0xD3, 0xCC, 0x01, 0x60, 0x64, 0x5D, 0x1E, 0xD1,
        /* 1650 */   0x67, 0x47, 0x8E, 0x11, 0xD7, 0x17, 0x45, 0x5F,
        /* 1658 */   0x81, 0x7D, 0x10, 0x38, 0x9F, 0xE7, 0x44, 0xB0,
        /* 1660 */   0x8E, 0x9A, 0x1F, 0x6D, 0xF8, 0xF8, 0x39, 0xF8,
        /* 1668 */   0x5B, 0xC1, 0x03, 0xA5, 0x8F, 0x45, 0x21, 0x1E,
        /* 1670 */   0x91, 0xF8, 0x39, 0x11, 0x5C, 0x26, 0xCE, 0x89,
        /* 1678 */   0x40, 0xE2, 0xD0, 0x0B, 0xE3, 0xB4, 0x80, 0x1B,
        /* 1680 */   0x88, 0xCF, 0x94, 0xD8, 0x29, 0x9F, 0x08, 0x3B,
        /* 1688 */   0x97, 0x60, 0x46, 0x07, 0xAE, 0xCB, 0xBD, 0x47,
        /* 1690 */   0x07, 0xFE, 0x93, 0x00, 0x1E, 0xEB, 0xFF, 0xFF,
        /* 1698 */   0x78, 0x07, 0xBE, 0x93, 0xBA, 0xEF, 0x26, 0xBE,
        /* 16A0 */   0xC8, 0xF8, 0x50, 0xF4, 0x7C, 0x07, 0xF8, 0x0F,
        /* 16A8 */   0x77, 0xB8, 0x43, 0xC5, 0x39, 0xDF, 0x01, 0xD2,
        /* 16B0 */   0xFE, 0xFF, 0xE7, 0x3B, 0x60, 0x79, 0xB6, 0x7E,
        /* 16B8 */   0xBE, 0x03, 0xBB, 0xC8, 0xF3, 0x1D, 0x40, 0xAC,
        /* 16C0 */   0xFF, 0xFF, 0xF9, 0x0E, 0xB0, 0x73, 0x46, 0xC3,
        /* 16C8 */   0x9D, 0xEF, 0xC0, 0x76, 0xB4, 0x01, 0xCC, 0x4D,
        /* 16D0 */   0xE3, 0xD1, 0x06, 0xDC, 0xC3, 0x85, 0x3D, 0x0C,
        /* 16D8 */   0xAE, 0xD0, 0xA6, 0x4F, 0x8D, 0x46, 0xAD, 0x1A,
        /* 16E0 */   0x94, 0xA9, 0x51, 0xE6, 0xFF, 0xDF, 0xA0, 0x56,
        /* 16E8 */   0x9F, 0x4A, 0x8D, 0x19, 0xCB, 0x0E, 0xA5, 0x80,
        /* 16F0 */   0x8F, 0x0A, 0x8D, 0xCD, 0xF2, 0x28, 0x04, 0x62,
        /* 16F8 */   0x31, 0xAF, 0x06, 0x81, 0x38, 0x2C, 0x08, 0x8D,
        /* 1700 */   0xF4, 0xCA, 0x11, 0x88, 0x25, 0x3F, 0xFB, 0x05,
        /* 1708 */   0x62, 0xB9, 0x6F, 0x06, 0x81, 0x38, 0xE0, 0x1B,
        /* 1710 */   0x4C, 0xE0, 0xE4, 0x61, 0x25, 0x70, 0xF2, 0x6E,
        /* 1718 */   0x10, 0x88, 0x23, 0x83, 0x50, 0xA1, 0x3A, 0x40,
        /* 1720 */   0x58, 0x4C, 0x10, 0x1A, 0xCA, 0x07, 0x08, 0x93,
        /* 1728 */   0xFE, 0x48, 0x10, 0x20, 0x31, 0x02, 0xC2, 0xC2,
        /* 1730 */   0xBD, 0xBF, 0x04, 0x62, 0x69, 0xEF, 0x09, 0x81,
        /* 1738 */   0x58, 0x88, 0x15, 0x10, 0x16, 0x17, 0x84, 0x86,
        /* 1740 */   0xD3, 0x02, 0xC2, 0x24, 0x99, 0x01, 0x61, 0x81,
        /* 1748 */   0x40, 0xA8, 0x7C, 0x35, 0x20, 0x4C, 0xA4, 0x1B,
        /* 1750 */   0x40, 0xBA, 0x7A, 0x81, 0x38, 0x88, 0x1E, 0x10,
        /* 1758 */   0x26, 0xC3, 0x0F, 0x08, 0x0B, 0x0D, 0x42, 0xA3,
        /* 1760 */   0x3D, 0x30, 0x04, 0x48, 0x0C, 0x81, 0xB0, 0xF8,
        /* 1768 */   0x8E, 0x40, 0x98, 0xF8, 0x57, 0x91, 0x40, 0x9C,
        /* 1770 */   0xDF, 0x12, 0xC4, 0x4D, 0x69, 0x88, 0x35, 0x01,
        /* 1778 */   0x31, 0x0D, 0x9E, 0x80, 0x98, 0x22, 0x10, 0x01,
        /* 1780 */   0x39, 0xF6, 0xD3, 0x43, 0x40, 0xD6, 0x60, 0x0A,
        /* 1788 */   0x88, 0x45, 0x07, 0x11, 0x90, 0x85, 0xA8, 0x02,
        /* 1790 */   0x62, 0x79, 0x5D, 0x01, 0xB1, 0xF0, 0x20, 0x02,
        /* 1798 */   0x72, 0xE6, 0x97, 0x9F, 0x80, 0xAC, 0xE0, 0xA5,
        /* 17A0 */   0xF3, 0x10, 0xC0, 0xDE, 0x10, 0x81, 0x48, 0x72,
        /* 17A8 */   0x10, 0x01, 0x39, 0xB0, 0x2F, 0x20, 0x16, 0x1F,
        /* 17B0 */   0x44, 0x40, 0xCE, 0xFA, 0x28, 0x14, 0x90, 0x83,
        /* 17B8 */   0x83, 0x68, 0x10, 0xE4, 0x6B, 0x26, 0x20, 0xA7,
        /* 17C0 */   0x07, 0x11, 0x10, 0xF9, 0x04, 0x05, 0x21, 0x6A,
        /* 17C8 */   0xBD, 0x81, 0x30, 0x3D, 0x8F, 0x42, 0x0D, 0x85,
        /* 17D0 */   0x80, 0x50, 0xE5, 0xEA, 0xCE, 0x31, 0x2C, 0x07,
        /* 17D8 */   0x08, 0xCD, 0x05, 0x22, 0x30, 0xAB, 0x70, 0x07,
        /* 17E0 */   0xC4, 0x54, 0x81, 0x08, 0xC8, 0x09, 0x80, 0xC8,
        /* 17E8 */   0xFF, 0x9F, 0x60, 0x2A, 0x10, 0x9A, 0x12, 0x8C,
        /* 17F0 */   0xEA, 0x92, 0x07, 0xC4, 0x12, 0x80, 0xD0, 0x54,
        /* 17F8 */   0x20, 0x34, 0x25, 0x88, 0x00, 0xAD, 0xCA, 0x1E,
        /* 1800 */   0x10, 0x53, 0x0A, 0x42, 0x95, 0x83, 0xD0, 0x74,
        /* 1808 */   0x20, 0x54, 0xB6, 0xBE, 0xC3, 0x02, 0x05, 0x11,
        /* 1810 */   0x90, 0xA3, 0x83, 0x50, 0xE1, 0xFE, 0x40, 0x98,
        /* 1818 */   0xDE, 0x97, 0x86, 0x00, 0x9D, 0x0E, 0x44, 0x40,
        /* 1820 */   0x4E, 0x0C, 0x42, 0x15, 0x7C, 0x32, 0x82, 0x10,
        /* 1828 */   0xB1, 0x20, 0x54, 0xC1, 0x27, 0x23, 0x28, 0xD1,
        /* 1830 */   0xF2, 0xB2, 0x13, 0x90, 0xF5, 0x81, 0x50, 0xBD,
        /* 1838 */   0x20, 0x02, 0x73, 0x36, 0x20, 0x9A, 0x17, 0x84,
        /* 1840 */   0xE6, 0x07, 0xA3, 0x5A, 0x8D, 0x02, 0x31, 0xFD,
        /* 1848 */   0x20, 0x34, 0x0F, 0x88, 0xC0, 0xAC, 0xE0, 0xF9,
        /* 1850 */   0x71, 0xC0, 0x0C, 0x84, 0xAA, 0x04, 0x11, 0x98,
        /* 1858 */   0x73, 0x01, 0xD1, 0xAC, 0x20, 0x34, 0x3B, 0x18,
        /* 1860 */   0xD5, 0xFE, 0x0F, 0xD1, 0x00, 0x08, 0x08, 0xCD,
        /* 1868 */   0x07, 0xA2, 0xC3, 0x00, 0x79, 0x96, 0x09, 0xC8,
        /* 1870 */   0x1A, 0x41, 0xA8, 0x66, 0x10, 0x81, 0x39, 0x27,
        /* 1878 */   0x10, 0xCD, 0x0E, 0x42, 0x95, 0xFD, 0x4D, 0x82,
        /* 1880 */   0x91, 0x8C, 0x0F, 0xD0, 0x40, 0x24, 0x37, 0x08,
        /* 1888 */   0xD5, 0xF1, 0x0C, 0x0A, 0x46, 0x74, 0x83, 0x08,
        /* 1890 */   0xC8, 0x59, 0x40, 0x68, 0x36, 0x30, 0x9A, 0x4C,
        /* 1898 */   0xED, 0x91, 0x80, 0xBA, 0x05, 0x61, 0xE9, 0x41,
        /* 18A0 */   0x68, 0x3A, 0xBB, 0x83, 0xA7, 0x20, 0x54, 0x81,
        /* 18A8 */   0x5E, 0x30, 0xA6, 0x19, 0x44, 0x87, 0x05, 0x02,
        /* 18B0 */   0x42, 0x73, 0x81, 0x51, 0x1D, 0xAF, 0x96, 0x40,
        /* 18B8 */   0x44, 0x1B, 0x08, 0xD5, 0x0A, 0xA2, 0x81, 0x93,
        /* 18C0 */   0x1F, 0x53, 0x10, 0x92, 0x14, 0x84, 0xFC, 0xFF,
        /* 18C8 */   0x07, 0xAA, 0xC7, 0x9C, 0x40, 0xAC, 0xFA, 0x5B,
        /* 18D0 */   0x25, 0x50, 0x27, 0x01, 0xA1, 0xC9, 0x40, 0x74,
        /* 18D8 */   0x7C, 0x20, 0x0F, 0xB8, 0x83, 0x64, 0x20, 0x54,
        /* 18E0 */   0x29, 0x88, 0xC0, 0xAC, 0xF4, 0x63, 0xA4, 0x23,
        /* 18E8 */   0x05, 0x51, 0x7D, 0xBC, 0xA0, 0x20, 0x34, 0xD1,
        /* 18F0 */   0x3B, 0x2C, 0x08, 0x7B, 0xB8, 0x69, 0xA8, 0xE4,
        /* 18F8 */   0x59, 0xA5, 0xA1, 0x12, 0x10, 0x9A, 0x0D, 0x44,
        /* 1900 */   0xC7, 0x04, 0xF2, 0xAA, 0x79, 0x4C, 0x60, 0x20,
        /* 1908 */   0x54, 0x2F, 0x08, 0xCD, 0x01, 0x42, 0x13, 0x83,
        /* 1910 */   0x08, 0xD4, 0xA9, 0xBF, 0x37, 0x1A, 0x2A, 0xF9,
        /* 1918 */   0x5B, 0x09, 0xC4, 0xCA, 0x5E, 0x69, 0x02, 0xB1,
        /* 1920 */   0xDE, 0xA7, 0x4E, 0x20, 0xE6, 0x1D, 0x98, 0xA9,
        /* 1928 */   0x05, 0xA1, 0xEA, 0x41, 0x04, 0xE6, 0xB4, 0x40,
        /* 1930 */   0x54, 0x81, 0x78, 0x10, 0xA6, 0x08, 0x44, 0x60,
        /* 1938 */   0x4E, 0x02, 0x44, 0xD3, 0x81, 0xD0, 0xEC, 0x60,
        /* 1940 */   0x54, 0xE7, 0xA3, 0x4D, 0x40, 0xD6, 0x0E, 0x42,
        /* 1948 */   0xB3, 0x80, 0x08, 0xCC, 0x59, 0x1E, 0x69, 0x02,
        /* 1950 */   0xB1, 0x92, 0x2F, 0x9D, 0x0E, 0x24, 0x04, 0x84,
        /* 1958 */   0x26, 0xD3, 0x7F, 0x68, 0xA1, 0x05, 0x80, 0x99,
        /* 1960 */   0x84, 0x04, 0x20, 0x4C, 0x16, 0x88, 0x0E, 0x27,
        /* 1968 */   0xD6, 0x08, 0x22, 0x40, 0xC7, 0x01, 0xA3, 0xD1,
        /* 1970 */   0x40, 0x68, 0x5C, 0x40, 0x9A, 0x1D, 0x90, 0x2A,
        /* 1978 */   0x6D, 0x00, 0xC6, 0x54, 0x83, 0xD0, 0x24, 0x20,
        /* 1980 */   0x02, 0x74, 0x2C, 0x10, 0x01, 0x5A, 0x74, 0x04,
        /* 1988 */   0x30, 0x16, 0x01, 0x84, 0x46, 0x05, 0xA1, 0xC9,
        /* 1990 */   0x2A, 0x80, 0xB2, 0x9C, 0x20, 0x1A, 0x20, 0xC9,
        /* 1998 */   0x30, 0x60, 0x0A, 0x42, 0x33, 0x81, 0xD0, 0x8C,
        /* 19A0 */   0x20, 0x54, 0x7C, 0x07, 0x10, 0x16, 0x04, 0x84,
        /* 19A8 */   0x86, 0x03, 0xD1, 0x00, 0xFE, 0xFF, 0x8F, 0x0C,
        /* 19B0 */   0x02, 0xD1, 0x00, 0x9C, 0x23, 0xC4, 0x61, 0x85,
        /* 19B8 */   0x82, 0xD0, 0xF4, 0x20, 0x34, 0x6C, 0x09, 0x50,
        /* 19C0 */   0x16, 0x1D, 0x44, 0xC7, 0x23, 0x92, 0x02, 0x8C,
        /* 19C8 */   0x05, 0x02, 0xA1, 0x31, 0x41, 0x68, 0x6C, 0x10,
        /* 19D0 */   0x1A, 0x29, 0x06, 0x28, 0x13, 0x54, 0xE3, 0x50,
        /* 19D8 */   0x44, 0x7B, 0x80, 0x31, 0x99, 0x20, 0x54, 0x36,
        /* 19E0 */   0x88, 0xC0, 0x1C, 0x14, 0x88, 0x86, 0x07, 0xA1,
        /* 19E8 */   0x62, 0x82, 0x00, 0x52, 0x10, 0x01, 0x12, 0x20,
        /* 19F0 */   0x1A, 0x1E, 0x84, 0x8A, 0x29, 0x32, 0x74, 0x0A,
        /* 19F8 */   0x42, 0x55, 0x24, 0x39, 0x9A, 0x50, 0x10, 0x1D,
        /* 1A00 */   0x4D, 0x08, 0x08, 0xCD, 0x07, 0x46, 0x75, 0x35,
        /* 1A08 */   0x39, 0x6E, 0x50, 0x10, 0xAA, 0x1D, 0x84, 0x06,
        /* 1A10 */   0x05, 0xA1, 0x39, 0xA2, 0x80, 0xB2, 0xEC, 0x20,
        /* 1A18 */   0x02, 0xB2, 0x9E, 0x2A, 0x87, 0x0A, 0x0A, 0x22,
        /* 1A20 */   0x30, 0xA7, 0x02, 0xA2, 0x49, 0x41, 0xA8, 0x8E,
        /* 1A28 */   0x2C, 0x47, 0x0A, 0x9A, 0x06, 0x84, 0x25, 0x06,
        /* 1A30 */   0xA1, 0xC9, 0xDA, 0x80, 0xB0, 0x0C, 0x75, 0x0E,
        /* 1A38 */   0x24, 0x14, 0x84, 0xE6, 0x04, 0xA1, 0x4A, 0xF2,
        /* 1A40 */   0x0C, 0x8F, 0x82, 0xE8, 0x38, 0x42, 0x80, 0x68,
        /* 1A48 */   0x7A, 0x10, 0xAA, 0xA6, 0xCF, 0x00, 0x28, 0x88,
        /* 1A50 */   0x06, 0x40, 0x40, 0x68, 0x4E, 0x30, 0xAA, 0xA8,
        /* 1A58 */   0xD1, 0xD1, 0x84, 0x82, 0x50, 0xDD, 0x2F, 0x4E,
        /* 1A60 */   0x81, 0xF8, 0xFF, 0x0F
    })
}

