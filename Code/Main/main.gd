extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer2D


func _ready() -> void:
	#SpawnBubble()
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25

func PlaySound():
	audio_player.play()
	

func OnTimedOut():
	SpawnBubble()

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	bubble_instance.main = self
	add_child(bubble_instance)
	
	
