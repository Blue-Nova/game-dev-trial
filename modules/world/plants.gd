extends TileMap

@onready var ground_tilemap = get_node("/root/world/ground")

var plant_node = preload("res://modules/plant/plant.tscn")

var active_plants = []

func _physics_process(_delta):
	if(Input.is_action_just_pressed("mb_right")):
		var new_pos = map_to_local(self.local_to_map(get_global_mouse_position()))
		
		# CHECK IF TILE ALREADY HAS A PLANT
		for plant_index in active_plants:
			if(new_pos == plant_index.position):
				print("Frame of plant: ",plant_index.frame)
				if(plant_index.frame >= 4):
					harvest(plant_index)
					active_plants.erase(plant_index)
				return
		
		plant(new_pos)

func plant(new_pos_plant):
	#CKECK IF TILE IS HOED
	var tile : Vector2 = local_to_map(get_global_mouse_position())
	var tile_atlas_coords = ground_tilemap.get_cell_atlas_coords(0,tile)
	if(!(tile_atlas_coords.x > 2 && tile_atlas_coords.y == 0)):
		return

	#PLANT A NEW PLANT
	var new_plant = plant_node.instantiate()
	self.add_child(new_plant)
	new_plant.init("strawberry")
	new_plant.position = new_pos_plant
	active_plants.append(new_plant)

func harvest(plant_harvest):
	plant_harvest.queue_free()
	
