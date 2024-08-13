extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_animation("unlit")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func interact():
	$PointLight2D.visible = true
	$AnimatedSprite2D.set_animation("lit")
