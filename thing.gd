extends Area2D

signal interact
signal card_show

var inRange = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


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

