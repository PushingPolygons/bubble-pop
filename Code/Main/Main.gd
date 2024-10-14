extends Node

const BUBBLE = preload("res://Bubble/Bubble.tscn")
const BUBBLE2 = preload("res://Bubble/Bubble2.tscn")
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer

func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25


func PlaySound():
	audio_player.play()
	print("audio")
	
func OnTimedOut():
	SpawnBubble()
	GetNumber()
	
	
func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance)
	
func SpawnSuperBubble():
	var bubble_instance2 = BUBBLE2.instantiate()
	bubble_instance2.main = self 
	bubble_instance2.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	add_child(bubble_instance2)

	
func GetNumber():
	var number = randf_range(1, 100)
	if number>90:
		SpawnSuperBubble()
		


		
