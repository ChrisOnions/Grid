extends NinePatchRect


@onready var inventory_container: NinePatchRect = $"."
@onready var panel_spacing: HBoxContainer = $Panel_Spacing

@onready var character_stats: NinePatchRect = $Panel_Spacing/Character_Stats
@onready var equipment: NinePatchRect = $Panel_Spacing/Equipment
@onready var inventory: NinePatchRect = $Panel_Spacing/Inventory
@onready var chest: NinePatchRect = $Panel_Spacing/Chest

func _ready() -> void:
	pass

func _input(event: InputEvent)-> void:
	if event.is_action_pressed("I_KEY"):
		character_stats.visible = true
		equipment.visible = true
		inventory.visible = true
		chest.visible = false
		self.inventory_container.visible = !self.inventory_container.visible

func Open_Container()-> void:
		#if event.is_action_pressed("E_KEY"):
		character_stats.visible = false
		equipment.visible = true
		inventory.visible = true
		chest.visible = true
