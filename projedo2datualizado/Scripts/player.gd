extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var event = $InputEventKey

var grav = 10
var speed = 300

func _process(delta):
	if Input.is_action_pressed("ui_text_completion_replace"):
		animation.play("invi")
	else:
		if !is_on_floor():
			velocity.y += grav
				
		if Input.is_action_pressed("space"):
			$AudioStreamPlayer2D.stop()
			animation.play("attack")
		elif abs(velocity.x) > 0.0:
			animation.play("walk")
			
		else:
			animation.play("idle")
			
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			$Sprite2D.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			velocity.x = -speed
			$Sprite2D.flip_h = true
		else:
			velocity.x = 0
		
		if is_on_floor() and Input.is_action_just_pressed("ui_up"):
			animation.play("jump")
			velocity.y -= 300	
		
	move_and_slide()
