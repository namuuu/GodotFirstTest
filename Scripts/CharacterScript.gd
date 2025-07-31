extends CharacterBody2D

# Data
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var animation_speed: float = 50
var direction: Vector2i = Vector2i.RIGHT

# Info variables
var go = false 
var goal

func _process(delta: float) -> void:
	if Global.advance == true:
		go = true
		Global.isReadyToAdvance.set("characterReady", false)
		
		# Set goal corresponding to obstacle
		match Level.getTileInfo(seeForward().x, seeForward().y):
			Level.OBSTACLE_TYPE.WALL:
				goal = position
			Level.OBSTACLE_TYPE.NONE:
				goal = Vector2(position.x + (16 * direction.x), position.y + (16 * direction.y))
		
	if go == true:
		position = position.move_toward(goal, animation_speed * delta)
		playMoveAnimation()
		
		# Check if we attained the goal
		if(position.x == goal.x && position.y == goal.y):
			go = false
			playStandingAnimation()
			Global.isReadyToAdvance.set("characterReady", true)
			
func getPosition() -> Vector2i:
	return Vector2((position.x + 8)/16, (position.y + 8)/16)
	

func playStandingAnimation():
	match direction:
		Vector2i.RIGHT:
			animated_sprite.play('right')
		Vector2i.LEFT:
			animated_sprite.play("left")
		Vector2i.UP:
			animated_sprite.play("up")
		Vector2i.DOWN:
			animated_sprite.play("down")
	
func playMoveAnimation():
	match direction:
		Vector2i.RIGHT:
			animated_sprite.play('move_right')
		Vector2i.LEFT:
			animated_sprite.play("move_left")
		Vector2i.UP:
			animated_sprite.play("move_up")
		Vector2i.DOWN:
			animated_sprite.play("move_down")
	
func seeForward():
	return Vector2(getPosition().x + direction.x, getPosition().y + direction.y)
