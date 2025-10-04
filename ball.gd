extends RigidBody2D

@onready var cue_ball_temp = $BallProxy/CueBallTemp
@onready var cpu_particles_2d = $CPUParticles2D

func _on_timer_timeout():
	cue_ball_temp.visible = false
	cpu_particles_2d.emitting = true
	#queue_free()


func _on_cpu_particles_2d_finished():
	queue_free()
