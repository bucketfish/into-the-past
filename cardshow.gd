extends "res://thing.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):
	if inRange && event.is_pressed():
		emit_signal("card_show")
		emit_signal("interact", "card")
