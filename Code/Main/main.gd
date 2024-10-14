extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
var score = 0
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var score_ui: Label = $ScoreBoard/ScoreUI
@onready var bubble_node: Node2D = $BubbleNode

func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25

func OnTimedOut():
	SpawnBubble()
	#audio_player.play()

func PlaySound():
	audio_player.play()
	
func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	bubble_instance.scale *= randf_range(0.4, 1.2)
	bubble_instance.modulate = Color(randf_range(0.5, 1), randf_range(0, 0.5), randf_range(1, 1.5))
	bubble_node.add_child(bubble_instance)

func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)
