include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

VARIANT = 1; // [1, 2, 3]

UPGRADE = "none"; // [none:None, banner:Banner, musician:Musician, sergeant:Sergeant]

module __Customizer_Limit__ () {}

VARIANTS = [
    [1, "none", "mid_unkempt", "cap", "torso_simple_cloth", "low", "large_cleaver_3"],
    [3, "short_combed", "none", "scarf_head", "torso_simple_cloth", "high", "large_pick"],
    [4, "short_combed", "long_unkempt", "none", "torso_vest_cloth", "high", "large_stone_axe_3"],
];

MAIN_HAND_XYZ = VARIANTS[VARIANT - 1][6] == "large_cleaver_3" ? [-33, -1, 0] :
    VARIANTS[VARIANT - 1][6] == "large_pick" ? [-31, 1, 0] :
    [-32, 0, 0];

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
    shirt = VARIANTS[VARIANT - 1][4],
    waist = "waist_tunic",
    left_arm_wearable = "left_arm_base",
    left_hand_wearable = "none",
    right_arm_wearable = "right_arm_base",
    right_hand_wearable = "none",
    left_leg_wearable = "left_leg_leggings_standard",
    left_foot_wearable = str("left_foot_boot_", VARIANTS[VARIANT - 1][5], "_standard"),
    right_leg_wearable = "right_leg_leggings_standard",
    right_foot_wearable = str("right_foot_boot_", VARIANTS[VARIANT - 1][5], "_standard"),
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = "none",
    wieldable_left_hand_x_offset = 0,
    wieldable_left_hand_y_offset = 0,
    wieldable_left_hand_z_offset = 0,
    wieldable_right_hand = VARIANTS[VARIANT - 1][6],
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);

if (UPGRADE != "none") {
    OFF_HAND_OBJ = UPGRADE == "banner" ? import("../../../../fixtures/custom_wieldables/banner_2.json") :
        UPGRADE == "sergeant" ? import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/wieldables/tall/adult_wieldables_shield_wood_left_hand.json") :
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/objects/instruments/instrument_3.json");

    OFF_HAND_XYZ = UPGRADE == "banner" ? [-25, 0, 3] :
        UPGRADE == "sergeant" ? [0, 0, 3] :
        [13, 7, 8];

    OFF_HAND_SCALE_FACTOR = UPGRADE == "musician" ? 0.5 : 1;
    OFF_HAND_ROTATE_FACTOR = UPGRADE == "musician" ? -15 : 0;

    translate([OFF_HAND_XYZ[0], OFF_HAND_XYZ[1], 0]) {
        rotate([0, 0, OFF_HAND_ROTATE_FACTOR]) {
            scale([OFF_HAND_SCALE_FACTOR, OFF_HAND_SCALE_FACTOR, OFF_HAND_SCALE_FACTOR]) {
                multi_layer_two_point_five_d(
                    image_layers = [OFF_HAND_OBJ],
                    layer_offsets = [OFF_HAND_XYZ[2]],
                    pixel_size = 1,
                    center = false
                );
            }
        }
    }
}
