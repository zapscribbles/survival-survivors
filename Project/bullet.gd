extends CharacterBody2D

const SPEED = 400.0
var TARGET
var VELOCITY

func set_target(setting):
	print(setting)
	TARGET = setting
	
	var distance_vector = TARGET - global_position
	velocity = distance_vector.normalized() * SPEED
	
	look_at(global_position.move_toward(TARGET, 1))

func _physics_process(delta):
	move_and_slide()
