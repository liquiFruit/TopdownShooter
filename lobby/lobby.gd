extends Control

@onready var server_ip = $CenterContainer/VBoxContainer/ConnectionInfo/ServerAddress
@onready var color_slider = $CenterContainer/VBoxContainer/CharacterCustomisation/VBoxContainer/PlayerColorSlider
@onready var sprite_preview = $CenterContainer/VBoxContainer/CharacterCustomisation/SpritePreview


func _load_game():
	Globals.server_ip = server_ip.text
	Globals.is_server = server_ip.text == "localhost"
	Globals.player_color = sprite_preview.modulate
	get_tree().change_scene_to_file("res://game/game.tscn")


func _on_player_color_slider_value_changed(value):
	sprite_preview.modulate = Color.from_hsv(value/100.0, 1, 1)
