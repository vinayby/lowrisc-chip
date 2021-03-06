# Copyright 2018 ETH Zurich and University of Bologna.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Florian Zaruba <zarubaf@iis.ee.ethz.ch>
# Description: Generate a memory configuration file from a bitstream (Genesys II only right now)

if {$argc < 2 || $argc > 4} {
    puts $argc
    puts {Error: Invalid number of arguments}
    puts {Usage: write_cfgmem.tcl mcsfile bitfile datafile}
    exit 1
}

lassign $argv mcsfile bitfile datafile

# https://scholar.princeton.edu/jbalkind/blog/programming-genesys-2-qspi-spi-x4-flash
write_cfgmem -format mcs -interface SPIx4 -size 32 -loadbit "up 0x0 $bitfile" -loaddata "up $::env(BITSIZE) $datafile" -file $mcsfile -force
