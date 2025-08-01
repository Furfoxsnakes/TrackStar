extends Node

@export var experience_curve:Curve
@export var max_experience:float = 9999
@export var max_level:int = 25
@export var current_level:int = 1
var experience:float = 0.0
var experience_for_next_level: float: 
	get:
		return get_experience_for_level(current_level)


func _ready() -> void:
	GameEvents.GarbageDroppedInHole.connect(_on_garbage_dropped_in_hole)


func _on_garbage_dropped_in_hole() -> void:
	experience = min(experience + GameData.Roomba.garbage_collected, max_experience)

	while experience >= experience_for_next_level:
		experience -= experience_for_next_level
		await level_up()

	GameEvents.EmitExperienceGained()


func get_experience_for_level(level: int) -> float:
	return experience_curve.sample_baked(float(level + 1) / float(max_level))

func level_up() -> void:
	current_level = min(current_level + 1, max_level)
	GameEvents.EmitLeveledUp()
	get_tree().paused = true
	await GameEvents.PowerupCollected
	# var powerup = Powerup.new(Powerup.Type.Speed)
	# PowerupManager.powerups.append(powerup)
	get_tree().paused = false
	print("Leveled up to level: ", current_level)
	
