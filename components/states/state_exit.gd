extends PlayerState


func enter(_msg := {}) -> void:

	player.velocity = Vector2.ZERO
	
	
func update(delta: float) -> void:
	
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if player.scale > Vector2(1, 1):
			player.scale -= Vector2(0.01, 0.01)
			player.position.y += 0.1
			player.get_node("AnimatedSprite2D").modulate.a -= 0.01
			if player.get_node("PointLight2D").energy > 0:
				player.get_node("PointLight2D").energy -= 0.02

