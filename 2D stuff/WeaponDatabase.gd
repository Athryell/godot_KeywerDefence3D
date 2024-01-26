extends Node


## Put this in Autoload


var cache: Dictionary = {}

@export_dir var weapons_folder

func _ready():
	var folder = DirAccess.open(weapons_folder)
	folder.list_dir_begin()
	
	var file_name = folder.get_next()
	
	while file_name != "":
		cache[file_name] = load(weapons_folder + "/" + file_name)
		file_name = folder.get_next()


func get_weapon(name_ID):
	#print(name_ID + ".tres")
	return cache[name_ID + ".tres"]
