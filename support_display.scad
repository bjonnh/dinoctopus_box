include <common.scad>
include <display_config.scad>
use <display.scad>
include <generic_board.scad>
include <dovetail.scad>
include <display_support_config.scad>
use <display_spacer.scad>

module support_display(ghost=false) {
    $fn=50;
    if (ghost) {
        translate([-display_support_shift_x,-display_support_spacing,display_support_screen_height]) rotate([90,0,0]) ghost_display();
    for (i=[0:3]) 
          translate([display_holes[i][0]-display_support_shift_x,0,display_holes[i][1]+display_support_screen_height]) 
            rotate([90,0,0]) display_spacer();    
    }
    //generic_board_attacher();
    difference() {
        cube([display_pcb_width-display_support_shift_x,display_support_thickness,board_attacher_height]);
        translate([-1,-margin/2,12]) cube([100-display_support_shift_x,50,32]);       
        for (i=[0:3]) 
          translate([display_holes[i][0]-display_support_shift_x,margin+display_support_spacing,display_holes[i][1]+display_support_screen_height]) 
            rotate([90,0,0]) cylinder(20,d=3);
    }
    
    translate([0,display_support_thickness/2,0]) rotate([0,0,90]) rail(true, rail_width, rail_height, display_pcb_width-display_support_shift_x); 
    translate([0,display_support_thickness/2,board_attacher_height]) rotate([0,180,90]) rail(true, rail_width, rail_height, display_pcb_width-display_support_shift_x);  
}

translate([0,0,display_pcb_width-remove_side]) rotate([0,90,0]) support_display(true);
