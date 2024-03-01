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
