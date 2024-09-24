class_name Powerup
extends StaticBody3D

@export var kind: POWERUPS.KIND = POWERUPS.KIND.CHEESE

signal consumed

func consume():
	consumed.emit()
	explode()
	queue_free()

func explode():
	var particle = ResourceLoader.load("res://objects/particle/particle.tscn")
	var ourSprite = get_node("AnimatedSprite3D")
	for n in 5+randi()%10:
		var p = particle.instantiate()
		var pSprite = p.get_node("AnimatedSprite3D")
		pSprite.sprite_frames = ourSprite.sprite_frames
		pSprite.animation = ourSprite.animation
		pSprite.pixel_size = ourSprite.pixel_size / 2
		pSprite.offset.x = -4 + randi() % 8
		pSprite.offset.y = -4 + randi() % 8
		p.scale.x *= randf() / 2
		p.scale.z *= randf() / 2
		p.position = position
		p.apply_central_force(Vector3(randf()/2, randf()/2, randf()/2))
		p.apply_torque(Vector3(randf(), randf(), randf()))
		get_tree().root.add_child(p)

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
