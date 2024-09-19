extends CanvasLayer

@onready var item_container = $Item_container
@onready var item_container2 = $Item_container2
@onready var item_container3 = $Item_container3
# Called when the node enters the scene tree for the first time.

func _on_pass_upgrade_button_pressed() -> void:
	PlayerLoadout.times_passed_item =+ 1
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_item_choice_button_pressed() -> void:
	if item_container.Item_loaded.Item_type == 1:
		PlayerLoadout.oldest_weapon = PlayerLoadout.newest_weapon
		PlayerLoadout.newest_weapon = item_container.Item_loaded
	if item_container.Item_loaded.Item_type == 0:
		PlayerLoadout.current_mode = item_container.Item_loaded
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")

func _on_item_choice_button_2_pressed() -> void:
	if item_container2.Item_loaded.Item_type == 1:
		PlayerLoadout.oldest_weapon = PlayerLoadout.newest_weapon
		PlayerLoadout.newest_weapon = item_container2.Item_loaded
	if item_container2.Item_loaded.Item_type == 0:
		PlayerLoadout.current_mode = item_container2.Item_loaded
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")


func _on_item_choice_button_3_pressed() -> void:
	if item_container3.Item_loaded.Item_type == 1:
		PlayerLoadout.oldest_weapon = PlayerLoadout.newest_weapon
		PlayerLoadout.newest_weapon = item_container3.Item_loaded
	if item_container3.Item_loaded.Item_type == 0:
		PlayerLoadout.current_mode = item_container3.Item_loaded
		
	print(item_container3.Item_loaded.Item_name)
	get_tree().change_scene_to_file("res://Area_Batalha.tscn")
