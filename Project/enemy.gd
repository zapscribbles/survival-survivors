extends CharacterBody2D

const SPEED = 80.0

var hp = 10
var dead = false
var gem_scene = preload("res://xp_gem.tscn")

func _ready():
	add_to_group("enemies")

func _physics_process(delta):
	
	if !dead:
		var player = get_tree().root.get_node("game/Player") as CharacterBody2D
		
		position = position.move_toward(player.position, delta*SPEED)
		look_at(position.move_toward(player.position, 1))

		move_and_slide()

func hit(weapon):
	if !dead:
		print(name + " was hit with " + str(weapon.dmg) + " damage")
		hp -= weapon.dmg
		if hp <= 0:
			destroyed(weapon)

func destroyed(by_weapon):
	dead = true
	print(name + " was destroyed by " + by_weapon.name)
	var gem = gem_scene.instantiate()
	gem.position = global_position
	get_node("/root/game/Loot").add_child(gem)
	$AnimationPlayer.play("death") 
