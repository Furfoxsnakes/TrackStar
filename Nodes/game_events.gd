extends Node

signal SpeedUp()
signal SlowDown()
signal GarbageCollected()
signal GarbageDroppedInHole()
signal ExperienceGained()

func EmitSpeedUp() -> void:
    emit_signal("SpeedUp")

func EmitSlowDown() -> void:
    emit_signal("SlowDown")

func EmitGarbageCollected() -> void:
    emit_signal("GarbageCollected")

func EmitGarbageDroppedInHole() -> void:
    emit_signal("GarbageDroppedInHole")

func EmitExperienceGained() -> void:
    emit_signal("ExperienceGained")