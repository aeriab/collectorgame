# File: CloudSpawner.gd

extends Node2D

# Drag your Cloud.tscn file here from the FileSystem dock
@export var cloud_scene: PackedScene

@onready var spawn_area: ColorRect = $ColorRect
@onready var timer: Timer = $Timer

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	_on_timer_timeout()
	Global.stop_round.connect(_on_stop_round)
	Global.start_round.connect(_on_start_round)

func _on_stop_round():
	timer.stop()

func _on_start_round():
	timer.wait_time = randf_range(0.01, Global.cloud_spawn_rate)
	timer.start()

func _on_timer_timeout():
	var cloud_instance = cloud_scene.instantiate()
	var spawn_area_rect = spawn_area.get_rect()
	var random_x = randf_range(spawn_area_rect.position.x, spawn_area_rect.end.x)
	var random_y = randf_range(spawn_area_rect.position.y, spawn_area_rect.end.y)
	get_parent().add_child(cloud_instance)
	cloud_instance.global_position = global_position + Vector2(random_x, random_y)
	timer.wait_time = randf_range(0.01, Global.cloud_spawn_rate)
