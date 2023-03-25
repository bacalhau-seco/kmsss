extends StaticBody2D
var Player = preload("res://characters/Player/player.tscn")


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		if Global.key >= 1:
			queue_free()
			Global.key -= 1
