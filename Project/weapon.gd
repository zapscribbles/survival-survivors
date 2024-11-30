extends Node2D

var bullet_scene = preload("res://bullet.tscn")
var dmg = 5
var num_shots = 2
var time_between_shots = 0.25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_cooldown_timeout():
	#print("Shoot!")
	var target
	
	for i in num_shots:
		target = find_closest_enemy()
		shoot_bullet(target)
		if i < num_shots: # AKA there are more shots to come
			await get_tree().create_timer(time_between_shots).timeout

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

func shoot_bullet(target):
	var bullet = bullet_scene.instantiate()
	
	if target:
		bullet.position = global_position
		bullet.set_target(target.global_position)
		bullet.weapon = self
		get_node("/root/game").add_child(bullet)
