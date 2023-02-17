include <dovetail.scad>
include <board_config.scad>
include <display_config.scad>
include <display_support_config.scad>
include <common.scad>
use <support_display.scad>;

screen_x=47.5-1+display_x_shift;
screen_y=mainboard_thickness+display_support_screen_height+display_y_shift;

// These were found manually!!
pot_x = front_panel_width-side_panel_thickness-display_pot_x_shift;
pot_y = display_pot_y_shift+7+display_support_screen_height;

switch_x = pot_x;
switch_y= display_switch_y_shift+7+display_support_screen_height;
module front_panel(holes=false) {
    $fn=50;
    union() {
        difference(){
            cube([front_panel_width,front_panel_height,front_panel_thickness]);
            // screen cut
            translate([screen_x+side_panel_thickness,screen_y,-margin/2]) cube([display_screen_width, display_screen_height, front_panel_thickness+margin]);
            translate([pot_x,pot_y,-margin/2]) cylinder(10,d=10);
            translate([switch_x, switch_y,-margin/2]) cylinder(10,d=5);
        }
        // rails h
        for (i=[1:mainboard_height/mainboard_spacing])
            union() {
                translate([i*mainboard_spacing-mainboard_spacing/2+side_panel_thickness,front_panel_height-mainboard_thickness+margin,margin]) rotate([90,180,0]) rail(true, rail_width, rail_height, front_panel_thickness+front_panel_ticks);
                translate([i*mainboard_spacing-mainboard_spacing/2+side_panel_thickness,mainboard_thickness+margin,margin]) rotate([90,180,180]) rail(true, rail_width, rail_height, front_panel_thickness+front_panel_ticks);
            }
        
    }
}

color("orange")front_panel();
translate([front_panel_width-display_support_shift_x-side_panel_thickness,4,16]) rotate([90,0,180]) support_display(true);
echo(front_panel_width-display_support_shift_x-side_panel_thickness);