include <display_config.scad>

module display_holes_row() {
    $fn=50;
    translate([display_hole_x_offset,display_hole_y_offset,-cut_limit]) cylinder(h=20,d=display_hole_size);
    translate([display_hole_x_offset,display_pcb_height-display_hole_y_offset,-cut_limit]) cylinder(h=20,d=display_hole_size);
}


module ghost_display() {
    $fn=50;
    module fakePCB() {        
        difference() {
            color([0,1.0,0]) cube([display_pcb_width,display_pcb_height, 2.00]);
            display_holes_row();
            translate([display_hole_between,0,0]) display_holes_row();
        }
    }
    
    module fakeDisplay() {
        cube([display_screen_width, display_screen_height,6.00]);
    }
    
    module fakePot() {  // Reference X is middle
        translate([-display_pot_side/2, -display_pot_side/2,0]) union() { 
        color([0,0,1.0]) cube([display_pot_side, display_pot_side, display_pot_height]);
        translate([display_pot_side/2, display_pot_side/2, display_pot_height]) cylinder(10, d=6);
        color([0,0,0,0.3]) translate([display_pot_side/2, display_pot_side/2, 12]) cylinder(10, d=25);
    }
    }

    switch_side=6;
    switch_height=4;
    bite_height=4;
    switch_round_diameter=3;
    module fakeSwitch() { // Reference X middle
        translate([-switch_side/2, 0 ,0]) union() { 
            color([0.4,0.4,0.4]) cube([switch_side,switch_side, switch_height]);
            color([0,0,0]) translate([switch_side/2, switch_side/2, switch_height]) cylinder(bite_height,d=switch_round_diameter);
    }
    }

    connector_height=9;
    module connector() {
        difference() {
            cube([21,connector_height,9]);
            translate([1,1,1+cut_limit*2]) cube([19,7,8+cut_limit]); // middle
            translate([8,-cut_limit,1+cut_limit*2])cube([5,2+cut_limit,9]); // notch
        }
    }

    sd_height=27;
    module sdCardSlot() {
        cube([17 ,27 ,3]);
    }
    
    fakePCB();
    translate([display_x_shift, display_y_shift,2.0]) fakeDisplay();
    translate([display_pot_x_shift,display_pot_y_shift, 2.0]) fakePot();
    translate([display_switch_x_shift, display_switch_y_shift,2.0]) fakeSwitch();
    translate([49,connector_height+9,0]) rotate([180,0,0]) connector();
    translate([49+21,connector_height+9,0]) rotate([180,0,0]) connector();
    translate([0,sd_height+8,0]) rotate([180,0,0]) sdCardSlot();
}


ghost_display();