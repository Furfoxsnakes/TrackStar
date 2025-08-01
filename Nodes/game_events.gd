extends Node

signal SpeedUp()
signal SlowDown()
signal GarbageCollected()
signal GarbageDroppedInHole()
signal ExperienceGained()
signal LeveledUp()
signal Powerupollected(powerup: Powerup)

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

func EmitLeveledUp() -> void:
    emit_signal("LeveledUp")

func EmitPowerupCollected(powerup: Powerup) -> void:
    emit_signal("Powerupollected", powerup)