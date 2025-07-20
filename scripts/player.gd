extends CharacterBody3D

signal picked(id)
#signal holding_bot

@onready var ray = $RayCast3D
@onready var move_timer = $MoveTimer
@onready var pick_timer = $PickTimer

var tween_move: Tween
var bot_in_hands: bool
var bot_queue: Array[int]

var top_bound = 4.0
var bottom_bound = 0.0
var left_bound = -1.725
var right_bound = -0.726


func _process(delta):
	if Input.is_action_pressed("player_up"):
		if move_timer.is_stopped() and position.x < top_bound:
			move_timer.start()
			move(Vector3(1.0, 0.0, 0.0))
	if Input.is_action_pressed("player_down"):
		if move_timer.is_stopped() and position.x > bottom_bound:
			move_timer.start()
			move(Vector3(-1.0, 0.0, 0.0))
	if Input.is_action_pressed("player_left"):
		if move_timer.is_stopped() and position.z > left_bound:
			move_timer.start()
			move(Vector3(0.0, 0.0, -1.0))
	if Input.is_action_pressed("player_right"):
		if move_timer.is_stopped() and position.z < right_bound:
			move_timer.start()
			move(Vector3(0.0, 0.0, 1.0))
	if Input.is_action_pressed("player_action"):
		if ray.is_colliding() and pick_timer.is_stopped() and !bot_in_hands:
			pick_timer.start()
			var obj = ray.get_collider()
			picked.emit(obj.id)
			obj.queue_free()
			bot_in_hands = true
	if bot_in_hands:
		if Input.is_action_pressed("command_attack"):
			pass


func move(dir):
	var new_pos = position + dir
	if tween_move and tween_move.is_running():
		tween_move.kill()
	tween_move = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween_move.tween_property(self, "position", new_pos, 0.125)

func hold_bot():
	pass

func _on_move_timer_timeout() -> void:
	move_timer.stop()

func _on_pick_timer_timeout() -> void:
	pick_timer.stop()
