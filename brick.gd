extends Area2D

var health = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health == 0:
		print("brick dead")

func _on_area_entered(area):
	health -= 1
