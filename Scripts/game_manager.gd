extends Node

var death_count = 0

signal deaths_changed(new_count)

func player_died():
	death_count += 1
	print("Deaths: ", death_count)
	deaths_changed.emit(death_count)

func restart_level():
	get_tree().reload_current_scene()
	
	
