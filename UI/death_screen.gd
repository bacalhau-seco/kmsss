extends Control

func _ready():
	$scream.play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_start_pressed():
	get_tree().change_scene("res://map/world.tscn")



func _on_Timer_timeout():
	$scream.stop()
