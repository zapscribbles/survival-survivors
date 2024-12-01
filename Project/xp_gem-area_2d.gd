extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func type():
	return "xp_gem"

func entered_collection_area():
	get_parent().entered_collection_area()

func get_gem():
	return get_parent()
