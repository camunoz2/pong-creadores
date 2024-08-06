extends RigidBody2D

# Velocidad inicial de la pelota
@export var initial_speed = 200.0

# Dirección inicial de la pelota
var direction = Vector2(1, 0).rotated(deg_to_rad(randf() * 360))

func _ready():
	linear_velocity = direction * initial_speed

func _physics_process(delta):
	move_and_collide(direction * initial_speed * delta)


