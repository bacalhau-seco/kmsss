extends Sprite

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://map/boss.tscn")
