# File: Cloud.gd
extends Node2D

var fade_in_duration: float = 4.0
var fade_out_duration: float = 5.0

# Private variables for this specific instance
var _speed: float
var _lifetime: float


@onready var spawn_area = $ColorRect
@export var ball_scene: PackedScene
@export var cloud_ball_color: Color

func _ready():
	var randSize = randf_range(Global.cloud_min_size, Global.cloud_max_size)
	scale = Vector2(randSize,randSize)
	_speed = randf_range(Global.cloud_min_speed, Global.cloud_max_speed)
	_lifetime = randf_range(Global.cloud_min_lifetime, Global.cloud_max_lifetime)
	animate()
	Global.stop_round.connect(_on_stop_round)
	Global.start_round.connect(_on_start_round)

func _on_stop_round():
	timer.stop()

func _on_start_round():
	timer.start()

func _process(delta: float):
	position.x += _speed * delta

func animate():
	modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, fade_in_duration)
	tween.tween_interval(_lifetime)
	tween.tween_property(self, "modulate:a", 0.0, fade_out_duration)
	tween.finished.connect(queue_free)

@onready var timer = $Timer

func _on_timer_timeout():
	var ball_instance = ball_scene.instantiate()
	var spawn_area_rect = spawn_area.get_rect()
	var random_x = randf_range(spawn_area_rect.position.x, spawn_area_rect.end.x)
	var random_y = randf_range(spawn_area_rect.position.y, spawn_area_rect.end.y)
	get_parent().add_child(ball_instance)
	ball_instance.is_rain = true
	var random_scale: float = randf_range(Global.rain_size * 0.66,Global.rain_size * 1.33)
	ball_instance.initialize_scale(random_scale)
	
	ball_instance.physics_material_override.bounce = Global.rain_bounce
	
	var random_lifetime: float = randf_range(Global.rain_lifetime * 0.66,Global.rain_lifetime * 1.33)
	ball_instance.initialize_lifetime(random_lifetime)
	ball_instance.change_color(cloud_ball_color)
	ball_instance.global_position = global_position + Vector2(random_x, random_y)
	timer.wait_time = randf_range(0.01, Global.cloud_ball_spawn_rate)
