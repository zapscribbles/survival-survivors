extends CharacterBody2D


const SPEED = 80.0


func _physics_process(delta):
	
	var player = $"../Player" as CharacterBody2D
	
	position = position.move_toward(player.position, delta*SPEED)
	look_at(position.move_toward(player.position, 500))

	move_and_slide()
