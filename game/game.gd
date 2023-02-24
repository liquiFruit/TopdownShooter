extends Node2D

const PLAYER_PREFAB : PackedScene = preload("res://players/player.tscn")
var multiplayer_peer:= ENetMultiplayerPeer.new()


func _ready():
	if Globals.is_server:
		multiplayer_peer.create_server(4200)
		multiplayer_peer.peer_connected.connect(spawn_player)
		spawn_player(1)
	else: 
		multiplayer_peer.create_client(Globals.server_ip, 4200)
	
	multiplayer.multiplayer_peer = multiplayer_peer

func spawn_player(id: int):
	var player = preload("res://players/player.tscn").instantiate()
	player.name = str(id)
	player.position = randf_range(-500, 500) * Vector2(randf(), randf()).normalized()
	$Players.add_child(player)
