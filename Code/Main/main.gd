extends Node
class_name Main

const BUBBLE = preload("res://Bubble/bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio = $Audio

func SpawnBubble():
	print("Spawning bubble.")
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(randf()*300, randf()*300)
	add_child(bubble_instance)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25
	#SpawnBubble()

func OnTimedOut():
	var instance = BUBBLE.instantiate()
	instance.position = Vector2(randf_range (100, get_viewport().size.x - 100), randf_range(300, get_viewport().size.y))
	instance.audio = audio
	instance.position.x = randi_range(0, get_viewport().size.x)
	instance.position.y = get_viewport().size.y
	add_child(instance)
