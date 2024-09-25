extends CharacterBody3D

var speed = 1
var hunger = 0
var tv = Vector3.ZERO
var anim: AnimatedSprite3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	STATE.current = STATE.TYPE.LIVE
	speed = GlobalPlayer.Speed
	anim = get_node("AnimatedSprite3D")

func _physics_process(_delta: float) -> void:
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
				hunger -= 0.01
			elif collider.kind == POWERUPS.KIND.BAGEL:
				print("it bagel")
				speed += 1
				hunger -= 0.02
			UI.setSpeed(speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	hunger += 0.001
	if hunger > 1.0:
		hunger = 1.0
	if hunger < 0:
		hunger = 0
	if hunger == 1:
		friggin_die()
	UI.setHunger(hunger)

func friggin_die() -> void:
	PARTICLES.explode(get_node("AnimatedSprite3D"), position)
	STATE.current = STATE.TYPE.DEAD
	queue_free()
