extends Node

func _ready() -> void:
	var levelSize = get_tree().current_scene.get_meta("LevelSize")
	print(levelSize)
	
func getOrigin() -> Vector2:
	return get_tree().current_scene.get_meta("LevelOrigin")
	
func getSize() -> Vector2:
	return get_tree().current_scene.get_meta("LevelSize")
	
func getTileInfo(x: int, y: int) -> int:
	if (x < getOrigin().x || y < getOrigin().y) :
		return OBSTACLE_TYPE.WALL
		
	if (x > getOrigin().x + getSize().x || y > getOrigin().y + getSize().y):
		return OBSTACLE_TYPE.WALL
		
	return OBSTACLE_TYPE.NONE
	
func getTileType(x: int, y: int):
	return Level.OBSTACLE_TYPE.find_key(getTileInfo(x, y))

enum OBSTACLE_TYPE {
	NONE,
	WALL
}
 
