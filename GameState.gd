extends Node

var UPDATE_SPEED_VALUE = 20
var playerSpeed = 0
var score = 0

func _ready():
	add_to_group("GameState")

func increaseScore():
	
	score = score + 1
	get_tree().call_group("GUI", "updateScore", score)

func increasePlayerSpeed():
	playerSpeed = playerSpeed + UPDATE_SPEED_VALUE
	get_tree().call_group("Player", "updateSpeed", playerSpeed)
	
func gameOver():
	get_tree().change_scene("res://scenes/GameOver.tscn")

func reset():
	playerSpeed = 0
	score = 0
	

