extends Node2D

@export var sprite: Sprite2D

var wave : Wave = null

func _init():
	TestDriver.run_tests()

# Called when the node enters the scene tree for the first time.
func _ready():
	# var size: Vector3 = Vector3(2, 2, 2)
	# wave = PackedWave.new()
	# wave.initialize(size)
	# wave.set_value(1, 1, 0, 1)
	# print(wave.get_value(1, 1, 1))
	# print(wave)

	# var rule = WFCRuleset.new()
	# rule.initialize_rule_data(3, 3)

	# rule.mod_rule_data(0, 1, Vector2(-1, -1), 1)
	# print(rule)

	# print(rule.is_tile_valid(0, 1, Vector2(-1, -1)))

	# var ruleset = WFCRuleset.new()	
	# ruleset.initialize_rule_data(1, 5)
	# var ret = ruleset.get_rule_val(0, 0, Vector2(2, 2))
	# print(ret)
	# print(ruleset)


	var img = Image.create(5, 5, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0))
	img.set_pixel(2, 2, Color(128, 128, 128))
	img.set_pixel(1, 1, Color(128, 128, 128))
	# img.set_pixel(3, 3, Color(128, 128, 128))
	# img.set_pixel(3, 1, Color(128, 128, 128))
	# img.set_pixel(1, 3, Color(128, 128, 128))
	sprite.texture = ImageTexture.create_from_image(img)

	var wfc = WFCInstance.new(img, 3)
	var rules = wfc.infer_rules()
	print(rules)

	# var probabilities = [0.1, 0.3, 0.4, 0.2]  # Example probabilities
	# var histogram = [0, 0, 0, 0]
	# for i in range(1000):
	# 	var index = RandomDist.rand_dist(probabilities)
	# 	histogram[index] += 1
	
	# print("Random histogram: ", histogram)
	# var dist: Array[float] = [0, 0, 0, 0]
	# var sum = 0
	# for freq in histogram: sum += freq
	# for i in range(4): dist[i] = float(histogram[i]) / sum
	# print("Random distribution: ", dist)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
