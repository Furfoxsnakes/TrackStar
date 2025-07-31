extends Node

signal SpeedUp()
signal SlowDown()
signal GarbageCollected()

func EmitSpeedUp() -> void:
    emit_signal("SpeedUp")

func EmitSlowDown() -> void:
    emit_signal("SlowDown")

func EmitGarbageCollected() -> void:
    emit_signal("GarbageCollected")