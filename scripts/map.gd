extends Node3D

@export var arena_size: int = 10
@export var floor_tile: PackedScene

func _ready() -> void:
	for x in range(arena_size):
		for y in range(arena_size):
			var tile_instance = floor_tile.instantiate() as Node3D
			tile_instance.transform.origin = Vector3(x * 2, 0, y * 2) # 2 units apart, adjust as needed
			add_child(tile_instance)
