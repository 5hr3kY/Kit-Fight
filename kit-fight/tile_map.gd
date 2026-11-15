extends TileMapLayer


var reachedTop = false 
var new = true

func check_location():
	if %Cat.position.y<=-3900:
		reachedTop = true
		
func _process(delta):
	check_location();
	if reachedTop:
		delete_all()
		generate_stuff()
		reachedTop = false
		
	if new:
		new= false
		generate_stuff()
	
	
func delete_all():
	for y in range (-200,0,1):
		for x in range (0,19,1):
			var coord= Vector2i(x,y)
			set_cell(coord, -1)

func generate_stuff():
	var unusableValues=[]
	for _nothing in range(10):
	
		var x = randi_range(0,14)
		var y = randi_range(-31,0)
		
		if [x,y] in unusableValues : continue
		
		unusableValues.append_array([x-1,y])
		unusableValues.append_array([x-1,y+1])
		unusableValues.append_array([x-1,y-1])

		for i in range(1,6,1):
			var coord = Vector2i((x+i),y*2)
			self.set_cell(coord,5,Vector2i(1,0))
			unusableValues.append_array([x+i,y])
			unusableValues.append_array([x+i,y+1])
			unusableValues.append_array([x+i,y-1])

			unusableValues.append_array([x+i,y+2])
			unusableValues.append_array([x+i,y-2])
			unusableValues.append_array([x+i,y+2])
			unusableValues.append_array([x+i,y-2])

	
