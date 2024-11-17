extends CharacterBody2D


const SPEED = 400.0

func _physics_process(delta):
	var enemy = get_node("/root/game/Enemy") as CharacterBody2D

	position = position.move_toward(enemy.position, delta*SPEED)
	look_at(position.move_toward(enemy.position, 500))

	move_and_slide()
