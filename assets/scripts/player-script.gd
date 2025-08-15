extends CharacterBody2D
class_name PlayerScript

@export var SPEED = 50
@export var JUMP_VELOCITY = -8

var level = 0 ## 0 is for tutorial
var direction = 0
var SPEED_MULTIPLIER = 6
var JUMP_VELOCITY_MULTIPLIER = 50
var keys_collected = 0
var hud : HUD
signal all_keys_collected

func _ready():
	hud = get_tree().get_first_node_in_group("hud")
	hud.update_keys_label(keys_collected)

func _process(delta: float):
	if position.y > 200 :
		get_tree().change_scene_to_file("res://assets/scenes/gameover.tscn")

func _input(event: InputEvent):
	if (event.is_action_pressed("S") && is_on_floor()):
		position.y += 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * JUMP_VELOCITY_MULTIPLIER

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("A", "D")
	if direction:
		velocity.x = direction * SPEED * SPEED_MULTIPLIER
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * SPEED_MULTIPLIER)

	move_and_slide()
func reset_keys():
	keys_collected = 0
	hud.update_keys_label(keys_collected)

func add_keys():
	keys_collected += 1
	hud.update_keys_label(keys_collected) 
	if keys_collected >= 3:
		print("collected all")
		emit_signal("all_keys_collected")
