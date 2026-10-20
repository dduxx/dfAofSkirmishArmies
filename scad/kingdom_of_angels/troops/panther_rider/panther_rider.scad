include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, heavy_glaive:Heavy Glaive, halberd:Halberd]

UPGRADE = "none"; // [none:None, sergeant:Sergeant, musician:Musician, banner:Banner]

module __Customizer_Limit__ () {}

HAS_BOW = WEAPON_LOADOUT == "default";

BOW_IN_LEFT = HAS_BOW && (UPGRADE == "none" || UPGRADE == "sergeant");

MAIN_HAND = HAS_BOW && !BOW_IN_LEFT ? "large_bow" :
    WEAPON_LOADOUT == "heavy_glaive" ? "large_spear" :
    WEAPON_LOADOUT == "halberd" ? "large_halberd" :
    "none";

HAS_HOOD = UPGRADE != "sergeant";

HAIR_STYLE = UPGRADE == "sergeant" ? "long_braided" : "long_combed";

MAIN_HAND_XYZ = MAIN_HAND == "large_halberd" ? [-32, 0, 1] :
    "large_spear" ? [-32, -2, 1] :
    [-32, 0, 1];

OFF_HAND_XYZ = [-32, 0, 5];

BODY_OFFSET = 2;
CLOTHING_OFFSET = 3;
HAIR_OFFSET = 4;

difference() {
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
        head = 4,
        has_left_shoulder = true,
        has_left_hand = true,
        has_right_shoulder = true,
        has_right_hand = true,
        has_left_leg = true,
        has_left_foot = true,
        has_right_leg = false,
        has_right_foot = false,
        body_offset = BODY_OFFSET,
        hair_style = HAIR_STYLE,
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
        right_foot_wearable = "none",
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


    if (MAIN_HAND == "large_spear" || MAIN_HAND == "large_halberd") {
        WEAPON_HIDE_XYZ = [4, 14, 8];
        WEAPON_HIDE_TRANS = [5, -2, 0];

        translate(WEAPON_HIDE_TRANS) {
            cube(WEAPON_HIDE_XYZ);
        }
    }
}

mount_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/creatures/surface/standard/leopard_adult.json");

translate([-3, -12, 0]) {
    multi_layer_two_point_five_d(
        image_layers = [mount_obj],
        layer_offsets = [1],
        pixel_size = 1,
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
