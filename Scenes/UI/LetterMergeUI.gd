extends Control

var alphabet := ["ABCDEFGHIJKLMNOPQRSTUVWXYZ"]
var letters_discovered = ["I", "L", "V", "M"]
var letter_btn = preload("res://Scenes/UI/letter_button.tscn")
var letter_scene = preload("res://Scenes/UI/draggable_letter.tscn")

func _ready():
	display_alphabet()
	$LeftButton.letter_dropped.connect(_on_letter_dropped)
	$RightButton.letter_dropped.connect(_on_letter_dropped)


func display_alphabet():
	for letter in alphabet[0]:
		var new_btn = letter_btn.instantiate()
		new_btn.text = letter
		if not letter in letters_discovered:
			new_btn.self_modulate = Color(Color.WHITE, 0.5)
			new_btn.disabled = true
		new_btn.letter_chosen.connect(_on_letter_chosen)
		$MarginContainer/AlphabetContainer.add_child(new_btn)


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		UiInteractionManager.current_letter_held.rotation += deg_to_rad(90) #TODO: tween/lerp 
	


func _on_letter_dropped(btn_name):
	UiInteractionManager.current_letter_held.queue_free()
	UiInteractionManager.current_letter_held = null
	check_if_letter_is_created()


func _on_letter_chosen(text):
	var draggable_letter = letter_scene.instantiate()
	draggable_letter.text = text
	add_child(draggable_letter)
	UiInteractionManager.current_letter_held = draggable_letter


func check_if_letter_is_created():
	
	#TODO: create combinations, dependent from rotation and not position
	
	pass
