extends NinePatchRect

@onready var control: NinePatchRect = $"."

var  is_hovering :bool = false

func _ready() -> void:
	control.connect("mouse_entered", _on_mouse_Control_entered)
	control.connect("mouse_exited",_on_mouse_exited)
	#connect("gui_input", Callable(self, "_gui_input"))

func _gui_input(event: InputEvent) -> void:
		if event.is_action_pressed("Left_Mouse_Click"):
			SignalBus.emit_signal("inventory_item_click", self)

func _on_mouse_Control_entered() -> void:
	is_hovering = true
	await get_tree().create_timer(2.0).timeout
	if is_hovering:
		print("Hover effect triggered!")

func _on_mouse_exited() -> void:
	is_hovering = false
