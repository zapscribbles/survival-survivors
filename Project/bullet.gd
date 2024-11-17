extends Area2D

const SPEED = 400.0
var TARGET
var VELOCITY

func set_target(setting):
	TARGET = setting
	
	var distance_vector = TARGET - global_position
	VELOCITY = distance_vector.normalized()
	
	look_at(global_position.move_toward(TARGET, 1))

func _physics_process(delta):
	position += VELOCITY * SPEED * delta


func _on_body_entered(body):
	print("Hit!")
	print(body)


func _on_body_exited(body):
	print("exit!")
	print(body)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("body hit!")
	print(body)


func _on_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	print("body exit!")
	print(body)
