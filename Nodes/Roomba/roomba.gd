class_name Roomba
extends CharacterBody2D

@export var move_speed:float = 100
@export var collision_area:Area2D
var movement:Vector2 = Vector2.ZERO

var garbage_capacity:float:
	get:
		return 60 + PowerupManager.get_bonus_capacity()
var garbage_collected:float = 400
var garbage_is_full:bool: 
	get:
		return garbage_collected == garbage_capacity


func _ready() -> void:
	GameData.Roomba = self
	GameEvents.PowerupCollected.connect(_on_powerup_collected)
	collision_area.area_entered.connect(_on_area_entered)

	GameEvents.EmitGarbageCollected()

func _process(_delta: float) -> void:
	movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = movement.normalized() * move_speed * PowerupManager.get_bonus_speed()
	move_and_slide()

func _on_area_entered(area: Area2D) -> void:
	if area is Obstacle:
		if garbage_is_full:
			return

		garbage_collected += 5
		GameEvents.EmitGarbageCollected()
		area.queue_free()

func _on_powerup_collected(powerup: Powerup) -> void:
	if powerup.type == Powerup.Type.CleaningArea:
		var collision_shape = collision_area.get_node("CollisionShape2D") as CollisionShape2D
		var new_circle_shape = CircleShape2D.new()
		new_circle_shape.radius = 10 * PowerupManager.get_bonus_cleaning_area()
		collision_shape.shape = new_circle_shape
