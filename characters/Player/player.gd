extends KinematicBody2D

var health = 100
var max_health = 100
var movespeed = 500
onready var hit = false
onready var health_bar = $hp
var blood = load("res://Global/gore/blood.tscn")

func _ready():
	Global.player = self

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	health_bar.value = health
	if health <= 0:
		kill()
	print(Global.kills)
	$"kill counter".text = str(Global.kills)
	$RichTextLabel2.text = str(Global.key)
	print(Global.boss_key)

func kill():
	get_tree().change_scene("res://UI/death_screen.tscn")
	Global.key = 0
	Global.kills = 0
	Global.boss_key = 0
	print("dead")

func set_pos(pos):
	self.position = pos

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		hit = true
		health -= 25
		var blood_instance = blood.instance()
		get_tree().current_scene.add_child(blood_instance)
		blood_instance.global_position = global_position
		blood_instance.rotation = global_position.angle_to_point(Global.player.global_position)
	
	if body.is_in_group("enemy-bullet"):
		health -= 5
		var blood_instance = blood.instance()
		get_tree().current_scene.add_child(blood_instance)
		blood_instance.global_position = global_position
		blood_instance.rotation = global_position.angle_to_point(Global.player.global_position)

func _on_Area2D_body_exited(body):
	if body.is_in_group("enemy"):
		hit = false

func _on_hit_timeout():
	if hit == true:
		health -= 10
		var blood_instance = blood.instance()
		get_tree().current_scene.add_child(blood_instance)
		blood_instance.global_position = global_position
		blood_instance.rotation = global_position.angle_to_point(Global.player.global_position)



