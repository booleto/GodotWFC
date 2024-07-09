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

	var img = Image.new()
	img.create(5, 5, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0))
	img.set_pixel(2, 2, Color(128, 128, 128))
	img.set_pixel(1, 1, Color(128, 128, 128))
	img.set_pixel(3, 3, Color(128, 128, 128))
	img.set_pixel(3, 1, Color(128, 128, 128))
	img.set_pixel(1, 3, Color(128, 128, 128))
	sprite.texture = ImageTexture.create_from_image(img)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
