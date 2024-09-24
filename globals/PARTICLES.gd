extends Node

func explode(ourSprite: AnimatedSprite3D, position: Vector3):
	var particle = ResourceLoader.load("res://objects/particle/particle.tscn")
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
