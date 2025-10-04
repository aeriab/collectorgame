extends Node

# Upgradable values
var base_movement_speed: float = 100
var modifier_movement_speed: float = 1.0
var adjusted_movement_speed: float = base_movement_speed * modifier_movement_speed

var base_cloud_spawn: float = 100
var modifier_cloud_spawn: float = 1.0
var adjusted_cloud_spawn: float = base_cloud_spawn * modifier_cloud_spawn

var base_dust_spawn: float = 100
var modifier_dust_spawn: float = 1.0
var adjusted_dust_spawn: float = base_dust_spawn * modifier_dust_spawn

func _process(delta: float) -> void:
	adjusted_movement_speed = base_movement_speed * modifier_movement_speed
	adjusted_cloud_spawn = base_cloud_spawn * modifier_cloud_spawn
	adjusted_dust_spawn = base_dust_spawn * modifier_dust_spawn
	
	spawn_rate = 4.0 * (adjusted_dust_spawn / 100.0)
	cloud_spawn_rate = 25.0 * (adjusted_cloud_spawn / 100.0)
	move_speed = 160.0 * (adjusted_movement_speed / 100.0)
	pass

var spawn_rate: float = 4.0
var cloud_spawn_rate: float = 25.0
var move_speed: float = 160.0
var money: int = 1000.0

var shrink_speed: float = 0.01
var cloud_min_speed: float = 2.0
var cloud_max_speed: float = 20.0
var cloud_min_lifetime: float = 7.0
var cloud_max_lifetime: float = 14.0
var cloud_min_size: float = 0.5
var cloud_max_size: float = 2.0
var cloud_ball_spawn_rate: float = 1.5


var round_progression_rate: float = 5.0

var round: int = 1
var base_reroll_costs: Array[int] = [5,10,20,30,50,80,120,200,300,400,550,750,1000,1500,2500,3500]
var reroll_cost: int = 5

var round_going: bool = true
signal stop_round
signal start_round
signal shop_reset

func on_bar_full():
	round_going = false
	stop_round.emit()

func on_reroll_clicked():
	if reroll_cost <= money:
		shop_reset.emit()
		money -= reroll_cost
		reroll_cost = ceil(reroll_cost * 1.2)

func on_next_round_clicked():
	round += 1
	reroll_cost = base_reroll_costs[round - 1]
	round_going = true
	start_round.emit()
	shop_reset.emit()
