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