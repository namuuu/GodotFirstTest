extends CharacterBody2D

func _process(delta: float) -> void:
	if Global.advance == true:
		print("J'avance!")
		Global.isReadyToAdvance.set("characterReady", true)
