#!/bin/bash
set -e
set -x

./make-cross-tc.sh
sudo ./do-cross-tc-to-ng.sh
./do-su-hack.sh

# "bolt on" the helpers for using the final product :)
sudo cp -a container-helpers/* dchrt-ng/
