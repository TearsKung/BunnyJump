extends KinematicBody2D

var motion = Vector2(0,0)

export var SPEED = 500 
export var Gravity = 500
# warning-ignore:unused_argument
func _physics_process(delta):
	
	motion.y = motion.y + Gravity
	
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
		print("fuck")
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
	