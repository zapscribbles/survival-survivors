extends Node2D

var enemy_scene = preload("res://enemy.tscn")
var enemy_counter = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.position = $SpawnRect.to_global(get_spawn_point())
	enemy.name = "Enemy" + str(enemy_counter)
	enemy_counter += 1
	
	print("enemy spawned at: "+ str(enemy.position))
	$Enemies.add_child(enemy)

func get_spawn_point():
	# Determine side to spawn from
	# Polygon has 4 points - 0 - 3, pick one of these
	var first_point_pos = randi_range(0, 3)
	
	# Get the second point. If the first point was 3, second point should be 0
	var second_point_pos
	if first_point_pos == 3:
		second_point_pos = 0
	else:
		second_point_pos = first_point_pos + 1
		
	# Get the associated vectors from the SpawnRect polygon
	var first_point = $SpawnRect.polygon[first_point_pos] as Vector2
	var second_point = $SpawnRect.polygon[second_point_pos] as Vector2
	
	# Pick a random interpolation state between the two, represented by "t"
	var t = randf_range(0, 1)
	
	# Return interpolated point
	# See https://docs.godotengine.org/en/stable/tutorials/math/interpolation.html
	return first_point.lerp(second_point, t)
