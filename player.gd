extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

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
		velocity += get_gravity() * delta
		$AnimatedSprite2D.play("jump")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
		
	move_and_slide()
