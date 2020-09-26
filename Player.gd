extends KinematicBody2D

const MAX_VELOCITY = 120
const ACCELERATION = 10
const DECELERATION = 50

var velocity = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		$AnimationPlayer.play("Running")
		velocity.x += 10
		velocity.x = clamp(velocity.x, -MAX_VELOCITY, MAX_VELOCITY)
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		$AnimationPlayer.play("Running")
		velocity.x -= 10
		velocity.x = clamp(velocity.x, -MAX_VELOCITY, MAX_VELOCITY)
	else:
		$AnimationPlayer.play("To Rest")
		if velocity.x > DECELERATION:
			velocity.x -= DECELERATION;
		elif velocity.x > -DECELERATION:
			velocity.x = 0;
		else:
			velocity.x += DECELERATION
	
	velocity = move_and_slide(velocity, Vector2.UP)
