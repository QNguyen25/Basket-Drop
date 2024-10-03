extends Area2D
@export var speed = 400
signal hit




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.set_deferred("disabled", false)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move right"):
		velocity.x += 1
	if Input.is_action_pressed("move left"):
		velocity.x -= 1
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta


	if velocity.x !=0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0

func _on_body_entered(body):
	hit.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	print("I was hit")


func _on_hit():
	pass # Replace with function body.
