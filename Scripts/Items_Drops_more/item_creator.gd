class_name Item
extends Node

const AXE = preload("res://Assets/Axe.png")
const SWORD = preload("res://Assets/FireSword.jpg")
const KNIFE = preload("res://Assets/knife.png")

var Weapon_names: Dictionary = {1: "Sword",2: "Axe",3: "Knife" }

func Create_new_item() -> Dictionary:
	var name : String = Weapon_names.values()[randi() % Weapon_names.size()]
	var item : Dictionary = {
"Name" : name,
"id": str(UUID()),
"Image" : Set_Image(name),
"Damage_increase_amount" : increase_amount(),
'Health_increase_amount': increase_amount(),
'Mana_increase_amount' : increase_amount(),
'Defence_increase_amount' : increase_amount()}
	return item

func increase_amount()-> Dictionary:
	var Rarity : String = Rarity_Detrminator()
	var DamageNumber : int 
	match Rarity:
		"Common" :
			DamageNumber = randi_range(1, 2)
		"Uncommon" :
			DamageNumber = randi_range(2, 4)
		"Rare" :
			DamageNumber = randi_range(4, 8)
		"Epic" :
			DamageNumber = randi_range(8, 12)
		"Legendary" :
			DamageNumber = randi_range(12, 24)
		"Etherial" :
			DamageNumber = randi_range(32, 24)
		_:
			DamageNumber = 1
	return {
			"Rarity" : Rarity,
			"Increase_amount" : DamageNumber
			}
func Rarity_Detrminator() -> String:
	var Randomiser: float = randf() * 100
	if Randomiser < 1.0 :
		return "Legendary"
	elif Randomiser >= 99.9:
		return "Etherial"
	elif 1.0 <= Randomiser and Randomiser <= 10.0:
		return "Epic"
	elif 10.0 <= Randomiser and Randomiser <= 30.0:
		return "Rare"
	elif 30.0 <= Randomiser and Randomiser <= 50.0:
		return "Uncommon"
	elif 50.0 <= Randomiser and Randomiser <= 99.9:
		return "Common"
	else :
		return "Common"


func UUID() -> String:
	return str(Time.get_ticks_msec()) + str(randi() % 1000)

func Set_Image(Value: String)-> CompressedTexture2D:

	if Value == "Axe":
		return AXE
	elif Value == "KNIFE":
		return KNIFE
	else: 
		return SWORD
