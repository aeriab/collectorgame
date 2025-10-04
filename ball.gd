extends RigidBody2D

@onready var cue_ball_temp = $BallProxy/CueBallTemp
@onready var cpu_particles_2d = $CPUParticles2D
@export var collect_color: Color
@onready var collision_shape_2d = $CollisionShape2D

func _on_timer_timeout():
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.emitting = true


func _on_cpu_particles_2d_finished():
	queue_free()

func collect():
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.color = collect_color
	cpu_particles_2d.emitting = true
