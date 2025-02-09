extends CanvasLayer

var _Base_Health : int = 1
var _Base_Damage : int = 1
var _Base_Defence : int = 1
var _Base_Attack : int = 1

var _Modified_Health : int = _Base_Health
var _Modified_Damage : int = _Base_Damage
var _Modified_Defence : int = _Base_Defence
var _Modified_Attack : int = _Base_Attack

var _equipped_items  : Array = []
var _Damage_modifiers: Dictionary 

# On update of items modifiers Add nessasary items 
# reset_modifiers_to_base()
# checkAndAddModifier() 

var Helmet : Dictionary = {
	"Name": "Helmet",
	"Health": 1,
	"Defence" :2
}

var Vest : Dictionary = {
	"Name": "Vest",
	"Attack": 2,
	"Defence" : 3
}

func equip_item(item : Dictionary) -> void :
	_equipped_items .append(item) 
	Update_modifiers()
	
func Un_equip_item(item : Dictionary) -> void :
	_equipped_items .erase(item)
	Update_modifiers()

func Update_modifiers() -> void:
	reset_modifiers_to_base()
	for each_equipped_item : Dictionary in _equipped_items :
		for key : String in each_equipped_item:
			if each_equipped_item[key] is String :
				pass
			else:
				checkAndAddModifier(key ,each_equipped_item[key])

# On item update, reset modifiers to base values and reapply modifiers
func reset_modifiers_to_base() -> void : 
	_Modified_Health =  _Base_Health
	_Modified_Damage  = _Base_Damage
	_Modified_Defence  = _Base_Defence

func checkAndAddModifier(key: String , modifier : int) -> void: 
	#if key == "Health" :
		#_Modified_Health += modifier
		#print(key," added, " ,"Health = ", _Modified_Health)
	#print (key , " : " , modifier)
	match key: 
		"Health": 
			_Modified_Health += modifier
		"Attack": 
			_Modified_Health += modifier
		"Defence":
			_Modified_Defence += modifier
		"Damage":
			_Modified_Damage += modifier
		_:
			print("Unknown modifier: ", key)

func _ready() -> void:
	print(_Modified_Health)
	equip_item(Helmet)
	equip_item(Vest)
	Un_equip_item(Vest)
