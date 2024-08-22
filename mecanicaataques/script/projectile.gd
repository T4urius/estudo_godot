extends Area2D

var direction : Vector2 = Vector2.RIGHT
var damage : float = 1

func set_direction(flip_direction, frame):
	$Sprite2D.flip_h = flip_direction
	$Sprite2D.frame = frame
	if flip_direction == false:
		direction = Vector2.RIGHT
	else:
		direction = Vector2.LEFT

func _physics_process(delta: float) -> void:
	position += direction * 200 * delta

func _on_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
