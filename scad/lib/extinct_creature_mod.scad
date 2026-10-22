include <../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>
include <../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

module hornless_quetzalcoatlus(pixel_size = 1, z_offset=1, z_pixel_diff = 10) {
    mount_obj = import("../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/extinct/cretaceous_quetzalcoatlus.json");

    difference() {
        multi_layer_two_point_five_d(
            image_layers = [mount_obj],
            layer_offsets = [z_offset],
            pixel_size = pixel_size,
            center = false,
        );

        // remove the horn
        translate([7 * pixel_size, 28 * pixel_size, 0]) {
            union() {
                cube([
                    10 * pixel_size,
                    16 * pixel_size,
                    z_pixel_diff * pixel_size
                ]);
                translate([9 * pixel_size, 1 * pixel_size, 0]) {
                    cube([
                        3 * pixel_size,
                        16 * pixel_size,
                        z_pixel_diff * pixel_size
                    ]);
                }
                translate([12 * pixel_size, 2 * pixel_size, 0]) {
                    cube([
                        2 * pixel_size,
                        16 * pixel_size,
                        z_pixel_diff * pixel_size
                    ]);
                }
                translate([14 * pixel_size, 3 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        16 * pixel_size,
                        z_pixel_diff * pixel_size
                    ]);
                }
                translate([15 * pixel_size, 4 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        16 * pixel_size,
                        z_pixel_diff * pixel_size
                    ]);
                }
                translate([16 * pixel_size, 5 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        16 * pixel_size,
                        z_pixel_diff * pixel_size
                    ]);
                }
                translate([17 * pixel_size, 6 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        16 * pixel_size,
                        z_pixel_diff * pixel_size
                    ]);
                }
            }
        }
    }

    // replace with border
    translate([13 * pixel_size, 28 * pixel_size, 0]) {
        color("#131212") {
            union() {
                cube([
                    4 * pixel_size,
                    1 * pixel_size,
                    pixel_size + z_offset
                ]);
                translate([3 * pixel_size, 1 * pixel_size, 0]) {
                    cube([
                        3 * pixel_size,
                        1 * pixel_size,
                        pixel_size + z_offset
                    ]);
                }
                translate([6 * pixel_size, 2 * pixel_size, 0]) {
                    cube([
                        2 * pixel_size,
                        1 * pixel_size,
                        pixel_size + z_offset
                    ]);
                }
                translate([8 * pixel_size, 3 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        1 * pixel_size,
                        pixel_size + z_offset
                    ]);
                }
                translate([9 * pixel_size, 4 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        1 * pixel_size,
                        pixel_size + z_offset
                    ]);
                }
                translate([10 * pixel_size, 5 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        1 * pixel_size,
                        pixel_size + z_offset
                    ]);
                }
                translate([11 * pixel_size, 6 * pixel_size, 0]) {
                    cube([
                        1 * pixel_size,
                        1 * pixel_size,
                        pixel_size + z_offset
                    ]);
                }
            }
        }
    }
}
