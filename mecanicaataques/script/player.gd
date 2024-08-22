extends CharacterBody2D

@onready var animation = $AnimationPlayer
@onready var weapon = $WeaponFX
@export var projectile_node : PackedScene

@export var current_item : Item = null:
	set(value):
		current_item = value
		
		if current_item != null:
			if current_item.animation in ["sword"]:
				set_damage(current_item.damage)
			else:
				set_damage(1)

var speed : float = 200
var counter : int = 1
var time : float = 0
var can_move : bool = true:
	set(value):
		can_move = value
		if value == false:
			speed = 0
		else:
			speed = 200

func _physics_process(delta: float) -> void:
	if time > 0 :
		time -= delta
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down") * speed
	move_and_slide()

	if can_move:			
		if velocity == Vector2.ZERO:
			animation.play("idle")
		else:
			animation.play("run")

		if velocity.x < 0:
			$Sprite2D.flip_h = true
			$Weapon.flip_h = true
			$Hitbox.scale.x = -1
		elif velocity.x > 0:
			$Sprite2D.flip_h = false
			$Weapon.flip_h = false
			$Hitbox.scale.x = 1
		
func _input(event):
	if event.is_action_pressed("attack") and time <= 0:
		play_animation()

func combo(animation):
	if animation in ["sword", "fist"]:
		return "_" + str(counter)
	else:
		return ""

func play_animation():
	can_move = false
	time = 0.4
	if current_item == null:
		animation.play("fist" + combo("fist"))
	else:
		$Weapon.texture = current_item.texture
		weapon.play(current_item.animation + combo(current_item.animation))
		animation.play(current_item.animation + combo(current_item.animation))

	counter += 1
	if counter > 3:
		counter = 1
		
func set_damage(amount):
	$Hitbox.damage = amount

func _on_animation_finished(anim_name):
	can_move = true

func shoot_projectile():
	var projectile = projectile_node.instantiate()
	projectile.position = position
	projectile.set_direction($Sprite2D.flip_h, current_item.projectile)
	projectile.damage = current_item.damage
	get_tree().current_scene.add_child(projectile)
