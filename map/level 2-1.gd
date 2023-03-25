extends Sprite
onready var player = $"../../player"

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player.set_pos(Vector2(-10984, 300))
