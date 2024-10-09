extends Area2D
class_name bubble

var main: Main = null

func _ready() -> void:
	input_event.connect(OnClicked)
	main.PlaySound()



func _process(delta: float) -> void:
	position.y -= 100 * delta
	if position.y < -140:
		queue_free()
		
@onready var audio_player: AudioStreamPlayer2D = $"../AudioPlayer"

func OnClicked(viewport, event, shape_id):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				print("click")
				Pop()
				audio_player.play()


func Pop():
	queue_free()
