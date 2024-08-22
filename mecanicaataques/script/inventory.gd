extends GridContainer

@onready var slots = get_children()

func _ready():
	add_item(load("res://script/resource/Bow.tres"))
	add_item(load("res://script/resource/KnightSword.tres"))
	add_item(load("res://script/resource/SoldierSword.tres"))
	add_item(load("res://script/resource/Tome.tres"))

func add_item(item: Item):
	for slot in slots:
		if slot.item == null:
			slot.item = item
			return
		print("Não é possível adicionar outro item...")

func remove_item(item: Item):
	for slot in slots:
		if slot.item == item:
			slot.item = null
			return
	print("Item não encontrado")
