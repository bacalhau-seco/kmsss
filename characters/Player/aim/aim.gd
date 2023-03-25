extends KinematicBody2D

var movespeed = 1000
var controller = false

func _physics_process(delta):
	if Input.is_action_just_pressed("controller"):
		controller = true
	var motion = Vector2()
	
	if controller == true:
		if Input.is_action_pressed("look_up"):
			motion.y -= 1
		if Input.is_action_pressed("look_down"):
			motion.y += 1
		if Input.is_action_pressed("look_left"):
			motion.x -= 1
		if Input.is_action_pressed("look_right"):
			motion.x += 1
	else:
		global_position = get_global_mouse_position()
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
