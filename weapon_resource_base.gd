extends Item_resource; class_name Weapon_resource;

@export_category("Weapon stats")
@export var weapon_sprite : Texture2D
@export_enum("melee", "ranged") var weapon_type : String
@export var weapon_damage : int
@export var weapon_range : int
@export var weapon_knockback : int
@export var weapon_cooldown : int
@export var bullet_amount : int
@export var bullet_separation_time : float
@export var bullet_velocity : int
