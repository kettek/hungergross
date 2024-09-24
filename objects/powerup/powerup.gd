class_name Powerup
extends StaticBody3D

@export var kind: POWERUPS.KIND = POWERUPS.KIND.CHEESE

signal consumed

func consume():
	consumed.emit()
	PARTICLES.explode(get_node("AnimatedSprite3D"), position)
	queue_free()

func randomizeKind() -> Powerup:
	return setKind(randi() % POWERUPS.KIND.size())

func setKind(k: POWERUPS.KIND) -> Powerup:
	var anim = get_node("AnimatedSprite3D")
	kind = k
	if k == POWERUPS.KIND.CHEESE:
		anim.animation = "cheese"
	elif k == POWERUPS.KIND.BAGEL:
		anim.animation = "bagel"
	return self
