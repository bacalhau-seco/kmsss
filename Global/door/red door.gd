extends StaticBody2D

var Player = preload("res://characters/Player/player.tscn")


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		if Global.red_key >= 1:
			queue_free()
			Global.red_key -= 1
