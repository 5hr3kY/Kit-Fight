extends Camera2D

func _init():
	self.zoom = Vector2(1.1, 0.5)


func _physics_process(delta: float) -> void:
	position.y = %Cat.position.y-175
