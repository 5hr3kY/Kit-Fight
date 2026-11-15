extends Camera2D


var score = 0
var reachedTop = false 
var previousHeight= 0
var maxHeight = 0

func update_score():
	var difference = position.y -maxHeight 
	if difference <= 0 :
		difference = 0
		
	if position.y > maxHeight:
		maxHeight = position.y
	
	score+= difference
	
	
	score += difference/2
func _init():
	self.zoom = Vector2(1.1, 0.5)

func _process(delta: float)-> void:
	display_score()
	update_score()

func _physics_process(delta:float)-> void:
	position.y = %Cat.position.y-175
	
	
func display_score():
	%CanvasLayer/scoreName.text = "Score: " + str(score )
