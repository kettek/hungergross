extends CharacterBody3D

var speed = 1
var tv = Vector3.ZERO
var anim: AnimatedSprite3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = GlobalPlayer.Speed
	anim = get_node("AnimatedSprite3D")

func _physics_process(delta: float) -> void:	
	var d = Vector3.ZERO
	
	if Input.is_action_pressed("east"):
		d.x += 1
		anim.flip_h = true
	if Input.is_action_pressed("west"):
		d.x -= 1
		anim.flip_h = false
	if Input.is_action_pressed("north"):
		d.z -= 1
	if Input.is_action_pressed("south"):
		d.z += 1
	
	tv /= 2
	tv.x += d.x * speed
	tv.z += d.z * speed
	
	velocity = tv
	
	move_and_slide()
	
	# check 4 poweruppies
	for i in range(get_slide_collision_count()):
		var c = get_slide_collision(i)
		var collider = c.get_collider()
		
		if collider == null:
			continue
		
		if collider.is_in_group("powerup"):
			collider.consume()
			if collider.kind == POWERUPS.KIND.CHEESE:
				print("it cheese")
				speed += 0.5
			elif collider.kind == POWERUPS.KIND.BAGEL:
				print("it bagel")
				speed += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
