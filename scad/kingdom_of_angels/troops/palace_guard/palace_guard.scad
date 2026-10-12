include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, heavy_halberd:Heavy Halberd, great_weapon:Great Weapon]


module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "heavy_halberd" ? "large_halberd" :
    WEAPON_LOADOUT == "great_weapon" ? "large_axe_great" :
    "large_sword_2h";

MAIN_HAND_XYZ = MAIN_HAND == "large_halberd" ? [-34, 0, 0] :
    MAIN_HAND == "large_axe_great" ? [-34, 0, 0] :
    [-32, -1, 0];

BODY_OFFSET = 1;
CLOTHING_OFFSET = 2;
PIXEL_SCALE = 1.15;

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
    pixel_size = PIXEL_SCALE,
    gender = "m",
    head = 1,
    has_left_shoulder = true,
    has_left_hand = true,
    has_right_shoulder = true,
    has_right_hand = true,
    has_left_leg = true,
    has_left_foot = true,
    has_right_leg = true,
    has_right_foot = true,
    body_offset = BODY_OFFSET,
    hair_style = "none",
    hair_offset = 0,
    beard_style = "none",
    beard_offset = 0,
    has_hood = false,
    has_cape = false,
    has_earings = false,
    headwear = "helm_artifact",
    face_covering = "none",
    shirt = "torso_plate_artifact",
    waist = "none",
    left_arm_wearable = "left_arm_plate_artifact",
    left_hand_wearable = "left_hand_base",
    right_arm_wearable = "right_arm_plate_artifact",
    right_hand_wearable = "right_hand_base",
    left_leg_wearable = "left_leg_greaves_artifact",
    left_foot_wearable = "left_foot_boot_high_artifact",
    right_leg_wearable = "right_leg_greaves_artifact",
    right_foot_wearable = "right_foot_boot_high_artifact",
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = "none",
    wieldable_left_hand_x_offset = 0,
    wieldable_left_hand_y_offset = 0,
    wieldable_left_hand_z_offset = 0,
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);
