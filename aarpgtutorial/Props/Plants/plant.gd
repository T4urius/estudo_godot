class_name Plant extends Node2D

func _ready() -> void:
	$HitBox.damaged.connect(TakeDamage)

func TakeDamage(_damage: int) -> void:
	queue_free()
