extends Area2D

func _ready():
	monitoring = true
	monitorable = true
	connect("body_entered", Callable(self, "_on_body_entered"))
	# optional: sanity print
	# print("Door ready. Layers:", collision_layer, "Mask:", collision_mask)

func _on_body_entered(body: Node2D) -> void:
	print("touch:", body)  # you'll see this if the signal fires
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://assets/scenes/level2.tscn")
