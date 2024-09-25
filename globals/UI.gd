extends Node

var hungerRect: ColorRect
var maxRectSize: float
var speedLabel: Label
var weinerLabel: Label
var ripLabel: Label

func setHunger(v: float) -> void:
	if hungerRect != null:
		hungerRect.size.x = maxRectSize * v
		hungerRect.color.g = 1.0 - v
		hungerRect.color.r = v

func setHungerRect(r: ColorRect) -> void:
	hungerRect = r
	maxRectSize = hungerRect.size.x

func setSpeed(v: float) -> void:
	if speedLabel != null:
		speedLabel.text = "SPEED " + str(v)

func setSpeedLabel(l: Label) -> void:
	speedLabel = l
