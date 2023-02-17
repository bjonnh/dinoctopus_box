include <common.scad>
use <midiboard_ada.scad>
include <midiboard_ada_config.scad>
include <generic_board.scad>
use <midiboard_spacer.scad>


module support_midiboard_ada(ghost=false) {
    $fn=25;
    if (ghost) {
        translate([0,0,midi_board_width+midi_support_board_height]) rotate([90,90,0]) midiboard_ada();
        for (i=[0:3]) 
          translate([midi_board_holes[i][1],0,midi_board_holes[i][0]+midi_support_board_height]) 
            rotate([90,0,0]) midiboard_spacer();
    }
    
    difference() {
        cube([midi_board_height, midi_support_thickness,board_attacher_height]);
        for (i=[0:3]) 
          translate([midi_board_holes[i][1],margin+midi_support_thickness,midi_board_holes[i][0]+midi_support_board_height]) 
            rotate([90,0,0]) cylinder(20,d=3);
        translate([-margin/2,-margin/2,9]) cube([17,10,35]);
    }
    
    translate([0,midi_support_thickness/2,0]) rotate([0,0,90]) rail(true, rail_width, rail_height, midi_board_height); 
    translate([0,midi_support_thickness/2,board_attacher_height]) rotate([0,180,90]) rail(true, rail_width, rail_height, midi_board_height);  
}

translate([0,0,midi_board_height])rotate([0,90,0]) support_midiboard_ada(false);
