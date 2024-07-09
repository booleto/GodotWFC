extends RefCounted
class_name Wave

var size : Vector3

func initialize(size : Vector3):
	#self.size = size
	#self.data = PackedByteArray()
	#for i in range(size.x):
		#self.data.append([])
		#for j in range(size.y):
			#self.data[i].append([])
			#for k in range(size.z):
				#self.data.append(0)
	return
	
	
func set_value(x: int, y: int, z: int, value: int):
	#self.data[index.x][index.y][index.z] = value
	return
	
	
func get_value(x: int, y: int, z: int) -> int:
	return 0
	
	
func fill(value: int):
	pass
	
