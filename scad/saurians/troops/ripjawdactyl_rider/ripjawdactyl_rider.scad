include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>
include <../../../lib/extinct_creature_mod.scad>

WEAPON_LOADOUT = "default"; // [default:Default, javelin:Javelin, fire_bolas:Fire Bolas]

UPGRADE = "none"; // [none:None, sergeant:Sergeant, musician:Musician, banner:Banner]

module __Customizer_Limit__ () {}

HAS_OFF_HAND_UPGRADE = UPGRADE == "banner" || UPGRADE == "musician";

MAIN_HAND = HAS_OFF_HAND_UPGRADE && WEAPON_LOADOUT == "javelin" ? "large_spear" :
    HAS_OFF_HAND_UPGRADE && WEAPON_LOADOUT == "fire_bolas" ? "large_whip" :
    "large_morningstar";

MAIN_HAND_OFFSET = 1;

MAIN_HAND_XYZ = MAIN_HAND == "large_spear" ? [-13, 15, MAIN_HAND_OFFSET] :
    MAIN_HAND == "fire_bolas" ? [-13, 15, MAIN_HAND_OFFSET] :
    [-12, 15, MAIN_HAND_OFFSET];

OFF_HAND = !HAS_OFF_HAND_UPGRADE && WEAPON_LOADOUT == "javelin" ? "large_spear" :
    !HAS_OFF_HAND_UPGRADE && WEAPON_LOADOUT == "fire_bolas" ? "large_whip" :
    "none";

OFF_HAND_OFFSET = 6;

OFF_HAND_XYZ = OFF_HAND == "large_spear" ? [-24, 18, OFF_HAND_OFFSET] :
    OFF_HAND == "large_whip" ? [-25, 17, OFF_HAND_OFFSET] :
    [0, 0, 0];

CAPE_OFFSET = 0;
BODY_OFFSET = 4;
CLOTHING_OFFSET = 5;

MOUNT_OFFSET = 0;

build_animal_people_standard(
    path_prefix = "../../fixtures/character_models/animal_people/regular/",
    prefix = "lizard_man_",
    body_offset = BODY_OFFSET,
    has_left_arm = true,
    has_right_arm = true,
    has_left_foot = true,
    has_right_foot = false,
    has_tail = true,
    wearables_path_prefix = "../../fixtures/character_models/animal_people/wearables_padded/",
    cape = "none",
    cape_offset = CAPE_OFFSET,
    shirt = "none",
    left_arm_wearable = UPGRADE == "sergeant" ? "left_arm_plate_artifact" :
        "left_arm_plate_standard",
    right_arm_wearable = "none",
    clothing_offset = CLOTHING_OFFSET,
    wieldables_path_prefix = "../../fixtures/character_models/wieldables/wide/adult_",
    wieldable_left_hand = OFF_HAND,
    wieldable_left_hand_x_offset = OFF_HAND_XYZ[0],
    wieldable_left_hand_y_offset = OFF_HAND_XYZ[1],
    wieldable_left_hand_z_offset = OFF_HAND_XYZ[2],
    wieldable_right_hand = MAIN_HAND,
    wieldable_right_hand_x_offset = MAIN_HAND_XYZ[0],
    wieldable_right_hand_y_offset = MAIN_HAND_XYZ[1],
    wieldable_right_hand_z_offset = MAIN_HAND_XYZ[2],
    pixel_size = 1,
);

if (UPGRADE == "banner" || UPGRADE == "musician") {
    OFF_HAND_OBJ = UPGRADE == "banner" ? import("../../../../fixtures/custom_wieldables/banner_worn_3.json") :
        import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/objects/instruments/instrument_9.json");

    OFF_HAND_XYZ = UPGRADE == "banner" ? [-13, 16, OFF_HAND_OFFSET] :
        [25, 21, 12];

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

translate([-8, -8, 0]) {
    mount_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/extinct/cretaceous_quetzalcoatlus.json");
    multi_layer_two_point_five_d(
        image_layers = [mount_obj],
        layer_offsets = [MOUNT_OFFSET],
        pixel_size = 1,
        center = false
    );
}
