extends CharacterBody2D

@onready var animatedsprite = $AnimatedSprite2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animatedsprite.flip_h = false
	elif direction < 0:
		animatedsprite.flip_h = true
	
	# Animações
	if is_on_floor():
		if direction == 0:
			animatedsprite.play("idle")
		else :
			animatedsprite.play("run")
	else : 
		animatedsprite.play("jump")
			
	# Movimentação	
	if direction:
		velocity.x = direction * SPEED		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
