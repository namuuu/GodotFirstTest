extends Node

var isReadyToAdvance: Dictionary = {
	#isPlayerReady = false,
	hasBufferedTimerCooldown = true
};

# Global time advance variable.
var advance: bool = false;

# Make sure that at least a second passed before advancing one more step
var bufferTimer = Timer.new()

func _ready() -> void:
	bufferTimer.timeout.connect(bufferTimerFinish)
	add_child(bufferTimer)

func _process(delta: float) -> void:
	var checkReadyToAdvance = true
	
	if advance == true:
		advance = false
		return
	
	# Vérifier que le dictionnaire de isReadyToAdvance est entièrement True
	for value in isReadyToAdvance.values():
		if value == false:
			checkReadyToAdvance = false
			
	
	if checkReadyToAdvance == false:
		return
		
	advance = true
	
	isReadyToAdvance = {
		#isPlayerReady = false,
		hasBufferedTimerCooldown = false
	};
	
	bufferTimer.start(1)
		
func bufferTimerFinish() -> void:
	print("Advancement step")
	isReadyToAdvance.set("hasBufferedTimerCooldown", true)
