class_name WeaponStats 
extends Item

#@export var Names :  = []
enum Weapon_Types {SWORD, KNIFE, AXE}

@export var Name : String 
var Category : String = "WEAPON"

@export var Weapon_level : int = 1

var Weapon_max_level :int = 100
var Weapon_experience : int 
var Weapon_experience_to_next_level : int = 10

@export var Health : int 
var Health_Rarity : int 
@export var Mana : int  
var Mana_Rarity : int 
@export var Damage : int 
var Damage_rarity : int 
@export var Defence : int 
var Defence_rarity : int 
@export var TotalRarity : String
@export var id: String

# item Creation
func _init() -> void:
	pass

# Exp and levels 

func Weapon_Level_up() -> void:
	if Weapon_experience >= Weapon_experience_to_next_level :
		Name = "Weapon_" + str(randi_range(0, Weapon_experience_to_next_level))
