extends Node2D
class_name Bubble

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= 100 * delta
