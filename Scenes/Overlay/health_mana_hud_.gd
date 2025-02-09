extends Control

@export var Player : Node2D
@onready var health_hud_display: TextureProgressBar = $Health_HUD_Display
@onready var mana_hud_display: TextureProgressBar = $Mana_HUD_Display

func _ready() -> void:
	if Player != null:
		pass
	else:
		print("no player ref")
	#SignalBus.connect("Update_Character_Stats", Callable(self,"Update_Health_Hud"))
	#SignalBus.connect("Update_Character_Stats", Callable(self,"Update_mana_Hud"))
	SignalBus.connect("Update_Character_Stats", Update_Stats)
	Update_Health_Hud()
	Update_mana_Hud()

func Update_Stats( value : String)-> void:
	match value:
		"Health" : 
			Update_Health_Hud()
		"Mana": 
			Update_mana_Hud()
		_:
			Update_Health_Hud()
			Update_mana_Hud()

func Update_Health_Hud() -> void:
	health_hud_display.max_value = Player.Stats.Max_Health
	health_hud_display.value = Player.Stats.Health

func Update_mana_Hud() -> void:
	mana_hud_display.max_value = Player.Stats.Max_Mana
	mana_hud_display.value = Player.Stats.Mana
