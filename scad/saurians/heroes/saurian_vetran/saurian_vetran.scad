include <../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/scad/libs/animal_people.scad>
include <../../../../dependencies/dduxx:twoPointFiveD:v1.0.0/scad/main.scad>

WEAPON_LOADOUT = "default"; // [default:Default, obsidian_great_weapon:Obsidian Great Weapon, heavy_halberd:Heavy Halberd, great_weapon:Great Weapon, dual_heavy_hand_weapons:Dual Heavy Hand Weapons, heavy_lance:Heavy Lance, heavy_spear:Heavy Spear]

MOUNT = "none"; // [none:None, raptor:Raptor]

module __Customizer_Limit__ () {}

MAIN_HAND = WEAPON_LOADOUT == "obsidian_great_weapon" ? "large_sword_stone" :
    WEAPON_LOADOUT == "heavy_halberd" ? "large_halberd" :
    WEAPON_LOADOUT == "great_weapon" ? "large_axe_battle" :
    WEAPON_LOADOUT == "heavy_lance" ? "large_pike" :
    WEAPON_LOADOUT == "heavy_spear" ? "large_spear" :
    "large_mace";

MAIN_HAND_OFFSET = MOUNT == "none" ? 0 : 1;

MAIN_HAND_XYZ = MAIN_HAND == "large_sword_stone" ? [-14, 15, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_halberd" ? [-13, 15, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_axe_battle" ? [-13, 15, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_pike" ? [-13, 15, MAIN_HAND_OFFSET] :
    MAIN_HAND == "large_spear" ? [-13, 15, MAIN_HAND_OFFSET] :
    [-13, 15, MAIN_HAND_OFFSET];

OFF_HAND = WEAPON_LOADOUT == "dual_heavy_hand_weapons" ? "large_mace" : "none";

OFF_HAND_OFFSET = MOUNT == "none" ? 5 : 6;

OFF_HAND_XYZ = [-20, 18, 5];


CAPE_OFFSET = 0;
BODY_OFFSET = MOUNT == "none" ? 2 : 3;
CLOTHING_OFFSET = MOUNT == "none" ? 3 : 4;
BODY_SCALE = 1.15;

MOUNT_OFFSET = 1;

scale([BODY_SCALE, BODY_SCALE, 1]) {
    build_animal_people_standard(
        path_prefix = "../../fixtures/character_models/animal_people/regular/",
        prefix = "lizard_man_",
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

if (MOUNT == "raptor") {
    mount_obj = import("../../../../dependencies/dduxx:dfCharacterBuilder:v2.2.1/fixtures/character_models/creatures/extinct/cretaceous_utahraptor.json");
    translate([-10, 0, 0]) {
        multi_layer_two_point_five_d(
            image_layers = [mount_obj],
            layer_offsets = [MOUNT_OFFSET],
            pixel_size = 1,
            center = false
        );
    }
}
