extends KinematicBody2D

const SPEED = 200 
const JUMP_SPEED = 200
const GRAVITY = 100
const UP = Vector2(0,-1)

var motion = Vector2(10,0)
var updatedSpeed = 0

onready var anim = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta): 
	apply_gravity(delta)

	get_input(delta) 
#	var motion = velocity*delta 
#	move_and_collide(motion)
	move_and_slide(motion, UP) # allready has delta
	if global_position.y > 640 || global_position.y <= 0:
		player_died()

func apply_gravity(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = (GRAVITY)	
	
func get_input(delta): 

	if Input.is_action_pressed("ui_select"):
		motion.y -= (JUMP_SPEED )
		anim.play("Jump")

	else:
		motion.x = (SPEED + updatedSpeed )
		anim.play("Run")
		
func player_died():
	get_tree().call_group("GameState","gameOver")
	
	
func updateSpeed(playerSpeed):
	updatedSpeed = playerSpeed
	
