extends Node3D

@onready var tick_sound = $TickStreamPlayer
@onready var enemy = $Enemy_Bot
@onready var hud = $Hud
@onready var spawner = $Bot_spawner

func _on_timer_timeout() -> void:
	tick_sound.play()
	
	if enemy.position.z == 2.0: enemy.attack()
	else: enemy.move(Vector3(0.0, 0.0, -1.0))
	
