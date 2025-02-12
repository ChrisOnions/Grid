class_name Inventory
extends Node

const INVENTORY_SLOT_CONTAINER = preload("res://Scenes/Inventory/Inventory_slot_container.tscn")
const WISHING_STONE = preload("res://Resources/Items/Junk_sell/Wishing_Stone.tres")

@export var _Inventory : Array = []
@onready var inventory_items_container: GridContainer = $VBoxContainer/Inventory_items_container

var inventory_slots: Array = []
var Max_Slots : int = 9 

var _item_held_slot : ItemResource
var _item_crurrent_slot : ItemResource 

func _ready() -> void:
	initialise_inventory(Max_Slots)
	add_item_frist_avaliable(WISHING_STONE)
	add_item_frist_avaliable(WISHING_STONE)

func Clear_slots()-> void:
	#inventory_items_container.remove_child()
	for slots in inventory_items_container.get_children():
		inventory_items_container.remove_child(slots)

func initialise_inventory(value: int) -> void:
	Clear_slots()
	_Inventory.resize(Max_Slots)
	for i in range(value):
		var slot: Control = INVENTORY_SLOT_CONTAINER.instantiate()
		inventory_items_container.add_child(slot) 
		inventory_slots.append(slot)

func _on_inventory_item_click(slot: Control) -> void :
	print("signal slick" , slot)


func update_inventory() -> void:
	for i in range(_Inventory.size()):
		var item : ItemResource = _Inventory[i]
		var slot : Control = inventory_slots[i]
		if item != null:
			#slot.new_item_assigned_to_slot(item) Both ways are viable
			slot.slot_item = item 
			
		else:
			slot.get_node("Icon").texture = null

func add_item_frist_avaliable(item: ItemResource) -> bool:
	for i in range(Max_Slots):
		if _Inventory[i] == null:
			_Inventory[i] = item
			update_inventory()
			return true
	return false
