extends Node

@export var main_menu: Control

func _on_main_menu_done() -> void:
	main_menu.queue_free()
