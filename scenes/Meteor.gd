extends Area2D

@export var speed := 500.0
var active := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta):
	if not active:
		return
	position.x += speed * delta

func _on_body_entered(body: CharacterBody2D):
	if body.name == "GreenShip":
		get_tree().reload_current_scene()
		print("COLLIDE")
