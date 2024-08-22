extends CharacterBody2D

@export var damage_node : PackedScene

func take_damage(amount):
	var damage = damage_node.instantiate()
	damage.find_child("Label").text = str(amount)
	damage.position = position
	get_tree().current_scene.add_child(damage)
	
	print(amount)
