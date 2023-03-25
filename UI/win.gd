extends Control

func _ready():
	$kills.text = str(Global.kills)
	$boss_kills.text = str(Global.boss_killed)

func _on_start_pressed():
	get_tree().change_scene("res://map/world.tscn")
	Global.boss_key = 0
	Global.dead_boss = false

