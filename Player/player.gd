class_name Player extends CharacterBody2D

@onready var sprite: TextureRect = %TextureRect_Sprite


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var flipping: bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("Left", "Right")
	
	if direction:
		velocity.x = direction * SPEED

		if direction > 0:
			if not flipping:
				flipping = true
				var tween = create_tween()
				tween.tween_property(sprite, "scale:x", -.799, .2)
				tween.finished.connect(_on_flip_finished)
		else:
			if not flipping:
				flipping = true
				var tween = create_tween()
				tween.tween_property(sprite, "scale:x", .799, .2)
				tween.finished.connect(_on_flip_finished)
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _on_flip_finished():
	flipping = false
	
	
