## The Network autoload.
extends Node

const PORT := 6769 # TODO: change
const MAX_CLIENTS := 8

func _ready() -> void:
	if DisplayServer.get_name() == "headless":
		setup_server()
		print("Started dedicated server on port ", PORT)

func setup_server():
	var peer := ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer
	peer.peer_connected.connect(_on_peer_connect)

func _on_peer_connect(id: int) -> void:
	print("Peer connected (id %s)" % id)
