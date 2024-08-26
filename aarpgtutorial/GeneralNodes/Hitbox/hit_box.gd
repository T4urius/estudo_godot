class_name HitBox extends Area2D

signal damaged(damage: int)

func TakeDamage(damage: int) -> void:
	print("TakeDamage ", damage)
	damaged.emit(damage)
