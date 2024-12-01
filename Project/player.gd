extends CharacterBody2D


const SPEED = 300.0

var hp : int :
	set(new_hp):
		hp = new_hp
		%HUD.update("hp", new_hp)

var xp : int :
	set(new_xp):
		xp = new_xp
		%HUD.update("xp", new_xp)

func _ready():
	hp = 50
	xp = 0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


func _on_collection_area_area_entered(area):
	
	if area.type() == "xp_gem":
		area.entered_collection_area()


func _on_collection_area_area_exited(area):
	pass
	#print("player collection area exited by " + area.type())


func _on_pickup_area_area_entered(area):
	
	if area.type() == "xp_gem":
		var gem = area.get_gem()
		gem.entered_pickup_area()
		xp += gem.xp_value
