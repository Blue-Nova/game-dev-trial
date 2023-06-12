class_name Item_List extends Node

enum item_type {plant, material, tool}

var item_dic = {}

func _ready():
	#REGISTER NEW ITEMS HERE
	register_item("strawberry_seed", "Strawberry Seeds", 10, item_type.plant, true)
	register_item("strawberry", "Strawberry", 5, item_type.material, true)
	register_item("wood_hoe", "Wooden Hoe", 25, item_type.tool, false)


func register_item(ID: String, item_name: String, value: int, type: item_type, stackable: bool):
	item_dic[ID] = {"ID" = ID, "name" = item_name, "value" = value,"type" = type, "stackable" = stackable}
