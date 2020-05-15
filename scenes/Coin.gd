extends Area2D
class_name Coin

var good_texture = preload("res://Life_Heart_Player.png")
var bad_texture = preload("res://Coin_Collect.png")

const GOOD = "good"
const BAD = "bad"

var coinType:String = "good" setget  setCoinType, getCoinType 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.x < 0:
		queue_free()


func _on_Coin_body_entered(body):
	print("_on_Coin_body_entered coinType " + coinType)
	if coinType == BAD:
		$Sprite.texture = good_texture
		get_tree().call_group("GameState","gameOver")
	else:
		$Sprite.texture = bad_texture
		get_tree().call_group("GameState","increaseScore")
		get_tree().call_group("GameState","increasePlayerSpeed")
		queue_free()
	

func setCoinType(coinTypex:String):
	print("setCoinType " + coinTypex)
	coinType = coinTypex
	if coinTypex == GOOD:
		$Sprite.texture = good_texture
	else:
		$Sprite.texture = bad_texture

func getCoinType()->String:
	return coinType
