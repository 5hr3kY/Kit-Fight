extends CharacterBody2D

var deceleration = 1

func _init():
	velocity.x = 90
	
	
func _physics_process(delta: float) -> void:
	if self.visible:
		position.x+=velocity.x 
		velocity.x-= deceleration
		if  velocity.x <0:
			queue_free()
