extends Node2D

var view_width = 0
var view_height = 0
var game_scale = 3
var current_level
var level_cleared = false
var torches_lit = 0
var door

# Called when the node enters the scene tree for the first time.
func _ready():
	
	view_width = get_viewport().size.x
	view_height = get_viewport().size.y
	level_cleared = false
	
	current_level = Global.current_level.instantiate()
	add_child(current_level)
	
	$Player.z_index = 1
	$Player.position = current_level.get_node("StartPos").position * Vector2(game_scale,game_scale)

	current_level.torch_count = current_level.get_node("TileMap").get_used_cells(1).size()
	
	door = current_level.get_node("Door")
	current_level.get_node("DirectionalLight2D").visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera_control()
	
	if torches_lit == current_level.torch_count and door.locked :
		door.unlock()
		current_level.get_node("DirectionalLight2D").visible = true
		current_level.turn_on_lights()


func camera_control():
	$Camera.position.x = $Player.position.x
	$Camera.position.y = $Player.position.y
	$Camera.position.x = clamp($Camera.position.x, view_width/2, 
		current_level.get_node("TileMap").get_used_rect().size.x*16*game_scale - view_width/2)
	$Camera.position.y = clamp($Camera.position.y, view_height/2, 
		current_level.get_node("TileMap").get_used_rect().size.y*16*game_scale - view_height/2)


func _on_player_lit_torch():
	torches_lit += 1


func _on_player_opened_door():
	door.open()
