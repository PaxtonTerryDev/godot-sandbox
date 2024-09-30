class_name TileOutlineLayer extends TileMapLayer

var outline_source_id: int = 3
var outline_coords: Vector2i = Vector2i(4, 3)
var current_outline: Vector2i

func outline_tile(tile_pos: Vector2i) -> void: 
	self.clear()
	self.set_cell(tile_pos, outline_source_id, outline_coords)
