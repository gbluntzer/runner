extends Area2D
class_name Coin

var good_texture = preload("res://Life_Heart_Player.png")
var bad_texture = preload("res://Coin_Collect.png")

var GOOD = "good"
var BAD = "bad"

var coinType:String = "good" setget  setCoinType, getCoinType 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.x < 0:
		queue_free()


func _on_Coin_body_entered(body):
	print(body.name)
	queue_free()
	

func setCoinType(coinType:String):
	
	coinType = coinType
	if coinType == GOOD:
		$Sprite.texture = good_texture
	else:
		$Sprite.texture = bad_texture

func getCoinType()->String:
	return coinType
