extends HBoxContainer

@onready var array = self.get_children()
@onready var selected_texture = $"%selected_texture"

var selected_index = 0;

func _physics_process(delta):
	if Input.is_action_just_released("inventory_up"):
		print("up")
		if selected_index >= array.size()-1:
			selected_index = array.size()-1
			return
		selected_index += 1
	
	if Input.is_action_just_released("inventory_down"):
		print("down")
		if selected_index <= 0:
			selected_index = 0
			return
		selected_index -= 1
		
	update_selected()

func update_selected():
	selected_texture.get_parent().remove_child(selected_texture)
	array[selected_index].add_child(selected_texture)
