extends Node
class_name Main

const BUBBLE = preload("res://bubble/bubble.tscn")
@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 1

func OnTimedOut():
	spawnbubble()
	
	

func spawnbubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance)
