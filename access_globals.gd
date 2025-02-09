extends Node

@onready var player: CharacterBody2D

func set_player(player_node: CharacterBody2D)-> void:
	player = player_node
