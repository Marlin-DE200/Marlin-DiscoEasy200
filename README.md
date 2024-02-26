# Marlin for Dagoma DiscoEasy200

This repo is a fork of the Marlin repo configured specifically for various versions of the Dagoma DiscoEasy200 3D Printer.

The intention is to support all Dagoma versions of the DiscoEasy200 including:

* Bicolor
* Extruder+ (with a filament sensor)
* No screen (Dagoma screen is assumed - other screens may be supported in the future)
* Black thermistor (white is assumed)
* Trapezoidal z-screws
* XL
* English, French & German languages
* Arc support (G2/G3)

The configuration settings for these options have been taken
directly from the Dagoma soure code and should work,
however the author has only tested the stock+LCD+White Thermistor version.

All these standard Dagoma options are built automatically.

In addition, several selected community enhancements are also supported:

* All other Marlin languages (mostly not tested - japanese / cyrilic language may need alternative fonts defining)
* Z122 head
* MKS standard pinouts (instead of the Dagoma special pinouts)
* Heated Bed (from atelier3d-shop.fr)

The configuration settings for these options have been taken
from various Thingiverse things and Github repos
that purport to support these modifications,
however none of these configurations have been tested.

Because the number of options is multiplicative,
adding these options to automated builds would
produce an unreasonable number of options.
(Each language currently produces about 160 builds,
so for the 3 languages we already produce almost 500 builds!!)

However a build workflow is available on Github to build any option
and you can then download the firmware Hex file from the Github Actions artifacts list.
If you need help with this please open a Github issue.

The stock Dagoma firmware was based on the beta version of Marlin available
when the DiscoVery was first launched (v1.1.0 RC6),
with substantial bespoke functionality added to support the Dagoma hardware functions.

The builds in this repo are based on the very latest Marlin v2,
allowing some of the more advanced functionality available in V2
to be enabled providing more capabilities than the stock Dagoma firmware,
though this is limited by the maximum firmware size supported by the motherboard.
The additional functionality currently enabled includes:

