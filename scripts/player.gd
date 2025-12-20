extends CharacterBody2D

# Movement variables
@export var speed: float = 250.0

func _physics_process(delta):
	# Get input direction
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right") || Input.is_key_pressed(KEY_D):
		input_direction.x += 1
	if Input.is_action_pressed("ui_left") || Input.is_key_pressed(KEY_A):
		input_direction.x -= 1
	if Input.is_action_pressed("ui_down") || Input.is_key_pressed(KEY_S):
		input_direction.y += 1
	if Input.is_action_pressed("ui_up") || Input.is_key_pressed(KEY_W):
		input_direction.y -= 1
	
	# Normalize to prevent faster diagonal movement
	input_direction = input_direction.normalized()
	
	# Set velocity
	velocity = input_direction * speed
	
	# Move the character
	move_and_slide()
