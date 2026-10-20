include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, great_weapon:Great Weapon, bow_and_heavy_hand_weapon:Bow and Heavy Hand Weapon]
// WEAPON = "greatsword"; // [greatsword:Greatsword, great_axe:Great Weapon, maul_bow:Heavy Hand Weapon + Bow]

UPGRADE = "none"; // [none:None, sergeant:Sergeant, musician:Musician, banner:Banner]

module __Customizer_Limit__ () {}

HAS_BOW = WEAPON_LOADOUT == "bow_and_heavy_hand_weapon";

BOW_IN_LEFT = HAS_BOW && (UPGRADE == "sergeant" || UPGRADE == "none");

MAIN_HAND = WEAPON_LOADOUT == "bow_and_heavy_hand_weapon" && BOW_IN_LEFT ? "large_maul" :
    WEAPON_LOADOUT == "bow_and_heavy_hand_weapon" && !BOW_IN_LEFT ? "large_bow" :
    WEAPON_LOADOUT == "great_weapon" ? "large_axe_great" :
    "large_sword_2h";

MAIN_HAND_XYZ = MAIN_HAND == "large_sword_2h" ? [-31, -1, 1] :
    MAIN_HAND == "large_axe_great" ? [-33, 0, 1] :
    MAIN_HAND == "large_bow" ? [-30, -2, 1] :
    [-31, -2, 1];

OFF_HAND_XYZ = [-32, 0, 4];

BODY_OFFSET = 2;
CLOTHING_OFFSET = 3;
WING_OFFSET = 0;
HAIR_OFFSET = 3;
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
    headwear = UPGRADE == "sergeant" ? "helm_wood" : "none",
    face_covering = "none",
    shirt = "torso_leather_standard",
    waist = "waist_skirt_short",
    left_arm_wearable = "left_arm_plate_standard",
    left_hand_wearable = "none",
    right_arm_wearable = "right_arm_plate_standard",
    right_hand_wearable = "none",
    left_leg_wearable = "none",
    left_foot_wearable = "left_foot_boot_high_standard",
    right_leg_wearable = "none",
    right_foot_wearable = "right_foot_boot_high_standard",
    cape_offset = 0,
    clothing_offset = CLOTHING_OFFSET,
    wieldable_left_hand = BOW_IN_LEFT ? "large_bow" : "none",
    wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
    wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
    wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
);

left_wing_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/animal_people/bird/crow_man_left_wing.json");
right_wing_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/animal_people/bird/crow_man_right_wing.json");

translate([-19 * PIXEL_SCALE, -12 * PIXEL_SCALE, 0]) {
    multi_layer_two_point_five_d(
        image_layers = [left_wing_obj, right_wing_obj],
        layer_offsets = [WING_OFFSET, WING_OFFSET],
        pixel_size = PIXEL_SCALE,
        center = false
    );
}

if (UPGRADE == "banner" || UPGRADE == "musician") {
    OFF_HAND_OBJ = UPGRADE == "banner" ? import("../../../../fixtures/custom_wieldables/banner_2.json") :
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/objects/instruments/instrument_3.json");

    OFF_HAND_XYZ = UPGRADE == "banner" ? [-25, 0, 3] :
        [13, 7, 8];

    OFF_HAND_SCALE_FACTOR = UPGRADE == "musician" ? 0.5 : 1;
    OFF_HAND_ROTATE_FACTOR = UPGRADE == "musician" ? -15 : 0;

    translate([OFF_HAND_XYZ[0] * PIXEL_SCALE, OFF_HAND_XYZ[1] * PIXEL_SCALE, 0]) {
        rotate([0, 0, OFF_HAND_ROTATE_FACTOR]) {
            scale([OFF_HAND_SCALE_FACTOR, OFF_HAND_SCALE_FACTOR, OFF_HAND_SCALE_FACTOR]) {
                multi_layer_two_point_five_d(
                    image_layers = [OFF_HAND_OBJ],
                    layer_offsets = [OFF_HAND_XYZ[2]],
                    pixel_size = PIXEL_SCALE,
                    center = false
                );
            }
        }
    }
}
