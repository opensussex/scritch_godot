extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var _timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(10.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	self.text = loadFile()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func saveFile(content):
	var file = File.new()
	file.open("user://scritch.dat", File.WRITE)
	file.store_string(content)
	file.close()

func loadFile():
	var file = File.new()
	file.open("user://scritch.dat", File.READ)
	var content = file.get_as_text()
	file.close()
	return content
	
func _on_Timer_timeout():
	print('!!!')
	saveFile(self.text)
