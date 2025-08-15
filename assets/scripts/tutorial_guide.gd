extends Node2D
var hud : HUD
var tutorial_step = -1  # -1 means intro phase
var intro_timer := 0.0


var intro_messages = [
	"Welcome to the game!",
	"Collect all keys to unlock the hammer!",
	"Watch out for enemies!"
]
var intro_index = 0

# Tips to show only once after tutorial ends
var tips_messages = [
	"Get all 3 Keys Use the hammer to advance!",
	"Avoid enemies — they hurt!",
	"Press S to drop through one-way platforms quickly.",
	"Get all 3 keys"
]
var tip_index = 0
var tip_timer := 0.0
var showing_tips = false

func _ready():
	hud = get_tree().get_first_node_in_group("hud")
	show_intro_message()

func _process(delta: float) -> void:
	if tutorial_step == -1:
		# Intro phase
		intro_timer += delta
		if intro_timer >= 2.0:
			intro_timer = 0.0
			intro_index += 1
			if intro_index < intro_messages.size():
				show_intro_message()
			else:
				# Move to tutorial step 0
				tutorial_step = 0
				show_step_message()
		return

	# Step-by-step tutorial
	match tutorial_step:
		0:
			if Input.is_action_just_pressed("Jump"):
				tutorial_step = 1
				show_step_message()
		1:
			if Input.is_action_just_pressed("A") or Input.is_action_just_pressed("D"):
				tutorial_step = 2
				show_step_message()
		2:
			var player = get_tree().get_first_node_in_group("player")
			if player and player.keys_collected >= 1:
				tutorial_step = 3
				show_step_message()
				showing_tips = true  # Start showing tips
		3:
			# Show tips only once
			if showing_tips and tip_index < tips_messages.size():
				tip_timer += delta
				if tip_timer >= 2.0:
					tip_timer = 0.0
					show_next_tip()
			elif showing_tips and tip_index >= tips_messages.size():
				showing_tips = false  # Done showing tips

func show_intro_message():
	hud.change_guide_label(intro_messages[intro_index])

func show_step_message():
	match tutorial_step:
		0:
			hud.change_guide_label("Press Space to Jump!")
		1:
			hud.change_guide_label("Good! Now use A & D to Move!")
		2:
			hud.change_guide_label("Great! Now collect a key!")
		3:
			hud.change_guide_label("Tutorial Complete! Here's some tips...")

func show_next_tip():
	hud.change_guide_label(tips_messages[tip_index])
	tip_index += 1
