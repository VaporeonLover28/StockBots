extends CanvasLayer

@onready var item_container = $Item_container
@onready var item_container2 = $Item_container2
@onready var item_container3 = $Item_container3

var newest_weapon_reader : String
var oldest_weapon_reader : String
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if PlayerLoadout.newest_weapon == null:
		newest_weapon_reader = "null"
	else:
		newest_weapon_reader = PlayerLoadout.newest_weapon.Item_name
	if PlayerLoadout.oldest_weapon == null:
		oldest_weapon_reader = "null"
	else:
		oldest_weapon_reader = PlayerLoadout.oldest_weapon.Item_name
	
func _on_pass_upgrade_button_pressed() -> void:
	PlayerLoadout.times_passed_item =+ 1
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_item_choice_button_pressed() -> void:
	if PlayerLoadout.current_money >= item_container.Item_loaded.Price:
		if item_container.Item_loaded.Item_type == 1:
			if newest_weapon_reader == oldest_weapon_reader and newest_weapon_reader == item_container.Item_loaded.Item_name and PlayerLoadout.oldest_weapon_lv < 2:
				PlayerLoadout.newest_weapon_lv += 1
				PlayerLoadout.oldest_weapon = null
			else:
				PlayerLoadout.oldest_weapon = PlayerLoadout.newest_weapon
				PlayerLoadout.oldest_weapon_lv = PlayerLoadout.newest_weapon_lv
				PlayerLoadout.newest_weapon = item_container.Item_loaded
				PlayerLoadout.newest_weapon_lv = 1
		if item_container.Item_loaded.Item_type == 0:
			PlayerLoadout.current_mode = item_container.Item_loaded
		PlayerLoadout.current_money =  PlayerLoadout.current_money - item_container.Item_loaded.Price
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_item_choice_button_2_pressed() -> void:
	if PlayerLoadout.current_money >= item_container2.Item_loaded.Price:
		if newest_weapon_reader == oldest_weapon_reader and newest_weapon_reader == item_container2.Item_loaded.Item_name and PlayerLoadout.oldest_weapon_lv < 2:
			PlayerLoadout.newest_weapon_lv += 1
			PlayerLoadout.oldest_weapon = null
		else:
			PlayerLoadout.oldest_weapon = PlayerLoadout.newest_weapon
			PlayerLoadout.oldest_weapon_lv = PlayerLoadout.newest_weapon_lv
			PlayerLoadout.newest_weapon = item_container2.Item_loaded
			PlayerLoadout.newest_weapon_lv = 1
		if item_container2.Item_loaded.Item_type == 0:
			PlayerLoadout.current_mode = item_container2.Item_loaded
		PlayerLoadout.current_money =  PlayerLoadout.current_money - item_container2.Item_loaded.Price
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_item_choice_button_3_pressed() -> void:
	if PlayerLoadout.current_money >= item_container3.Item_loaded.Price:
		if newest_weapon_reader == oldest_weapon_reader and newest_weapon_reader == item_container3.Item_loaded.Item_name and PlayerLoadout.oldest_weapon_lv < 2:
			PlayerLoadout.newest_weapon_lv += 1
			PlayerLoadout.oldest_weapon = null
		else:
			PlayerLoadout.oldest_weapon = PlayerLoadout.newest_weapon
			PlayerLoadout.oldest_weapon_lv = PlayerLoadout.newest_weapon_lv
			PlayerLoadout.newest_weapon = item_container3.Item_loaded
			PlayerLoadout.newest_weapon_lv = 1
		if item_container3.Item_loaded.Item_type == 0:
			PlayerLoadout.current_mode = item_container3.Item_loaded
		PlayerLoadout.current_money =  PlayerLoadout.current_money - item_container3.Item_loaded.Price
		get_tree().change_scene_to_file("res://Area_Batalha.tscn")
		
