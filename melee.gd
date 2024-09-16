extends Area2D

@onready var coll = $MeleeColl
@onready var dano: int
@onready var knockback : int
@onready var origin : int
@onready var attack_separation_time : float
# Called when the node enters the scene tree for the first time.

	
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player_type_hurtbox") and origin == 1:
		$"../../../".instantiated_player.current_life -= dano
		$"../../../".instantiated_player.velocity.x -= knockback
		$"../../../".instantiated_player.velocity.y -= knockback
		$"../../../PlayerHurtStream".playing = true
	if area.is_in_group("Enemy_type_hurtbox") and origin == 0:
		$"../../../".instantiated_enemy.current_life -= dano
		$"../../../".instantiated_enemy.velocity.x += knockback
		$"../../../".instantiated_enemy.velocity.y -= knockback
		$"../../../EnemyHurtStream".playing = true


func _on_animated_sprite_2d_animation_finished() -> void:
	$MeleeColl.disabled = true
	$AnimatedSprite2D.visible = false
