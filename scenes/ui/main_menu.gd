extends Control

@export var address_input: LineEdit
@export var title: Label

signal done

func _on_host_pressed() -> void:
	Network.setup_server()
	done.emit()

func _on_join_pressed() -> void:
	var peer := ENetMultiplayerPeer.new()
	var result := peer.create_client(address_input.text, Network.PORT)
	if result == OK:
		multiplayer.multiplayer_peer = peer
		done.emit()
	else:
		title.text = "ERROR >:(" # TODO: actual error handling

func _on_quit_pressed() -> void:
	get_tree().quit()
