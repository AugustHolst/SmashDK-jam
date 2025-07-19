extends CanvasLayer

@onready var health_bar = $ProgressBar

func _on_enemy_bot_attack_player(damage: int) -> void:
	health_bar.value -= damage