* Support for all Marlin languages
* Probe Offset Wizard - alternative to the Dagoma App to set the z-offset -
  [youtube video](https://www.youtube.com/watch?v=2gRfU26aTDs)

There is still a lot of newer functionality available in Marlin v2
that has not been enabled as standard due to lack of testing with the DE200,
and the author would welcome users testing these options and
submitting PRs (with before and after test evidence).

In particular the following features are
available as experimental features using the Single Build workflow,
but not currently enabled for standard builds
because they will need to be tested **and** tuned
(and their memory usage will need to stay within the memory of the MKS BASe 1.5 controller):

* Bilinear bed-levelling rather than linear bed-levelling as this handles non-flat beds better
  ([as recommended by Marlin](https://marlinfw.org/docs/features/auto_bed_leveling.html))
* [Unified Bed Levelling](https://marlinfw.org/docs/features/unified_bed_leveling.html)
* [Linear Advance](https://marlinfw.org/docs/features/lin_advance.html)
* [Input shaping](https://marlinfw.org/docs/features/input_shaping.html)
* [S-Curve Acceleration](https://github.com/synthetos/TinyG/wiki/Jerk-Controlled-Motion-Explained)
* [Model Predictive Temperature Control](https://marlinfw.org/docs/features/model_predictive_control.html)
* [Junction deviation](https://www.reddit.com/r/3Dprinting/comments/dx8bdb/here_is_why_you_should_disable_junction_deviation/)

The following advanced Marlin features are available for evaluation,
but do not currently have even Single Build support

* [Direct stepping](https://reprap.org/wiki/Direct_Stepping) / [Step Daemon](https://github.com/colinrgodsey/step-daemon)

The implementation of this version has been designed to be flexible and to allow for both
easy updating as new stock versions of Marlin are released, and
additions of more configurations for publicly available mods such as bltouch.

Discussions inc. feedback, Issues and Pull-Requests are all welcome,
particularly where you have tested the improvements yourself,
and the author is favourable to supporting
any DE200 configuration using commonly available components
other than already supported here.

As an illustration of the information needed to support additional mods,
the reasons that e.g. bltouch has not been included are:

* bltouch connection pins are not standardised
* bltouch mounting positions are not standardised - and so the nozzle-offsets are unknown
* there are no standarised Thingiverse Things for either the mount or for the firmware that
  can be used as the basis for configuration, the closest being a Z122 head + bltouch that does
  not have matching firmware or the nozzle-offsets defined

### DISCLAIMER

At present this is Work in Progress.
Most versions are untested and,
whilst the author has made reasonable efforts to configure it correctly,
***you use these versions at your own risk***.

### Marlin-by-Dagoma vs stock Marlin

A comparison of the Marlin-by-Dagoma stock firmware
(which claims to be (based on) 1.1.0 RC6)
against stock Marlin 1.1.0 RC6 suggests that it was indeed based on this release,
but it was ***VERY*** heavily modified by Dagoma
(probably to add functionality that simply didn't exist at the time).

To analyse each of these changes made by Dagoma
and see whether they were included in later versions of Marlin,
and if so whether they are compatible,
would be a task of massive proportions -
so to create these versions of Marlin-for-DiscoEasy200 firmware
I have assumed that later versions of stock Marlin will work on the DE200
without modification.

The availability of other people's later versions
of stock Marlin for DE200 suggests that it will work fine,
and anecdotal evidence suggests that
the print quality will be significantly better,
presumably due to numerous bugs having been fixed in base Marlin
which were never fixed in Marlin-by-Dagoma.

Therefore as starting point,
we have carefully configured stock Marlin v2.1.x
to have the same configuration settings as the Marlin-by-Dagoma 1.1.0 RC6,
leaving all newer Marlin configuration settings at default.
This delivers all newer functionality that is enabled by default
in Marlin.

In addition, where optional (typically minor) functionality looks like it might be beneficial,
we have enabled that too.


### Detailed functional changes from Dagoma stock firmware

This is unlikely to be a definitive list -
please add to it when you spot something that is different.

* 25% faster Z-feedrate when homing - 5mm/s instead of 4mm/s
* More bed levelling points
* Optimised bed-levelling Z speeds.
* Bed size reduced from 205x205 to 204x204 because of a bug (centre calculated using integer arithmetic).
* Bed-levellinbg margin increased from 10mm to 21mm because of a bug (to do with the inductive sensor position).
* Quick home - X & Y homing are done at the same time.
* XY Frequency limit - reduce shaking and ringing-artifacts on prints by limiting short zigzags to 10 per second.
* Beep to warn you when you change the feedrate % by turning the knob when printing and on the status page.
* Transmit buffer - to improve status OK responses to a USB host during USB printing.
* Detect broken endstop
* Firmware settings are automatically reset when new firmware is loaded or if they get corrupted.
  (Firmware setting storage may not be compatible between versions.)
* SD card CRC and retry is enabled
* Encoder (knob) direction reversed because it makes more sense.
* Encoder (knob) improved accuracy.
* Menus return to Info screen after 20s rather than Dagoma 10s or Marlin 15s
* Fan noise reduction (using software PWM rather than hardware PWM)
* SD-card file list sorting enabled
* SD card autostart - menu item + support for both `autoN.g` and `dagomaN.g`
* Scrolling status messages (that are wider than display)
* Temp stability time for M109 reduced from 15s to Marlin default 10s
* M701/M702 codes for filament load/unload enabled
* Support [Host Action Commands](https://reprap.org/wiki/G-code#Action_commands)
  so that e.g. [Octoprint](https://docs.octoprint.org/en/master/bundledplugins/action_command_prompt.html)for
  can provide alternative functionality for printers without LCDs.
* Probe Offset Wizard - alternative to the Dagoma App to set the z-offset -
  [youtube video](https://www.youtube.com/watch?v=2gRfU26aTDs)
* M73 support so that a [matching Octoprint plugin](https://plugins.octoprint.org/plugins/m73etaoverride/) can set the % progress bar.
* Positions of Filament Change and Printer Information menus swapped.

The following stock functions have not been configured (because we cannot work out how)
and probably won't work:

* Use of Y end-stop switch to pause the print

If anyone knows or can work out how to make these work, please let us know.

### Untested versions

I created this site because I wanted an up-to-date version of Marlin
for my specific DE200 configuration stock+LCD+english),
and the firmware for this version has been tested.

However unless I get reports for other versions working OK,
I cannot say for certainty that they will work.

In most cases, due to the close simularities,
these other versions should work just fine,
however based on intuition I do wonder whether the following problems
might need to be addressed (feedback requested):

* For trapezoidal Z-screws do we need to keep the Z-steppers energised to prevent the head from descending?
  (By default, z-steppers are de-energised automatically in certain circumstances.)
  In the stock Dagoma firmware for trapezoidal screws, the z-steppers are de-energised in
  exactly the same way as for non-trapezoidal screws, so it should be ok.
  However, if not the fix is not difficult - so let me know.

## Marlin 3D Printer Firmware
<p align="center"><img src="buildroot/share/pixmaps/logo/marlin-outrun-nf-500.png" height="250" alt="MarlinFirmware's logo" /></p>

<p align="center">
    <a href="/LICENSE"><img alt="GPL-V3.0 License" src="https://img.shields.io/github/license/marlinfirmware/marlin.svg"></a>
    <a href="https://github.com/MarlinFirmware/Marlin/graphs/contributors"><img alt="Contributors" src="https://img.shields.io/github/contributors/marlinfirmware/marlin.svg"></a>
    <a href="https://github.com/MarlinFirmware/Marlin/releases"><img alt="Last Release Date" src="https://img.shields.io/github/release-date/MarlinFirmware/Marlin"></a>
    <a href="https://github.com/MarlinFirmware/Marlin/actions"><img alt="CI Status" src="https://github.com/MarlinFirmware/Marlin/actions/workflows/test-builds.yml/badge.svg"></a>
    <a href="https://github.com/sponsors/thinkyhead"><img alt="GitHub Sponsors" src="https://img.shields.io/github/sponsors/thinkyhead?color=db61a2"></a>
    <br />
    <a href="https://fosstodon.org/@marlinfirmware"><img alt="Follow MarlinFirmware on Mastodon" src="https://img.shields.io/mastodon/follow/109450200866020466?domain=https%3A%2F%2Ffosstodon.org&logoColor=%2300B&style=social"></a>
</p>

Additional documentation can be found at the [Marlin Home Page](https://marlinfw.org/).
Please test this firmware and let us know if it misbehaves in any way. Volunteers are standing by!

## Marlin 2.1

Marlin 2.1 continues to support both 32-bit ARM and 8-bit AVR boards while adding support for up to 9 coordinated axes and to up to 8 extruders.

Download earlier versions of Marlin on the [Releases page](https://github.com/MarlinFirmware/Marlin/releases).

## Example Configurations

Before you can build Marlin for your machine you'll need a configuration for your specific hardware. Upon request, your vendor will be happy to provide you with the complete source code and configurations for your machine, but you'll need to get updated configuration files if you want to install a newer version of Marlin. Fortunately, Marlin users have contributed dozens of tested configurations to get you started. Visit the [MarlinFirmware/Configurations](https://github.com/MarlinFirmware/Configurations) repository to find the right configuration for your hardware.

## Building Marlin 2.1

To build and upload Marlin you will use one of these tools:

- The free [Visual Studio Code](https://code.visualstudio.com/download) using the [Auto Build Marlin](https://marlinfw.org/docs/basics/auto_build_marlin.html) extension.
- The free [Arduino IDE](https://www.arduino.cc/en/main/software) : See [Building Marlin with Arduino](https://marlinfw.org/docs/basics/install_arduino.html)
- You can also use VSCode with devcontainer : See [Installing Marlin (VSCode devcontainer)](http://marlinfw.org/docs/basics/install_devcontainer_vscode.html).

Marlin is optimized to build with the **PlatformIO IDE** extension for **Visual Studio Code**. You can still build Marlin with **Arduino IDE**, and we hope to improve the Arduino build experience, but at this time PlatformIO is the better choice.

## Hardware Abstraction Layer (HAL)

Marlin includes an abstraction layer to provide a common API for all the platforms it targets. This allows Marlin code to address the details of motion and user interface tasks at the lowest and highest levels with no system overhead, tying all events directly to the hardware clock.

Every new HAL opens up a world of hardware. At this time we need HALs for RP2040 and the Duet3D family of boards. A HAL that wraps an RTOS is an interesting concept that could be explored. Did you know that Marlin includes a Simulator that can run on Windows, macOS, and Linux? Join the Discord to help move these sub-projects forward!

## 8-Bit AVR Boards

A core tenet of this project is to keep supporting 8-bit AVR boards while also maintaining a single codebase that applies equally to all machines. We want casual hobbyists to benefit from the community's innovations as much as possible just as much as those with fancier machines. Plus, those old AVR-based machines are often the best for your testing and feedback!

### Supported Platforms

  Platform|MCU|Example Boards
  --------|---|-------
  [Arduino AVR](https://www.arduino.cc/)|ATmega|RAMPS, Melzi, RAMBo
  [Teensy++ 2.0](https://www.microchip.com/en-us/product/AT90USB1286)|AT90USB1286|Printrboard
  [Arduino Due](https://www.arduino.cc/en/Guide/ArduinoDue)|SAM3X8E|RAMPS-FD, RADDS, RAMPS4DUE
  [ESP32](https://github.com/espressif/arduino-esp32)|ESP32|FYSETC E4, E4d@BOX, MRR
  [LPC1768](https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/general-purpose-mcus/lpc1700-cortex-m3/512-kb-flash-64-kb-sram-ethernet-usb-lqfp100-package:LPC1768FBD100)|ARM® Cortex-M3|MKS SBASE, Re-ARM, Selena Compact
  [LPC1769](https://www.nxp.com/products/processors-and-microcontrollers/arm-microcontrollers/general-purpose-mcus/lpc1700-cortex-m3/512-kb-flash-64-kb-sram-ethernet-usb-lqfp100-package:LPC1769FBD100)|ARM® Cortex-M3|Smoothieboard, Azteeg X5 mini, TH3D EZBoard
  [STM32F103](https://www.st.com/en/microcontrollers-microprocessors/stm32f103.html)|ARM® Cortex-M3|Malyan M200, GTM32 Pro, MKS Robin, BTT SKR Mini
  [STM32F401](https://www.st.com/en/microcontrollers-microprocessors/stm32f401.html)|ARM® Cortex-M4|ARMED, Rumba32, SKR Pro, Lerdge, FYSETC S6, Artillery Ruby
  [STM32F7x6](https://www.st.com/en/microcontrollers-microprocessors/stm32f7x6.html)|ARM® Cortex-M7|The Borg, RemRam V1
  [STM32G0B1RET6](https://www.st.com/en/microcontrollers-microprocessors/stm32g0x1.html)|ARM® Cortex-M0+|BigTreeTech SKR mini E3 V3.0
  [STM32H743xIT6](https://www.st.com/en/microcontrollers-microprocessors/stm32h743-753.html)|ARM® Cortex-M7|BigTreeTech SKR V3.0, SKR EZ V3.0, SKR SE BX V2.0/V3.0
  [SAMD51P20A](https://www.adafruit.com/product/4064)|ARM® Cortex-M4|Adafruit Grand Central M4
  [Teensy 3.5](https://www.pjrc.com/store/teensy35.html)|ARM® Cortex-M4|
  [Teensy 3.6](https://www.pjrc.com/store/teensy36.html)|ARM® Cortex-M4|
  [Teensy 4.0](https://www.pjrc.com/store/teensy40.html)|ARM® Cortex-M7|
  [Teensy 4.1](https://www.pjrc.com/store/teensy41.html)|ARM® Cortex-M7|
  Linux Native|x86/ARM/etc.|Raspberry Pi

## Submitting Patches

Proposed patches should be submitted as a Pull Request against the ([bugfix-2.1.x](https://github.com/MarlinFirmware/Marlin/tree/bugfix-2.1.x)) branch.

- Follow the [Coding Standards](https://marlinfw.org/docs/development/coding_standards.html) to gain points with the maintainers.
- Please submit Feature Requests and Bug Reports to the [Issue Queue](https://github.com/MarlinFirmware/Marlin/issues/new/choose). Support resources are also listed there.
- Whenever you add new features, be sure to add tests to `buildroot/tests` and then run your tests locally, if possible.
  - It's optional: Running all the tests on Windows might take a long time, and they will run anyway on GitHub.
  - If you're running the tests on Linux (or on WSL with the code on a Linux volume) the speed is much faster.
  - You can use `make tests-all-local` or `make tests-single-local TEST_TARGET=...`.
  - If you prefer Docker you can use `make tests-all-local-docker` or `make tests-all-local-docker TEST_TARGET=...`.

## Marlin Support

The Issue Queue is reserved for Bug Reports and Feature Requests. To get help with configuration and troubleshooting, please use the following resources:

- [Marlin Documentation](https://marlinfw.org) - Official Marlin documentation
- [Marlin Discord](https://discord.gg/n5NJ59y) - Discuss issues with Marlin users and developers
- Facebook Group ["Marlin Firmware"](https://www.facebook.com/groups/1049718498464482/)
- RepRap.org [Marlin Forum](https://forums.reprap.org/list.php?415)
- Facebook Group ["Marlin Firmware for 3D Printers"](https://www.facebook.com/groups/3Dtechtalk/)
- [Marlin Configuration](https://www.youtube.com/results?search_query=marlin+configuration) on YouTube

## Contributors

Marlin is constantly improving thanks to a huge number of contributors from all over the world bringing their specialties and talents. Huge thanks are due to [all the contributors](https://github.com/MarlinFirmware/Marlin/graphs/contributors) who regularly patch up bugs, help direct traffic, and basically keep Marlin from falling apart. Marlin's continued existence would not be possible without them.

## Administration

Regular users can open and close their own issues, but only the administrators can do project-related things like add labels, merge changes, set milestones, and kick trolls. The current Marlin admin team consists of:

<table align="center">
<tr><td>Project Maintainer</td></tr>
<tr><td>

 🇺🇸  **Scott Lahteine**
       [@thinkyhead](https://github.com/thinkyhead)
       [<kbd>  Donate 💸  </kbd>](https://www.thinkyhead.com/donate-to-marlin)

</td><td>

 🇺🇸  **Roxanne Neufeld**
       [@Roxy-3D](https://github.com/Roxy-3D)

 🇺🇸  **Keith Bennett**
       [@thisiskeithb](https://github.com/thisiskeithb)
       [<kbd>  Donate 💸  </kbd>](https://github.com/sponsors/thisiskeithb)

 🇺🇸  **Jason Smith**
       [@sjasonsmith](https://github.com/sjasonsmith)

</td><td>

 🇧🇷  **Victor Oliveira**
       [@rhapsodyv](https://github.com/rhapsodyv)

 🇬🇧  **Chris Pepper**
       [@p3p](https://github.com/p3p)

🇳🇿  **Peter Ellens**
       [@ellensp](https://github.com/ellensp)
       [<kbd>  Donate 💸  </kbd>](https://ko-fi.com/ellensp)

</td><td>

 🇺🇸  **Bob Kuhn**
       [@Bob-the-Kuhn](https://github.com/Bob-the-Kuhn)

 🇳🇱  **Erik van der Zalm**
       [@ErikZalm](https://github.com/ErikZalm)
       [<kbd>  Donate 💸  </kbd>](https://flattr.com/submit/auto?user_id=ErikZalm&url=https://github.com/MarlinFirmware/Marlin&title=Marlin&language=&tags=github&category=software)

</td></tr>
</table>

## License

Marlin is published under the [GPL license](/LICENSE) because we believe in open development. The GPL comes with both rights and obligations. Whether you use Marlin firmware as the driver for your open or closed-source product, you must keep Marlin open, and you must provide your compatible Marlin source code to end users upon request. The most straightforward way to comply with the Marlin license is to make a fork of Marlin on Github, perform your modifications, and direct users to your modified fork.

While we can't prevent the use of this code in products (3D printers, CNC, etc.) that are closed source or crippled by a patent, we would prefer that you choose another firmware or, better yet, make your own.
