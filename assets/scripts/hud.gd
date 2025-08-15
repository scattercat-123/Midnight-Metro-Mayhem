extends Control
class_name HUD

@export var keys_label : Label
@export var guide_label : Label

func update_keys_label(number : int):
	keys_label.text = "x " + str(number)
	
func change_guide_label(text : String):
	guide_label.text=" ~ " + text + "..."
