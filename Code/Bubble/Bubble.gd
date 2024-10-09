extends Area2D
class_name Bubble

var main: Main
var spd: int = 100
var id: int 

func _ready() -> void:
	randomize()
	id = randf()
	input_event.connect(OnClicked);

func _process(delta: float) -> void:
	position.y -= spd * delta
	if position.y < -50:
		queue_free();
func OnClicked(viewport, event, shape_id = randi()):
	if event is InputEventMouseButton:
		if Input.is_action_pressed("Pop"):
			print(str(shape_id))
			Pop()
		else:
			return
func Pop():
	main.PlaySound()
	queue_free();
