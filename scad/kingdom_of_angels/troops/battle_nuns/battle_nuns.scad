include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

VARIANT = 1; // [1, 2, 3]

UPGRADE = "none"; // [none:None, sergeant:Sergeant, musician:Musician, banner:Banner]

module __Customizer_Limit__ () {}

VARIANTS = [
    [1, "long_braided"],
    [2, "long_pony_tail"],
    [4, "long_combed"],
];

HAS_HOOD = UPGRADE != "sergeant";

WEAPON = UPGRADE == "sergeant" ? "large_mace" : "large_flail";

MAIN_HAND_XYZ = [-32, -2, 1];

BODY_OFFSET = 1;
CLOTHING_OFFSET = 2;
HAIR_OFFSET = 2;

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
    beard_style = "none",
    beard_offset = 0,
    has_hood = HAS_HOOD,
    has_cape = true,
    has_earings = false,
    headwear = "none",
    face_covering = "none",
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
    wieldable_left_hand = "none",
    wieldable_left_hand_x_offset = 0,
    wieldable_left_hand_y_offset = 0,
    wieldable_left_hand_z_offset = 0,
    wieldable_right_hand = WEAPON,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);

if (UPGRADE == "banner" || UPGRADE == "musician") {
    OFF_HAND_OBJ = UPGRADE == "banner" ? import("../../../../fixtures/custom_wieldables/banner_2.json") :
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/fixtures/objects/instruments/instrument_3.json");

    OFF_HAND_XYZ = UPGRADE == "banner" ? [-25, 0, 3] :
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
