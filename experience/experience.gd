extends Node

signal exp_changed(old_exp: int, new_exp: int)
signal level_changed(old_level: int, new_level: int)

@export var exp: int:
	set(new_val):
		if (exp == new_val): return
		var old: int = exp
		exp = new_val
		exp_changed.emit(old, exp)
		if (exp >= req_exp):
			level += 1

@export var level: int = 1:
	set(value):
		var old: int = level
		level = value
		level_changed.emit(old, value)
		update_req_exp(value)

@export var req_exp: int

const EXP_MULTIPLIER: int = 100

func _ready() -> void:
	update_req_exp(level)
	print(req_exp)

func get_required_experience(level: int) -> int:
	return round(pow(level, 1.8) + level * 4) * EXP_MULTIPLIER

func update_req_exp(level: int) -> void:
	req_exp = get_required_experience(level)

func get_level_exp_floor(level: int) -> int:
	return 1

func _on_exp_changed(old_exp: int, new_exp: int) -> void:
	print("Experience Changed: ", old_exp, " -> ", new_exp)

func _on_level_changed(old_level: int, new_level: int) -> void:
	print("Level Changed: ", old_level, " -> ", new_level)

# Function to add exp when the "I" key is pressed
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed("TEST_add_exp")):
		add_exp(50)  # Add 50 exp (or any value you want)

func add_exp(amount: int) -> void:
	exp += amount
