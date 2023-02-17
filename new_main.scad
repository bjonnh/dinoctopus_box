include <common.scad>
include <board_config.scad>
include <display_config.scad>
include <display_support_config.scad>
use <mainboard.scad>
use <support_midiboard_ada.scad>
use <support_display.scad>
use <support_pico.scad>
use <side_panel.scad>
use <front_panel.scad>
use <back_panel.scad>

// TODO:
// screen more right
// hide screen more
// cut screen support left
// shorter screen spacers
// empty midi boards (cut square like display)

$fn=50;

ghost = true;

back_boards_position=0;

for (i=[0:3]) 
    translate([back_boards_position,30*i-3+10,board_attacher_height+mainboard_thickness]) rotate([180,0,0]) support_midiboard_ada(ghost);
translate([back_boards_position,107.5,mainboard_thickness]) rotate([0,0,0]) support_pico(ghost);
translate([mainboard_width-13,0,mainboard_thickness]) rotate([0,0,90]) support_display(ghost);

color("darkorange",0.5) mainboard();
color("darkorange",0.5) translate([0,0, board_attacher_height+2*mainboard_thickness]) mirror([0,0,1]) mainboard();
color("darkorange", 0.5) translate([0,-side_panel_thickness,0]) rotate([90,0,0]) mirror([0,0,1]) side_panel();
color("darkorange", 0.5) translate([0,mainboard_height+side_panel_thickness,0]) rotate([90,0,0]) mirror([0,0,0]) side_panel();

color("darkorange", 0.5) translate([mainboard_width+front_panel_thickness,mainboard_height+side_panel_thickness,0]) rotate([90,0,-90]) front_panel();
color("darkorange", 0.5) translate([-front_panel_thickness,-side_panel_thickness,0]) rotate([90,0,90]) back_panel();


// To print it:

// support_midiboard_ada * 4
// support_pico
// support_display
// mainboard * 2
// side_panel * 2
// front_panel
// back_panel
// midiboard_spacer * 16
// display_spacer * 4
