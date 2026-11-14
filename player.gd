extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

@onready var animation = $AnimatedSprite2D

func _ready():
	$Camera2D.make_current()
	$AnimatedSprite2D.play("idle")
	
func _physics_process(delta):
		
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if not is_on_floor():
		velocity.y += GRAVITY * delta
		animation.play("jump")
	elif velocity.x != 0:
		animation.play("run")
	else:
		animation.play("idle")
		

	move_and_slide()

	if direction != 0:
		animation.play("run")
		animation.flip_h = direction < 0
	else:
		animation.play("idle")


func _on_bounce_pad_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -800
