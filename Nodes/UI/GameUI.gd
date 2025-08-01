class_name GameUI
extends CanvasLayer

@export var speed_up_button: Button
@export var slow_down_button: Button
@export var garbage_collected_progress_bar: ProgressBar
@export var garbage_capacity_label: Label
@export var experience_progress_bar: ProgressBar
@export var experience_label: Label

@export var runner_1_laps_label: Label
@export var runner_2_laps_label: Label
@export var runner_3_laps_label: Label
@export var runner_4_laps_label: Label

func _ready() -> void:
	speed_up_button.pressed.connect(_on_speed_up_pressed)
	slow_down_button.pressed.connect(_on_slow_down_pressed)
	GameEvents.GarbageCollected.connect(_on_garbage_collected)
	GameEvents.GarbageDroppedInHole.connect(_on_garbage_collected)
	GameEvents.ExperienceGained.connect(_on_experience_gained)
	GameEvents.PowerupCollected.connect(_on_powerup_collected)
	GameEvents.LapCompleted.connect(_on_lap_completed)
	update_experience_progress_bar()
	# _on_garbage_collected()	 # Initialize the progress bar value

func _on_speed_up_pressed() -> void:
	GameEvents.EmitSpeedUp()

func _on_slow_down_pressed() -> void:
	GameEvents.EmitSlowDown()

func _on_garbage_collected() -> void:
	update_garbage_collected_progress_bar()

func _on_garbage_dropped_in_hole() -> void:
	update_garbage_collected_progress_bar()

func _on_experience_gained() -> void:
	update_experience_progress_bar()

func _on_powerup_collected(_powerup: Powerup) -> void:
	update_garbage_collected_progress_bar()

func _on_lap_completed() -> void:
	update_laps_labels()

func update_garbage_collected_progress_bar() -> void:
	garbage_capacity_label.text = str(int(GameData.Roomba.garbage_collected)) + " / " + str(int(GameData.Roomba.garbage_capacity))
	garbage_collected_progress_bar.value = GameData.Roomba.garbage_collected / GameData.Roomba.garbage_capacity

func update_experience_progress_bar() -> void:
	experience_label.text = "Lvl "+ str(int(ExperienceManager.current_level)) + ": " + str(int(ExperienceManager.experience)) + " / " + str(int(ExperienceManager.experience_for_next_level))
	experience_progress_bar.value = ExperienceManager.experience / ExperienceManager.experience_for_next_level

func update_laps_labels() -> void:
	runner_1_laps_label.text = "Runner 1: " + str(GameData.Runners[0].laps_completed)
	runner_2_laps_label.text = "Runner 2: " + str(GameData.Runners[1].laps_completed)
	runner_3_laps_label.text = "Runner 3: " + str(GameData.Runners[2].laps_completed)
	runner_4_laps_label.text = "Runner 4: " + str(GameData.Runners[3].laps_completed)