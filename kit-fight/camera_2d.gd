extends Camera2D


var score = 0
var reachedTop = false 
var previousHeight= 0
var maxHeight = -100

func update_score():
	var difference = position.y - maxHeight
	if difference >= 0:
		difference = 0
	else:
		difference*=-1
		maxHeight = position.y
		
	if position.y <=-4000+175:
		maxHeight = -100
	score+= difference/10
func _init():
	self.zoom = Vector2(1.1, 0.5)

func _process(delta: float)-> void:
	if %scoreName:
		display_score()
	update_score()

func _physics_process(delta:float)-> void:
	position.y = %Cat.position.y-175
	
	
func display_score():
	%scoreName.text = "Score: " + str(int(score) )
