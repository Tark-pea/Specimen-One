extends MeshInstance3D

var playersList = []
var player_count = -10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		playersList.append(body)
		player_count = Network.players.size()
		if playersList.size() == player_count:
			print("Start Game")


func _on_button_area_3d_body_exited(body: Node3D) -> void:
	playersList.pop_at(playersList.find(body))
