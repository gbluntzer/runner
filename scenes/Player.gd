extends KinematicBody2D


var jumpspeed = -150
var gravityscale = 98.0
var walkspeed = 150 
var velocity = Vector2(250,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta): 
	velocity.y = gravityscale

	get_input() 
#	var motion = velocity*delta 
#	move_and_collide(motion)
	move_and_slide(velocity)
	if global_position.y > 640:
		player_died()

	
	
func get_input(): 
#	if Input.is_action_pressed("ui_left"): 
#		velocity.x = -walkspeed 
#	elif Input.is_action_pressed("ui_right"): 
#		velocity.x = walkspeed 
#	else: 
#		velocity.x = 0

	if Input.is_action_pressed("ui_select"):
#		print("Space")
		velocity.y += jumpspeed
	else:
		velocity.y = gravityscale
		
func player_died():
	print("player died")
	
