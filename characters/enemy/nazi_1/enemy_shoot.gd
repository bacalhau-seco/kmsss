extends Node2D

var bullet_speed = 1500
var bullet = preload("res://characters/enemy/nazi_1/enemy-bullet.tscn")
onready var player = get_node("../../player")
var shoot = false

func _physics_process(delta):
	look_at(player.global_position)

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)

func _on_Timer_timeout():
	if shoot == true:
		fire()
		$sound.play()


