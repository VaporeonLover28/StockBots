extends Item_resource; class_name Weapon_resource;

@export_category("Weapon stats")
@export var weapon_sprite : Texture2D
@export_enum("melee", "ranged") var weapon_type : String
@export var type_bullet : String
@export var weapon_damage : int
@export var weapon_range : int
@export var weapon_cooldown : int
@export var bullet_velocity : int
