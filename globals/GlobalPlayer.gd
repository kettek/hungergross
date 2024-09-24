extends Node

@export var Health = 5
@export var Speed = 1
@export var Damage = 1

var firstLoad = true

func _ready() -> void:
	if firstLoad:
		print("first dingus")
	firstLoad = false
