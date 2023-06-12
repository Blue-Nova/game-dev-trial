extends PanelContainer
@onready var item_texture = $MarginContainer/item_texture
@onready var amount_label = $amount_label


func set_slot_data(slot_data: SlotData):
	var item_data = slot_data.item_data
	item_texture.texture = item_data.texture
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	
	if slot_data.quantity > 1:
		amount_label.text = "%s" % slot_data.quantity
		amount_label.show()
