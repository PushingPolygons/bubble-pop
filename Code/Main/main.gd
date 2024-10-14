extends Node
class_name Main

const BUBBLE = preload("res://Bubble/Bubble.tscn")
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var score = 0;
@onready var label: Label = $PanelContainer/Label
@onready var bubbly_nody: Node2D = $"bubbly nody"

func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.11
	UpdateScore(0)

func OnTimedOut():
	SpawnBubble()

func PlaySound():
	audio_stream_player_2d.play(0);
	
func UpdateScore(score_delta: int):
	score += score_delta;
	label.text = str(score);

func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self;
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y*1.1)
	bubble_instance.scale *= randf_range(0.5, 1.2)
	if randf_range(0,10) >= 5:
		bubble_instance.modulate = Color.AQUA;
	if randf_range(0,10) >= 5:
		bubble_instance.modulate = Color.MEDIUM_VIOLET_RED;
	if randf_range(0,10) >= 5:
		bubble_instance.modulate = Color.TRANSPARENT;
	 
	bubbly_nody.add_child(bubble_instance)
