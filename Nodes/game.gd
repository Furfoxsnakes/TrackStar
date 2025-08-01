class_name Game
extends Node

func _ready() -> void:
	get_tree().paused = true	


func start_game() -> void:
	get_tree().paused = false
