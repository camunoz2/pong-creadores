extends RigidBody2D

# Velocidad inicial de la pelota
var initial_speed = 100
var velocity = Vector2.ZERO

func _ready():
	# Desactivar la gravedad para este cuerpo
	gravity_scale = 0

	# Generar una dirección aleatoria asegurando componentes tanto en x como en y
	var direction = Vector2()
	while abs(direction.x) < 0.5 or abs(direction.y) < 0.5:
		direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
	
	# Configurar la velocidad inicial
	velocity = direction * initial_speed
	# Aplicar una fuerza inicial a la pelota
	linear_velocity = velocity

	# Conectar la señal de colisión


func _integrate_forces(_state):
	# Obtener el tamaño del viewport
	var viewport_size = get_viewport_rect().size

	# Rebotar en los bordes superior e inferior
	if position.y <= 0 or position.y >= viewport_size.y:
		linear_velocity.y = -linear_velocity.y

	# Rebotar en los bordes izquierdo y derecho (puedes cambiar esto según tu lógica de juego)
	if position.x <= 0 or position.x >= viewport_size.x:
		linear_velocity.x = -linear_velocity.x

func _on_body_entered(body):
	if body.is_in_group("paddle"):  # Asumiendo que las paletas están en el grupo "paddle"
		# Invertir la dirección horizontal
		linear_velocity.x = -linear_velocity.x

		# Opcional: Ajustar la dirección vertical según el punto de impacto
		var diff = position.y - body.position.y
		linear_velocity.y = diff * 10  # Ajusta el factor según sea necesario






