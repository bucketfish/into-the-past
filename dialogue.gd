extends Sprite

signal back

var active = false

var part = 0
var scene = ""

var dialogue = {
	"card": ["oh, this!",
		"ms jade is so nice! i do have another session later today.",
		"it was Pretty Terrible Times. gosh.",],
	"meds":[ "oh shit! i almost forgot to take the meds.",
		"i better take it. urgh.",
		"i mean, it does help, so that's pretty good.",
		"i've been trying to escape from that deep place..."],
	"blade":[
		"no. i shouldn't touch it.",
		"i really shouldn't.",
		"damnit, i swear i stopped!",
		"god. christ. they say it's getting better!",
		"i can't go back now..."
	],
	"room4": [
		"make it stop. make it stop, make it",
		"stop. i can't take it anymore!",
		"make it STOP. BREATHE! MAKE IT",
		"STOP! STOPSTOPSTOP painpainpain...",
		"stop.stopstop  stop stop stopstop so ptotp s top",
		"stops top  stop stop stop",
		"stop..."
	],
	"telephone": [
		"oh! it's ms jade!",
		'"hello, ms jade!"',
		'"hey! how have you been!"',
		'"i\'ve been doing pretty well! thank you for all your help..."'
	],
	"table": [
		"my table's clean and empty for the first time in months!",
		"i'm pretty proud of how far i've come."
	],
	"table2": [
		"gosh. there's still so much undone work!",
		"i mean, at least they're stacked neatly now...",
		"i'll get around to it soon enough."
	],
	"bed": [
		"i just got out of bed!",
		"not going back there today."
	],
	"plant": [
		"my plant boi is healthy again!",
		"it's so nice and green!!",
		"sis will be happy with this."
	],
	"plant2":[
		"it's been wilting for a while.",
		"sis said it'll help with everything...",
		"but i haven't really got time to take care of it.",
		"or the energy to."
	],
	"paper":[
		"that must've fallen sometime while i was sleeping.",
		"guess it's staying there now..."
	],
	"bed3": [
		"i really, really want to go back to bed...",
		"i'm so tired."
	],
	"table3":[
		"they keep piling on.",
		"the work never ends...",
		"every day is the same."
	]
}

var count = {
	"card": 3,
	"meds":  4,
	"blade": 5,
	"room4":  7,
	"telephone": 4,
	"table": 2,
	"table2": 3,
	"bed": 2,
	"plant": 3,
	"plant2": 4,
	"paper": 2,
	"bed3": 2,
	"table3": 3
}

var nextsc = {
	"card": "res://room2.tscn",
	"meds": "res://room3.tscn",
	"blade": "res://room4.tscn",
	"room4": "res://final.tscn",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	$AnimationPlayer.play("hide")
	$Sprite.visible = false
	$Sprite2.visible = false
	if scene == "room4":
		$AnimationPlayer.play("show")

func confirmation():
	$Sprite.visible = true
	$Sprite2.visible = true
	
func _input(event):
	if event.is_action_pressed("ui_accept") && active:
		part += 1
		if part == count[scene]:
			if scene == "room4":
				Scenechange.change_scene("res://final.tscn")
			elif scene == "telephone":
				Scenechange.change_scene("res://ending.tscn")
			elif nextsc.has(scene):
				confirmation()
			else:
				$AnimationPlayer.play("hide")
				emit_signal("back")
				part = 0
				$Sprite.visible = false
				$Sprite2.visible = false
				
		elif part > count[scene]:
			pass
			#Scenechange.change_scene(nextsc[scene])
			
		else:
			$RichTextLabel.text = dialogue[scene][part];
			$next.play()
	
	
			

func _on_thing_interact(_scene):
	scene = _scene
	active = true
	part = 0
	$RichTextLabel.text = dialogue[scene][part];
	$AnimationPlayer.play("show")
	


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		active = false
		Scenechange.change_scene(nextsc[scene])


func _on_back_input_event(viewport, event, shape_idx):
	active = false
	if event.is_pressed():
		$AnimationPlayer.play("hide")
		emit_signal("back")
		part = 0
		$Sprite.visible = false
		$Sprite2.visible = false
		
