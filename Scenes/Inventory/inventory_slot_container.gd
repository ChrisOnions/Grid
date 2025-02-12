extends NinePatchRect

@onready var control: NinePatchRect = $"."
@onready var icon: TextureRect = $Icon

var  is_hovering :bool = false
var slot_item: ItemResource = null: set = new_item_assigned_to_slot

func _ready() -> void:
	control.connect("mouse_entered", _on_mouse_Control_entered)
	control.connect("mouse_exited",_on_mouse_exited)

func _gui_input(event: InputEvent) -> void:
		if event.is_action_pressed("Left_Mouse_Click"):
			SignalBus.emit_signal("inventory_item_click", self)

func _on_mouse_Control_entered() -> void:
	is_hovering = true
	await get_tree().create_timer(2.0).timeout
	if is_hovering:
		_on_item_hover()

func _on_item_hover() -> void :
	print("Name : " , slot_item.name)
	print("Description : " , slot_item.description)
	print("Stack Size : " , slot_item.can_stack)
	print("price : " , slot_item.price)
	print("rarity : " , slot_item.item_rarity_value)
	#print(str(slot_item.item_rarity_value)
	

func _on_mouse_exited() -> void:
	is_hovering = false

func new_item_assigned_to_slot(new_slot_item: ItemResource) -> void : 
	if slot_item == null:
		slot_item = new_slot_item
		icon.texture = new_slot_item.texture
		print("container set hit ")
	else: 
		pass
