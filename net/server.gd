extends Node

var players: Array[int] = []

func init() -> void:
	print("Started server on port ", Network.PORT)

func add_player(id: int) -> void:
	players.push_back(id)
	get_tree().current_scene.load_level.rpc_id(id, "uid://cl2yhoq64cfkm")
