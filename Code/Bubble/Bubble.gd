extends Area2D
class_name Bubble

var spd: int = 100

func _ready():
	mouse_entered.connect(Pop_Bubble)

func _process(delta: float) -> void:
	position.y -= spd * delta
	#if Input.is_action_just_pressed("Pop"):
		#mouse_entered.connect(Pop_Bubble)
	if position.y < -50:
		queue_free();
func Pop_Bubble():
	if Input.is_action_just_pressed("Pop"):
		queue_free();
