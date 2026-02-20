extends CharacterBody2D

@export var speed = 500.0
@onready var sprite = $Sprite2D

func _ready():
	var label = get_tree().current_scene.get_node("Label")
	label.text = "REACH PACIL!!!"
	label.visible = true
	
	await get_tree().create_timer(1.0).timeout
	
	label.visible = false

func _physics_process(delta):
	
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
		sprite.rotation = deg_to_rad(0)
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
		sprite.rotation = deg_to_rad(180)

	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		sprite.rotation = deg_to_rad(-90)
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
		sprite.rotation = deg_to_rad(90)
	
	direction = direction.normalized()
	
	velocity = direction * speed
	move_and_slide()
