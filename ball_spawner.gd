# ball_spawner.gd
extends Node2D

## The scene for the ball you want to spawn.
## Drag your "ball.tscn" file from the FileSystem dock here in the Inspector.
@export var ball_scene: PackedScene

## The horizontal range (min and max X values) for spawning.
@export_group("Spawn Range")
@export var spawn_x_min: float = -800.0
@export var spawn_x_max: float = 800.0 # Default width for a new 2D project

## The vertical position (Y value) for spawning.
@export var spawn_y_position: float = -800.0
@onready var timer = $Timer


# This function runs every time the Timer node times out.
# You must connect your Timer's "timeout" signal to this function.
func _on_timer_timeout():
	var new_ball = ball_scene.instantiate()
	var random_x = randf_range(spawn_x_min, spawn_x_max)
	new_ball.position = Vector2(random_x, spawn_y_position)
	add_child(new_ball)
	timer.wait_time = randf_range(0.01, Global.spawn_rate)
