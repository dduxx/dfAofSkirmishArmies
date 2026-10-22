include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>

WEAPON_LOADOUT = "default"; // [default:Default, great_weapon:Great Weapon]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "great_weapon" ? "large_axe_great" : "large_sword_stone";

MAIN_HAND_XYZ = MAIN_HAND == "large_axe_great" ? [-14, 14, 0] : [-14, 14, 0];

CAPE_OFFSET = 0;
BODY_OFFSET = 2;
CLOTHING_OFFSET = 3;

build_animal_people_standard(
    path_prefix = "../../fixtures/character_models/animal_people/regular/",
    prefix = "crocodile_saltwater_man_",
    body_offset = BODY_OFFSET,
    has_left_arm = true,
    has_right_arm = true,
    has_left_foot = true,
    has_right_foot = true,
    has_tail = true,
    wearables_path_prefix = "../../fixtures/character_models/animal_people/wearables_padded/",
    cape = "none",
    cape_offset = CAPE_OFFSET,
    shirt = "none",
    left_arm_wearable = "left_arm_plate_standard",
    right_arm_wearable = "right_arm_plate_standard",
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
