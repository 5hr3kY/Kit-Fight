extends CharacterBody2D

var jumped = false
var gravity = 2
var onFloor = false 
var speed = 10
var attacking  = false
var prev_is_on_floor = false
var prev_velocity = 0

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_axis("ui_left","ui_right")
	
	velocity.x = input_direction *speed
	if position.x <100 and input_direction < 0 or position.x >1000 and input_direction >0:
		velocity.x  = 0
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -60
	
	if not is_on_floor():
		velocity.y += gravity
	else:
		if prev_is_on_floor == false and prev_velocity > 10.0:
			velocity.y = 0.25 * -prev_velocity
	prev_velocity = velocity.y
	prev_is_on_floor = is_on_floor()
	move_and_slide()



	position.x+=velocity.x 
	position.y += velocity.y

	
