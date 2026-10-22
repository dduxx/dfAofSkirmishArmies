include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

module __Customizer_Limit__ () {}

PREFIX = "../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/surface/standard/";

SNAKE_TYPES = [
    "adder_adult",
    "king_cobra_adult",
    "copperhead_snake_adult"
];

SNAKE_TRANS = [
    [0, 16, 1],
    [8, 8, 3],
    [16, 0, 5],
];

for (i = [0 : len(SNAKE_TYPES) - 1]) {
    snake = SNAKE_TYPES[i];
    path = str(PREFIX, snake, ".json");
    snake_obj = import(path);

    translate([SNAKE_TRANS[i][0], SNAKE_TRANS[i][1], 0]) {
        multi_layer_two_point_five_d(
            image_layers = [snake_obj],
            layer_offsets = [SNAKE_TRANS[i][2]],
            pixel_size = 1,
            center = false
        );
    }
}
