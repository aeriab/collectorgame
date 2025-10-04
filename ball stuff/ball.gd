extends RigidBody2D

@onready var cue_ball_temp = $BallProxy/CueBallTemp
@onready var cpu_particles_2d = $CPUParticles2D
@export var collect_color: Color
@onready var collision_shape_2d = $CollisionShape2D
const POPUP_NOTIFICATION = preload("res://popup_notification.tscn")

var ball_money_value: float = 1.0

func _on_timer_timeout():
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.emitting = true


func _on_cpu_particles_2d_finished():
	queue_free()

func collect():
	Global.money += ball_money_value
	var notification = POPUP_NOTIFICATION.instantiate()
	notification.global_position = self.global_position
	get_parent().add_child(notification)
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.color = collect_color
	cpu_particles_2d.emitting = true
