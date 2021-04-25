extends "res://thing.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bed_input_event(viewport, event, shape_idx):
	if inRange && event.is_pressed():
		emit_signal("interact", "bed")
