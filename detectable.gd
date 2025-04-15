class_name Detectable extends RigidBody2D

@export var detectable_type: detectable_types
enum detectable_types {ENEMY,PICKUP}

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body is Player:
		queue_free()
