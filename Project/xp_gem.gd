extends CharacterBody2D

enum GEM_STATE { 
	IDLE, 			# Gems start this way
	IN_TRANSIT, 		# This triggers once the gem enters the players collection area
	COLLECTED 		# This triggers once the gem reaches the player
	}

@onready var player = get_tree().root.get_node("game/Player") as CharacterBody2D

const SPEED = 150.0

var state = GEM_STATE.IDLE
var xp_value = 1

func _ready():
	$AnimationPlayer.play("idle")
	

func _physics_process(delta):
	
	if state == GEM_STATE.IN_TRANSIT:
		position = position.move_toward(player.position, delta*SPEED)
		look_at(position.move_toward(player.position, 1))

		move_and_slide()

func entered_collection_area():
	state = GEM_STATE.IN_TRANSIT
	$AnimationPlayer.play("in_transit")

func entered_pickup_area():
	queue_free()
