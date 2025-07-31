class_name Roomba
extends CharacterBody2D

@export var move_speed:float = 100
@export var collision_area:Area2D
var movement:Vector2 = Vector2.ZERO

func _ready() -> void:
	collision_area.area_entered.connect(_on_area_entered)

func _process(_delta: float) -> void:
	movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement.normalized() * move_speed * get_movement_speed_bonus()
	move_and_slide()

func _on_area_entered(area: Area2D) -> void:
	if area is Obstacle:
		if GameData.garbage_is_full:
			return
		
		GameData.garbage_collected += 5
		GameEvents.EmitGarbageCollected()
		area.queue_free()


func get_movement_speed_bonus() -> float:
	var speed_bonus_multiplier = 1.0

	for powerup in PowerupManager.powerups:
		if powerup.type == Powerup.Type.Speed:
			speed_bonus_multiplier += 0.15

	return speed_bonus_multiplier
