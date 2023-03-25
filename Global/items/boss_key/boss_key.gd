extends Sprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		Global.boss_key += 1
		queue_free()
