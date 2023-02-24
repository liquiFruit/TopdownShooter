extends CharacterBody2D


func _enter_tree():
	set_multiplayer_authority(str(name).to_int())
	if is_multiplayer_authority():
		$aimer.modulate = Globals.player_color
