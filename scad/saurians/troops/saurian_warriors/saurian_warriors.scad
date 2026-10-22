include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, halberd:Halberd, spear:Spear]

UPGRADE = "none"; // [none:None, sergeant:Sergeant, musician:Musician, banner:Banner]

VARIANT = 1; // [1, 2, 3]

module __Customizer_Limit__ () {}

VARIANTS = [
    ["none", "left_arm_plate_standard"],
    ["none", "none"],
    ["cape", "none"]
];

MAIN_HAND = WEAPON_LOADOUT == "halberd" ? "large_halberd" :
    WEAPON_LOADOUT == "spear" ? "large_spear" :
    "large_sword_stone";

MAIN_HAND_OFFSET = 0;

MAIN_HAND_XYZ = MAIN_HAND == "large_spear" ? [-13, 15, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_halberd" ? [-13, 15, MAIN_HAND_OFFSET] :
    [-13, 15, MAIN_HAND_OFFSET];

CAPE_OFFSET = 0;
BODY_OFFSET = 2;
CLOTHING_OFFSET = 3;

OFF_HAND_OFFSET = 5;

build_animal_people_standard(
    path_prefix = "../../fixtures/character_models/animal_people/regular/",
    prefix = "lizard_man_",
    body_offset = BODY_OFFSET,
    has_left_arm = true,
    has_right_arm = true,
    has_left_foot = true,
    has_right_foot = true,
    has_tail = true,
    wearables_path_prefix = "../../fixtures/character_models/animal_people/wearables_padded/",
    cape = VARIANTS[VARIANT - 1][0],
    cape_offset = CAPE_OFFSET,
    shirt = "none",
    left_arm_wearable = UPGRADE == "sergeant" ? "left_arm_plate_artifact" :
        VARIANTS[VARIANT - 1][1],
    right_arm_wearable = "none",
    clothing_offset = CLOTHING_OFFSET,
    wieldables_path_prefix = "../../fixtures/character_models/wieldables/wide/adult_",
    wieldable_left_hand = "none",
    wieldable_left_hand_x_offset = 0,
    wieldable_left_hand_y_offset = 0,
    wieldable_left_hand_z_offset = 0,
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
    pixel_size = 1,
);

if (UPGRADE == "banner" || UPGRADE == "musician") {
    OFF_HAND_OBJ = UPGRADE == "banner" ? import("../../../../fixtures/custom_wieldables/banner_worn_3.json") :
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/objects/instruments/instrument_9.json");

    OFF_HAND_XYZ = UPGRADE == "banner" ? [-12, 16, OFF_HAND_OFFSET] :
        [25, 21, 8];

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
