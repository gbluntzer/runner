extends KinematicBody2D

const SPEED = 500 
const JUMP_SPEED = 200
const GRAVITY = 5
const UP = Vector2(0,-1)

var motion = Vector2(0,0)

onready var anim = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta): 
	apply_gravity()

	get_input() 
#	var motion = velocity*delta 
#	move_and_collide(motion)
	move_and_slide(motion, UP)
	if global_position.y > 640:
		player_died()

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY	
	
func get_input(): 

	if Input.is_action_just_pressed("ui_select"):
		print("Ui_SELECT")
		motion.y -= JUMP_SPEED
		anim.play("Jump")

	else:
		motion.x = SPEED
		anim.play("Run")
		
func player_died():
	get_tree().change_scene("res://scenes/GameOver.tscn")
	
