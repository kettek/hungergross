extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Randomize Map
	var powerup = ResourceLoader.load("res://objects/powerup/powerup.tscn")

	var count = 12 + randi() % 6
	for i in count:
		var p = powerup.instantiate().randomizeKind()
		var vec = Vector3.ZERO
		vec.x = -10 + randi() % 20
		vec.z = -10 + randi() % 20
		p.position = vec
		add_child(p)
	STATE.foods = count
	
	print(count)

	# Setup user state
	STATE.setState(STATE.TYPE.LIVE)
