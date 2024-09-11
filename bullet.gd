extends Area2D

@onready var bullet: Area2D = $"."
var distance_traveled: int
@onready var Vl : int
@onready var dano : int
@onready var range : int
@onready var origin : int

func _ready():

	bullet.area_entered.connect(on_hit)
	if Vl > 0:
		$"../boomPlayer".playing = true
		self.scale.x = 1 
	if Vl < 0:
		$"../boomEnemy".playing = true
		self.scale.x = -1

func _process(_delta):
	global_position.x += Vl
	distance_traveled += Vl
	
	if global_position.x <= 0 or global_position.x >= 1158:
		self.queue_free()
	if distance_traveled < range * -1 or distance_traveled > range:
		self.queue_free()
		
func on_hit(area):
	if area.is_in_group("Player_type_hurtbox") and origin != 0:
		$"../".instantiated_player.current_life -= dano
		$"../PlayerHurtStream".playing = true
		self.queue_free()
	if area.is_in_group("Enemy_type_hurtbox") and origin != 1:
		$"../".instantiated_enemy.current_life -= dano
		$"../EnemyHurtStream".playing = true
		self.queue_free()
