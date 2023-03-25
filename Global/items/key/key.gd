extends Sprite

func _on_Area2D_body_entered(body):
	Global.key += 1
	queue_free()
