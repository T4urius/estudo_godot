class_name PlayerInteractionHost extends Node2D

@onready var player: Player = $".."

func _ready():
	player.DirectionChanged.connect(UpdateDirection)

func UpdateDirection(new_direction : Vector2) -> void:
	match new_direction:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = -90
		_:
			rotation_degrees = 0
