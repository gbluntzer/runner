extends Node2D


var GoodTemplate = preload("res://scenes/Coin.tscn")
onready var player = $Player
var scroll = Vector2(-0.1,0)
var rng = RandomNumberGenerator.new()
var Y_OFFSET = 50





# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	$ParallaxBackground.scroll_offset += scroll
	pass


func _on_Timer_timeout():
	var newCoin:Coin = GoodTemplate.instance()
	
	
	var choice = rng.randf_range(-100, 100)
	
	if choice < 0:
		newCoin.setCoinType("bad")
	else :
		newCoin.setCoinType("good")		
	
	newCoin.global_position = player.global_position
	newCoin.global_position.x = newCoin.global_position.x + get_viewport().size.x / 2
	
	var my_random_number = rng.randf_range(-Y_OFFSET, Y_OFFSET)
	
	newCoin.global_position.y = newCoin.global_position.y + my_random_number
	self.add_child(newCoin)
	

	$Timer.start()
