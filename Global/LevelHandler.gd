extends Node

var current_level : int = 0

var level_array : Array = [ "Integration Test" ]



func next_level():
	#Move onto the next level in the array of levels.
	#Right now, just keep playing the test scene again and
	#again.
	SceneBrowser.change_scene( level_array[ 0 ] )
