extends Node

@export var mapName = "map01"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadMap("map01")

func loadMap(name: String):
	var map = ResourceLoader.load("res://maps/" + name + ".tscn")
	if (!map):
		print("oh no")
		loadMap("map01")
		return
	mapName = name
	var m = map.instantiate()
	$"..".get_child(0).queue_free()
	$"..".add_child(m)
	
