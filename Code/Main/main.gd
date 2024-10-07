extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")

func SpawnBubble():
	print("Spawning bubble.")
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(100, 200)
	add_child(bubble_instance)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SpawnBubble()
