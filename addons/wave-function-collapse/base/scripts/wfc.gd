extends RefCounted
class_name WFCInstance

var tile_count: int
var kernel_size : int

var img_decode: Dictionary = {}
var img_encode: Dictionary = {}
var encoded_image: Wave = PackedWave.new()
var ruleset: WFCRuleset = WFCRuleset.new()


func generate(distribution, output_size: Vector2, kernel_size: int):
	pass


func synthesize_texture(image: Image, output_size: Vector2, kernel_size: int=5):
	self.load_image(image)
	self.infer_rules()
	pass
	

func infer_rules() -> WFCRuleset:
	ruleset.initialize_rule_data(tile_count, kernel_size)
	var direction: Vector2
	var kernel_center: Vector2 = ruleset._get_kernel_center()
	var max_x = Vector2(encoded_image.size.x, encoded_image.size.x)
	var max_y = Vector2(encoded_image.size.y, encoded_image.size.y)

	for x in range(encoded_image.size.x): # loop through every pixels in the image
		for y in range(encoded_image.size.y):
			var x_range = Vector2(x - kernel_size, x + kernel_size) # exclude edges
			var y_range = Vector2(y - kernel_size, y + kernel_size)
			x_range.clamp(Vector2(0, 0), max_x)
			y_range.clamp(Vector2(0, 0), max_y)

			var center_tile: int = encoded_image.get_value(x, y, 0)
			for i in range(x_range[0], x_range[1]): # loop through pixels in a kernel centered around each pixels
				for j in range(y_range[0], y_range[1]):
					if Vector2(x, y) == Vector2(i, j): continue
					var kernel_tile: int = encoded_image.get_value(i, j, 0)
					direction = Vector2(x, y) - Vector2(i, j)
					ruleset.mod_rule_data(center_tile, kernel_tile, direction, WFCRuleset.TRUE)
		
	return ruleset


func load_image(image: Image) -> Wave:
	var pix: Color
	tile_count = 0
	encoded_image.initialize(Vector3(image.get_width(), image.get_height(), 1))

	for x in range(image.get_width()):
		for y in range(image.get_height()):
			pix = image.get_pixel(x, y)

			if not img_encode.has(pix):
				img_encode[pix] = tile_count
				img_decode[tile_count] = pix
				tile_count += 1
			encoded_image.set_value(x, y, 0, img_encode[pix])
	
	return encoded_image
