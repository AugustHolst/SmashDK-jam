extends CharacterBody3D

signal attack_player(damage: int)

var tween_move: Tween
var tween_attack: Tween

@onready var mesh = $MeshInstance3D

func move(direction: Vector3) -> void:
	var new_pos = position + direction
	
	if tween_move and tween_move.is_running():
		tween_move.kill()
	tween_move = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_move.tween_property(self, "position", new_pos, 0.25)

func attack() -> void:
	attack_player.emit(1)
	if tween_attack and tween_attack.is_running():
		tween_attack.kill()
	tween_attack = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	
	tween_attack.tween_property(mesh, "scale", Vector3.ONE * 1.3, 0.15)
	tween_attack.chain().tween_property(mesh, "scale", Vector3.ONE, 0.15)
	
	#tween_attack.tween_property(self, "scale", Vector3.ONE * 1.3, 0.15)
	#tween_attack.chain().tween_property(self, "scale", Vector3.ONE, 0.15)
