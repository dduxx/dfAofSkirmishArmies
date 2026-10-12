include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, heavy_ice_halberd:Heavy Ice Halberd, great_weapon:Great Weapon, heavy_flame_spear:Heavy Flame Spear, heavy_hand_weapon_and_bow:Heavy Hand Weapon and Bow]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "heavy_ice_halberd" ? "large_halberd" :
    WEAPON_LOADOUT == "great_weapon" ? "large_axe_great" :
    WEAPON_LOADOUT == "heavy_flame_spear" ? "large_spear" :
    WEAPON_LOADOUT == "heavy_hand_weapon_and_bow" ? "large_maul" :
    "large_sword_2h";

MAIN_HAND_OFFSET = 1;

MAIN_HAND_XYZ = MAIN_HAND == "large_sword_2h" ? [-32, -1, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_halberd" ? [-33, 0, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_axe_great" ? [-34, 0, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_spear" ? [-32, -1, MAIN_HAND_OFFSET] :
    [-32, -2, MAIN_HAND_OFFSET];

OFF_HAND = WEAPON_LOADOUT == "heavy_hand_weapon_and_bow" ? "large_bow" : "none";

OFF_HAND_OFFSET = 4;

OFF_HAND_XYZ = [-32, 0, OFF_HAND_OFFSET];

BODY_OFFSET = 1;
CLOTHING_OFFSET = 3;
WING_OFFSET = 0;
HAIR_OFFSET = 2;
PIXEL_SCALE = 1.25;

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
    head = 4,
    has_left_shoulder = true,
    has_left_hand = true,
    has_right_shoulder = true,
    has_right_hand = true,
    has_left_leg = true,
    has_left_foot = true,
    has_right_leg = true,
    has_right_foot = true,
    body_offset = BODY_OFFSET,
    hair_style = "long_combed",
    hair_offset = HAIR_OFFSET,
    beard_style = "none",
    beard_offset = 0,
    has_hood = false,
    has_cape = false,
    has_earings = false,
    headwear = "crown",
    face_covering = "none",
    shirt = "torso_leather_standard",
    waist = "waist_skirt_short",
    left_arm_wearable = "left_arm_plate_artifact",
    left_hand_wearable = "none",
    right_arm_wearable = "right_arm_plate_artifact",
    right_hand_wearable = "none",
    left_leg_wearable = "none",
    left_foot_wearable = "left_foot_boot_high_artifact",
    right_leg_wearable = "none",
    right_foot_wearable = "right_foot_boot_high_artifact",
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = OFF_HAND,
    wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
    wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
    wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);

left_wing_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/fixtures/character_models/animal_people/bird/cardinal_man_left_wing.json");
right_wing_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/fixtures/character_models/animal_people/bird/cardinal_man_right_wing.json");

translate([-18 * PIXEL_SCALE, -12 * PIXEL_SCALE, 0]) {
    multi_layer_two_point_five_d(
        image_layers = [left_wing_obj, right_wing_obj],
        layer_offsets = [WING_OFFSET, WING_OFFSET],
        pixel_size = PIXEL_SCALE,
        center = false
    );
}
