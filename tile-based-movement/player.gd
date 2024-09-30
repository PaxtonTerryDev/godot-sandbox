extends Node2D

signal player_pos_changed(old_pos: Vector2, new_pos: Vector2)
var tile_size: int = 16
@onready var tilemap_ref: TileMovementBase = $"../TileMovementBase"

func _ready():
	move_to_tile(tilemap_ref.map_to_local(tilemap_ref.start_tile))

func move_to_tile(tile_pos: Vector2):
	if (tile_pos == position): return
	var old_pos = position
	position = tile_pos
	print("New Player Position: ", position)
	player_pos_changed.emit(old_pos, position)


func _on_tile_movement_base_tile_clicked(tile: Vector2i, tile_pos: Vector2) -> void:
	move_to_tile(tile_pos)
