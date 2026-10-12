include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

module __Customizer_Limit__ () {}

MAIN_HAND_XYZ = [-32, -2, 2];

BODY_OFFSET = 1;
CLOTHING_OFFSET = 2;
HAIR_OFFSET = 2.5;

build_humanoid_adult(
    path_prefix = str(
        "../../fixtures/character_models/",
        "human",
        "/adult_"
    ),
    wieldables_path_prefix = str(
        "../../fixtures/character_models/wieldables/",
        "tall",
        "/adult_"
    ),
    pixel_size = 1,
    gender = "f",
    head = 2,
    has_left_shoulder = true,
    has_left_hand = true,
    has_right_shoulder = true,
    has_right_hand = true,
    has_left_leg = true,
    has_left_foot = true,
    has_right_leg = true,
    has_right_foot = true,
    body_offset = BODY_OFFSET,
    hair_style = "long_pony_tail",
    hair_offset = HAIR_OFFSET,
    beard_style = "none",
    beard_offset = 0,
    has_hood = true,
    has_cape = true,
    has_earings = false,
    headwear = "none",
    face_covering = "veil_face",
    shirt = "torso_simple_cloth",
    waist = "waist_robe",
    left_arm_wearable = "left_arm_base",
    left_hand_wearable = "none",
    right_arm_wearable = "right_arm_base",
    right_hand_wearable = "none",
    left_leg_wearable = "none",
    left_foot_wearable = "left_foot_boot_low_standard",
    right_leg_wearable = "none",
    right_foot_wearable = "right_foot_boot_low_standard",
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = "large_bow",
    wieldable_left_hand_x_offset = -32,
    wieldable_left_hand_y_offset = 0,
    wieldable_left_hand_z_offset = 4,
    wieldable_right_hand = "large_flail",
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);
