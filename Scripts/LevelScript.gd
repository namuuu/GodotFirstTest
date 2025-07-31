extends Node

var levelData = {
	"level01": {
		playerSpawn = "0;0",
		playerSpawnDirection = "down",
		obstacles = {
			"0;3": "WALL"
		}
	}
}
	
func getOrigin() -> Vector2:
	return get_tree().current_scene.get_meta("LevelOrigin")
	
func getSize() -> Vector2:
	return get_tree().current_scene.get_meta("LevelSize")

func getLevelData():
	return levelData[get_tree().current_scene.get_meta("LevelId")]
	
func getTileInfo(x: int, y: int) -> int:
	if (x < getOrigin().x || y < getOrigin().y) :
		return OBSTACLE_TYPE.WALL
		
	if (x > getOrigin().x + getSize().x || y > getOrigin().y + getSize().y):
		return OBSTACLE_TYPE.WALL
		
	var tileStringLocation: String = str(x, ";", y)
	if getLevelData()["obstacles"].has(tileStringLocation):
		return OBSTACLE_TYPE.get(getLevelData()["obstacles"][tileStringLocation])
		
	return OBSTACLE_TYPE.NONE
	
func getTileType(x: int, y: int):
	return Level.OBSTACLE_TYPE.find_key(getTileInfo(x, y))

enum OBSTACLE_TYPE {
	NONE,
	WALL
}
 
