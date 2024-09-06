class_name PressurePlate extends Node2D

signal activated
signal deactivated

var bodies: int = 0
var is_active: bool = false
var off_rect: Rect2

@onready var area: Area2D = $Area2D
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var audio_activate: AudioStream = preload("res://Interactables/Dungeon/lever-01.wav")
@onready var audio_deactivate: AudioStream = preload("res://Interactables/Dungeon/lever-02.wav")
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)
	off_rect = sprite.region_rect
	
func _on_body_entered(_b: Node2D) -> void:
	bodies += 1
	check_is_activated()
	pass
	
func _on_body_exited(_b: Node2D) -> void:
	bodies -= 1
	check_is_activated()
	pass
	
func check_is_activated() -> void:
	if bodies > 0 and is_active == false:
		is_active = true
		sprite.region_rect.position.x = off_rect.position.x - 32
		play_audio(audio_activate)
		activated.emit()
	elif bodies <= 0 and is_active == true:
		is_active = false
		sprite.region_rect.position.x = off_rect.position.x
		play_audio(audio_deactivate)
		deactivated.emit()
	pass

func play_audio(_stream: AudioStream) -> void:
	audio.stream = _stream
	audio.play()
	pass
