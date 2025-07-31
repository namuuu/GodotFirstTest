extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var go = false 
var goal
var SPEED = 50

func _process(delta: float) -> void:
	if Global.advance == true:
		go = true
		Global.isReadyToAdvance.set("characterReady", false)
		goal = Vector2(position.x + 16, position.y + 0)
		
	if go == true:
		#print("J'avance!")
		animated_sprite.play('move_right')
		position = position.move_toward(goal, SPEED * delta)
		
		if(position.x == goal.x && position.y == goal.y):
			go = false
			animated_sprite.play("right")
			Global.isReadyToAdvance.set("characterReady", true)
