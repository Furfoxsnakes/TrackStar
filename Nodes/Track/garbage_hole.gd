class_name GarbageHole
extends Area2D

func _ready() -> void:
	GameData.GarbageHole = self
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is Roomba:
		GameEvents.EmitGarbageDroppedInHole()
		GameData.Roomba.garbage_collected = 0
		GameEvents.EmitGarbageCollected()
