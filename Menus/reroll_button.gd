extends Button


func _ready() -> void:
	RoundCounter.reroll_price = round(RoundCounter.reroll_price/2)
	if RoundCounter.reroll_price == 0:
		RoundCounter.reroll_price = 1

func _physics_process(delta: float) -> void:
	self.text = "Reroll shop: " + str(RoundCounter.reroll_price) + "     Scrap"

func _on_pressed() -> void:
	if PlayerLoadout.current_money >= RoundCounter.reroll_price:
		$"../Item_container".roll()
		$"../Item_container2".roll()
		$"../Item_container3".roll()
		PlayerLoadout.current_money -= RoundCounter.reroll_price
		RoundCounter.reroll_price *= 2
		
