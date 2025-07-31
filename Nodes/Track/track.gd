class_name Track
extends Node2D

@export var lanes:Array[Path2D] = []
@export var obstacle_spawn_timer:Timer
@export var obstacle_scene:PackedScene


func _ready() -> void:
	# spawn_obstacle()
	obstacle_spawn_timer.timeout.connect(_on_obstacle_spawn_timer_timeout)
	obstacle_spawn_timer.start()


func _on_obstacle_spawn_timer_timeout() -> void:
	spawn_obstacle(lanes.pick_random())


func spawn_obstacle(lane:Path2D) -> void:
	var obstacle_instance = obstacle_scene.instantiate()
	var curve_length = lane.curve.get_baked_length()
	var random_distance = randf() * curve_length
	var random_point = lane.curve.sample_baked(random_distance)
	obstacle_instance.position = random_point
	add_child(obstacle_instance)
