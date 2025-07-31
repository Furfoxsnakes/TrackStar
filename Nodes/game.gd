class_name Game
extends Node

static var Instance:Game

@export var Roomba:Roomba
@export var GarbageHole:GarbageHole

func _ready() -> void:
	if Instance:
		push_error("Game instance already exists!")
		return
	else:
		Instance = self