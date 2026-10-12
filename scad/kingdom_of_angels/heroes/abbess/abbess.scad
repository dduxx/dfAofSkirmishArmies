include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; //[default:Default, heavy_flail:Heavy Flail, heavy_halberd:Heavy Halberd]

HAS_BOW = false;

MOUNT = "none"; // [none:None, leopard:Leopard]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "heavy_halberd" ? "large_halberd" :
    WEAPON_LOADOUT == "heavy_flail" ? "large_flail" :
    "large_spear";

BODY_OFFSET = MOUNT == "none" ? 1 : 2;
CLOTHING_OFFSET = MOUNT == "none" ? 2 : 3;
HAIR_OFFSET = MOUNT == "none" ? 2 : 3;
OFF_HAND_OFFSET = MOUNT == "none" ? 3 : 4;
MAIN_HAND_OFFSET = MOUNT == "none" ? 0 : 1;

MAIN_HAND_XYZ = MAIN_HAND == "large_flail" ? [-32, 0, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_halberd" ? [-32, 0, MAIN_HAND_OFFSET] :
    [-33, -2, MAIN_HAND_OFFSET];

OFF_HAND_XYZ = [-32, 0, OFF_HAND_OFFSET];

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
        head = 3,
        has_left_shoulder = true,
        has_left_hand = true,
        has_right_shoulder = true,
        has_right_hand = true,
        has_left_leg = true,
        has_left_foot = true,
        has_right_leg = MOUNT == "none" ? true : false,
        has_right_foot = MOUNT == "none" ? true : false,
        body_offset = BODY_OFFSET,
        hair_style = "long_pony_tail",
        hair_offset = HAIR_OFFSET,
        beard_style = "none",
        beard_offset = 0,
        has_hood = false,
        has_cape = true,
        has_earings = false,
        headwear = "none",
        face_covering = "none",
        shirt = "torso_plate_standard",
        waist = "waist_robe",
        left_arm_wearable = "left_arm_base",
        left_hand_wearable = "none",
        right_arm_wearable = "right_arm_base",
        right_hand_wearable = "none",
        left_leg_wearable = "none",
        left_foot_wearable = "left_foot_boot_low_standard",
        right_leg_wearable = "none",
        right_foot_wearable = MOUNT == "none" ? "right_foot_boot_low_standard" : "none",
        cape_offset = 0,
        clothing_offset = CLOTHING_OFFSET,
        wieldable_left_hand = HAS_BOW ? "large_bow" : "none",
        wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
        wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
        wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
        wieldable_right_hand = MAIN_HAND,
        wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
        wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
        wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
    );

    if (MOUNT != "none" && (MAIN_HAND == "large_spear" || MAIN_HAND == "large_halberd")) {
        WEAPON_HIDE_XYZ = [4, 14, 8];
        WEAPON_HIDE_TRANS = [5, -2, 0];

        translate(WEAPON_HIDE_TRANS) {
            cube(WEAPON_HIDE_XYZ);
        }
    }
}



if (MOUNT != "none") {
    mount_obj = MOUNT == "leopard" ?
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.0.0/fixtures/character_models/creatures/surface/standard/leopard_adult.json") :
        undef;

    MOUNT_TRANS = MOUNT == "leopard" ?
        [-3, -12, 0] :
        [0, 0, 0];

    translate(MOUNT_TRANS) {
        multi_layer_two_point_five_d(
            image_layers = [mount_obj],
            layer_offsets = [1],
            pixel_size = 1,
            center = false
        );
    }
}
