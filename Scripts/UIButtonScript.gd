extends TextureButton

func _on_button_down() -> void:
	Global.isReadyToAdvance.set("isPlayerReady", true)
