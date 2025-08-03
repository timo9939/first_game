extends CharacterBody2D

@export var speed = 300  # Adjust this value to change movement speed

func _physics_process(delta):
	# Get input direction
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	# Normalize diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Move the character
	velocity = direction * speed
	move_and_slide()
