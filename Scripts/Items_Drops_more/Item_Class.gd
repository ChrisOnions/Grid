@tool
class_name ItemResource
extends Resource
enum rarity { RED, GREEN, BLUE }


@export var name: String = "New Item"
@export var texture: Texture2D
@export var description: String = ""
@export var can_stack: bool = false 
@export var price :int = 1
@export var item_rarity_value: rarity 
