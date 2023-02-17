include <dovetail.scad>
include <board_config.scad>
include <display_config.scad>
include <display_support_config.scad>
include <common.scad>
use <support_display.scad>


shifting_of_screen_board=4;

screen_x=front_panel_width-side_panel_thickness-display_x_shift-display_screen_width;
screen_y=mainboard_thickness+display_support_screen_height+display_y_shift;

pot_x = front_panel_width-side_panel_thickness-display_pot_x_shift;
pot_y = display_pot_y_shift+shifting_of_screen_board+display_support_screen_height;

switch_x = pot_x;
switch_y= display_switch_y_shift+shifting_of_screen_board+display_support_screen_height;

module front_panel(ghost=false) {
    $fn=50;
    if (ghost) {
        translate([front_panel_width-display_support_shift_x-side_panel_thickness,shifting_of_screen_board,16]) rotate([90,0,180]) support_display(true);

        }
    
    color("orange")union() {
        difference(){
            cube([front_panel_width,front_panel_height,front_panel_thickness]);
            // screen cut
            translate([screen_x,screen_y+5,-margin/2]) cube([display_screen_width, display_screen_height-5, front_panel_thickness+margin+2]);
            translate([pot_x,pot_y,-margin/2]) cylinder(10,d=10);
            translate([switch_x, switch_y,-margin/2]) cylinder(10,d=5);
        }
        intersection() {
            translate([screen_x,screen_y+5,-margin/2]) cube([display_screen_width, display_screen_height-5, 3]);
            angle = atan(3.0/(display_real_screen_offset_y-5));
            translate([screen_x, screen_y+5,0.0]) rotate([angle,0,0]) cube([display_screen_width, 100,8]);
        }
        intersection() {
            translate([screen_x,screen_y,-margin/2]) cube([display_screen_width, display_screen_height, 3]);
            angle = atan(3.0/2.54);
            translate([screen_x+display_screen_width, screen_y+display_screen_height,0.0]) rotate([angle,0,180]) cube([display_screen_width, 100,8]);
        }
        intersection() {
            translate([screen_x,screen_y,-margin/2]) cube([display_screen_width, display_screen_height, 3]);
            angle = atan(3.0/2.54);
            translate([screen_x+display_screen_width, screen_y,0.0]) rotate([angle,0,90]) cube([display_screen_height, 100,8]);
        }
        intersection() {
            translate([screen_x,screen_y,-margin/2]) cube([display_screen_width, display_screen_height, 3]);
            angle = atan(3.0/2.4); //measured in real 
            translate([screen_x, screen_y+display_screen_height,0.0]) rotate([angle,0,-90]) cube([display_screen_height, 100,8]);
        }
        //translate([screen_x, screen_y,0.0]) polyhedron( CubePoints, CubeFaces ); //cube([display_screen_width, display_screen_height,4.00]);
        // rails h
        for (i=[1:mainboard_height/mainboard_spacing])
            union() {
                translate([i*mainboard_spacing-mainboard_spacing/2+side_panel_thickness,front_panel_height-mainboard_thickness+margin,margin]) rotate([90,180,0]) rail(true, rail_width, rail_height, front_panel_thickness+front_panel_ticks);
                translate([i*mainboard_spacing-mainboard_spacing/2+side_panel_thickness,mainboard_thickness+margin,margin]) rotate([90,180,180]) rail(true, rail_width, rail_height, front_panel_thickness+front_panel_ticks);
            }
        
    }
}

front_panel(true);
