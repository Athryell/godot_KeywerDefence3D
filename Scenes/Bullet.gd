extends Area3D

@export var speed = 50
var mesh_text : String

func _ready():
#	mesh_text = "P"
#	$MeshInstance3D.set_text = mesh_text
	pass


func _process(delta):
	translate(Vector3(0, 0, -1 * speed * delta))

