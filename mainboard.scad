include <dovetail.scad>;
include <board_config.scad>;
include <common.scad>;

// mainboard

module mainboard(holes=false) {
    difference() {
        cube([mainboard_width,mainboard_height,mainboard_thickness]);
        // rails h
        for (i=[1:mainboard_width/mainboard_spacing]) 
            translate([i*mainboard_spacing-mainboard_spacing/2,mainboard_height+margin,mainboard_thickness+margin]) rail(false, rail_width, rail_height, mainboard_height+2*margin);
        // rails v
        for (i=[1:mainboard_height/mainboard_spacing]) 
            translate([-margin,i*mainboard_spacing-mainboard_spacing/2,mainboard_thickness+margin]) rotate([0,0,90]) rail(false, rail_width, rail_height, mainboard_width+2*margin);
        if (holes) {
        for (x=[1:mainboard_width/deep_holes_spacing-1]) 
            for (y=[1:mainboard_height/deep_holes_spacing-1]) 
                union() {
                    translate([x*deep_holes_spacing,y*deep_holes_spacing,-margin]) 
                        cylinder(mainboard_thickness+2*margin,d=bigscrew_diameter, $fn=50);
                    translate([x*deep_holes_spacing,y*deep_holes_spacing,-margin]) 
                        cylinder(bigscrew_head_height+2*margin,d=bigscrew_head_diameter, $fn=50);
                }    
        }
    }
}

mainboard();