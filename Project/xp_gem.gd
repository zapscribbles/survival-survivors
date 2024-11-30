extends CharacterBody2D


const SPEED = 300.0

func _ready():
	$AnimationPlayer.play("idle")

func _physics_process(delta):
	pass
	
	
