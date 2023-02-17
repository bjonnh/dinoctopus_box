$fn=100;

cut_limit = 1.0;
pcb_height=47;
pcb_width=105;
module fakePCB() {
    module holesRow() {
        translate([9,3,-cut_limit]) cylinder(h=20,d=hole_size);
        translate([9,pcb_height-3,-cut_limit]) cylinder(h=20,d=hole_size);
    }
    hole_size= 3.0;
    difference() {
        color([0,1.0,0]) cube([105.00,pcb_height, 2.00]);
        holesRow();
        translate([93.00,0,0]) holesRow();
    }
}

display_height=37.79;
module fakeDisplay() {
    cube([57.19, display_height,6.00]);
}
pot_side=97.70-86.52;
pot_height=7;
module fakePot() {  // Reference X is middle
    translate([-pot_side/2, 0,0]) union() { 
    color([0,0,1.0]) cube([pot_side, pot_side, pot_height]);
    translate([pot_side/2, pot_side/2, pot_height]) cylinder(10, d=6);
    color([0,0,0,0.3]) translate([pot_side/2, pot_side/2, 12]) cylinder(10, d=25);
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

module fakeMini() {
    fakePCB();
    translate([13.0, pcb_height-display_height-4.0,2.0]) fakeDisplay();
    translate([91.86, pcb_height-pot_side/2-20.0,2.0]) fakePot();
    translate([91.86, 6,2.0]) fakeSwitch();
    translate([49,connector_height+9,0]) rotate([180,0,0]) connector();
    translate([49+21,connector_height+9,0]) rotate([180,0,0]) connector();
    translate([0,sd_height+8,0]) rotate([180,0,0]) sdCardSlot();
}

box_width=110;
box_height=60;
box_depth=140;

module box() {
    difference() {
        cube([box_width,box_height,box_depth]);
        translate([2,2,-cut_limit]) cube([box_width-4,box_height-4,box_depth-8]);
    }
}

arduino_width=105;
arduino_height=58;
module arduino() {
    cube([arduino_width-40,arduino_height,40]);
    cube([arduino_width,arduino_height,13]);
}

jack_size=16;
module jack() {
    cube([jack_size,jack_size,30]);
    translate([jack_size/2, jack_size/2,-10]) cylinder(10,d=9);
}

module jackbox() {
    for ( i = [0 : 4] ){
        for ( j = [0 : 1] ){
            translate([i*jack_size+2,j*jack_size+2,0]) jack();
        }
    }
}

module midibox() {
    cube([53,20,40]);
}

translate([(box_width-pcb_width)/2,(box_height-pcb_height)/2,box_depth-10]) fakeMini();
color([0.7,0.7,1,0.5]) translate([arduino_height+2,2,arduino_width+2]) rotate([0,90,90]) arduino();
color([1.0,0.7,0.7,0.5]) translate([00,14,2]) jackbox();
color([0.4,0.4,0.4,0.5]) translate([108,2,cut_limit]) rotate([0,0,90]) midibox();
color([1,1,1,0.5]) box();

