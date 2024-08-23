class_name State_Attack extends State

var attacking : bool = false

@export var attack_sound : AudioStream
@export_range(1,20,0.5) var decelerate_speed : float = 5.0

@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var attack_anim : AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var animation : AnimationPlayer = $"../../AnimationPlayer"

@onready var idle : State = $"../Idle"
@onready var walk : State = $"../Walk"


func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_anim.play("attack_" + player.AnimDirection())
	animation.animation_finished.connect(EndAttack)
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	
	attacking = true
	pass
	
func Exit() -> void:
	animation.animation_finished.disconnect(EndAttack)
	attacking = false
	pass
	
func Process(_delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
func Physics(delta: float) -> State:
	return null

func HandleInput(event: InputEvent) -> State:
	return null

func EndAttack(_newAnimName: String) -> void:
	attacking = false
