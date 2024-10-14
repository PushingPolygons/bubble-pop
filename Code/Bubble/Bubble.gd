extends Area2D
class_name Bubble

var main: Main

var speed = randf_range(25,125)
@onready var timer: Timer = $Timer

<<<<<<< Updated upstream

=======
#When Bubble Clicked Deleted and sound played
>>>>>>> Stashed changes
func _ready() -> void:
	input_event.connect(OnClicked)
	
#If The Bubble Off Screen It gets Deleted
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
func Pop():
	queue_free()
	
