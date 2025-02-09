extends Resource
class_name CharacterStats

## # # # Movenemt Variables # # # ##
const SPEED: int = 100
const SPRINT_SPEED: float = 1.5
const FRICTION: float = 8000.00
const ACCELERATION: int = 3000.0
const VELOCITY: Vector2 = Vector2.ZERO
const TELEPORT_DISTANCE: int = 100
const FLASH_COOLDOWN: float = 4.0
var input: Vector2

@export var Name : String = 'WILLIAM': set = _set_Name, get = _Get_Name
## # # #  Health # # # ## 
@export var Health : int = 89: set = _set_Heath, get = _get_Health
@export var Max_Health: int = 100
## # # #  Mana # # # ## 
@export var Mana : int = 67 : set = _set_Mana, get = _get_Mana
@export var Max_Mana : int = 100
## # # #  Combat # # # ## 
@export var Attack : int = 1
@export var Defence  :int = 0

## # # # SET GET Functions # # # ## 

func _set_Name(value : String)-> void:
	Name = value
	SignalBus.emit_signal("Update_Character_Stats", "Name")

func _Get_Name() -> String:
	return Name

func _set_Heath(value : int)-> void:
	Health = min(max(value, 0), Max_Health)

	SignalBus.emit_signal("Update_Character_Stats", "Health")

func _get_Health() -> int: 
	return Health

func _set_Mana(value : int)-> void:
	Mana = min(max(value, 0), Max_Mana)
	SignalBus.emit_signal("Update_Character_Stats", "Mana")
func _get_Mana() -> int: 
	return Mana
