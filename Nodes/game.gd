class_name Game
extends Node

func _ready() -> void:
	GameEvents.PauseGame.connect(_on_pause_game)
	GameEvents.ResumeGame.connect(_on_resume_game)

func _on_pause_game() -> void:
	set_process(false)

func _on_resume_game() -> void:
	set_process(true)