include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

module __Customizer_Limit__ () {}

PATH = "../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/extinct/jurassic_rhamphorhynchus.json";

body_obj = import(PATH);

multi_layer_two_point_five_d(
    image_layers = [body_obj],
    layer_offsets = [1],
    pixel_size = 1,
    center = false
);
