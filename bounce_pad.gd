extends Area2D

const BOUNCE_FORCE = -800.0

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = BOUNCE_FORCE
