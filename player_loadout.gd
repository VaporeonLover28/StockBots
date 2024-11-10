extends Node

var player_round_life = 3
@export var all_weapons : Array[Weapon_resource]
var newest_weapon : Weapon_resource
var newest_weapon_lv : int = 1
var oldest_weapon : Weapon_resource
var oldest_weapon_lv : int = 1
var current_mode : Mode_resource
var current_money : int
var times_passed_item : int
