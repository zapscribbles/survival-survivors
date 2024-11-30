extends CharacterBody2D


const SPEED = 80.0


func _physics_process(delta):
	
	var player = get_node("/root/game/Player") as CharacterBody2D
	
	position = position.move_toward(player.position, delta*SPEED)
	look_at(position.move_toward(player.position, 1))

	move_and_slide()
