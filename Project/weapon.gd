extends Node2D

var bullet_scene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_cooldown_timeout():
	#print("Shoot!")
	var bullet = bullet_scene.instantiate()
		
	var target = find_closest_enemy()
	
	if target:
		bullet.position = global_position
		bullet.set_target(target.global_position)
		get_node("/root/game").add_child(bullet)

func find_closest_enemy():
	# Get all enemies
	var enemies = get_tree().get_nodes_in_group("enemies")
	
	if !enemies.is_empty():
		# Create an empty variable for storing closest enemy
		var closest_enemy = enemies[0]
	
		# Iterate over enemies and compare distance - if this enemy is closer than the closest enemy so far, replace
		#print("\n" + name + ":\n")
		for enemy in enemies:
			#print(enemy.name+":")
			#print("distance to " + enemy.name + ": " + str(global_position.distance_to(enemy.global_position)))
			#print("distance to closest enemy(" + closest_enemy.name + "): " + str(global_position.distance_to(closest_enemy.global_position)))
			if global_position.distance_to(enemy.global_position) < global_position.distance_to(closest_enemy.global_position):
				closest_enemy = enemy
	
		# Return closest enemy
		return closest_enemy
	else:
		return null
