extends Node2D
class_name Bubble

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= 100 * delta
	
	if position.y < -42:
		queue_free()
