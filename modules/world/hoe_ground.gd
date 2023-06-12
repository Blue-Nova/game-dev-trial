extends TileMap

func _physics_process(_delta):
	if(Input.is_action_just_pressed("mb_left")):
		var tile : Vector2 = local_to_map(get_global_mouse_position())
		var tile_atlas_coords = get_cell_atlas_coords(0,tile)
		if(tile_atlas_coords.x > 2 && tile_atlas_coords.y == 0):
			return
		var random = RandomNumberGenerator.new()
		random.randomize()
		set_cell(0,tile,0,Vector2(random.randi_range(3,4),0))
