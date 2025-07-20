extends Node3D


@onready var tick_sound = $TickStreamPlayer
@onready var music_player = $MusicStreamPlayer
@onready var enemy = $Enemy_Bot
@onready var hud = $Hud
@onready var spawner = $Bot_spawner
@onready var spawn_timer = $BotSpawner/SpawnTimer

var music_playing = false
var spawning_bots = false

func _on_timer_timeout() -> void:
	if !music_playing and !spawning_bots:
		music_playing = true
		music_player.play()
		
		spawning_bots = true
		spawn_timer.start()

	if enemy.position.z == 2.0: enemy.attack()
	else: enemy.move(Vector3(0.0, 0.0, -1.0))
	
