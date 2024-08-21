extends Node2D

const speed = 60

var direction = 1
@onready var animatedsprite = $AnimatedSprite2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animatedsprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animatedsprite.flip_h = false
	position.x += direction * speed * delta
	
