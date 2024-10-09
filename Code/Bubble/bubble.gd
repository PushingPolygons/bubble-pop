extends Area2D
class_name Bubble

func _ready() -> void:
	input_event.connect(OnClick)

func OnClick(viewport: Node, event, shape_id):
	#if(event.)
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				Pop();

func Pop():
	queue_free();

func _process(delta: float) -> void:
	position.y -= 100 * delta
	if position.y < 0:
		queue_free();
