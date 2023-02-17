include <common.scad>
include <pico_config.scad>
use <pico.scad>


include <generic_board.scad>

support_pico_thickness=2;
support_pico_length=51;

module support_pico(ghost=false) {
    $fn=25;
    if (ghost) {
        translate([0,0,support_pico_thickness]) rotate([0,0,0]) pico();
    }
    difference() {
        cube([support_pico_length,21,support_pico_thickness]);
        for(i=[0:3])
        translate([pico_holes[i][0],pico_holes[i][1],-margin/2]) 
            cylinder(h=10, d=1.9);
    }
    translate([0,7.5,0]) rotate([0,0,90]) rail(true, rail_width, rail_height, support_pico_length); 
    translate([0,17.5,0]) rotate([0,0,90]) rail(true, rail_width, rail_height, support_pico_length);
}

rotate([0,90,0]) support_pico();