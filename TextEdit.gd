extends TextEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = loadFile();
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	saveFile(self.text);


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
