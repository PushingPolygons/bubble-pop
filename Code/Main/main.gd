extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#SpawnBubble()
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25 #seconds

func OnTimedOut():
	SpawnBubble()

#func _process(delta: float) -> void:
	#pass

#Function to create a bubble instance and spawn or
#instantiate a new bubble. 
func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance)
