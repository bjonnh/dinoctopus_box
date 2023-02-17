include <dovetail.scad>;
include <board_config.scad>;
include <common.scad>;


hole_spacing=10;
front_back_holes_depth=10;

module generic_board_attacher_mating() {
    difference() {
        cube([board_attacher_width,board_attacher_length,board_attacher_height]);
        // non attaching holes
        
        for (z=[1:board_attacher_height/(hole_spacing/2)-1]) translate([0,0,hole_spacing/2*z]) union() {
            /*for (i=[1:board_attacher_length/hole_spacing-1]) 
                translate([-margin,hole_spacing*i,0]) rotate([0,90,0]) 
                    cylinder(board_attacher_width+2*margin,d=bigscrew_diameter, $fn=50);*/
            for (i=[1:board_attacher_length/(hole_spacing/2)]) 
                translate([-margin,hole_spacing*i/2-hole_spacing/4,0]) rotate([0,90,0]) 
                    cylinder(board_attacher_width+2*margin,d=bigscrew_attach_hole_diameter, $fn=50);                
        }
        // vertical attaching holes
        for (i=[1:board_attacher_height/(hole_spacing/2)-1]) 
            union() {
                translate([board_attacher_width/2,front_back_holes_depth+margin,hole_spacing*i/2]) rotate([90,00,0]) 
                    cylinder(front_back_holes_depth+2*margin,d=bigscrew_attach_hole_diameter, $fn=50);             
                translate([board_attacher_width/2,board_attacher_length+margin,hole_spacing*i/2]) rotate([90,00,0]) 
                    cylinder(front_back_holes_depth+2*margin,d=bigscrew_attach_hole_diameter, $fn=50);             
            }
                
    }
}

module generic_board_attacher() {
    union() {
        generic_board_attacher_mating();
        translate([board_attacher_width/2,board_attacher_length,0]) rail(true, rail_width, rail_height, board_attacher_length);  
        translate([board_attacher_width/2,board_attacher_length,board_attacher_height]) rotate([0,180,0]) rail(true, rail_width, rail_height, board_attacher_length);  
    }
}

//generic_board_attacher();