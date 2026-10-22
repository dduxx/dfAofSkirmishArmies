include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, blowpipe:Blowpipe]

module __Customizer_Limit__ () {}

MAIN_HAND = "large_sword_stone";

MAIN_HAND_OFFSET = 0;

MAIN_HAND_XYZ = [-13, 15, MAIN_HAND_OFFSET];

CAPE_OFFSET = 0;
BODY_OFFSET = 2;
CLOTHING_OFFSET = 3;

OFF_HAND = WEAPON_LOADOUT == "blowpipe" ? "large_blowgun" : "large_whip";

OFF_HAND_OFFSET = 4;

OFF_HAND_XYZ = OFF_HAND == "large_blowgun" ? [-21, 18, OFF_HAND_OFFSET] :
    [-21, 17, OFF_HAND_OFFSET];

build_animal_people_standard(
    path_prefix = "../../fixtures/character_models/animal_people/regular/",
    prefix = "chameleon_man_",
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
    left_arm_wearable = "none",
    right_arm_wearable = "none",
    clothing_offset = CLOTHING_OFFSET,
    wieldables_path_prefix = "../../fixtures/character_models/wieldables/wide/adult_",
    wieldable_left_hand = OFF_HAND,
    wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
    wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
    wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
    pixel_size = 1,
);
