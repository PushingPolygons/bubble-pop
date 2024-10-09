extends Node
class_name Main

const BUBBLE = preload("res://Bubble/bubble.tscn")
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#SpawnBubble()
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y + 42)
	add_child(bubble_instance)

func OnTimedOut():
	SpawnBubble()
