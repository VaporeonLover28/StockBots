extends Node

var UI_is_open : bool

func boxopen(box):
	match box.name:
		"Hover_collision1":
			#quem leu isso é um gayzão °w°
			print("box1")
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_2/Hover_collision2/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_2/Hover_collision2/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_3/Hover_collision3/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_3/Hover_collision3/CollisionShape2D").disabled = true
		"Hover_collision2":
			print("box2")
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_1/Hover_collision1/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_1/Hover_collision1/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_3/Hover_collision3/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_3/Hover_collision3/CollisionShape2D").disabled = true
		"Hover_collision3":
			print("box3")
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_1/Hover_collision1/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_1/Hover_collision1/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_2/Hover_collision2/CollisionShape2D").disabled = true
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_2/Hover_collision2/CollisionShape2D").disabled = true

func boxclose(box):
	match box.name:
		"Hover_collision1":
			#quem leu isso é um gayzão °w°
			print("box1")
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_2/Hover_collision2/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_2/Hover_collision2/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_3/Hover_collision3/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_3/Hover_collision3/CollisionShape2D").disabled = false
		"Hover_collision2":
			print("box2")
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_1/Hover_collision1/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_1/Hover_collision1/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_3/Hover_collision3/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_3/Hover_collision3/CollisionShape2D").disabled = false
		"Hover_collision3":
			print("box3")
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_1/Hover_collision1/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_1/Hover_collision1/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Player_itemframe_2/Hover_collision2/CollisionShape2D").disabled = false
			get_node("/root/Area_batalha/battle_camera/UI_layer/Enemy_itemframe_2/Hover_collision2/CollisionShape2D").disabled = false
