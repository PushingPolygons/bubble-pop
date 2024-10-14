extends Area2D
class_name Bubble2
var speed = randf_range(25,125)
@onready var timer: Timer = $Timer


var main: Main

func _ready() -> void:
	input_event.connect(OnClicked)

func _process(delta: float) -> void:
	position.y -= speed * delta
	if position.y < 0:
		queue_free()

func OnClicked(viewport, event, shape_id):
	if event is InputEventMouseButton:				
				main.PlaySound()
				Pop()

func Pop():
	queue_free()

	
	