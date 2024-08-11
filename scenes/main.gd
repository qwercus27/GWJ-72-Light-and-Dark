extends Node2D

var view_width = 0
var view_height = 0
var game_scale = 3
var current_level
var level_cleared = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	view_width = get_viewport().size.x
	view_height = get_viewport().size.y
	level_cleared = false
	
	current_level = Global.current_level.instantiate()
	add_child(current_level)
	
	$Player.z_index = 1
	$Player.position = current_level.get_node("StartPos").position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera_control()

func camera_control():
	$Camera.position.x = $Player.position.x
	$Camera.position.y = $Player.position.y
	$Camera.position.x = clamp($Camera.position.x, view_width/2, 
		current_level.get_node("TileMap").get_used_rect().size.x*16*game_scale - view_width/2)
	$Camera.position.y = clamp($Camera.position.y, view_height/2, 
		current_level.get_node("TileMap").get_used_rect().size.y*16*game_scale - view_height/2)
