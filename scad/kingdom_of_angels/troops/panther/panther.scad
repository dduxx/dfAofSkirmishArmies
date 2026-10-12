include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

leopard_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/fixtures/character_models/creatures/surface/standard/leopard_adult.json");

multi_layer_two_point_five_d(
    image_layers = [leopard_obj],
    layer_offsets = [1],
    pixel_size = 1,
    center = false
);
