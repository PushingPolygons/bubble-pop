extends Area2D
class_name Bubble

var shake: bool;
var killtimer: float;

var main: Main;

func _ready() -> void:
	killtimer = 0;
	input_event.connect(OnClick)
	

func OnClick(viewport: Node, event, shape_id):
	#if(event.)
	
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				Pop();
	else:
		shake = true;
		

func Pop():
	killtimer = .2;
	#queue_free();

func _process(delta: float) -> void:
	if (killtimer < 0):
		main.UpdateScore(1);
		main.PlaySound()
		queue_free()
	if(killtimer > 0):
		scale.x += delta * 5;
		scale.y += delta * 5;
		killtimer -= delta;
		
	if shake:
		position.x += randf_range(-100,100) * delta;
		position.y += randf_range(-100,100) * delta;
		shake = false;

	position.y -= 100 * delta
	if position.y < -50:
		queue_free();
