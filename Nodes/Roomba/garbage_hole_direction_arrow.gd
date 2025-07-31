class_name GarbageHoleDirectionArrow
extends Node2D


@export var camera: Camera2D

var screen_size: Vector2


func _ready() -> void:
	screen_size = camera.get_viewport().get_visible_rect().size


func _process(_delta: float) -> void:
	point_to_garbage_hole(Game.Instance.GarbageHole)


func point_to_garbage_hole(garbage_hole: Node2D) -> void:
	
	# the arrow should move to the edge of the screen close to the garbage hole
	var direction: Vector2 = get_parent().global_position.direction_to(garbage_hole.global_position)
	# var direction: Vector2 = garbage_hole.global_position.direction_to(global_position)
	# var offset = global_position.distance_to(garbage_hole.global_position) / 2
	var offset = 300
	var target_position: Vector2 = garbage_hole.global_position + direction * (screen_size.length() / 2 - offset)
	# position = target_position
	position.x = clampf(target_position.x, -screen_size.x / 2 + 10, screen_size.x / 2 - 10)
	position.y = clampf(target_position.y, -screen_size.y / 2 + 10, screen_size.y / 2 - 10)

	look_at(garbage_hole.global_position)