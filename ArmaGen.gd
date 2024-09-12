extends Sprite2D; class_name Weapon

#@export var weapon_resource: Resource
@onready var weapon_cooldown_timer = $weapon_cooldown_timer
@onready var bullet_spawn_marker = $bullet_spawn_marker
@onready var attack_spawn_marker = $attack_spawn_marker
@export var weapon_resource: Weapon_resource
@onready var bullet = preload("res://bullet.tscn")
@onready var attack = preload("res://atatck.tscn")
@onready var range = weapon_resource.weapon_range + $"../".mode.extra_range
@onready var dano = weapon_resource.weapon_damage +  $"../".mode.extra_damage
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
	if $"../".side == 1:
		flip_h = true
		bullet_origin = 1
		
	
	set_texture(weapon_resource.weapon_sprite)
	weapon_cooldown_timer.timeout.connect(funcao_weapon_cooldown)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if weapon_cooldown_timer.time_left == 0:
		weapon_cooldown_timer.start(weapon_cooldown)
		
func funcao_weapon_cooldown():
	for bullet_count in range(bullet_amount):
		if weapon_resource.weapon_type == "melee":
			var instanciated_attack = attack.instantiate()
			print(instanciated_attack)
			instanciated_attack.dano = dano
			instanciated_attack.knockback = weapon_knockback 
			instanciated_attack.global_position = attack_spawn_marker.global_position
			instanciated_attack.origin = bullet_origin
			add_child(instanciated_attack)
		if weapon_resource.weapon_type == "ranged":
			var instanciated_bullet = bullet.instantiate()
			instanciated_bullet.range = range
			instanciated_bullet.Vl = bullet_velocity
			instanciated_bullet.dano = dano
			instanciated_bullet.knockback = weapon_knockback 
			instanciated_bullet.global_position = bullet_spawn_marker.global_position
			instanciated_bullet.origin = bullet_origin
			if self.flip_h == false:
				instanciated_bullet.Vl = instanciated_bullet.Vl * 1
			if self.flip_h == true:
				instanciated_bullet.Vl = instanciated_bullet.Vl * -1
			$"../../".add_child(instanciated_bullet)
		await get_tree().create_timer(bullet_separation_time).timeout
