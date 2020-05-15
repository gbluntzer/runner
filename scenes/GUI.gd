extends CanvasLayer

var counter = 0

func _ready():
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(counter)

func updateScore(score):
	counter = counter + 1
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(score)
	
