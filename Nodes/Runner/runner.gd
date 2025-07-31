class_name Runner
extends PathFollow2D

@export var base_speed: float = 100
@export var max_movespeed_multiplier: float = 3.5
@export var min_movespeed_multiplier: float = 0.5
@export var collision_area: Area2D
@export var tripped_timer:Timer

var current_speed_multiplier: float = 1.0

func _ready() -> void:
	GameEvents.SpeedUp.connect(_on_speed_up)
	GameEvents.SlowDown.connect(_on_slow_down)
	collision_area.area_entered.connect(_on_area_entered)
	tripped_timer.timeout.connect(_on_tripped_timer_timeout)

func _process(delta: float) -> void:
	progress += base_speed * current_speed_multiplier * delta
	
func _on_speed_up() -> void:
	if !tripped_timer.is_stopped():
		return  # Ignore speed up if tripped
	
	current_speed_multiplier = min(current_speed_multiplier + 0.25, max_movespeed_multiplier)

func _on_slow_down() -> void:
	if !tripped_timer.is_stopped():
		return  # Ignore slow down if tripped
	
	# Ensure we don't go below the minimum speed multiplier
	current_speed_multiplier = max(current_speed_multiplier - 0.25, min_movespeed_multiplier)

func _on_area_entered(area:Area2D) -> void:
	if area is Obstacle:
		current_speed_multiplier = 0.25
		tripped_timer.start()

func _on_tripped_timer_timeout() -> void:
	current_speed_multiplier = 1
