class_name Powerup
extends StaticBody3D

@export var kind: POWERUPS.KIND = POWERUPS.KIND.CHEESE

var isConsumed = false

signal consumed

func consume():
	isConsumed = true
	consumed.emit()
	PARTICLES.explode(get_node("AnimatedSprite3D"), position)
	queue_free()

func randomizeKind() -> Powerup:
	return setKind(randi() % POWERUPS.KIND.size())

func setKind(k: POWERUPS.KIND) -> Powerup:
	var anim = get_node("AnimatedSprite3D")
	kind = k
	anim.animation = POWERUPS.ANIMATIONS[kind]
	return self
