extends Node2D

func _ready():
	mostrar_mensaje_game_over()

func mostrar_mensaje_game_over() -> void:
	$Label.text = "Game Over"


	# Añadir un temporizador para cerrar el juego después de unos segundos si se desea
	var temporizador = Timer.new()
	temporizador.wait_time = 3.0
	temporizador.one_shot = true
	temporizador.connect("timeout", Callable(self, "_on_temporizador_timeout"))
	add_child(temporizador)
	temporizador.start()

func _on_temporizador_timeout() -> void:
	get_tree().quit()


