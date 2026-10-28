class_name Game extends Node

@export var game: Node3D
@export var main_menu: Control

const PLAYER := preload("uid://bxxgouwsehtmc")

var level: Node

func _on_main_menu_done() -> void:
	main_menu.queue_free()

func _ready() -> void:
	if DisplayServer.get_name() == "headless":
		Network.setup_server()

@rpc("call_local")
func load_level(uid: String) -> void:
	if level: level.queue_free()
	level = load(uid).instantiate()
	level.add_child(PLAYER.instantiate())
	game.add_child(level)
