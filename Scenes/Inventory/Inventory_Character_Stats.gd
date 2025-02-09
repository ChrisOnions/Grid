extends NinePatchRect
# When adding to this script check the init add the values in both match and Default
@onready var stats_name: Label = $VBoxContainer/Stats_Name
@onready var stats_attack: Label = $VBoxContainer/Stats_Attack
@onready var stats_defence: Label = $VBoxContainer/Stats_Defence
@onready var stats_health: Label = $VBoxContainer/Stats_Health
@onready var stats_mana: Label = $VBoxContainer/Stats_Mana

@export var Player : CharacterBody2D 

func _ready() -> void:
	SignalBus.connect("Update_Character_Stats", Update_Stats)
	Update_Stats("Initial update Wont Match")
	print ( get_tree().get_first_node_in_group("Player_Group"))

func Update_Stats( value : String)-> void:
	match value:
		"Name" : 
			stats_name.text = "Name: %s" % str(Player.Stats.Name)
		"Attack" : 
			stats_attack.text = "Attack : %s " % [str(Player.Stats.Attack)]
		"Defence":
			stats_defence.text = "Defence : %s " % Player.Stats.Defence
		"Health":
			stats_health .text = "Health : %s / %s " % [Player.Stats.Health , Player.Stats.Max_Health]
		"Mana":
			stats_mana .text = "Mana : %s / %s " % [Player.Stats.Mana , Player.Stats.Mana]
		_:
			print("Error: You passed the wrong string, either spelling or other issue.")
			stats_name.text = "Name: %s" % str(Player.Stats.Name)
			stats_attack.text = "Attack : %s " % [str(Player.Stats.Attack)]
			stats_mana.text = "Mana : %s " % [str(Player.Stats.Mana)]
			stats_defence.text = "Defence : %s " % Player.Stats.Defence
			stats_health .text = "Health : %s / %s " % [Player.Stats.Health , Player.Stats.Max_Health]
