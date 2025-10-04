extends Node

var spawn_rate: float = 4.0
var shrink_speed: float = 0.01

var money: int = 0.0

var cloud_min_speed: float = 2.0
var cloud_max_speed: float = 20.0
var cloud_min_lifetime: float = 7.0
var cloud_max_lifetime: float = 14.0
var cloud_min_size: float = 0.5
var cloud_max_size: float = 2.0
var cloud_spawn_rate: float = 25.0
var cloud_ball_spawn_rate: float = 1.5


var round_progression_rate: float = 5.0

var round: int = 1

var round_going: bool = true
signal stop_round
signal start_round

func on_bar_full():
	round_going = false
	stop_round.emit()
	print("The progress bar is full! Responding globally.")

func on_next_round_clicked():
	round += 1
	round_going = true
	start_round.emit()
