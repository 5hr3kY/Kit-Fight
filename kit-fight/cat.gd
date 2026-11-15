#assumes that it will loop from 100 -4000

extends CharacterBody2D


var deceleration  = 1
var gravity = 2
var speed = 10
var surpassBoundary = false 
var prev_is_on_floor = false
var prev_velocity = 0
var potential_velocity = 0


func _sigma(delta):
	if Input.is_action_just_pressed("ui_esc"):
		get_tree().change_scene_to_file( "res://Scenes/title_screen.tscn")

func _charge(delta):		
	if Input.is_action_pressed("ui_up") and is_on_floor():
		potential_velocity-= 100*delta
		
	elif Input.is_action_just_released("ui_up") and is_on_floor():
		velocity.y = clamp(potential_velocity,-100,0) 
		potential_velocity =0
		


func _check_location():
	if position.y < -4000:
		surpassBoundary = true  
		print(position.y)
		
	if surpassBoundary and velocity.x ==0 and velocity.y ==0 and  is_on_floor():
		position.y = 0
		surpassBoundary= false
		print(position)

func _process(delta: float) -> void:
	_charge(delta)
	_check_location()
	_sigma(delta)
	

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		var input_direction = Input.get_axis("ui_left","ui_right")
		velocity.x = input_direction *speed 
	
	
		if position.x <$CollisionShape2D.shape.size.x*2 and input_direction < 0 or position.x >get_window().size.x- $CollisionShape2D.shape.size.x and input_direction >0:
			velocity.x  = 0

	elif velocity.x !=0:
		if velocity.x >0:
			velocity.x -= deceleration
		elif velocity.x< 0:
			velocity.x+= deceleration
		
	
	if not is_on_floor():
		velocity.y += gravity
		
	elif prev_is_on_floor == false and prev_velocity > 10.0:
			velocity.y = 0.25 * -prev_velocity
	prev_velocity = velocity.y
	prev_is_on_floor = is_on_floor()
	move_and_slide()



	position.x+=velocity.x 
	position.y += velocity.y


	
