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
@export var weapons_itens : Array[Weapon_resource]
@export var modes_itens : Array[Mode_resource]
@onready var random_weapon1 : Weapon_resource
@onready var random_weapon2 : Weapon_resource
@onready var random_mode : Mode_resource

#varíaveis de comando
@onready var robot_collision = $robot_collision
@onready var robot_hurtbox = $robot_hurtbox
@onready var robot_anim = $robot_anim
@onready var timer_chage_agst = $timer_chageAGST
@onready var weapon_marker1 = $Weapon_marker1
@onready var weapon_marker2 = $Weapon_marker2
@onready var timer_start_battle = $timer_start_battle


func _ready():
	#conectando sinais
	timer_chage_agst.timeout.connect(change_agst)
	timer_start_battle.timeout.connect(start_fight)
	
	
	#decidindo lados dos robos
	if side == 0:
		dir = 1
		robot_anim.flip_h = false
		mode = PlayerLoadout.current_mode
		instanciated_weapon1 = weapon.instantiate()
		instanciated_weapon1.weapon_resource = PlayerLoadout.newest_weapon
		add_child(instanciated_weapon1)
		instanciated_weapon2 = weapon.instantiate()
		instanciated_weapon2.z_index = -10
		instanciated_weapon2.weapon_resource = PlayerLoadout.oldest_weapon
		add_child(instanciated_weapon2)
		instanciated_weapon1.flip_h = false
		instanciated_weapon2.flip_h = false
	if side == 1:
		dir = -1
		robot_anim.flip_h = true
		random_weapon1 = weapons_itens.pick_random()
		random_weapon2 = weapons_itens.pick_random()
		random_mode = modes_itens.pick_random()
		mode = random_mode
		instanciated_weapon1 = weapon.instantiate()
		instanciated_weapon1.weapon_resource = random_weapon1
		add_child(instanciated_weapon1)
		instanciated_weapon2 = weapon.instantiate()
		instanciated_weapon2.z_index = -10
		instanciated_weapon2.weapon_resource = random_weapon2
		add_child(instanciated_weapon2)
		instanciated_weapon1.flip_h = true
		instanciated_weapon2.flip_h = true
	
	max_life = 100 + mode.extra_life
	current_life = max_life
	VL = 3 + mode.extra_VL
	maxVL = 100 + mode.extra_VL * 25
	probability_GB = mode.mode_probability_GB
	probability_GF = mode.mode_probability_GF
	probability_GW = mode.mode_probability_GW
	probability_GRF = mode.mode_probability_GRF
	probability_GRB = mode.mode_probability_GRB
	probability_GSF = mode.mode_probability_GSF
	probability_GSB = mode.mode_probability_GSB

func _physics_process(_delta):
	
	if velocity.x == 0:
		robot_anim.play("idle")
	else:
		robot_anim.play("move")
	
	instanciated_weapon1.global_position = weapon_marker1.global_position
	instanciated_weapon2.global_position = weapon_marker2.global_position
	
	if current_life <= 0:
		self.visible = false
		
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
	
