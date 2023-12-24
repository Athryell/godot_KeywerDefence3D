extends Node

const key_scene = preload("res://Scenes/key.tscn") 
const KEY_DIMENSIONS = 1.3

func _ready():
	init_keyboard()


func init_keyboard():
	var keyboard_layout = [
		"QWERTYUIOP",
		"ASDFGHJKL",
		"ZXCVBNM"
	]
	
	for row in range(keyboard_layout.size()):
		for col in range(keyboard_layout[row].length()):
			var letter = keyboard_layout[row][col]
			var new_key = key_scene.instantiate()
			new_key.name = "Key_" + letter
			new_key.letter_bind = letter
			new_key.position.x = col * KEY_DIMENSIONS + row * 0.5
			new_key.position.z = row * KEY_DIMENSIONS

			$Keyboard.add_child(new_key)
