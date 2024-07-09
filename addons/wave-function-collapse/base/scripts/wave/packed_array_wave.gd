extends Wave
class_name PackedWave

var data : PackedByteArray

func initialize(size : Vector3):	
	self.size = size
	self.data = PackedByteArray()
	for i in range(size.x * size.y * size.z):
		data.append(0)
	
	
func set_value(x: int, y: int, z: int, value: int):
	if not self._is_valid_indexing(x, y, z): return
	var idx = _flatten_idx(x, y, z)
	self.data.encode_s8(idx, value)
	
	
func get_value(x: int, y: int, z: int) -> int:
	assert(self._is_valid_indexing(x, y, z), "Invalid wave indexing found at: ".join(get_stack()))
	var idx = _flatten_idx(x, y, z)
	return self.data.decode_s8(idx)
	
	
func fill(value: int):
	self.data.fill(value)
	
	
func _flatten_idx(x: int, y: int, z: int) -> int:
	return x * size.y * size.z + y * size.z + z


func _is_valid_indexing(x: int, y: int, z:int) -> bool:
	var ret = x < size.x \
		&& y < size.y \
		&& z < size.z
	return ret
		 

func _to_string():
	var out_str = ""
	out_str += "Wave data: \n"
	for z_slice in range(size.z):
		out_str += "Z slice %d: \n" % z_slice
		for x in range(size.x):
			for y in range(size.y):
				out_str += str(self.get_value(x, y, z_slice)) + " "
			out_str += "\n"
	return out_str
