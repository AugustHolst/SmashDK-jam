extends CharacterBody3D

@onready var ray = $RayCast3D

var id: int

var tween_conveyor: Tween
var tween_move: Tween
var tween_attack: Tween

var conveyor_dir = Vector3(-1.0, 0.0, 0.0)

func _process(delta: float) -> void:
	pass

func roll_on_conveyor() -> void:
	var new_pos = position + conveyor_dir
	if tween_conveyor and tween_conveyor.is_running():
		tween_conveyor.kill()
	tween_conveyor = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_conveyor.tween_property(self, "position", new_pos, 0.25)

func can_roll() -> bool:
	return !ray.is_colliding()
