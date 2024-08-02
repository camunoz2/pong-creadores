extends Node2D

@export var velocidad_pelota: float = 300.0

var pelota: Node2D
var direccion: Vector2
var game_over_signal: Signal

func _ready():
	pelota = $Pelota
	direccion = Vector2(1, 1).normalized()
	
	# Crear y conectar la señal para el Game Over
	game_over_signal = Signal()
	game_over_signal.connect(_on_game_over)

func _process(delta: float) -> void:
	mover_pelota(delta)
	verificar_colisiones()

func mover_pelota(delta: float) -> void:
	pelota.position += direccion * velocidad_pelota * delta

func verificar_colisiones() -> void:
	if pelota.position.x < 0 or pelota.position.x > get_viewport().size.x:
		game_over_signal.emit()
	elif pelota.position.y < 0 or pelota.position.y > get_viewport().size.y:
		direccion.y = -direccion.y

func _on_game_over() -> void:
	get_tree().change_scene("res://GameOver.tscn")


