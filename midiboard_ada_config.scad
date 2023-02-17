include <common.scad>;
midi_board_width = 2*inch_to_mm;
midi_board_height = 0.9*inch_to_mm;
midi_board_depth = 1.62;
midi_board_hole_diameter = 2.54;
midi_board_hole_from_side = 0.05*inch_to_mm + midi_board_hole_diameter/2;
midi_board_underclearance = 4.24; // For the optocoupler
midi_support_board_height=1;
midi_support_thickness=4;
midi_support_spacing=midi_board_underclearance;


midi_board_holes = [
   [midi_board_hole_from_side, midi_board_hole_from_side],
   [midi_board_width-midi_board_hole_from_side, midi_board_hole_from_side],
   [midi_board_hole_from_side, midi_board_height-midi_board_hole_from_side],
   [midi_board_width-midi_board_hole_from_side, midi_board_height-midi_board_hole_from_side]
];
