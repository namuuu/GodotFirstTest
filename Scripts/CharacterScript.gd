extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var go = false 

func _process(delta: float) -> void:
	if Global.advance == true:
		go = true
		Global.isReadyToAdvance.set("characterReady", false)
		
	if go == true:
		print("J'avance!")
		animated_sprite.play('move_right')
		for i in 4:
			position.x += 4
		animated_sprite.play("right")
		
		
		Global.isReadyToAdvance.set("characterReady", true)
