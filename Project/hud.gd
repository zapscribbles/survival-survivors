extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(element, value):
	match element:
		"hp":
			print("hp updated to " + str(value))
			%HP.text = str(value)
		"xp":
			print("xp updated to " + str(value))
			%XP.text = str(value)
