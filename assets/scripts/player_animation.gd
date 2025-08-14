extends Node2D

@export var sprite: Sprite2D
@export var animation_player: AnimationPlayer
@export var player_controller: PlayerScript

func _process(delta: float):
	## character flipping
	if player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true
		
	## movement animation player !1
	if abs(player_controller.velocity.x) > 0:
			animation_player.play("move")
	else:
		animation_player.play("Idle")
	
	## jumping animationn
	if player_controller.velocity.y < 0:
		animation_player.play("jump")
	elif player_controller.velocity.y > 0:
		animation_player.play("fall")
