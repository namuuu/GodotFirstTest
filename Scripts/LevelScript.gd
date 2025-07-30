extends Node

func _ready() -> void:
	var levelSize = get_meta("LevelSize")
	print(levelSize)
	
func getTileInfo(x: int, y: int):
	
	if (x < get_meta("LevelOrigin").x || y < get_meta("LevelOrigin").y) :
		return OBSTACLE_TYPE.WALL
		
	if (x > get_meta("LevelOrigin").x + get_meta("LevelSize").x || y > get_meta("LevelOrigin").y + get_meta("LevelSize").y):
		return OBSTACLE_TYPE.WALL

enum OBSTACLE_TYPE {
	NONE,
	WALL
}
 
