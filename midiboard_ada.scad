include <common.scad>
include <midiport_ada.scad>
include <midiboard_ada_config.scad>

module midiboard_ada() {
    // Midi featherwing
    $fn=50;
    port_retreat = 3.2;
    port_left = 5;
    port_right = 26;
    
    width_hole_space = 45;
    height_hole_space = 17.5;
    safety_area = 5;
    margin=0.1;
    translate([0,0,midi_board_underclearance]) union() {
        translate([port_left, port_retreat, midi_board_depth]) midiport_ada(); // out
        translate([port_right, port_retreat, midi_board_depth]) midiport_ada(); // in
        color("green") difference() {
            cube([midi_board_width, midi_board_height, midi_board_depth]);
            for (i=[0:3]) translate([midi_board_holes[i][0], midi_board_holes[i][1], -margin/2])  cylinder(h=midi_board_depth+margin,d=midi_board_hole_diameter);
            
        }
        // safety zone
        color("red") union() {
            translate([safety_area,0,-midi_board_underclearance]) cube([midi_board_width-safety_area*2, midi_board_height, midi_board_underclearance]);
            translate([0,safety_area,-midi_board_underclearance]) cube([midi_board_width, midi_board_height-safety_area*2, midi_board_underclearance]);
        }
    }
}

midiboard_ada();