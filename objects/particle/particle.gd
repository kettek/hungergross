extends RigidBody3D

var maxLifetime = 0
var lifetime = 0
var anim: AnimatedSprite3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maxLifetime = 0.5 + randf()
	anim = get_node("AnimatedSprite3D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lifetime += delta
	anim.set_transparency(1.0 - lifetime / maxLifetime)
	if lifetime > maxLifetime:
		queue_free()
