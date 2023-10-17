extends Node

var fase: int = 1
var itens: int = 0
var maxItens: int = 0

func reset():
	itens = 0
	maxItens = 0

func addItem():
	itens += 1
	if (itens == maxItens):
		get_tree().call_group("HUD", "vitoria")
		get_tree().call_group("player", "stop")
