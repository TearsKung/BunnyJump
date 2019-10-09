extends Area2D
var score = 0

func _on_Node2D_body_entered(body):
	queue_free()
	if score >= 1:
			$AudioStreamPlayer.play()
			score = score + 1
	
