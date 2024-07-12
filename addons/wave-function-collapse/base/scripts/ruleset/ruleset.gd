extends RefCounted
class_name WFCRuleset

const TRUE = 1
const FALSE = 0

var rule_data: Array[PackedWave] = []
var kernel_size: int = 3


func get_rule_data(index: int) -> PackedWave:
	if index >= rule_data.size(): return null
	return self.rule_data[index]


func add_rule_data(data: PackedWave):
	rule_data.append(data)


func mod_rule_data(from: int, to:int, position: Vector2, value):
	print("OH SHIT MODDED")
	position = position + self._get_kernel_center()
	rule_data[from].set_value(position.x, position.y, to, value)


func initialize_rule_data(tile_count: int, kernel_size: int):
	assert(kernel_size % 2 == 1, "Even kernel size")
	self.kernel_size = kernel_size
	for i in range(tile_count):
		var rule = PackedWave.new()
		var center = int(kernel_size / 2)
		rule.initialize(Vector3(kernel_size, kernel_size, tile_count))
		rule.fill(FALSE)
		rule.set_value(center, center, i, TRUE)
		self.add_rule_data(rule)


func get_rule_val(origin_tile: int, checked_tile: int, direction: Vector2) -> int:
	# prints("CHECKED: ", direction.x, direction.y)
	direction += self._get_kernel_center()
	# prints("CHECKED: ", direction.x, direction.y)
	return rule_data[origin_tile].get_value(direction.x, direction.y, checked_tile)


func is_tile_valid(origin_tile: int, checked_tile: int, check_pos: Vector2) -> bool:
	check_pos += self._get_kernel_center()
	# var result = rule_data[origin_tile].get_value(check_pos.x, check_pos.y, checked_tile)
	var result = get_rule_val(origin_tile, checked_tile, check_pos)
	return result != FALSE


func apply_rules(wave: Wave, position) -> PackedVector2Array: #returns changed positions
	#NOTE: unused
	#NOTE: mutates wave
	#TODO: do this
	var val = FALSE
	var changed_positions: PackedVector2Array = PackedVector2Array()

	for tile in range(wave.size.z):
		val = wave.get_value(position.x, position.y, tile)
		if val == FALSE: continue # invalid value
		var rule = rule_data[tile]
		var center = int(kernel_size / 2)

		#loop through rule kernel
		for x in range(wave.size.x):
			for y in range(wave.size.y):
				if x == center and y == center: continue
				for z in range(wave.size.z):
					if wave.get_value(x, y, z) == TRUE and rule.get_value(x, y, z) == FALSE:
						wave.set_value(x, y, z, FALSE)
						changed_positions.append(Vector2(x, y))

	return changed_positions


func _get_kernel_center() -> Vector2:
	var center = int(kernel_size / 2)
	return Vector2(center, center)


func _to_string():
	for rule in rule_data:
		print(rule)