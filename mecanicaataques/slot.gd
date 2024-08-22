extends PanelContainer
class_name Slot

@onready var textureRect = $TextureRect
@export var item : Item = null:
	set(value):
		item = value
		
		if get_parent().name == "Character":
			get_parent().equip(item)
		
		if value!= null:
			textureRect.texture = value.icon
		else:
			textureRect.texture = null

func get_preview():
	var preview_texture = TextureRect.new()
	preview_texture.texture = textureRect.texture
	preview_texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_texture.custom_minimum_size = Vector2(20,20)

	var preview = Control.new()
	preview.add_child(preview_texture)
	preview_texture.position = -0.5 * Vector2(20,20)
	
	return preview

func _get_drag_data(_at_position):
	set_drag_preview(get_preview())
	return self

func _can_drop_data(_pos, data):
	return data is Slot
	
func _drop_data(_at_position, data):
	var temp = item
	item = data.item
	data.item = temp
