#!/usr/bin/env dash

status=$(bspc config -d focused window_gap)

if [ $status = 0 ]; then
  bspc config -d focused window_gap      20
  bspc config -d focused top_padding     30
  bspc config -d focused bottom_padding  30
  bspc config -d focused left_padding   100
  bspc config -d focused right_padding  100
else
  bspc config -d focused window_gap       0
  bspc config -d focused top_padding      0
  bspc config -d focused bottom_padding   0
  bspc config -d focused left_padding     0
  bspc config -d focused right_padding    0
fi
