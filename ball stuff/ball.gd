extends RigidBody2D

@onready var cue_ball_temp = $BallProxy/CueBallTemp
@onready var cpu_particles_2d = $CPUParticles2D
@export var collect_color: Color
@onready var collision_shape_2d = $CollisionShape2D
const POPUP_NOTIFICATION = preload("res://popup_notification.tscn")
@onready var ball_proxy = $BallProxy

var ball_money_value: float = 1.0

var is_rain: bool = false
var is_elixer: bool = false
var is_gold: bool = false

func _ready():
	if Global.gold_chance >= randf_range(0.0,100.0):
		is_gold = true
		modulate = Color("#FFD700")
	else:
		modulate = Color("#ac9c86")
	
	physics_material_override.bounce = Global.dust_bounce
	
	var random_scale: float = randf_range(Global.dust_size * 0.66,Global.dust_size * 1.33)
	initialize_scale(random_scale)
	
	var random_lifetime: float = randf_range(Global.dust_lifetime * 0.66,Global.dust_lifetime * 1.33)
	initialize_lifetime(random_lifetime)

@onready var timer = $Timer
func initialize_lifetime(lifetime_val):
	print(lifetime_val)
	timer.stop()
	timer.wait_time = lifetime_val
	timer.start()


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
		if is_elixer:
			ball_money_value = Global.rain_value * 10
	else:
		ball_money_value = Global.dust_value
		if is_gold:
			ball_money_value = Global.dust_value * 10
	Global.money += ball_money_value
	var notification = POPUP_NOTIFICATION.instantiate()
	notification.global_position = self.global_position
	get_parent().add_child(notification)
	notification.set_text("+$" + str(int(ball_money_value)))
	collision_shape_2d.disabled = true
	cue_ball_temp.visible = false
	cpu_particles_2d.color = collect_color
	cpu_particles_2d.emitting = true
