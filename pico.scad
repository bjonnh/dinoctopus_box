include <pico_config.scad>;

module pico_holes_block(diameter, margin, extra_up,thickness) {
    $fn=50;
    for(i=[0:3])
        translate([pico_holes[i][0],pico_holes[i][1],-margin/2]) 
            cylinder(h=thickness+margin+extra_up, d=diameter);
}


module pico() {
    difference() {
        union() {
            color("green") cube([pico_width,pico_height,pico_thickness]);
            color("grey") translate([-usb_protrude,(pico_height-usb_height)/2,pico_thickness]) cube([usb_width, usb_height, usb_thickness]);
        }
        pico_holes_block(pico_screw_hole, margin,1,pico_thickness);
    }
}

pico();