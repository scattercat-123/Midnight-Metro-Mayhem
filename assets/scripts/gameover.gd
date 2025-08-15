extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_pos = to_local(event.position)
		if Rect2(Vector2.ZERO, texture.get_size()).has_point(local_pos):
			get_tree().change_scene_to_file("res://assets/scenes/intro.tscn")
