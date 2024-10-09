extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
const BUBBLE2 = preload("res://Bubble/Bubble2.tscn")
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer



func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.3


func Sound():
	audio_player.play()
	print("Audio")
	
func OnTimedOut():
	SpawnBubble()
	GetNumber()
	Sound()

	
func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance)
	
func SpawnSuperBubble():
	var bubble_instance2 = BUBBLE2.instantiate()
	bubble_instance2.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance2)
	
func GetNumber():
	var number = randf_range(1, 100)
	if number>90:
		print("test")
		SpawnSuperBubble()

		