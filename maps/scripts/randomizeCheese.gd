extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var powerup = ResourceLoader.load("res://objects/powerup/powerup.tscn")
	
	var count = 16 + randi() % 16
	for i in count:
		var p = powerup.instantiate().randomizeKind()
		var vec = Vector3.ZERO
		vec.x = -10 + randi() % 20
		vec.z = -10 + randi() % 20
		p.position = vec
		add_child(p)
