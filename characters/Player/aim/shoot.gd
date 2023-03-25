extends Node2D

var bullet_speed = 1500
var bullet = preload("res://characters/Player/aim/bullet.tscn")

func _physics_process(delta):
	look_at($"../aim".global_position)
	if Input.is_action_just_pressed("fire"):
		fire()
		$sound.play()

func fire():
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)




func _on_Timer_timeout():
	if Input.is_action_pressed("fire"):
		fire()
		$sound.play()
