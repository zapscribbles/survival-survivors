extends Node2D

var bullet_scene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_cooldown_timeout():
	print("Shoot!")
	var bullet = bullet_scene.instantiate()
	var enemy = get_node("/root/game/Enemy") as CharacterBody2D

	bullet.position = global_position
	bullet.set_target(enemy.global_position)
	get_node("/root/game/").add_child(bullet)
	
	
