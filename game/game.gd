extends Node2D

var multiplayer_peer:= ENetMultiplayerPeer.new()


func _ready():
	if Globals.is_server:
		multiplayer_peer.create_server(4200)
		multiplayer_peer.peer_connected.connect(spawn_player)
	else: 
		multiplayer_peer.create_client(Globals.server_ip, 4200)
	
	multiplayer.multiplayer_peer = multiplayer_peer

func spawn_player(id: int):
	print("peer connected")
