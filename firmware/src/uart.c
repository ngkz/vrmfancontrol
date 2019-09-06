/*
 *  ThinkPad E490 VRM Cooling Mod Controller Firmware
 *  Copyright (C) 2019  Kazutoshi Noguchi
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/*
  This code derived from ATTinyCore:
  TinySoftwareSerial.cpp - Hardware serial library for Wiring
  Copyright (c) 2006 Nicholas Zambetti.  All right reserved.
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.
  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  Modified 23 November 2006 by David A. Mellis
  Modified 28 September 2010 by Mark Sproul
*/

#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "uart.h"

#define BAUD_RATE               1200
#define P_TX                    PB0
#define P_RX                    PB1
#define PCINT_RX                PCINT1
#define SERIAL_BUFFER_SIZE      16
#define ONEBIT_DELAY_COUNT      ((F_CPU/BAUD_RATE-8)/3)

static int putch(char ch, FILE *stream);
static int getch(FILE *stream);

static uint8_t rxbuf [SERIAL_BUFFER_SIZE];
static volatile uint8_t rxbuf_head;
static uint8_t rxbuf_tail;
static FILE uart_stdio = FDEV_SETUP_STREAM(putch, getch, _FDEV_SETUP_RW);

static int putch(char ch, FILE *stream) {
    uint8_t oldSREG = SREG;
    cli(); //Prevent interrupts from breaking the transmission.
    //it can either receive or send, not both (because receiving requires an interrupt and would stall transmission
    asm volatile(
        "   com %[ch]\n" // ones complement, carry set
        "1: brcc 2f\n"                     //^|
        "   cbi %[port],%[pin]\n"          // |
        "   rjmp 3f\n"                     // | 4 cycles
        "2: sbi %[port],%[pin]\n"          // |
        "   nop\n"                         //_|
        "3: ldi r25, %[delaycount]\n "     //^|
        "4: dec r25\n"                     // | ONEBIT_DELAY_COUNT * 3 cycles
        "   brne 4b\n"                     // |
        "   lsr %[ch]\n"                   //^|
        "   dec %[bitcount]\n"             // | 4 cycles
        "   brne 1b\n"                     //_|
        :
        : [ch] "r" (ch),
          [bitcount] "r" ((uint8_t)10),
          [port] "I" (_SFR_IO_ADDR(PORTB)),
          [pin] "I" (P_TX),
          [delaycount] "M"(ONEBIT_DELAY_COUNT)
        : "r25"
    );

    SREG = oldSREG;
    return 0;
}

ISR(PCINT0_vect) {
    char ch;
    asm volatile(
        "1:   ldi r25, %[startbitdelay]\n"           //^| Get to 0.25 of start bit (our baud is too fast, so give room to correct)
        "2:   dec r25\n"                             // | ONEBIT_DELAY_COUNT / 4 * 3 cycles
        "     brne 2b\n"                             //_|
        "3:   ldi r25, %[onebitdelay]\n"             //^|
        "4:   dec r25\n"                             // | ONEBIT_DELAY_COUNT * 3 cycles
        "     brne 4b\n"                             //_|
        "     clc\n"                                 //^|
        "     sbic %[port], %[pin]\n"                // |
        "     sec\n"                                 // |
        "     dec  %[count]\n"                       // | 8 cycles
        "     breq 5f\n"                             // |
        "     ror  %[ch]\n"                          // |
        "     rjmp 3b\n"                             //_|
        "5:\n"
        : [ch] "=r" (ch)
        : [count] "r" ((uint8_t)9),
          [port] "I" (_SFR_IO_ADDR(PORTB)),
          [pin] "I" (P_RX),
          [onebitdelay] "M"(ONEBIT_DELAY_COUNT),
          [startbitdelay] "M"(ONEBIT_DELAY_COUNT/4)
        : "r25"
    );

    // store the received character into ring buffer
    uint8_t i = (rxbuf_head + 1) % SERIAL_BUFFER_SIZE;
    if (i != rxbuf_tail) {
        rxbuf[rxbuf_head] = ch;
        rxbuf_head = i;
    }

    // clear the interrupt flag
    GIFR |= _BV(PCIF);
}

static int getch(FILE *stream) {
    while (rxbuf_head == rxbuf_tail);

    unsigned char c = rxbuf[rxbuf_tail];
    rxbuf_tail = (rxbuf_tail + 1) % SERIAL_BUFFER_SIZE;

    return c;
}

uint8_t uart_input_available() {
    return (SERIAL_BUFFER_SIZE + rxbuf_head - rxbuf_tail) % SERIAL_BUFFER_SIZE;
}

void init_uart_stdio() {
    DDRB |= _BV(P_TX); //TX output
    DDRB &= _BV(P_RX); //RX input
    PORTB |= _BV(P_TX) | _BV(P_RX); //TX high, pull-up RX

    // RX level change generates a pin chage interrupt
    PCMSK = _BV(PCINT_RX);
    GIMSK |= _BV(PCIE);

    stdout = &uart_stdio;
    stdin  = &uart_stdio;
}
