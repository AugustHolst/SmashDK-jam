extends Node3D

@onready var tick_sound = $TickStreamPlayer

func _on_timer_timeout() -> void:
	tick_sound.play()
