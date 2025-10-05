extends RigidBody2D

@onready var cue_ball_temp = $BallProxy/CueBallTemp
@onready var cpu_particles_2d = $CPUParticles2D
@export var collect_color: Color
@onready var collision_shape_2d = $CollisionShape2D
const POPUP_NOTIFICATION = preload("res://popup_notification.tscn")
@onready var ball_proxy = $BallProxy

var ball_money_value: float = 1.0

var is_rain: bool = false

func _ready():
	var random_scale: float = randf_range(Global.dust_size * 0.66,Global.dust_size * 1.33)
	initialize_scale(random_scale)

func initialize_scale(scale_val):
	collision_shape_2d.scale = Vector2(scale_val,scale_val)
	ball_proxy.scale = Vector2(scale_val,scale_val)
	cpu_particles_2d.scale = Vector2(scale_val,scale_val)

func _on_timer_timeout():
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.emitting = true


func _on_cpu_particles_2d_finished():
	queue_free()

func change_color(new_color: Color):
	cue_ball_temp.modulate = new_color

func collect():
	if is_rain:
		ball_money_value = Global.rain_value
	else:
		ball_money_value = Global.dust_value
	Global.money += ball_money_value
	var notification = POPUP_NOTIFICATION.instantiate()
	notification.global_position = self.global_position
	get_parent().add_child(notification)
	notification.set_text("+$" + str(int(ball_money_value)))
	print(ball_money_value)
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.color = collect_color
	cpu_particles_2d.emitting = true
