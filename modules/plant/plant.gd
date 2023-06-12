extends Sprite2D

@onready var grow_timer = $"grow_timer"

const strawberry_texture = preload("res://assets/art/tilesets/strawberry.png")

var age = 0
func init(_type):
	set_texture(strawberry_texture)


func _on_grow_timer_timeout():
	if(frame >= 3):
		grow_timer.stop()
	age+=1
	frame = age
