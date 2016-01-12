/*
 * Some or all of this work - Copyright (c) 2006 - 2016, Intel Corp.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * Neither the name of Intel Corporation nor the names of its contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * Resource Descriptor macros
 *
 * UartSerialBus Resource Descriptor Macro
 */
Device (UART) {}

Name (p45A, Package() {
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeEven, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeEven, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeEven, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeNone, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeNone, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeNone, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeSpace, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeSpace, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeSpace, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeMark, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeMark, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeMark, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },

// StopBits

	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsZero,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsOne,
            0xA5, BigEndian, ParityTypeOdd, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsOnePlusHalf,
            0xA5, BigEndian, ParityTypeOdd, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },

// DataBits

	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsFive, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsSix, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsSeven, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsNine, StopBitsTwo,
            0xA5, BigEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },

// Endian

	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsZero,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsOne,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsOnePlusHalf,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsFive, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsSix, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsSeven, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsNine, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceConsumer, ,
            RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
    },

// ResourceProducer

	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsZero,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer, ,)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsOne,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlNone,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer, ,)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsOnePlusHalf,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlXon,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer,)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsFive, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer,)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsSix, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer,)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsSeven, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer)
    },
	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, DataBitsNine, StopBitsTwo,
            0xA5, LittleEndian, ParityTypeOdd, FlowControlHardware,
            0x3377, 0x4488, "\\UART", 0x8C, ResourceProducer)
    },

    // Minimal invocation

	ResourceTemplate () {
        UartSerialBus (0xFFEEDDCC, , , 0xA5, , , ,
            0x3300, 0x4400, "\\UART", , , ,)
    }
})


Name (p45B, Package() {
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBC,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x01, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBE,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x01, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x01, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBC,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x00, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBE,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x00, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x00, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBC,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x04, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBE,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x04, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x04, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBC,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x03, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBE,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x03, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x03, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBC,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBE,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xB1,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xB4,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBA,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x8D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x9D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xAD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xBD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0xCD,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x31,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x34,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x3A,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x0D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x1D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x2D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x3D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x25)
    {
        /* 0000 */   0x8E, 0x20, 0x00, 0x01, 0x8C, 0x03, 0x02, 0x4D,
        /* 0008 */   0x00, 0x01, 0x11, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0xF0, 0xF1,
        /* 0018 */   0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0x5C, 0x55, 0x41,
        /* 0020 */   0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x31,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x34,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x3A,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x0D,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x1D,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x2D,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x3D,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x8C, 0x03, 0x00, 0x4D,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x77, 0x33, 0x88, 0x44, 0x02, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    },
    Buffer (0x1E)
    {
        /* 0000 */   0x8E, 0x19, 0x00, 0x01, 0x00, 0x03, 0x02, 0x34,
        /* 0008 */   0x00, 0x01, 0x0A, 0x00, 0xCC, 0xDD, 0xEE, 0xFF,
        /* 0010 */   0x00, 0x33, 0x00, 0x44, 0x00, 0xA5, 0x5C, 0x55,
        /* 0018 */   0x41, 0x52, 0x54, 0x00, 0x79, 0x00
    }
})

Method(RT25,, Serialized)
{
	Name(ts, "RT25")

	// Emit test header, set the filename

	THDR (ts, "UartSerialBus Resource Descriptor Macro", __FILE__)

    // The main test packages must have the same number of entries

    If (LNotEqual (SizeOf (p45A), SizeOf (p45B)))
    {
        err (ts, 182, 0, 0, 0, 0, "Incorrect package length")
        Return ()
    }

    // Main test case for packages above

	m330(ts, SizeOf (p45A), "p45A", p45A, p45B)

    // Check resource descriptor tag offsets

	Store (
		ResourceTemplate () {
            UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
                0xA5, BigEndian, ParityTypeEven, FlowControlNone,
                0x3300, 0x4400, "\\UART",
                0xEE, ResourceProducer, UAR0,
                RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
            UartSerialBus (0xFFEEDDCC, DataBitsEight, StopBitsTwo,
                0xA5, BigEndian, ParityTypeEven, FlowControlNone,
                0x3300, 0x4400, "\\UART",
                0xEE, ResourceConsumer, UAR1,
                RawDataBuffer (0x07) {0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5, 0xF6})
		}, Local0)

    m331(ts, 1, UAR0._FLC, 0x38, UAR1._FLC, 0x150, "_FLC")
    m331(ts, 2, UAR0._STB, 0x3A, UAR1._STB, 0x152, "_STB")
    m331(ts, 3, UAR0._LEN, 0x3C, UAR1._LEN, 0x154, "_LEN")
    m331(ts, 4, UAR0._END, 0x3F, UAR1._END, 0x157, "_END")
    m331(ts, 5, UAR0._SPE, 0x60, UAR1._SPE, 0x178, "_SPE")
    m331(ts, 6, UAR0._RXL, 0x80, UAR1._RXL, 0x198, "_RXL")
    m331(ts, 7, UAR0._TXL, 0x90, UAR1._TXL, 0x1A8, "_TXL")
    m331(ts, 8, UAR0._PAR, 0xA0, UAR1._PAR, 0x1B8, "_PAR")
    m331(ts, 9, UAR0._LIN, 0xA8, UAR1._LIN, 0x1C0, "_LIN")
    m331(ts, 10, UAR0._VEN, 0xB0, UAR1._VEN, 0x1C8, "_VEN")
}


