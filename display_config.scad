display_pcb_height=47;
display_pcb_width=105;
display_hole_size= 3.0;
cut_limit = 1.0;

display_hole_x_offset=9;
display_hole_y_offset=3;
display_hole_between=93;

display_screen_width=57.19;
display_screen_height=37.79;
display_x_shift=13;
display_y_shift = display_pcb_height-display_screen_height-4.0;
display_holes=[[display_hole_x_offset, display_hole_y_offset],
               [display_hole_x_offset, display_pcb_height-display_hole_y_offset],
               [display_hole_between+display_hole_x_offset, display_hole_y_offset],
               [display_hole_between+display_hole_x_offset, display_pcb_height-display_hole_y_offset]];
               
display_pot_side=12;
display_pot_height=7;

display_pot_x_shift = 92.2;
display_pot_y_shift = display_pcb_height-20.66;


display_switch_x_shift= display_pot_x_shift;
display_switch_y_shift = 8.85;
