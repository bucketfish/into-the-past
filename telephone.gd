extends Area2D

signal interact
signal card_show

var inRange = false
var play = true
#onready var card = $card
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	play = true
	$AnimationPlayer2.play("ring")
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("show")
	inRange = true
	

# warning-ignore:unused_argument
func _on_Area2D_area_exited(area):
	$AnimationPlayer.play("hide")
	inRange = false


# warning-ignore:unused_argument
# warning-ignore:unused_argument

func _on_Area2D_input_event(viewport, event, shape_idx):
	if inRange && event.is_pressed():
		emit_signal("interact", "telephone")
		$AnimationPlayer2.play("still")
		play = false
		$AudioStreamPlayer2D.stop()



func _on_AudioStreamPlayer2D_finished():
	if play:
		$AudioStreamPlayer2D.play()
