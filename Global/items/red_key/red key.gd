extends Sprite

func _on_Area2D_body_entered(body):
	Global.red_key += 1
	queue_free()
