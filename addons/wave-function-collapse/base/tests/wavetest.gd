class_name WaveTest

static func test_wave_idx():
	var array_sizes = [
		Vector3(10, 10, 20),
		Vector3(1, 6, 5),
		Vector3(2, 13, 7),
		Vector3(534, 100, 1),
		Vector3(1, 1, 1),
	]
	var test_cases = [
		Vector3(5, 5, 7),
		Vector3(0, 0, 4),
		Vector3(0, 1, 1),
		Vector3(1, 12, 0),
		Vector3(0, 0, 0),
	]
	var ret = [
		1107,
		4,
		8,
		112,
		0
	]

	for idx in range(array_sizes.size()):
		var wave = PackedWave.new()
		wave.size = array_sizes[idx]
		var x = test_cases[idx].x
		var y = test_cases[idx].y
		var z = test_cases[idx].z        
		var ans = wave._flatten_idx(x, y, z)
		assert(ans == ret[idx], "Wrong wave indexing return. Check PackedWave._flatten_idx")


static func test_get_set_value():
	var array_sizes = [
		Vector3(10, 10, 20),
		Vector3(1, 6, 5),
		Vector3(2, 13, 7),
		Vector3(534, 100, 1),
		Vector3(1, 1, 1),
	]
	var test_cases = [
		Vector3(5, 5, 7),
		Vector3(0, 0, 4),
		Vector3(0, 1, 1),
		Vector3(1, 12, 0),
		Vector3(0, 0, 0),
	]
	var ret = [
		2,
		1,
		1,
		1,
		0
	]

	for idx in range(test_cases.size()):
		var wave = PackedWave.new()
		wave.initialize(array_sizes[idx])
		var x = test_cases[idx].x
		var y = test_cases[idx].y
		var z = test_cases[idx].z 
		wave.set_value(x, y, z, ret[idx])
		var ans = wave.get_value(x, y, z)
		assert(ans == ret[idx], "Set and get at same index return different values. Values greater than 8bits might have been inputted. Check PackedWave.set_value() and PackedWave.get_value()")


static func test_fill():
	var array_sizes = [
		Vector3(10, 10, 20),
		Vector3(1, 6, 5),
		Vector3(2, 13, 7),
		Vector3(534, 100, 1),
		Vector3(1, 1, 1),
	]
	var test_cases = [
		1,
		2,
		0,
		3,
		4,
	]
	for idx in range(test_cases.size()):
		var wave = PackedWave.new()
		wave.initialize(array_sizes[idx])
		var ans = test_cases[idx]
		wave.fill(ans)

		for i in range(wave.size.x * wave.size.y * wave.size.z):
			assert(
				ans == wave.data.decode_s8(i),
				"Invalid fill. Check PackedWave.fill()"
			)
		
