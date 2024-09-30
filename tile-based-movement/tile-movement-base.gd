class_name TileMovementBase extends TileMapLayer

signal tile_clicked(tile: Vector2i, tile_pos: Vector2)

var mouse_position: Vector2
var mouse_tile: Vector2i
var start_tile: Vector2i = Vector2i(0, 0)
@onready var outline_layer: TileOutlineLayer = $TileOutlineLayer

func _process(delta: float) -> void:
	mouse_position = get_local_mouse_position()
	mouse_tile = local_to_map(mouse_position)
	outline_layer.outline_tile(mouse_tile)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("tile_clicked", mouse_tile, map_to_local(mouse_tile))

	
