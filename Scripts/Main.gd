extends Node

const novocarro = preload("res://Scenes/carros.tscn")

var pdevagar = [600, 544, 438, 324, 216, 160]
var prapido = [488, 272, 104]

var score1 = 5
var score2 = 5

var total_score = 5

func _ready():
	$Button.hide()
	$tema.play()
	$placar1.text = str(total_score)
	$placar2.text = str(total_score)
	score1 = total_score
	score2 = total_score
	randomize()

func _on_horacarrorapido_timeout():
	var carrorapido = novocarro.instance()
	add_child(carrorapido)
	carrorapido.position.x = -10
	carrorapido.position.y = prapido[randi() % prapido.size()]
	carrorapido.linear_velocity = Vector2(rand_range(700, 710), 0)

func _on_horacarrodevagar_timeout():
	var carrodevagar = novocarro.instance()
	add_child(carrodevagar)
	carrodevagar.position.x = -10
	carrodevagar.position.y = pdevagar[randi() % pdevagar.size()]
	carrodevagar.linear_velocity = Vector2(rand_range(300, 310), 0)

func _on_Player_pontua():
	if score1 <= total_score:
		score1 -= 1
		$ponto.play()
		$placar1.text = str(score1)
	if score1 == 0:
		$Button.show()
		$tema.stop()
		$resultado.text = "P1 Ganhou!"
		$ganhou.play()
		$horacarrodevagar.stop()
		$horacarrorapido.stop()

func _on_Player2_pontua2():
	if score2 <= total_score:
		score2 -= 1
		$ponto.play()
		$placar2.text = str(score2)
	if score2 == 0:
		$Button.show()
		$tema.stop()
		$resultado.text = "P2 Ganhou!"
		$ganhou.play()
		$horacarrodevagar.stop()
		$horacarrorapido.stop()

func _on_Button_pressed():
	$Button.hide()
	get_tree().reload_current_scene()
