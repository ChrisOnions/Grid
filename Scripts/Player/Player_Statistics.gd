extends BoxContainer

@onready var Name_label: Label = $Header
@onready var Health_label: Label = $Stat1
@onready var Mana_label: Label = $Stat2
@onready var Attack_label: Label = $Stat3
@onready var Defence_label: Label = $Stat4
#@onready var stat_5: Label = $Stat5
#@onready var stat_6: Label = $Stat6
#@onready var stat_7: Label = $Stat7
#@onready var stat_8: Label = $Stat8

func _ready() -> void:
	pass
	#GlobalPlayer.connect("update_stats",update_Player_Statistics)
	

func update_Player_Statistics(stat_changed: String) -> void:
	match stat_changed:
		"Name" :
			Name_label.text = 'Name - ' + str(AccessGlobals.stats.Name)
		"Health" :
			Health_label.text = 'Health - ' + str(AccessGlobals.stats.Health)
		"Mana" :
			Mana_label.text = 'Mana - ' + str(AccessGlobals.stats.Mana)
		"Attack" :
			Attack_label.text = 'Attack - ' + str(AccessGlobals.stats.Attack)
		"Defence" : 
			Defence_label.text = 'Defence - ' + str(AccessGlobals.stats.Defence)
		"All" : 
			Name_label.text = 'Name - ' + str(AccessGlobals.stats.Name)
			Health_label.text = 'Health - ' + str(AccessGlobals.stats.Health)
			Mana_label.text = 'Mana - ' + str(AccessGlobals.stats.Mana)
			Attack_label.text = 'Attack - ' + str(AccessGlobals.stats.Attack)
			Defence_label.text = 'Defence - ' + str(AccessGlobals.stats.Defence)
		_ :
			assert(false, "Invalid stat passed to updates_Player_Statistics: " + stat_changed)
