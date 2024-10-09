extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.24

func OnTimedOut():
	SpawnBubble()

func PlaySound():
	audio_stream_player_2d.play(0);

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self;
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y*1.1)
	add_child(bubble_instance)
