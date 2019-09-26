extends KinematicBody2D

var motion = Vector2(0,0)
export var Gravity = 30
export var SPEED = 500
export var jump_power = 700
var jump_count = 0
func _init():
	pass
	
func _physics_process(delta):
	walk()
	apply_gravity()
	jump()
	update_animation()
	
	move_and_slide(motion, Vector2(0,-1))
func walk():
	if Input.is_action_pressed("left") and not Input.is_action_just_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right")and not Input.is_action_just_pressed("left"):
		motion.x = +SPEED
	else:
		motion.x = 0
func jump():
	if jump_count < 1:
		if Input.is_action_just_pressed("jump"):
			motion.y = -jump_power
			$AudioStreamPlayer.play()
			jump_count = jump_count + 1
	if is_on_floor():
		jump_count = 0

func apply_gravity():
	if is_on_floor():
		motion.y = 0
	else:
		motion.y = motion.y + Gravity

func update_animation():
	if motion.y < 0 :
		$AnimatedSprite.play("jump")
	elif is_on_floor() and motion.x > 0 :
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("walk")
	elif is_on_floor() and motion.x < 0 :
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
	elif motion.y == 0 and motion.x == 0:
		$AnimatedSprite.play("idle")

func is_dead():
	if position.y >1000 :
		return true
	return false