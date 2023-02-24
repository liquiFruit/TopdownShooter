extends CharacterBody2D


var movement:= Vector2.ZERO
var speed:= 2000
var max_vel:= 1000
var drag_coefficient:= 0.5
var impulse:= 50000

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())
	if is_multiplayer_authority():
		$aimer.modulate = Globals.player_color

func _physics_process(delta):
	var drag:= -velocity.normalized() * drag_coefficient
	velocity += (movement + drag) * speed * delta
	move_and_slide()
	
func _unhandled_input(event):
	handle_player_move()


func handle_player_move():
	var horizontal:= Input.get_action_strength("right") - Input.get_action_strength("left")
	var vertical:= Input.get_action_strength("down") - Input.get_action_strength("up")
	var dir:= Vector2(horizontal,vertical).normalized()
	movement = dir
	
func handle_aim():
	var pos = get_local_mouse_position()
	var dir = (pos - position).normalized()
	
	
	
	
	
#	if Input.is_anything_pressed():
#		movement = dir
#	else:
#		if movement != -velocity.normalized():
#			movement = -velocity.normalized() * drag

