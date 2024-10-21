extends Area2D
class_name Bubble

var audio: AudioStreamPlayer2D
var main: Main

func _ready() -> void:
	input_event.connect(OnClicked)

func OnClicked(_viewport, event, _shape):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				pop()
				main.IncreaseScore()
				print("Player clicked down.")
			else:
				print("Player Clicked Up.")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= 100 * delta

func pop():
	audio.position = position
	audio.play()
	queue_free()
