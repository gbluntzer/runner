extends Control



func _on_TryAgainButton_pressed():
	get_tree().call_group("GameState","reset")
	get_tree().change_scene("res://World.tscn")
	
