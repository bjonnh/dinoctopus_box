module dovetail_shape(width, height, length) {
    translate([-width/2,0,0]) linear_extrude(height = length) {
        polygon([[0, 0], [width, 0], [width - width/3, height], [width/3, height]]);
    }
}

module rail(male=false, width, height, length, default_offset=0.2) {
    // male will reduce the width slightly
    offset = male ? default_offset : 0;
    
    translate([0,0,-height+offset]) rotate([90,0,0]) dovetail_shape(width-2*offset,height-offset,length);
}
