## The Network autoload.
extends Node

const PORT := 6769 # TODO: change
const MAX_CLIENTS := 8

func setup_client(address: String) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var result := peer.create_client(address, Network.PORT)
	if result != OK: return result
	multiplayer.multiplayer_peer = peer
	await multiplayer.connected_to_server
	return OK

func setup_server(playing: bool = false) -> Error:
	var peer := ENetMultiplayerPeer.new()
	var result := peer.create_server(PORT, MAX_CLIENTS)
	if result != OK: return result
	multiplayer.multiplayer_peer = peer
	peer.peer_connected.connect(_on_peer_connect)
	Server.init()
	if playing:
		Server.add_player(peer.get_unique_id())
	return OK

func _on_peer_connect(id: int) -> void:
	print("Peer connected (id %s)" % id)
	Server.add_player(id)
