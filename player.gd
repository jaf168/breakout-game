extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var screen_size
var half_width

func _ready():
	screen_size = get_viewport_rect().size
	var collision_shape = $CollisionShape2D.shape
	half_width = collision_shape.size.x / 2
	
func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	position.x = clamp(position.x, half_width, screen_size.x - half_width)
