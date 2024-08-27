class_name HitBox extends Area2D

signal damaged(damage: int)

func TakeDamage(hurt_box: HurtBox) -> void:
	damaged.emit(hurt_box)
