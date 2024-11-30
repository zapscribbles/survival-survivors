extends CharacterBody2D


const SPEED = 80.0

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	
	var player = get_tree().root.get_node("game/Player") as CharacterBody2D
	
	position = position.move_toward(player.position, delta*SPEED)
	look_at(position.move_toward(player.position, 1))

	move_and_slide()
