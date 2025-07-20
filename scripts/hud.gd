extends CanvasLayer

@onready var health_bar = $ProgressBar
@onready var action_queue = $VBoxContainer

func _on_enemy_bot_attack_player(damage: int) -> void:
	health_bar.value -= damage

func _on_player_picked(id: Variant) -> void:
	action_queue.visible = true
