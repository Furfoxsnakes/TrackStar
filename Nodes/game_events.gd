extends Node

signal SpeedUp()
signal SlowDown()
signal GarbageCollected()
signal GarbageDroppedInHole()
signal ExperienceGained()
signal LeveledUp()
signal PowerupCollected(powerup: Powerup)
signal PauseGame()
signal ResumeGame()
signal LapCompleted()

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
    emit_signal("PowerupCollected", powerup)

func EmitPauseGame() -> void:
    emit_signal("PauseGame")

func EmitResumeGame() -> void:
    emit_signal("ResumeGame")

func EmitLapCompleted() -> void:
    emit_signal("LapCompleted")