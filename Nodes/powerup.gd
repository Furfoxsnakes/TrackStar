class_name Powerup
extends Resource

enum Type {
	Speed,
	Capacity,
	CleaningArea
}

@export var name:String
@export var description:String
@export var type:Type


func _init(type:Type) -> void:
    self.type = type