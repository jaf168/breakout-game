extends Area2D

var ball_speed = 400.0
var direction = Vector2(1, -1).normalized()
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = direction * ball_speed
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

# Called every frame. 'delta' is the elapsed time since the previous frdwame.
func _process(delta):
	global_position += velocity * delta
	var screen_size = get_viewport().get_visible_rect().size
	if global_position.y > screen_size.y:
		print("game over")
	
	
func _on_body_exited(body):
	print("Ball left body: ", body.name)

func _on_area_exited(area):
	print("Ball left area: ", area.name)
	
func _on_body_entered(body):
	bounce_off_body(body)
	print("Ball entered body: ", body.name)

func _on_area_entered(area):
	print("Ball entered area: ", area.name)
	if area.is_in_group("bricks"):
		area.queue_free()
		bounce_off_area(area)
	else:
		bounce_off_area(area)
		
func bounce_off_area(area):
	
	if area.name == "Left":
		velocity.x = abs(velocity.x)
	elif area.name == "Right":
		velocity.x = -abs(velocity.x)
	elif area.name == "Top":
		velocity.y = abs(velocity.y)
	else:
		velocity.y = -velocity.y
			

func bounce_off_body(body):
	velocity.y = -velocity.y
