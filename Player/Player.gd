extends KinematicBody2D

export var ACCELERATION = 3000
export var MAX_SPEED = 300
export var FRICTION = 1500

enum {
	MOVE,
	INTERACT,
	PAUSE
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
var walking = false
#var stats = PlayerStats


onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _physics_process(delta):
	if walking == true && $walk.playing == false:
		$walk.play()
	elif walking == false && $walk.playing == true:
		$walk.stop()
	match state:
		MOVE:
			move_state(delta)
		INTERACT:
			attack_state(delta)

	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		
		animationState.travel("Run")
		walking = true
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		
		animationState.travel("Idle")
		walking = false
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move()
	
	
	## signal
		#state = INTERACT
	
	
func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
func move():
	velocity = move_and_slide(velocity)
	
	
func attack_animation_finished():
	state = PAUSE
	animationState.travel("Idle")


func _on_thing_interact():
	state = PAUSE
	animationState.travel("Idle")

func _on_thing_card_show():
	state = PAUSE
	animationState.travel("Idle")

func _on_dialogue_back():
	state = MOVE
	animationState.travel("Idle")


func _on_walk_finished():
	if walking:
		$walk.play()
