module midiport_ada() {
    // origin point is bottom left looking at plate and connectors at the bottom
    // This is a bounding box, the connectors on the back are included in the shape
    plate_width = 20;
    plate_height = 20;
    plate_depth = 2.33;
               
    plate_side_width = 1;
    plug_cut = 13.7;
        
    module plate(width, height, depth, side_width, plug_cut) {
        side_depth = 1.3;
        base_height = 7;
        base_depth = 12.76;
        margin=0.1;
        
        translate([-width/2,-height/2,0]) difference() {
            union() {
                cube([width, height, depth]); // plate
                translate([side_width,0,depth]) cube([width-side_width*2, base_height, base_depth]); // base
            }
            translate([width/2,height/2,-margin/2]) cylinder(h=depth+margin, d=plug_cut);
            translate([-margin/2,-margin/2,depth-side_depth-margin/2]) cube([side_width+margin, height+margin, side_depth+margin]); 
            translate([-margin/2+width-side_width,-margin/2,depth-side_depth-margin/2]) cube([side_width+margin, height+margin, side_depth+margin]); 
        }
    }
    module plug(plug_cut, plate_depth) {
        connectors_safety_zone = 2;
        depth = 9.5 + plate_depth; 
        diameter = 11.7;
        cylinder(depth+connectors_safety_zone, d= diameter);
        translate([0,0,plate_depth]) cylinder(depth+connectors_safety_zone, d=plug_cut);
    }
    color("grey") translate([plate_width/2,0,plate_height/2]) rotate([90,0,180])  union() {
        plate(plate_width,plate_height, plate_depth, plate_side_width,plug_cut);
        translate([0,0,0]) plug(plug_cut,plate_depth);
    }
}
