extends CharacterBody2D

@export var Stats : Resource
@export var _Inventory : Inventory 
@onready var ray_cast_2d: RayCast2D = $RayCast2D

const FRED = preload("res://Resources/Characters/Fred.tres")
const WILLIAM = preload("res://Resources/Characters/William.tres")

var input: Vector2
var last_Direction_State : String = "Down"

# # # # # Nodes # # # # #
@onready var flash_cooldown: Timer = $Timers/FlashCooldown
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# # # # # is_ true_Bools  # # # # #
func _ready() -> void:
	set_player(WILLIAM)
	add_to_group("player")
	AccessGlobals.set_player(self)
func _process(delta : float)->void:
	Player_Movement(delta)
	var mouse_pos: Vector2 = get_global_mouse_position()
	var direction: Vector2 = (mouse_pos - global_position).normalized()
	var angle: float  = direction.angle() - PI / 2
	ray_cast_2d.rotation = angle


func set_player(Character: Resource) -> void:
	if Character == WILLIAM :
		Stats = WILLIAM 
	elif Character == FRED :
		Stats = FRED
	else:
		Stats = null
		
func get_input() -> Vector2: 
	input.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left") 
	input.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up") 
	return input.normalized()

func Player_Movement(delta: float) -> void:
	var current_speed:int = adjust_speed_for_shift()
	input = get_input()
	_Animation_player()
	if input == Vector2.ZERO:
		if velocity.length() > (Stats.FRICTION * delta):
			velocity -= velocity.normalized() * (Stats.FRICTION * delta)
		else:
			velocity = Vector2.ZERO
	else:
		var target_velocity: Vector2 = input * current_speed
		velocity = velocity.move_toward(target_velocity, Stats.ACCELERATION * delta)
	move_and_slide()
	
func adjust_speed_for_shift() -> float:
	if Input.get_action_strength("Shift") > 0:
		return Stats.SPEED * Stats.SPRINT_SPEED
	else:
		return Stats.SPEED

func _Animation_player()-> void:
	if velocity.length() > 0:
		if velocity.x > 0:
			animated_sprite_2d.play("right_face_Run")
			last_Direction_State = "Right"
		elif velocity.x < 0:
			animated_sprite_2d.play("left_face_Run")
			last_Direction_State = "Left"
		elif velocity.y > 0:
			animated_sprite_2d.play("down_face_Run")
			last_Direction_State = "Down"
		elif velocity.y < 0:
			animated_sprite_2d.play("up_face_Run")
			last_Direction_State = "Up"	
	else:
		match last_Direction_State:
			"Right": 
				animated_sprite_2d.play("right_face_Idle")
			"Left": 
				animated_sprite_2d.play("left_face_Idle")
			"Down": 
				animated_sprite_2d.play("down_face_Idle")
			"Up": 
				animated_sprite_2d.play("up_face_Idle")


### Player Statistics base ###
func Health_Increase(value: int)-> void:
	Stats.Health = min(Stats.Health + Stats.value, Stats.Max_Health)
	SignalBus.emit_signal("Update_Character_Stats")

func Health_Decrease(value: int)-> void:
	if Stats.Health <=  0 :
		Stats.Health = 0
		SignalBus.emit_signal("Update_Character_Stats")
		Player_death()
	else :
		Stats.Health -= value
		SignalBus.emit_signal("Update_Character_Stats")

func Mana_Increase_over_Time(value: float) -> void:
	Stats.Mana += 1

func Player_death() -> void : 
	print("You are dead")


### Player Statistics Level Up ###
func Player_Increase_Level() -> void:
	Player_max_heath_increase_on_level_up()
	Player_max_mana_increase_on_level_up()

func Player_max_heath_increase_on_level_up() -> void:
	Stats.Max_Health += 10
	SignalBus.emit_signal("Update_Character_Stats")
	
func Player_max_mana_increase_on_level_up()-> void:
	Stats.Max_Mana += 1
	SignalBus.emit_signal("Update_Character_Stats")
