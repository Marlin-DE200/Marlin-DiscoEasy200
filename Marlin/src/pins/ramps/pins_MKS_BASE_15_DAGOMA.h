/**
 * Marlin 3D Printer Firmware
 * Copyright (C) 2016 MarlinFirmware [https://github.com/MarlinFirmware/Marlin]
 *
 * Based on Sprinter and grbl.
 * Copyright (C) 2011 Camiel Gubbels / Erik van der Zalm
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/**
 * MKS BASE v1.5 with A4982 stepper drivers and digital micro-stepping
 * but with Dagoma DiscoEasy200 pinout modifications
 */

#include "pins_MKS_BASE_15.h"

/**
 * Dagoma modifications
 */

#undef BOARD_INFO_NAME
#define BOARD_INFO_NAME "MKS BASE 1.5 Dagoma"

#undef X_MIN_PIN
#undef X_MAX_PIN
#undef Y_MIN_PIN
#undef Y_MAX_PIN
#undef Z_MIN_PIN
#undef Z_MAX_PIN
#define X_MIN_PIN           2
#define X_MAX_PIN          -1
#define Y_MIN_PIN          -1
#define Y_MAX_PIN           3
#define Z_MIN_PIN          15
#define Z_MAX_PIN          -1

#undef FIL_RUNOUT_PIN
#undef FIL_RUNOUT2_PIN
#define FIL_RUNOUT_PIN 19
#define FIL_RUNOUT2_PIN 14

// From https://github.com/MarlinFirmware/Marlin/issues/12003
// #if IS_U8GLIB_ST7920
  // #define BOARD_ST7920_DELAY_1                 0
  // #define BOARD_ST7920_DELAY_2               250 or 400
  // #define BOARD_ST7920_DELAY_3                 0
// #endif

// From https://github.com/MarlinFirmware/Marlin/issues/12003 for long cables
// #define ST7920_DELAY_1 DELAY_NS (0)
// #define ST7920_DELAY_2 DELAY_NS (250)
// #define ST7920_DELAY_3 DELAY_NS (250)


// From Github PRs for other boards
// Alter timing for graphical display
#if HAS_MARLINUI_U8GLIB
  #ifndef BOARD_ST7920_DELAY_1
    //#define BOARD_ST7920_DELAY_1    DELAY_NS(96)
    // #define BOARD_ST7920_DELAY_1   DELAY_NS(120)
    // From https://marlinfw.org/docs/basics/troubleshooting.html
    #define BOARD_ST7920_DELAY_1 DELAY_NS(200) // After CLK LOW
  #endif
  #ifndef BOARD_ST7920_DELAY_2
    //#define BOARD_ST7920_DELAY_2    DELAY_NS(48)
    // #define BOARD_ST7920_DELAY_2    DELAY_NS(80)
    // From https://marlinfw.org/docs/basics/troubleshooting.html
    #define BOARD_ST7920_DELAY_2 DELAY_NS(400) // After DAT
  #endif
  #ifndef BOARD_ST7920_DELAY_3
    //#define BOARD_ST7920_DELAY_3   DELAY_NS(600)
    // #define BOARD_ST7920_DELAY_3   DELAY_NS(580)
    // From reprap site for RRD_FGDC
    //#define BOARD_ST7920_DELAY_3   DELAY_NS(63)
    // From https://marlinfw.org/docs/basics/troubleshooting.html
    #define BOARD_ST7920_DELAY_3 DELAY_NS(200) // After CLK HIGH
  #endif
#endif
