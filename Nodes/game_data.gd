extends Node

var Roomba:Roomba

var garbage_capacity:float = 60
var garbage_collected:float = 0.0
var garbage_is_full:bool: 
    get:
        return garbage_collected == garbage_capacity

func collect_garbage(amount: int) -> void:
    if garbage_is_full:
        return  # Ignore if garbage is full
    
    garbage_collected = min(garbage_collected + amount, garbage_capacity)
    GameEvents.EmitGarbageCollected()