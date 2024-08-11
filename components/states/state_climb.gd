extends PlayerState

func enter(_msg := {}) -> void:
	print("entered climb state")
	player.released_ladder.connect(on_released_ladder)
	#player.get_node("AnimatedSprite2D").play("climbing")


func physics_update(delta: float) -> void:
	
	#if Input.is_action_pressed("down") and player.is_on_floor() and not player.can_climb:
		#state_machine.transition_to("Idle")
		#return
	
	var direction = Input.get_axis("left", "right")

	if direction:
		player.velocity.x = direction * player.speed
		if direction > 0:
			player.get_node("AnimatedSprite2D").set_flip_h(false)
		elif direction < 0:
			player.get_node("AnimatedSprite2D").set_flip_h(true)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
	
	var y_direction = Input.get_axis("up", "down")
	
	if y_direction:
		
		player.velocity.y = y_direction * player.ladder_speed
	else:
		player.velocity.y = move_toward(player.velocity.y, 0, player.ladder_speed)
	#player.velocity.y += player.gravity * delta

	player.move_and_slide()
	
	if Input.is_action_just_pressed("space"):
		state_machine.transition_to("Air", {do_jump = true})

func on_released_ladder():
	if(not player.is_on_floor()):
		state_machine.transition_to("Air")
	else:
		state_machine.transition_to("Run")

