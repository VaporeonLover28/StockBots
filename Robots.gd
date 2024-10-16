extends CharacterBody2D; class_name Robots
#status basícos do robô
@export_category("Stats")
@export_enum ("player","enemy") var side : int
@onready var mode : Mode_resource
@onready var max_life : int
@onready var current_life : int
@onready var VL :int
@onready var maxVL : int
var battle_started = false
var process_game = false
enum{Go_back, Go_front, Go_wait, Go_runF, Go_runB, Go_slowF ,Go_slowB}
var agressive_state = Go_front
var probabilitiy_caculetor : int
@onready var probability_GB : Array[int]
@onready var probability_GF : Array[int]
@onready var probability_GW : Array[int]
@onready var probability_GRF : Array[int]
@onready var probability_GRB : Array[int]
@onready var probability_GSF : Array[int]
@onready var probability_GSB : Array[int]
var change_to_GB : bool
var change_to_GF : bool
var change_to_GW : bool
var change_to_GRF : bool
var change_to_GSF : bool
var change_to_GRB : bool
var change_to_GSB : bool
var dir: int

#itens
@onready var weapon = preload("res://arma_gen.tscn")
var instanciated_weapon1 
var instanciated_weapon2


#itens para inimigo
@onready var random_weapon1 : Weapon_resource
@onready var random_weapon2 : Weapon_resource
@onready var random_mode : Mode_resource

#varíaveis de comando
enum {no_hit, hurt}
var hurt_state = no_hit
@onready var robot_collision = $robot_collision
@onready var robot_hurtbox = $robot_hurtbox
@onready var robot_anim = $robot_anim
@onready var robot_player = $robot_player
#            TIMER_CHANGE_AGST
@onready var timer_chage_agst = $timer_chageAGST
@onready var weapon_marker1 = $Weapon_marker1
@onready var weapon_marker2 = $Weapon_marker2
@onready var timer_start_battle = $timer_start_battle
@onready var timer_hurt = $timer_hurt


func _ready():
	#conectando sinais
	timer_chage_agst.timeout.connect(change_agst)
	timer_start_battle.timeout.connect(start_fight)
	timer_hurt.timeout.connect(stop_hurt)
	
	#decidindo lados dos robos
	if side == 0:
		dir = 1
		robot_anim.flip_h = false
		mode = PlayerLoadout.current_mode
		if PlayerLoadout.newest_weapon != null:
			instanciated_weapon1 = weapon.instantiate()
			instanciated_weapon1.weapon_resource = PlayerLoadout.newest_weapon
			add_child(instanciated_weapon1)
			instanciated_weapon1.arma_gen_sprite.flip_h = false
			
		if PlayerLoadout.oldest_weapon != null:
			instanciated_weapon2 = weapon.instantiate()
			instanciated_weapon2.z_index = -1
			instanciated_weapon2.weapon_resource = PlayerLoadout.oldest_weapon
			add_child(instanciated_weapon2)
			instanciated_weapon2.arma_gen_sprite.flip_h = false
		
		max_life = (100 + mode.extra_life) + (10 * PlayerLoadout.times_passed_item)
	if side == 1:
		dir = -1
		robot_anim.flip_h = true
		if RoundCounter.rounds == 0:
			mode = load("res://Modes/basic.tres")
		if RoundCounter.rounds >= 1:
			random_mode = RoundCounter.current_item_modes.pick_random()
			mode = random_mode
		instanciated_weapon1 = weapon.instantiate()
		random_weapon1 = RoundCounter.current_item_weapons.pick_random()
		instanciated_weapon1.weapon_resource = random_weapon1
		add_child(instanciated_weapon1)
		instanciated_weapon1.arma_gen_sprite.flip_h = true
		if RoundCounter.rounds >= 2:
			instanciated_weapon2 = weapon.instantiate()
			random_weapon2 = RoundCounter.current_item_weapons.pick_random()
			instanciated_weapon2.z_index = -1
			instanciated_weapon2.weapon_resource = random_weapon2
			add_child(instanciated_weapon2)
			instanciated_weapon2.arma_gen_sprite.flip_h = true
			
		if RoundCounter.rounds == 0:
			max_life = 60
		if RoundCounter.rounds == 1:
			max_life = 80
		if RoundCounter.rounds > 1:
			max_life = 100 + mode.extra_life + 10 * (RoundCounter.rounds -2)
	
	current_life = max_life
	VL = 4 + mode.extra_VL
	maxVL = (4 + mode.extra_VL) * 15
	probability_GB = mode.mode_probability_GB
	probability_GF = mode.mode_probability_GF
	probability_GW = mode.mode_probability_GW
	probability_GRF = mode.mode_probability_GRF
	probability_GRB = mode.mode_probability_GRB
	probability_GSF = mode.mode_probability_GSF
	probability_GSB = mode.mode_probability_GSB

