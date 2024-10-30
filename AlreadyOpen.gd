extends Node

var UI_is_open : bool

func boxopen(box):
	match box.name:
		"Hover_collision1":
			print("box1")
			#$battle_camera/UI_layer/Player_itemframe_2/Hover_collision2/CollisionShape2D.disabled = true
			#$battle_camera/UI_layer/Player_itemframe_3/Hover_collision3/CollisionShape2D.disabled = true
		"Hover_collision2":
			print("box2")
			#$battle_camera/UI_layer/Player_itemframe_1/Hover_collision1/CollisionShape2D.disabled = true
			#$battle_camera/UI_layer/Player_itemframe_3/Hover_collision3/CollisionShape2D.disabled = true
		"Hover_collision3":
			print("box3")
			#$battle_camera/UI_layer/Player_itemframe_1/Hover_collision1/CollisionShape2D.disabled = true
			#$battle_camera/UI_layer/Player_itemframe_2/Hover_collision2/CollisionShape2D.disabled = true
