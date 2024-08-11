extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_detect_ladder_area_entered(area):
	if area.is_in_group("ladder"):
		$Platform.collision_layer = 0
		$Platform.collision_mask = 0

func _on_one_way_timer_timeout():
	$Platform.collision_layer = 1
	$Platform.collision_mask = 1
