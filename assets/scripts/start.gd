extends Sprite2D

@export var start_without_animation: bool = false
@export var animation_duration: float = 10.0  # seconds

func _ready():
	if start_without_animation:
		get_tree().change_scene_to_file("res://assets/scenes/level1.tscn")
	else:
		# Wait for the animation to finish
		await get_tree().create_timer(animation_duration).timeout
		get_tree().change_scene_to_file("res://assets/scenes/level1.tscn")

#func _input(event):
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#var local_pos = to_local(event.position)
		#if Rect2(Vector2.ZERO, texture.get_size()).has_point(local_pos):
			#print("Going to level1")
			#get_tree().change_scene_to_file("res://assets/scenes/level1.tscn")
			
