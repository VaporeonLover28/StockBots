extends CharacterBody2D; class_name Robots
#status basícos do robô
@export_category("Stats")
@export_enum ("player","enemy") var side : int
@export var mode : Mode
@onready var max_life = 100 + mode.extra_life 
@onready var current_life = max_life
@onready var VL = 3 + mode.extra_VL
@onready var maxVL = 100 + mode.extra_VL * 25
var battle_started = false
enum{Go_back, Go_front, Go_wait, Go_runF, Go_runB, Go_slowF ,Go_slowB}
var agressive_state = Go_front
var probabilitiy_caculetor : int
@onready var probability_GB = mode.mode_probability_GB
@onready var probability_GF = mode.mode_probability_GF
@onready var probability_GW = mode.mode_probability_GW
@onready var probability_GRF = mode.mode_probability_GRF
@onready var probability_GRB = mode.mode_probability_GRB
@onready var probability_GSF = mode.mode_probability_GSF
@onready var probability_GSB = mode.mode_probability_GSB
var change_to_GB : bool
var change_to_GF : bool
var change_to_GW : bool
var change_to_GRF : bool
var change_to_GSF : bool
var change_to_GRB : bool
var change_to_GSB : bool
var dir: int
#itens
@onready var weapon1 = preload("res://arma_gen.tscn")
var instanciated_weapon1 
var weapon2
#varíaveis de comando
@onready var robot_collision = $robot_collision
@onready var robot_hurtbox = $robot_hurtbox
@onready var robot_anim = $robot_anim
@onready var timer_chage_agst = $timer_chageAGST
@onready var weapon_marker1 = $Weapon_marker1
@onready var timer_start_battle = $timer_start_battle

func _ready():
	#conectando sinais
	timer_chage_agst.timeout.connect(change_agst)
	timer_start_battle.timeout.connect(start_fight)
	#adicionando arma ao robô
	instanciated_weapon1 = weapon1.instantiate()
	add_child(instanciated_weapon1)
	#decidindo lados dos robos
	if side == 0:
		dir = 1
		robot_anim.flip_h = false
		instanciated_weapon1.flip_h = false
	else:
		dir = -1
		robot_anim.flip_h = true
		instanciated_weapon1.flip_h = true
		
func _physics_process(delta):
	
	instanciated_weapon1.global_position = weapon_marker1.global_position
	
	#if current_life <= 0:
		#self.visible = false
		
	#statemachime pra movimentação
	if battle_started == true:
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
				
		move_and_slide()
func funcao_go_back():
	velocity.x -= VL * dir
	if velocity.x <= -maxVL:
		velocity.x = -maxVL
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
	if velocity.x >= maxVL:
		velocity.x = maxVL
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
	if velocity.x >= maxVL * 1.5:
		velocity.x = maxVL * 1.5
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
	velocity.x += VL / 1.5 * dir
	if velocity.x >= maxVL / 1.5:
		velocity.x = maxVL / 1.5
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
	velocity.x -= VL * 1.5 * dir
	if velocity.x <= -maxVL * 1.5:
		velocity.x = -maxVL * 1.5
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
	velocity.x -= VL / 1.5 * dir
	if velocity.x <= -maxVL :
		velocity.x = -maxVL
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
	
func change_agst():
	#randomizando proxímo estado
	probabilitiy_caculetor = round(13 * randf()) + 1
	change_to_GB = probability_GB.has(probabilitiy_caculetor)
	change_to_GF = probability_GF.has(probabilitiy_caculetor)
	change_to_GW = probability_GW.has(probabilitiy_caculetor)
	change_to_GRF = probability_GRF.has(probabilitiy_caculetor)
	change_to_GSF = probability_GSF.has(probabilitiy_caculetor)
	change_to_GRB = probability_GRB.has(probabilitiy_caculetor)
	change_to_GSB = probability_GSB.has(probabilitiy_caculetor)
	
