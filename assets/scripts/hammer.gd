extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	get_node("CollisionShape2D").disabled = false

func hammer_open():
	animation_player.play("hammer")
	get_node("CollisionShape2D").set_deferred("disabled", true)


func _on_punk_all_keys_collected() -> void:
	hammer_open()
