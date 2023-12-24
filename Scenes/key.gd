class_name KeyScene
extends Node3D

@export var press_offset := 0.2

var letter_bind: String
var bullet_scene = preload("res://Scenes/bullet.tscn")

func _ready():
	$LetterLabel.text = letter_bind.to_upper()

func _input(event):
	if event is InputEventKey and event.as_text_keycode() == letter_bind.to_upper():
		if event.pressed and not event.echo:
			handle_key_press()
		elif event.is_released():
			handle_key_released()

func handle_key_press():
	position.y -= press_offset
	shoot()
	pass
	
func handle_key_released():
	position.y += press_offset
	pass
	
func shoot():
	var bullet: Area3D = bullet_scene.instantiate()
	bullet.position = $Marker3D.position
	#bullet.get_node("MeshInstance3D").text = letter_bind.to_upper()
	
	add_child(bullet)
