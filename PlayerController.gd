extends CharacterBody2D
class_name PlayerController


@export var maxHealth: float = 200.0
@export var healthPoints: float = 200.0
@export var movementSpeed: float = 300.0
@export var speedMultiplier: float = 1
@export var characterName: String = "player"

@onready var sprite: Sprite2D = $Sprite
@onready var collisionBox: CollisionShape2D = $CollisionBox


func _ready():
	pass
	

func handleMovement(delta = get_process_delta_time()):
	look_at(get_global_mouse_position())
	
	# Vertical Player Movement
	if Input.is_key_pressed(KEY_W):
		velocity.y = -abs(movementSpeed * speedMultiplier)
	elif Input.is_key_pressed(KEY_S):
		velocity.y = abs(movementSpeed * speedMultiplier)
	else:
		velocity.y = 0
		
		
	# Horizontal Player Movement
	if Input.is_key_pressed(KEY_A):
		velocity.x = -abs(movementSpeed * speedMultiplier)
	elif Input.is_key_pressed(KEY_D):
		velocity.x = abs(movementSpeed * speedMultiplier)
	else:
		velocity.x = 0

func _process(delta):
	if healthPoints > maxHealth:
		healthPoints = maxHealth
		
		
		
func _physics_process(delta):
	handleMovement()
	move_and_slide()
