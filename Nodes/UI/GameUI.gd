class_name GameUI
extends CanvasLayer

@export var speed_up_button: Button
@export var slow_down_button: Button
@export var garbage_collected_progress_bar: ProgressBar

func _ready() -> void:
	speed_up_button.pressed.connect(_on_speed_up_pressed)
	slow_down_button.pressed.connect(_on_slow_down_pressed)
	GameEvents.GarbageCollected.connect(_on_garbage_collected)
	_on_garbage_collected()	 # Initialize the progress bar value

func _on_speed_up_pressed() -> void:
	GameEvents.EmitSpeedUp()

func _on_slow_down_pressed() -> void:
	GameEvents.EmitSlowDown()

func _on_garbage_collected() -> void:
	garbage_collected_progress_bar.value = GameData.garbage_collected / GameData.garbage_capacity
