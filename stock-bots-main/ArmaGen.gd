extends Sprite2D; class_name Weapon

#@export var weapon_resource: Resource
@onready var weapon_cooldown_timer = $weapon_cooldown_timer
@onready var bullet_spawn_marker = $bullet_spawn_marker
@export var weapon_resource: Weapon_resource
@onready var sniper = load("res://Weapons/sniper.tres")
@onready var bazuca = load("res://Weapons/bazuca.tres")
@onready var bullet = preload("res://bullet.tscn")
@onready var range:int
@onready var dano: int
@onready var weapon_cooldown : int
@onready var bullet_velocity: int
@onready var bullet_origin: int




# Called when the node enters the scene tree for the first time.
func _ready():
	if $"../".side == 0:
		weapon_resource = sniper
		bullet_origin = 0
	if $"../".side == 1:
		weapon_resource = bazuca
		bullet_origin = 1
		
	range = weapon_resource.weapon_range + $"../".mode.extra_range
	dano = weapon_resource.weapon_damage +  $"../".mode.extra_damage
	weapon_cooldown = weapon_resource.weapon_cooldown
	bullet_velocity = weapon_resource.bullet_velocity
		
	set_texture(weapon_resource.weapon_sprite)
	weapon_cooldown_timer.timeout.connect(funcao_weapon_cooldown)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $"../".current_life > 0:
		if weapon_cooldown_timer.time_left == 0:
			weapon_cooldown_timer.start(weapon_cooldown)
		
func funcao_weapon_cooldown():
	if $"../".current_life > 0:
		var instanciated_bullet = bullet.instantiate()
		instanciated_bullet.range = range
		instanciated_bullet.Vl = bullet_velocity
		instanciated_bullet.dano = dano
		instanciated_bullet.global_position =bullet_spawn_marker.global_position
		instanciated_bullet.origin = bullet_origin
		if self.flip_h == false:
			instanciated_bullet.Vl = instanciated_bullet.Vl * 1
		if self.flip_h == true:
			instanciated_bullet.Vl = instanciated_bullet.Vl * -1
		$"../../".add_child(instanciated_bullet)
		
