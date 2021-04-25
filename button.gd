extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("on")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	$AnimationPlayer.play("hover")


func _on_Area2D_mouse_exited():
	$AnimationPlayer.play("on")



func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		$click.play()
