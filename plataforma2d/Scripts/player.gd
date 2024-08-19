extends CharacterBody2D

# quando jogo for iniciado
#func _ready():
#	print('oi')

# enquanto o jogo estiver aberto (60x por sec)
var grav = 10;
var speed = 300;

func _process(delta):
	# gravidade
	if !is_on_floor():
		velocity.y += grav
		
	# andando para direita ao apertar a seta ->
	if Input.is_action_pressed("ui_right"):		
		velocity.x = speed
		$"Sprite2D/Duck(16x16)".flip_h = false
	# andando para esquerda ao apertar a seta <-
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$"Sprite2D/Duck(16x16)".flip_h = true
	else:
		velocity.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y -= speed
		
	move_and_slide()
