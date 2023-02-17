include <common.scad>
include <pico.scad>
include <generic_board.scad>

module support_pico(ghost=false) {
    if (ghost) {
        rotate([0,-90,0]) pico();
        
    }
    generic_board_attacher();
}

