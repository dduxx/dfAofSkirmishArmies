include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

VARIANT = 1; // [1, 2, 3]

module __Customizer_Limit__ () {}

VARIANTS = [
    [1, "none", "none", "helm_wood"],
    [2, "none", "none", "cap_base"],
    [3, "short_combed", "short_unkempt", "none"],
];

OFF_HAND_XYZ = [-32, 0, 4];

RIGHT_HAND_XYZ = [-34, -1, 0];

BODY_OFFSET = 2;
CLOTHING_OFFSET = 3;
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
    gender = "m",
    head = VARIANTS[VARIANT - 1][0],
    has_left_shoulder = true,
    has_left_hand = true,
    has_right_shoulder = true,
    has_right_hand = true,
    has_left_leg = true,
    has_left_foot = true,
    has_right_leg = true,
    has_right_foot = true,
    body_offset = BODY_OFFSET,
    hair_style = VARIANTS[VARIANT - 1][1],
    hair_offset = HAIR_OFFSET,
    beard_style = VARIANTS[VARIANT - 1][2],
    beard_offset = HAIR_OFFSET,
    has_hood = false,
    has_cape = false,
    has_earings = false,
    headwear = VARIANTS[VARIANT - 1][3],
    face_covering = "none",
    shirt = "torso_mail_standard",
    waist = "waist_skirt_short",
    left_arm_wearable = "left_arm_mail_standard",
    left_hand_wearable = "none",
    right_arm_wearable = "right_arm_mail_standard",
    right_hand_wearable = "none",
    left_leg_wearable = "left_leg_leggings_standard",
    left_foot_wearable = "left_foot_boot_high_standard",
    right_leg_wearable = "right_leg_leggings_standard",
    right_foot_wearable = "right_foot_boot_high_standard",
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = "large_crossbow",
    wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
    wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
    wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
    wieldable_right_hand = "large_sword_short",
    wieldable_right_hand_x_offset = RIGHT_HAND_XYZ[0],
    wieldable_right_hand_y_offset = RIGHT_HAND_XYZ[1],
    wieldable_right_hand_z_offset = RIGHT_HAND_XYZ[2],
);
