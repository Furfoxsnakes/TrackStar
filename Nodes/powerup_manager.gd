extends Node

@export var powerups:Array[Powerup] = []

func get_bonus_speed() -> float:
    var speed_bonus:float = 1.0

    for powerup in powerups:
        if powerup.type == Powerup.Type.Speed:
            speed_bonus += 0.15

    return speed_bonus


func get_bonus_capacity() -> int:
    var capacity_bonus:int = 0

    for powerup in powerups:
        if powerup.type == Powerup.Type.Capacity:
            capacity_bonus += 60

    return capacity_bonus


func get_bonus_cleaning_area() -> float:
    var cleaning_area_bonus:float = 1.0

    for powerup in powerups:
        if powerup.type == Powerup.Type.CleaningArea:
            cleaning_area_bonus += 0.15

    return cleaning_area_bonus