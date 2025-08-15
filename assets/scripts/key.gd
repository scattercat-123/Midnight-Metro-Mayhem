extends Area2D
var keys = 0

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerScript:
		queue_free()
		body.add_keys()
