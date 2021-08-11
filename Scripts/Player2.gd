extends Area2D

export var speed = 100
var screen_size
signal pontua2

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2()
	velocity.y = Input.get_action_strength("desce") - Input.get_action_strength("sobe")
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	
	#Não sair da tela
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.y > 0:
		$AnimatedSprite.animation = "baixo"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "cima"

func _on_Player2_body_entered(body):
	if body.name == "ganha":
		emit_signal("pontua2")
	else:
		$colisao.play()
	volta()

func volta():
	position.x = 944
	position.y = 696
