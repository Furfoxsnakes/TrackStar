extends Node

var Roomba:Roomba
var GarbageHole:GarbageHole

var Runners:Array[Runner] = []

# var garbage_capacity:float = 450
# var garbage_collected:float = 450
# var garbage_is_full:bool: 
#     get:
#         return garbage_collected == garbage_capacity

# func collect_garbage(amount: int) -> void:
#     if garbage_is_full:
#         return  # Ignore if garbage is full
    
#     garbage_collected = min(garbage_collected + amount, garbage_capacity)
#     GameEvents.EmitGarbageCollected()