extends Node2D

var locked = true

# Called when the node enters the scene tree for the first time.
func _ready():
	lock()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func unlock():
	$AnimatedSprite2D.animation = "unlocked"
	$Interact/CollisionShape2D.disabled = false
	locked = false

func open():
	$AnimatedSprite2D.animation = "opened"
	
func close():
	$AnimatedSprite2D.animation = "unlocked"

func lock():
	$AnimatedSprite2D.animation = "locked"
	$Interact/CollisionShape2D.disabled = true
	locked = true
