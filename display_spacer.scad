include <common.scad>
include <display_config.scad>
use <display.scad>
include <generic_board.scad>
include <dovetail.scad>
include <display_support_config.scad>

module display_spacer() {
    $fn=50;
    difference() {
        cylinder(display_support_spacing, d=bigscrew_head_diameter);
        translate([0,0,-margin/2]) cylinder(display_support_spacing+margin, d=bigscrew_diameter);
    }
}

display_spacer();