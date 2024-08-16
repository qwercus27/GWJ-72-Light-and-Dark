extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_animation("unlit")
	$InteractHint.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func interact():
	$PointLight2D.visible = true
	$AnimatedSprite2D.set_animation("lit")
	$InteractHint.visible = false

func show_hint():
	$InteractHint.visible = true

func hide_hint():
	$InteractHint.visible = false
	

func _on_interact_area_entered(area):
	if area.is_in_group("player"):
		if $AnimatedSprite2D.animation == "unlit":
			show_hint()

func _on_interact_area_exited(area):
	if area.is_in_group("player"):
		hide_hint()
