extends Sprite

signal interact

var sent = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	sent = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_pressed() && sent == false:
		sent = true
		#emit_signal("interact", "card")


func _on_thing_card_show():
	visible = true
	sent = false


func _on_dialogue_back():
	visible = false
	sent = false
