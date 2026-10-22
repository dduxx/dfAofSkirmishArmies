include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>

module __Customizer_Limit__ () {}

MAIN_HAND = "large_spear_training";
MAIN_HAND_XYZ = [-15, 14, 0];

CAPE_OFFSET = 0;
BODY_OFFSET = 1;
CLOTHING_OFFSET = 2;

build_animal_people_standard(
    path_prefix = "../../fixtures/character_models/animal_people/large/",
    prefix = "toad_man_",
    body_offset = BODY_OFFSET,
    has_left_arm = true,
    has_right_arm = true,
    has_left_foot = true,
    has_right_foot = true,
    has_tail = false,
    wearables_path_prefix = "../../fixtures/character_models/animal_people/wearables_large_padded/",
    cape = "cape",
    cape_offset = CAPE_OFFSET,
    shirt = "torso_vest",
    left_arm_wearable = "none",
    right_arm_wearable = "none",
    clothing_offset = CLOTHING_OFFSET,
    wieldables_path_prefix = "../../fixtures/character_models/wieldables/wide/adult_",
    wieldable_left_hand = "none",
    wieldable_left_hand_x_offset = 0,
    wieldable_left_hand_y_offset = 0,
    wieldable_left_hand_z_offset = 0,
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
    pixel_size = 1,
);
