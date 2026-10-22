include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, blessed_greatsword:Blessed Greatsword]

UPGRADE = "none"; // [none:None, sergeant:Sergeant, musician:Musician, banner:Banner]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "blessed_greatsword" ? "large_sword_2h" : "large_hammer_war";

HAS_SHIELD = MAIN_HAND == "large_hammer_war" && (UPGRADE == "none" || UPGRADE == "sergeant");

LEFT_ARM = UPGRADE == "sergeant" ? "left_arm_plate_artifact" : "left_arm_plate_standard";
RIGHT_ARM = UPGRADE == "sergeant" ? "right_arm_plate_artifact" : "right_arm_plate_standard";

HEADWEAR = UPGRADE == "sergeant" ? "helm_artifact" : "helm_wood";

MAIN_HAND_XYZ = MAIN_HAND == "large_hammer_war" ? [-32, -2, 0] :
    [-30, -1, 0];

OFF_HAND_XYZ = [0, 0, 4];

BODY_OFFSET = 1;
CLOTHING_OFFSET = 2;
HAIR_OFFSET = 3;

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
    hair_offset = HAIR_OFFSET,
    beard_style = "none",
    beard_offset = HAIR_OFFSET,
    has_hood = false,
    has_cape = false,
    has_earings = false,
    headwear = HEADWEAR,
    face_covering = "none",
    shirt = "torso_plate_standard",
    waist = "none",
    left_arm_wearable = LEFT_ARM,
    left_hand_wearable = "none",
    right_arm_wearable = RIGHT_ARM,
    right_hand_wearable = "none",
    left_leg_wearable = "left_leg_greaves_standard",
    left_foot_wearable = "left_foot_boot_high_standard",
    right_leg_wearable = "right_leg_greaves_standard",
    right_foot_wearable = "right_foot_boot_high_standard",
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = HAS_SHIELD ? "shield_standard" : "none",
    wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
    wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
    wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);

if (UPGRADE == "banner" || UPGRADE == "musician") {
    OFF_HAND_OBJ = UPGRADE == "banner" ? import("../../../../fixtures/custom_wieldables/banner_2.json") :
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/objects/instruments/instrument_3.json");

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
