extends Area2D

var weapon
const SPEED = 400.0
var TARGET
var VELOCITY
var hit = false

func set_target(setting):
	TARGET = setting
	
	var distance_vector = TARGET - global_position
	VELOCITY = distance_vector.normalized()
	
	look_at(global_position.move_toward(TARGET, 1))

func _physics_process(delta):
	if !hit:
		position += VELOCITY * SPEED * delta

func _on_area_entered(area:Area2D):
	if area.type():
		if area.type() == "enemy":
			#print("bullet hit: " + area.enemy_name())
			area.hit(weapon)
			on_hit()

func on_hit():
	hit = true
	$AnimationPlayer.play("hit") 
	# NB AnimationPlayer handles queue_free()
