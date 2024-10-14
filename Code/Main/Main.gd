extends Node
<<<<<<< Updated upstream

=======
class_name Main
#Bubbles
>>>>>>> Stashed changes
const BUBBLE = preload("res://Bubble/Bubble.tscn")
const BUBBLE2 = preload("res://Bubble/Bubble2.tscn")
#Different Things in Main
@onready var timer: Timer = $Timer
@onready var audio_player: AudioStreamPlayer2D = $AudioPlayer
@onready var score_ui: Label = $ScoreBoard/ScoreUI
@onready var bubble_node: Node2D = $BubbleNode

<<<<<<< Updated upstream
=======
var score = 0

#The Game Starts
>>>>>>> Stashed changes
func _ready() -> void:
	timer.timeout.connect(OnTimedOut)
	timer.wait_time = 0.25
	UpdateScore(0)
	
#Playing Bubble Pop
func PlaySound():
	audio_player.pitch_scale = randf_range(0.7, 1.3)
	audio_player.play()
	print("audio")


func OnTimedOut():
	SpawnBubble()
	GetNumber()
<<<<<<< Updated upstream
	
=======
>>>>>>> Stashed changes
	


func SpawnBubble():
	var bubble_instance = BUBBLE.instantiate()
	bubble_instance.main = self
	bubble_instance.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
	bubble_node.add_child(bubble_instance)
	
func SpawnSuperBubble():
	var bubble_instance2 = BUBBLE2.instantiate()
	bubble_instance2.main = self 
	bubble_instance2.position = Vector2(randf_range(0, get_viewport().size.x), get_viewport().size.y)
<<<<<<< Updated upstream
	add_child(bubble_instance2)

	
=======
	bubble_instance2.scale *= (randf_range(0.8, 1.2))
	bubble_instance2.rotation *= (randf_range(0.8, 1.2))
	#bubble_instance2.modulate = Color.CHARTREUSE
	bubble_node.add_child(bubble_instance2)

#Random Number 
>>>>>>> Stashed changes
func GetNumber():
	var number = randf_range(1, 100)
	if number>90:
		SpawnSuperBubble()
		


func UpdateScore(delta_score: int):
	score += delta_score
	score_ui.text = str(score)
	if score>100:
		print("100")

func UpdateScore2(delta_score: int):
	score -= delta_score
	score_ui.text = str(score)
	if score>100:
		print("100")
