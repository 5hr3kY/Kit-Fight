extends TileMapLayer


var reachedTop = false 
var new = true
var topClouds=[]
var numClouds = 10



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
	for y in range (-50,20,1):
		for x in range (0,20,1):
			var coord= Vector2i(x,y)
			set_cell(coord, -1)

func generate_stuff():
	var placedClouds =0
	for coordinates in topClouds:
		#for x in range(1,6,1):	
		#print(coordinates)
		self.set_cell(coordinates,5,Vector2i(1,0))
	placedClouds+= topClouds.size()/5

	var unusableValues=[]
	topClouds = []
	
	
	for i in range(1,10,1):
		var x = randi_range(0,14) 
		var y = randi_range(2*(i-11)-1,2*(i-11)+1)
		
		for deltax in range (1,5,1):
			var coord = Vector2i((x+deltax),y*5)
		
			self.set_cell(coord,5,Vector2i(1,0))
			
		unusableValues.append_array([x-1,y])
		unusableValues.append_array([x-1,y+1])
		unusableValues.append_array([x-1,y-1])
					
		unusableValues.append_array([x+i,y])
		unusableValues.append_array([x+i,y+1])
		unusableValues.append_array([x+i,y-1])
		unusableValues.append_array([x+i,y+2])
		unusableValues.append_array([x+i,y-2])
		unusableValues.append_array([x+i,y+2])
		unusableValues.append_array([x+i,y-2])

	for _nothing in range(numClouds- placedClouds):
	
		var x = randi_range(0,14)
		var y = randi_range(-21,1)
		
		if [x,y] in unusableValues : continue
		
		unusableValues.append_array([x-1,y])
		unusableValues.append_array([x-1,y+1])
		unusableValues.append_array([x-1,y-1])

		for i in range(1,6,1):
			var coord = Vector2i((x+i),y*5)
			self.set_cell(coord,5,Vector2i(1,0))
			
			if y< -35:
				topClouds.append(Vector2i(x+i,y+30))

			
			unusableValues.append_array([x+i,y])
			unusableValues.append_array([x+i,y+1])
			unusableValues.append_array([x+i,y-1])
			unusableValues.append_array([x+i,y+2])
			unusableValues.append_array([x+i,y-2])
			unusableValues.append_array([x+i,y+2])
			unusableValues.append_array([x+i,y-2])

	
