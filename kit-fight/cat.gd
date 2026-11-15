extends CharacterBody2D

var jumped = false
var gravity = .45
var onFloor = false 
var speed = 10
var attacking  = false


func _physics_process(delta: float) -> void:
	var input_direction = Input.get_axis("ui_left","ui_right")
	
	velocity.x = input_direction *speed
	if position.x <100 and input_direction < 0 or position.x >1000 and input_direction >0:
		velocity.x  = 0
	
	if Input.is_action_just_pressed("ui_up") and not jumped and onFloor:
		velocity.y= -100
		
		
		jumped = true
		onFloor = false 
		
	if position.y<500 and not onFloor:
		velocity.y +=gravity *speed	
	elif position.y >500 and not onFloor:
		if velocity.y <=10:
			velocity.y = 0
			onFloor = true 
			jumped = false
		else:	
			velocity.y = -velocity.y/2
			
		position.y = 500
			


	position.x+=velocity.x 
	position.y += velocity.y
	
	
	if Input.is_action_just_pressed("ui_space") and not attacking:
		%Fireball.visible = true
	
