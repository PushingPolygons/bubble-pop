extends Area2D
class_name Bubble
var main: Main

func Pop():
	queue_free()
	main.PlaySound()

func OnClicked(viewport, event, shape_index):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				Pop()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_event.connect(OnClicked)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= 100 * delta
	
	if position.y < -42:
		queue_free()
