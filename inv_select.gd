extends HBoxContainer

@onready var array = self.get_children()
@onready var selected_texture = $"%selected_texture"

var selected_index = 0;

func _ready():
	print(array)
	print(array[0])
	print(array[1])
	print(array[2])
	print(array[3])
	print(array[4])

func _physics_process(delta):
	if Input.is_action_just_pressed("inventory_up"):
		print("up")
		select_up()
	if Input.is_action_just_pressed("inventory_down"):
		print("down")
		select_down()

func select_up():
	if selected_index >= array.size()-1:
		selected_index = array.size()-1
		return
	selected_index += 1
	update_selected()

func select_down():
	if selected_index <= 0:
		selected_index = 0
		return
	selected_index -= 1
	update_selected()

func update_selected():
	selected_texture.get_parent().remove_child(selected_texture)
	array[selected_index].add_child(selected_texture)
	print(selected_index)
	print(selected_texture.get_parent())
