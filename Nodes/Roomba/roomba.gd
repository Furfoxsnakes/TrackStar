class_name Roomba
extends CharacterBody2D

@export var move_speed:float = 100
@export var collision_area:Area2D
var movement:Vector2 = Vector2.ZERO

var garbage_capacity:float = 0
var garbage_collected:float = 0
var garbage_is_full:bool: 
	get:
		return garbage_collected == garbage_capacity


func _ready() -> void:
	collision_area.area_entered.connect(_on_area_entered)

func _process(_delta: float) -> void:
	movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement.normalized() * move_speed * PowerupManager.get_bonus_speed()
	move_and_slide()

func _on_area_entered(area: Area2D) -> void:
	if area is Obstacle:
		if GameData.garbage_is_full:
			return
		
		GameData.garbage_collected += 5
		GameEvents.EmitGarbageCollected()
		area.queue_free()

