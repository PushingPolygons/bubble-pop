extends Area2D
class_name Bubble2
var speed = randf_range(25,125)
@onready var timer: Timer = $Timer


var main: Main

func _ready() -> void:
	input_event.connect(OnClicked)

#When Off Screen Bubble Deletes
func _process(delta: float) -> void:
	position.y -= speed * delta
	if position.y < 0:
		queue_free()
<<<<<<< Updated upstream
=======
		main.UpdateScore2(3)
>>>>>>> Stashed changes

func OnClicked(viewport, event, shape_id):
	if event is InputEventMouseButton:
				main.PlaySound()
				Pop()
				main.UpdateScore(3)
				print("SuperBubble")

func Pop():
	queue_free()

	
	
