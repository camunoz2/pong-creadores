extends CharacterBody2D

@export var speed = 300
@export var up_action = "up"
@export var down_action = "down"

func get_input():
	var input_direction = Vector2.ZERO
	if Input.is_action_pressed(up_action):
		input_direction.y -= 1
	if Input.is_action_pressed(down_action):
		input_direction.y += 1
	
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
