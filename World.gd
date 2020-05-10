extends Node2D


var CoinTemplate = preload("res://scenes/Coin.tscn")
onready var player = $Player
var scroll = Vector2(-0.1,0)
var OFFSET = 100




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$ParallaxBackground.scroll_offset += scroll
	pass


func _on_Timer_timeout():
	var newCoin:Area2D = CoinTemplate.instance()
	newCoin.global_position = player.global_position
	newCoin.global_position.x = newCoin.global_position.x + OFFSET
	newCoin.global_position.y = newCoin.global_position.y + OFFSET
	self.add_child(newCoin)
	$Timer.start()
