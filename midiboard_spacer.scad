include <common.scad>
use <midiboard_ada.scad>
include <midiboard_ada_config.scad>
include <generic_board.scad>

module midiboard_spacer() {
    $fn=50;
    difference() {
        cylinder(midi_support_spacing, d=bigscrew_head_diameter);
        translate([0,0,-margin/2]) cylinder(midi_support_spacing+margin, d=bigscrew_diameter);
    }
}

midiboard_spacer();