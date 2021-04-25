extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var room = 1;

onready var players = {
	1: $room1,
	2: $room2,
	3: $room3,
	4: $room4
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$room1.play();


func _on_finished():
	players[room].play();

func change_music(_room):
	room = _room
