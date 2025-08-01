class_name LevelUpUI
extends CanvasLayer

@export var speed_increse_button: Button
@export var capacity_increse_button: Button
@export var cleaning_area_increse_button: Button

func _ready() -> void:
	speed_increse_button.pressed.connect(_on_speed_increase_pressed)
	capacity_increse_button.pressed.connect(_on_capacity_increase_pressed)
	cleaning_area_increse_button.pressed.connect(_on_cleaning_area_increase_pressed)
	GameEvents.LeveledUp.connect(_on_leveled_up)
	GameEvents.PowerupCollected.connect(_on_powerup_collected)

func _on_speed_increase_pressed() -> void:
	PowerupManager.add_powerup(Powerup.new(Powerup.Type.Speed))

func _on_capacity_increase_pressed() -> void:
	PowerupManager.add_powerup(Powerup.new(Powerup.Type.Capacity))

func _on_cleaning_area_increase_pressed() -> void:
	PowerupManager.add_powerup(Powerup.new(Powerup.Type.CleaningArea))

func _on_leveled_up() -> void:
	visible = true

func _on_powerup_collected(_powerup: Powerup) -> void:
	visible = false
