extends GridContainer

func equip(item):
	get_tree().current_scene.find_child("Player").current_item = item
