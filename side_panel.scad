include <dovetail.scad>
include <board_config.scad>
include <common.scad>

module side_panel(holes=false) {
    union() {
        cube([mainboard_width,side_panel_height,side_panel_thickness]);
        // rails h
        for (i=[1:mainboard_width/mainboard_spacing])
            union() {
                translate([i*mainboard_spacing-mainboard_spacing/2,side_panel_height-mainboard_thickness+margin,margin]) rotate([90,180,0]) rail(true, rail_width, rail_height, side_panel_thickness+side_panel_ticks);
                translate([i*mainboard_spacing-mainboard_spacing/2,mainboard_thickness+margin,margin]) rotate([90,180,180]) rail(true, rail_width, rail_height, side_panel_thickness+side_panel_ticks);
            }
        
    }
}

side_panel();