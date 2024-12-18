extends Node; class_name Weapon

#@export var weapon_resource: Resource
@onready var weapon_cooldown_timer = $weapon_cooldown_timer
@onready var arma_gen_sprite = $ArmaGen_sprite
@onready var bullet_spawn_marker = $bullet_spawn_marker
@export var weapon_resource: Weapon_resource
var weapon_bonus_lv : float
@onready var bullet = preload("res://bullet.tscn")
@onready var range = weapon_resource.weapon_range * $"../".mode.extra_range
@onready var dano = weapon_resource.weapon_damage * $"../".mode.extra_damage
@onready var weapon_knockback = weapon_resource.weapon_knockback
@onready var weapon_cooldown = weapon_resource.weapon_cooldown
@onready var bullet_velocity = weapon_resource.bullet_velocity
@onready var bullet_amount = weapon_resource.bullet_amount
@onready var bullet_separation_time = weapon_resource.bullet_separation_time
@onready var bullet_origin: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if $"../".side == 0:
		bullet_origin = 0
		if self.weapon_resource.weapon_type == "melee":
			$ArmaGen_sprite.rotation = 0
		if self.weapon_resource.weapon_type == "ranged":
			$ArmaGen_sprite.rotation = 0.79
	if $"../".side == 1:
		arma_gen_sprite.flip_h = true
		$Melee.scale.x *= -1
		bullet_origin = 1
		if self.weapon_resource.weapon_type == "melee":
			$ArmaGen_sprite.rotation = 0
		if self.weapon_resource.weapon_type == "ranged":
			$ArmaGen_sprite.rotation = -0.79
	
	$Melee.z_index = 0
	arma_gen_sprite.set_texture(weapon_resource.weapon_sprite)
	weapon_cooldown_timer.timeout.connect(funcao_weapon_cooldown)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if weapon_cooldown_timer.time_left == 0 and $"../".process_game == true:
		weapon_cooldown_timer.start(weapon_cooldown)
		
func funcao_weapon_cooldown():
	$weapon_cooldown_timer.stop()
	if $"../".process_game == true:
		for bullet_count in range(bullet_amount):
			if weapon_resource.weapon_type == "melee":
				$Melee.dano = dano * weapon_bonus_lv
				$Melee.knockback = weapon_knockback * weapon_bonus_lv
				$Melee.origin = bullet_origin
				$Melee.attack_separation_time = bullet_separation_time
				$Melee/MeleeColl.disabled = false
				$Melee/AnimatedSprite2D.visible = true
				$Melee/AnimatedSprite2D.play("attack_anim", bullet_separation_time + 0.8)
			if weapon_resource.weapon_type == "ranged":
				var instanciated_bullet = bullet.instantiate()
				instanciated_bullet.range = range
				if arma_gen_sprite.flip_h == false:
					if self.get_parent().velocity.x >= 1:
						instanciated_bullet.Vl = bullet_velocity + (self.get_parent().velocity.x / 100)
					else:
						instanciated_bullet.Vl = bullet_velocity
				if arma_gen_sprite.flip_h == true:
					if self.get_parent().velocity.x <= 1:
						instanciated_bullet.Vl = bullet_velocity - (self.get_parent().velocity.x / 100)
					else:
						instanciated_bullet.Vl = bullet_velocity
				instanciated_bullet.dano = dano * weapon_bonus_lv
				instanciated_bullet.knockback = weapon_knockback * weapon_bonus_lv
				instanciated_bullet.global_position = bullet_spawn_marker.global_position
				instanciated_bullet.origin = bullet_origin
				if arma_gen_sprite.flip_h == false:
					instanciated_bullet.Vl = instanciated_bullet.Vl * 1
				if arma_gen_sprite.flip_h == true:
					instanciated_bullet.Vl = instanciated_bullet.Vl * -1
				$"../../".add_child(instanciated_bullet)
			
			$anim.play(str(get_parent().name) + str(weapon_resource.weapon_type))
			await get_tree().create_timer(bullet_separation_time).timeout
	$weapon_cooldown_timer.start()
