extends Node
class_name Main

var score: int = 0
const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var score_ui: Label = $ScoreBoard/ScoreUI
@onready var audio_stream: AudioStreamPlayer2D = $AudioStream


func _ready() -> void:
	randomize()
	#spawnBubble()
	timer.timeout.connect(OnTimedOut)
func spawnBubble():
	var screenLen = randi_range(0, get_viewport().size.x)
	var spawnHeight = get_viewport().size.y + 100
	var bubble_instance = BUBBLE.instantiate()
	
	bubble_instance.position = Vector2(screenLen, spawnHeight)
	SizeOfBubble(bubble_instance)
	bubble_instance.main = self
	add_child(bubble_instance)

func OnTimedOut():
	spawnBubble()

func SizeOfBubble(bubble_instance):
	var randNum = randi_range(1,3)
	
	if (randNum == 1):
		bubble_instance.scale = Vector2(0.5, 0.5)
		bubble_instance.modulate = Color.BLUE_VIOLET
		bubble_instance.delta = 3
	elif (randNum == 2):
		bubble_instance.scale = Vector2(0.333, 0.333)
		bubble_instance.modulate = Color.DARK_SLATE_GRAY
		bubble_instance.delta = 1
	else:
		bubble_instance.scale = Vector2(0.25, 0.25)
		bubble_instance.delta = -3
	
func PlaySound():
	audio_stream.play()
	
func updateScore(score_delta: int):
	score += score_delta;
	score_ui.text = str(score)
