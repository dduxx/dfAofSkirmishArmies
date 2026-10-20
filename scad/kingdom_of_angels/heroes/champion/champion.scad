include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/scad/libs/creature.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, blessed_greatsword:Blessed Greatsword, heavy_halberd:Heavy Halberd, dual_heavy_hand_weapons:Dual Heavy Hand Weapons, heavy_lance:Heavy Lance, heavy_spear:Heavy Spear]
HAS_CROSSBOW = false;

MOUNT = "none"; // [none:None, horse:Horse, lion:Lion]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "blessed_greatsword" ? "large_sword_2h" :
    WEAPON_LOADOUT == "heavy_halberd" ? "large_halberd" :
    WEAPON_LOADOUT == "heavy_lance" ? "large_pike" :
    WEAPON_LOADOUT == "heavy_spear" ? "large_spear" :
    "large_maul";

OFF_HAND = WEAPON_LOADOUT == "dual_heavy_hand_weapons" ? "large_maul" :
    HAS_CROSSBOW ? "large_crossbow" :
    "shield_standard";

MAIN_HAND_OFFSET = MOUNT == "none" ? 0 : 1;
BODY_OFFSET = MOUNT == "none" ? 1 : 3;
CLOTHING_OFFSET = MOUNT == "none" ? 2 : 4;
CAPE_OFFSET = 0;
OFF_HAND_OFFSET = MOUNT == "none" ? 4 : 6;

MAIN_HAND_XYZ = MAIN_HAND == "large_sword_2h" ? [-33, -1, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_halberd" ? [-34, 0, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_pike" ? [-34, 0, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_spear" ? [-34, -1, MAIN_HAND_OFFSET] :
    [-33, -2, MAIN_HAND_OFFSET];

OFF_HAND_XYZ = OFF_HAND == "shield_standard" ?
    [0, 0, OFF_HAND_OFFSET] :
    OFF_HAND == "large_maul" ? [-32, -2, OFF_HAND_OFFSET] :
    [-32, -1, OFF_HAND_OFFSET];

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
        gender = "m",
        head = 2,
        has_left_shoulder = true,
        has_left_hand = true,
        has_right_shoulder = true,
        has_right_hand = true,
        has_left_leg = true,
        has_left_foot = true,
        has_right_leg = MOUNT == "none" ? true : false,
        has_right_foot = MOUNT == "none" ? true : false,
        body_offset = BODY_OFFSET,
        hair_style = "none",
        hair_offset = 0,
        beard_style = "none",
        beard_offset = 0,
        has_hood = false,
        has_cape = true,
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
        right_leg_wearable = MOUNT == "none" ? "right_leg_greaves_artifact" : "none",
        right_foot_wearable = MOUNT == "none" ? "right_foot_boot_high_artifact" : "none",
        cape_offset = CAPE_OFFSET,
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

    if (
        MOUNT != "none" &&
            (
                MAIN_HAND == "large_spear" ||
                MAIN_HAND == "large_halberd" ||
                MAIN_HAND == "large_pike"
            )
    ) {
        WEAPON_HIDE_XYZ = [3, 15, 8];
        WEAPON_HIDE_TRANS = [3, -2, 0];

        translate(WEAPON_HIDE_TRANS) {
            cube(WEAPON_HIDE_XYZ);
        }
    }
}

if (MOUNT != "none") {
    mount_obj = MOUNT == "horse" ?
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/creatures/domestic/burden/horse.json") :
        MOUNT == "lion" ? import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/creatures/surface/gendered/lion_male.json") :
        undef;

    saddle_obj = MOUNT == "horse" ?
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/creatures/domestic/burden/horse_saddle_1.json") :
        MOUNT == "lion" ? import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.0/fixtures/character_models/creatures/domestic/burden/water_buffalo_saddle_1.json") :
        undef;

    MOUNT_TRANS = MOUNT == "horse" ?
        [-5, -12, 0] :
        MOUNT == "lion" ? [-6, -12, 0] :
        [0, 0, 0];

    translate(MOUNT_TRANS) {
        multi_layer_two_point_five_d(
            image_layers = [mount_obj, saddle_obj],
            layer_offsets = [1, 2],
            pixel_size = 1,
            center = false
        );
    }
}
