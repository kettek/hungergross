extends Node

var hungerRect: ColorRect
var maxRectSize: float

func setHunger(v: float) -> void:
	if hungerRect != null:
		hungerRect.size.x = maxRectSize * v
		hungerRect.color.g = 1.0 - v
		hungerRect.color.r = v

func setHungerRect(r: ColorRect) -> void:
	hungerRect = r
	maxRectSize = hungerRect.size.x
