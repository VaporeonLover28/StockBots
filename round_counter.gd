extends Node

var rounds : int = 0 : set = _item_pool
var reroll_price : int = 1
var winmoneyindicator : int
var timeswon = 0
@export var mode_rarity_1 : Array[Mode_resource]
@export var mode_rarity_2 : Array[Mode_resource]
@export var mode_rarity_3 : Array[Mode_resource]
@export var weapon_rarity_1 : Array[Weapon_resource]
@export var weapon_rarity_2 : Array[Weapon_resource]
@export var weapon_rarity_3 : Array[Weapon_resource]
@export var weapon_rarity_4 : Array[Weapon_resource]
var current_item_modes : Array[Mode_resource]
var current_item_weapons : Array[Weapon_resource]
var current_item_pool : Array

func _process(delta: float) -> void:
	winmoneyindicator = round(4 * (RoundCounter.rounds - 1)/2)
	
	if Input.is_action_just_pressed("time"):
		if Engine.time_scale == 1:
			Engine.time_scale = 1.75
		elif Engine.time_scale == 1.75:
			Engine.time_scale = 5
		elif Engine.time_scale == 5:
			Engine.time_scale = 1

func _item_pool(round):
	rounds = round
	current_item_modes.clear()
	current_item_weapons.clear()
	current_item_pool.clear()
	if rounds >= 0 and rounds < 4:
		current_item_weapons.append_array(weapon_rarity_1)
		current_item_modes.append_array(mode_rarity_1)
	if rounds >= 2 :
		current_item_weapons.append_array(weapon_rarity_2)
	if rounds >= 3:
		current_item_modes.append_array(mode_rarity_2)
	if rounds >= 4 :
		current_item_weapons.append_array(weapon_rarity_3)
	if rounds >= 5:
		current_item_modes.append_array(mode_rarity_3)
	if rounds >= 6 :
		current_item_weapons.append_array(weapon_rarity_4)
	
	current_item_pool.append_array(current_item_weapons)
	current_item_pool.append_array(current_item_modes)
