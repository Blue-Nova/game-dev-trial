extends Control

var selected_index = 0;

const selected_texture = preload("res://assets/art/tilesets/slot_selected.png")
const slot = preload("res://modules/UI/slot.tscn")

@onready var selected = $selected_texture
@onready var h_box_container = $HBoxContainer

func _ready():
	var inv_data = preload("res://modules/player/player_inventory.tres")
	populate_item_container(inv_data.slot_datas)



func populate_item_container(slot_datas: Array[SlotData]):
	for child in h_box_container.get_children():
		child.queue_free()
	
	for slot_data in slot_datas:
		var new_slot = slot.instantiate()
		h_box_container.add_child(new_slot)
		
		if slot_data:
			new_slot.set_slot_data(slot_data)
	
	selected.get_parent().remove_child(selected)
	h_box_container.get_children()[0].add_child(selected)


func _physics_process(_delta):
	#MOVE THE SELECTED ITEM IN INVENTORY ON MOUSE SCROLL
	if Input.is_action_just_released("inventory_up"):
		var array = self.get_children()
		if selected_index >= array.size()-1:
			selected_index = 0
			return
		selected_index += 1
		update_selected()
	
	if Input.is_action_just_released("inventory_down"):
		var array = self.get_children()
		if selected_index <= 0:
			selected_index = array.size()-1
			return
		selected_index -= 1
		update_selected()
	

func update_selected():
	selected_texture.get_parent().remove_child(selected)
	h_box_container.get_children()[selected_index].add_child(selected)
