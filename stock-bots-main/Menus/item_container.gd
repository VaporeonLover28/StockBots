extends BoxContainer

@export var all_itens : Array[String]
@onready var item_loaded = load(all_itens.pick_random())
@onready var item_sprite: Sprite2D = $HBoxContainer/Item_sprite
@onready var item_name: Label = $HBoxContainer/Item_name
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
