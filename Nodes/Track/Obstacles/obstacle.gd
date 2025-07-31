class_name Obstacle
extends Area2D

func _ready() -> void:
    input_event.connect(_on_input_event)


func _on_input_event(viewport:Node, event:InputEvent, shape_idx:int) -> void:
    if event is InputEventMouseButton and event.pressed:
        queue_free()
