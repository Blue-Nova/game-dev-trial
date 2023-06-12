extends CharacterBody2D
@export var speed = 50

var PLAYER_INVENTORY = {}

func _physics_process(_delta):
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
