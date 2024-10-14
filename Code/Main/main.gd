extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var score_ui: Label = $ScoreBoard/ScoreUI
@onready var bubble_node: Node2D = $BubbleNode

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	UpdateScore(0)
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25 #seconds

func PlaySound(bubble_position):
	audio_player.position = bubble_position
	audio_player.pitch_scale = randf_range(0.7, 1.3)
	audio_player.play()

func OnTimedOut():
	SpawnBubble()
	#audio_player.play()

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	bubble_instance.scale *= randf_range(0.8, 1.2)
	bubble_instance.modulate = Color(randf_range(0, 1),randf_range(0, 1),randf_range(0, 1))
	bubble_node.add_child(bubble_instance) #This adds every bubble instance to BubbleNode

func UpdateScore(delta_score: int):
	score += delta_score 
	score_ui.text = str(score)
