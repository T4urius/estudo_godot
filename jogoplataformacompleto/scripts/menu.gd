class_name MainMenu

extends Control

@onready var btnExit = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var btnStart = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button

@onready var start_level = preload("res://scenes/game.tscn") as PackedScene

func _ready():
	btnStart.button_down.connect(on_start_pressed)
	btnExit.button_down.connect(on_exit_pressed)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)
	
func on_exit_pressed() -> void:
	get_tree().quit()
