extends KinematicBody2D

export var path_to_player := NodePath("res://nodes/player.tscn")

var speed = 150
var health = 50
var blood = load("res://nodes/blood.tscn")
var gore1 = load("res://nodes/gore1.tscn")
var gore2 = load("res://nodes/gore2.tscn")
onready var player = $"../player"
var move: bool

func _ready():
	pass

func _process(delta):
	if move == true:
		var velocity = (self.position - $"../player".position).normalized() * speed
		move_and_slide(velocity)

func kill():
	queue_free()
	Global.kills += 1
	var gore1_instance = gore1.instance()
	get_tree().current_scene.add_child(gore1_instance)
	gore1_instance.global_position = global_position
	gore1_instance.rotation = global_position.angle_to_point(Global.player.global_position)
	var gore2_instance = gore2.instance()
	get_tree().current_scene.add_child(gore2_instance)
	gore2_instance.global_position = global_position
	gore2_instance.rotation = global_position.angle_to_point(Global.player.global_position)

func _on_Area2D_body_entered(body):
	if "bullet" in body.name:
		health -= 20
		var blood_instance = blood.instance()
		get_tree().current_scene.add_child(blood_instance)
		blood_instance.global_position = global_position
		blood_instance.rotation = global_position.angle_to_point(Global.player.global_position)
	if health <= 0:
		kill()

func _on_enemy_body_entered(body):
	if body.is_in_group("player"):
		move = true
		print("1")

func _on_enemy_body_exited(body):
	if body.is_in_group("player"):
		move = false
		print("0")
