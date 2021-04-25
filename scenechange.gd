extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var black = $Control/ColorRect

func _ready():
	#animation_player.play_backwards("fade")
	pass
	
func change_scene(path, delay = 0.2):
	$Control.visible = true
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene(path)== OK)
	animation_player.play_backwards("fade")
	yield(animation_player, "animation_finished")
	emit_signal("scene_changed")
	$Control.visible = false
