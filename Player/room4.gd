extends "res://Player/Player.gd"

signal interact


func _ready():
	state = PAUSE
	animationState.travel("Freeze")
	emit_signal("interact", "room4")
	Music.change_music(4)
