extends Node3D

var robot = preload("res://scenes/robot.tscn")
var robots: Array[CharacterBody3D]
var i: int
var last_conveyor_position_x = -11.0


func _ready() -> void:
	i = 0
	robots = [robot.instantiate()]
	add_child(robots[i])

func _on_timer_timeout() -> void:
	for i in len(robots):
		var rob = robots[i]
		if rob.can_roll():
			rob.roll_on_conveyor()

func _on_spawn_timer_timeout() -> void:
	robots.append(robot.instantiate())
	add_child(robots[len(robots) - 1])
	last_conveyor_position_x += 1.0
