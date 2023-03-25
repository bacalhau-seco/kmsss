extends StaticBody2D

onready var player = $"../player"
var heal

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		heal = 25
		player.health += heal
		player.health = clamp(player.health, 0, player.max_health)
		queue_free()
