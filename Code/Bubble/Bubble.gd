extends Area2D
class_name Bubble

var main: Main
var spd: int = 100
var id: int 
var delta: int = 3

func _ready() -> void:
	randomize()
	id = randi()
	input_event.connect(OnClicked);

func _process(delta: float) -> void:
	position.y -= spd * delta
	if position.y < -50:
		queue_free();
func OnClicked(viewport, event, shape_id):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("Pop"):
			Pop()
func Pop():
	main.PlaySound()
	main.updateScore(delta)
	queue_free();
