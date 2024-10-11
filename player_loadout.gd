extends Node

var player_round_life = 3
@export var all_weapons : Array[Weapon_resource]
var newest_weapon : Weapon_resource
var oldest_weapon : Weapon_resource
var current_mode : Mode_resource
var times_passed_item : int
