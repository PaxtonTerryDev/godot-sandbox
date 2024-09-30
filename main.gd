extends Node2D


func _on_tile_movement_base_tile_clicked(tile: Vector2i, tile_pos: Vector2) -> void:
	print("Called From Main - Tile Clicked: ", tile, tile_pos)
