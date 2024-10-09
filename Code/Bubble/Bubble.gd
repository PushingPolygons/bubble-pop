extends Node2D
class_name Bubble
var speed = randf_range(25,125)

func _process(delta: float) -> void:
	position.y -= speed * delta
	if position.y < 0:
		queue_free()

	

	
	
	
	



	





	
