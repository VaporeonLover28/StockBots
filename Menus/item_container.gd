extends BoxContainer

var Item_loaded : Item_resource

func _ready() -> void:
	roll()
# Called when the node enters the scene tree for the first time.
func roll() -> void:
	Item_loaded = RoundCounter.current_item_pool.pick_random()
	if Item_loaded.Item_type == 1:
		$VBoxContainer/Item_sprite.texture = Item_loaded.weapon_sprite 
		$VBoxContainer/Item_sprite.scale = Vector2(3,3)
		$VBoxContainer/Item_name.text = Item_loaded.Item_name + ": Weapon"
		$VBoxContainer/Item_price.text = "Price: $" + str(Item_loaded.Price)
		$VBoxContainer/PanelContainer/Item_Label.text = Item_loaded.Description
	if Item_loaded.Item_type == 0:
		$VBoxContainer/Item_sprite.texture = Item_loaded.robo_image
		$VBoxContainer/Item_sprite.scale = Vector2(3, 3)
		$VBoxContainer/Item_name.text = Item_loaded.Item_name + ": Mode"
		$VBoxContainer/Item_price.text = "Price: $" + str(Item_loaded.Price)
		$VBoxContainer/PanelContainer/Item_Label.text = Item_loaded.Description
