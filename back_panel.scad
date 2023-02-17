include <dovetail.scad>
include <board_config.scad>
include <display_config.scad>
include <display_support_config.scad>
include <midiboard_ada_config.scad>
include <common.scad>
use <support_display.scad>
include <pico_config.scad>

midi_cut_width=20;
midi_cut_height=40;
usb_x=8.5;
usb_y=7;
midi_x=9;
midi_y=12.5;
midi_shift_x=30;
module back_panel() {

    $fn=50;
    union() {
        difference(){
            cube([front_panel_width,front_panel_height,front_panel_thickness]);
            translate([front_panel_width-usb_x-usb_width*2,usb_y,-margin/2]) cube([usb_width*2,usb_thickness*2,front_panel_thickness+margin]);
            for (i=[0:3])
                translate([front_panel_width-midi_cut_width-midi_shift_x*i-midi_x, midi_y,-margin/2]) cube([midi_cut_width,midi_cut_height,front_panel_thickness+margin]);
        }
        // rails h
        for (i=[1:mainboard_height/mainboard_spacing])
            union() {
                translate([i*mainboard_spacing-mainboard_spacing/2+side_panel_thickness,front_panel_height-mainboard_thickness+margin,margin]) rotate([90,180,0]) rail(true, rail_width, rail_height, front_panel_thickness+front_panel_ticks);
                translate([i*mainboard_spacing-mainboard_spacing/2+side_panel_thickness,mainboard_thickness+margin,margin]) rotate([90,180,180]) rail(true, rail_width, rail_height, front_panel_thickness+front_panel_ticks);
            }
        
    }
}

color("orange") back_panel();
