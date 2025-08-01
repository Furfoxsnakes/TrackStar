class_name LevelUpUI
extends CanvasLayer

@export var speed_increse_button: Button
@export var capacity_increse_button: Button
@export var cleaning_area_increse_button: Button

func _ready() -> void:
    speed_increse_button.pressed.connect(_on_speed_increase_pressed)
    capacity_increse_button.pressed.connect(_on_capacity_increase_pressed)
    cleaning_area_increse_button.pressed.connect(_on_cleaning_area_increase_pressed)

func _on_speed_increase_pressed() -> void:
    PowerupManager.powerups.append(Powerup.new(Powerup.Type.Speed))

func _on_capacity_increase_pressed() -> void:
    PowerupManager.powerups.append(Powerup.new(Powerup.Type.Capacity))

func _on_cleaning_area_increase_pressed() -> void:
    PowerupManager.powerups.append(Powerup.new(Powerup.Type.CleaningArea))