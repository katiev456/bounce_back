extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

	if direction != 0:
		animation.play("run")
		animation.flip_h = direction < 0
	else:
		animation.play("idle")


func _on_bounce_pad_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -800
