extends Area2D
class_name Bubble

var main: Main

func _ready() -> void:
	input_event.connect(OnClicked)



func _process(delta: float) -> void:
	position.y -= 100 * delta
	if position.y < 0:
		queue_free()

func OnClicked(_viewport, event, shape_id):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Click Me!")
				Pop()

func Pop():
	main.PlaySound()
	main.UpdateScore(3)
	queue_free()
	
