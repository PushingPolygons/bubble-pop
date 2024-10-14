extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#SpawnBubble()
	timer.timeout.connect(OnTimesOut)
	timer.wait_time = 0.25


func PlaySound():
	audio_player.play()

func OnTimesOut():
	SpawnBubble()
	#audio_player.play()
