extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enemy_name():
	return get_parent().name

func type():
	return "enemy"

func hit(weapon):
	get_parent().hit(weapon)
