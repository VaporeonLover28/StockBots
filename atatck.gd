extends Area2D


@onready var attack: Area2D = $"."
@onready var dano : int
@onready var knockback : int
@onready var origin : int
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	animated_sprite_2d.play("attack_anim")
	self.z_index = 0
	attack.area_entered.connect(on_hit)
	animated_sprite_2d.animation_finished.connect(when_anim_finished)
	if origin == 0:
		$"../../../boomPlayer".playing = true
		self.scale.x *= 1
	if origin == 1:
		$"../../../boomEnemy".playing = true
		self.scale.x *= -1
		
	
	print("to aqui, ataque")
func on_hit(area):
	print("bati")
	if area.is_in_group("Player_type_hurtbox") and origin != 0:
		$"../../../".instantiated_player.current_life -= dano
		$"../../../".instantiated_player.velocity.x -= knockback
		$"../../../PlayerHurtStream".playing = true
		print("acertei")
		
	if area.is_in_group("Enemy_type_hurtbox") and origin != 1:
		$"../../../".instantiated_enemy.current_life -= dano
		$"../../../".instantiated_enemy.velocity.x += knockback
		$"../../../EnemyHurtStream".playing = true
		print("acertei")
		
func when_anim_finished():
	self.queue_free()
