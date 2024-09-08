extends Camera2D

var Area_de_batalha
var distance: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"../".player_has_died == false and $"../".enemy_has_died == false:
		distance = abs(abs($"..".instantiated_enemy.global_position.x) - abs(($"..".instantiated_player.global_position.x)))/200
		position.x =  $"..".instantiated_player.global_position.x + 200
		zoom.x = abs(lerpf(zoom.x,distance, -0.07))
		zoom.y = abs(lerpf(zoom.y,distance, -0.07))
		zoom.x = clampf(zoom.x, 1, 2)
		zoom.y = clampf(zoom.y, 1, 2)
		
	if $"..".player_has_died == false and $"..".enemy_has_died == true:
		position.x =  $"..".instantiated_player.global_position.x
		zoom.x = 3
		zoom.y = 3
		
	if $"..".player_has_died == true and $"..".enemy_has_died == false:
		position.x =  $"..".instantiated_enemy.global_position.x
		zoom.x = 3
		zoom.y = 3
		
		
		
	
	
