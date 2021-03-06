extends Node


#This is a SceneBrowser.


#Call change_scene( "SceneName" )  to change scene.

#Add the path to scenes in get_scene
var loader : ResourceInteractiveLoader

export var scene_map : Dictionary = {
	"Main Menu": "res://UI/MainMenu.tscn",
	"Level 1": "res://Levels/Level1.tscn",
	"Level 2": "res://Levels/Level2.tscn",
	"Level 3": "res://Levels/Level3.tscn",
	"Level 4": "res://Levels/Level4.tscn",
	"Level 5": "res://Levels/Level5.tscn",
	"Level 6": "res://Levels/Level6.tscn",
	"Level 7": "res://Levels/Level7.tscn",
	"Level 8": "res://Levels/Level8.tscn",
	"Level 9": "res://Levels/Level9.tscn",
	"Level 10": "res://Levels/Level10.tscn",
	"Credits": "res://UI/creditsBackground.tscn",
}

func change_scene( scene_name ):
	var new = get_scene( scene_name )
	new = load( new )
	get_tree().change_scene_to( new )
 #end


func get_current_scene() -> Node:
	return get_tree().current_scene


func change_scene_with_load( scene_name, loader_name = "Hi" ):
	#I figured we might want different loader's each time or
	#something. Hence the loader argument.
	var new_scene = get_scene( scene_name )
	loader = ResourceLoader.load_interactive( new_scene )
	set_process( true )
 #end


#ADD HERE
func get_scene( scene_name ):
	return scene_map[scene_name]
 #end


func _process(delta):
	loader.poll()

	if loader.get_resource() != null :
		get_tree().change_scene_to( loader.get_resource() )
		get_tree().paused = false
		set_process( false )
		return
 #end


func _ready():
	set_process( false )
 #end


