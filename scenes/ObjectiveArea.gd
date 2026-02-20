extends Area2D

@export var next_level_path : String = "res://scenes/SecondLevel.tscn"

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		level_complete()


func _on_body_entered(body: CharacterBody2D):
	if (body.name == "GreenShip"):
		print("Reached objective!")
		level_2_complete()

	await get_tree().create_timer(2.0).timeout
	get_tree().quit()
		
func level_complete():
	print("LEVEL COMPLETE!")

	show_level_message()

	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file(next_level_path)
	
func level_2_complete():
	print("YOU WIN!!!")

	show_level_2_message()

	await get_tree().create_timer(2.0).timeout
	
func show_level_message():
	var label = get_tree().current_scene.get_node("Label")
	label.text = "LEVEL COMPLETE!"
	label.visible = true

func show_level_2_message():
	var label = get_tree().current_scene.get_node("Label")
	label.text = "YOU WIN!!!"
	label.visible = true
