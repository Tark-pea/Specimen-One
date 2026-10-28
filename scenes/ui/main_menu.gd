extends Control

@export var address_input: LineEdit
@export var title: Label

signal done

func _on_host_pressed() -> void:
	var result := Network.setup_server(true)
	if result == OK:
		done.emit()
	else:
		title.text = "ERROR >:(" # TODO: actual error handling

func _on_join_pressed() -> void:
	var address := address_input.text
	var result := await Network.setup_client("127.0.0.1" if address == "" else address)
	if result == OK:
		done.emit()
	else:
		title.text = "ERROR >:(" # TODO: actual error handling

func _on_quit_pressed() -> void:
	get_tree().quit()