func _physics_process(delta):
	
	#print(str(self.name) + "velocity = " + str(maxVL))
	
	if process_game == true:
		if not is_on_floor():
			velocity.y += 350 * delta
		
		if instanciated_weapon1 != null:
			instanciated_weapon1.global_position = weapon_marker1.global_position
		if instanciated_weapon2 != null:
			instanciated_weapon2.global_position = weapon_marker2.global_position
		
		#if current_life <= 0:
			#self.visible = false
			
		#statemachime pra movimentação
		if battle_started == true and process_game:
			#statemachime pra movimentação
			match agressive_state:
				Go_back:
					funcao_go_back()
				Go_front:
					funcao_go_front()
				Go_wait:
					funcao_go_wait()
				Go_runF:
					funcao_go_runF()
				Go_slowF:
					funcao_go_slowF()
				Go_runB:
					funcao_go_runB()
				Go_slowB:
					funcao_go_slowB()
					
			match hurt_state:
				no_hit:
					funcao_no_hit()
				hurt:
					funcao_hurt()
					
			move_and_slide()
func funcao_go_back():
	velocity.x -= VL * dir
	if velocity.x * dir <= -maxVL :
		velocity.x = -maxVL * dir
	if change_to_GF == true:
		agressive_state = Go_front
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GRF == true:
		agressive_state = Go_runF
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GRB == true:
		agressive_state = Go_runB
	if change_to_GSB == true:
		agressive_state = Go_slowB
func funcao_go_front():
	velocity.x += VL * dir
	if velocity.x * dir >= maxVL:
		velocity.x = maxVL * dir
	if change_to_GB == true:
		agressive_state = Go_back
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GRF == true:
		agressive_state = Go_runF
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GRB == true:
		agressive_state = Go_runB
	if change_to_GSB == true:
		agressive_state = Go_slowB
func funcao_go_wait():
	velocity.x = 0
	if change_to_GB == true:
		agressive_state = Go_back
	if change_to_GF == true:
		agressive_state = Go_front
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GRF == true:
		agressive_state = Go_runF
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GRB == true:
		agressive_state = Go_runB
	if change_to_GSB == true:
		agressive_state = Go_slowB

func funcao_go_runF(): 
	velocity.x += VL * 1.5 * dir
	if velocity.x * dir >= maxVL * 1.5:
		velocity.x = maxVL * 1.5 * dir
	if change_to_GB == true:
		agressive_state = Go_back
	if change_to_GF == true:
		agressive_state = Go_front
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GRB == true:
		agressive_state = Go_runB
	if change_to_GSB == true:
		agressive_state = Go_slowB
func funcao_go_slowF(): 
	velocity.x += VL * 0.5 
	if velocity.x * dir >= maxVL * 0.5:
		velocity.x = maxVL * 0.5 * dir
	if change_to_GB == true:
		agressive_state = Go_back
	if change_to_GF == true:
		agressive_state = Go_front
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GRF == true:
		agressive_state = Go_runF
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GRB == true:
		agressive_state = Go_runB
	if change_to_GSB == true:
		agressive_state = Go_slowB
func funcao_go_runB():
	velocity.x -= VL * 1.5
	if velocity.x * dir <= -maxVL * 1.5:
		velocity.x = -maxVL * 1.5 * dir
	if change_to_GB == true:
		agressive_state = Go_back
	if change_to_GF == true:
		agressive_state = Go_front
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GRF == true:
		agressive_state = Go_runF
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GSB == true:
		agressive_state = Go_slowB
func funcao_go_slowB():
	velocity.x -= VL * 0.5 * dir
	if velocity.x * dir <= -maxVL * 0.5:
		velocity.x = -maxVL * 0.5 * dir
	if change_to_GB == true:
		agressive_state = Go_back
	if change_to_GF == true:
		agressive_state = Go_front
	if change_to_GW == true:
		agressive_state = Go_wait
	if change_to_GRF == true:
		agressive_state = Go_runF
	if change_to_GSF == true:
		agressive_state = Go_slowF
	if change_to_GRB == true:
		agressive_state = Go_runB

func start_fight():
	battle_started = true
	process_game = true
	
func funcao_no_hit():
	if velocity.x == 0:
		robot_player.play("idle")
	elif velocity.x <= 100 and velocity.x >= -100 and velocity.x != 0:
		robot_player.play("walk")
	elif velocity.x > 100  or velocity.x < -100:
		robot_player.play("run")
	
func _on_robot_hurtbox_area_entered(area: Area2D) -> void:
	if process_game:
		if area.is_in_group("bullet_type_hurtbox") and area.origin != side and hurt_state != hurt:
			hurt_state = hurt
	
func funcao_hurt():
	if process_game:
		robot_player.play("hurt")
		if timer_hurt.is_stopped() == true:
			timer_hurt.start()
	
func stop_hurt():
	if process_game:
		hurt_state = no_hit
		timer_hurt.stop()
		
func change_agst():
	if process_game:
		#randomizando proxímo estado
		probabilitiy_caculetor = round(13 * randf()) + 1
		#                                 PROBABILITY CALCULATOR
		change_to_GB = probability_GB.has(probabilitiy_caculetor)
		change_to_GF = probability_GF.has(probabilitiy_caculetor)
		change_to_GW = probability_GW.has(probabilitiy_caculetor)
		change_to_GRF = probability_GRF.has(probabilitiy_caculetor)
		change_to_GSF = probability_GSF.has(probabilitiy_caculetor)
		change_to_GRB = probability_GRB.has(probabilitiy_caculetor)
		change_to_GSB = probability_GSB.has(probabilitiy_caculetor)
	
