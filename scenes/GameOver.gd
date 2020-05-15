extends Control

func _ready():
	var gameState = get_node("/root/GameState")
	$CenterContainer/VBoxContainer/LastScore.text= str(gameState.score)

func _on_TryAgainButton_pressed():
	get_tree().call_group("GameState","reset")
	get_tree().change_scene("res://World.tscn")
	
