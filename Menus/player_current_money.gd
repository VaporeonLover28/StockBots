extends Label


# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	self.text = "Scrap: " + str(PlayerLoadout.current_money)
	
	if RoundCounter.rounds > 1:
		$Money_Won.text = "(+" + str(RoundCounter.winmoneyindicator) + ")"
	else:
		$Money_Won.text = "(+4)"
	
	if PlayerLoadout.current_money >= 10:
		$Money_Won.position.x = 118
	else:
		$Money_Won.position.x = 108
