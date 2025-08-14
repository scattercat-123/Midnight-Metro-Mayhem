extends CharacterBody2D
class_name PlayerScript

@export var SPEED = 50
@export var JUMP_VELOCITY = -7

var direction = 0
var SPEED_MULTIPLIER = 6
var JUMP_VELOCITY_MULTIPLIER = 50

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
