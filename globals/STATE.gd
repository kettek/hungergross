extends Node

enum TYPE { LIVE, DEAD, DONE }

@export var current: TYPE = TYPE.LIVE

@export var foods: int = 0

func eatFood() -> void:
	foods -= 1
	print(foods)
	if foods <= 0:
		setState(TYPE.DONE)

func setState(t: TYPE) -> void:
	current = t
