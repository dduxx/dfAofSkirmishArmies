include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>
include <../../../lib/extinct_creature_mod.scad>

WEAPON_LOADOUT = "default"; // [default:Default, dual_hand_weapons:Dual Hand Weapons, lance:Heavy Lance]

ADDITIONAL_WEAPON = "none"; // [none:None, champion_fire_bolas:Champion Fire Bolas, champion_javelin:Champion Javelin, champion_blowpipe:Champion Blowpipe]

MOUNT = "none"; // [none:None, deinonychus:Deinonychus, pterodactyl:Pterodactyl, ripjawdactyl:Ripjawdactyl]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "lance" ? "large_pike" :
    "large_mace";

MAIN_HAND_OFFSET = MOUNT == "none" ? 0 : 2;

MAIN_HAND_XYZ = MAIN_HAND == "large_pike" ? [-13, 15, MAIN_HAND_OFFSET] :
    [-13, 15, MAIN_HAND_OFFSET];

OFF_HAND = ADDITIONAL_WEAPON == "champion_fire_bolas" ? "large_whip" :
    ADDITIONAL_WEAPON == "champion_javelin" ? "large_spear" :
    ADDITIONAL_WEAPON == "champion_blowpipe" ? "large_blowgun" :
    WEAPON_LOADOUT == "dual_hand_weapons" ? "large_mace" :
    "none";

OFF_HAND_OFFSET = MOUNT == "none" ? 5 : 7;

OFF_HAND_XYZ = OFF_HAND == "large_whip" ? [-20, 18, OFF_HAND_OFFSET] :
    OFF_HAND == "large_spear" ? [-20, 18, OFF_HAND_OFFSET] :
    OFF_HAND == "large_blowgun" ? [-20, 18, OFF_HAND_OFFSET] :
    [-20, 18, OFF_HAND_OFFSET];


CAPE_OFFSET = 0;
BODY_OFFSET = MOUNT == "none" ? 2 : 4;
CLOTHING_OFFSET = MOUNT == "none" ? 3 : 5;
BODY_SCALE = 1.15;

MOUNT_OFFSET = 0;

scale([BODY_SCALE, BODY_SCALE, 1]) {
    build_animal_people_standard(
        path_prefix = "../../fixtures/character_models/animal_people/regular/",
        prefix = "leopard_gecko_man_",
        body_offset = BODY_OFFSET,
        has_left_arm = true,
        has_right_arm = true,
        has_left_foot = true,
        has_right_foot = MOUNT == "none",
        has_tail = true,
        wearables_path_prefix = "../../fixtures/character_models/animal_people/wearables_padded/",
        cape = "none",
        cape_offset = CAPE_OFFSET,
        shirt = "torso_plate_artifact",
        left_arm_wearable = "left_arm_plate_artifact",
        right_arm_wearable = "right_arm_plate_artifact",
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
}

if (MOUNT == "deinonychus") {
    mount_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/extinct/cretaceous_nothronychus.json");
    translate([23, 31, 0]) {
        rotate([0, 0, 25]) {
            multi_layer_two_point_five_d(
                image_layers = [mount_obj],
                layer_offsets = [MOUNT_OFFSET],
                pixel_size = 1,
                center = true
            );
        }
    }
} else if (MOUNT == "ripjawdactyl") {
    mount_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/extinct/cretaceous_quetzalcoatlus.json");
    translate([-2, -4, 0]) {
            multi_layer_two_point_five_d(
                image_layers = [mount_obj],
                layer_offsets = [MOUNT_OFFSET],
                pixel_size = 1,
                center = false
            );
    }
} else if (MOUNT == "pterodactyl") {
    translate([-2, -4, 0]) {
        hornless_quetzalcoatlus(z_offset = MOUNT_OFFSET);
    }
}
