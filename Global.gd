extends Node

# Upgradable values
var base_movement_speed: float = 100
var modifier_movement_speed: float = 1.0
var adjusted_movement_speed: float = base_movement_speed * modifier_movement_speed

var base_cloud_spawn: float = 100
var modifier_cloud_spawn: float = 1.0
var adjusted_cloud_spawn: float = base_cloud_spawn * modifier_cloud_spawn

var base_rain_spawn: float = 100
var modifier_rain_spawn: float = 1.0
var adjusted_rain_spawn: float = base_rain_spawn * modifier_rain_spawn

var base_dust_spawn: float = 100
var modifier_dust_spawn: float = 1.0
var adjusted_dust_spawn: float = base_dust_spawn * modifier_dust_spawn

var base_rain_value: float = 100.0
var modifier_rain_value: float = 1.0
var adjusted_rain_value: float = base_rain_value * modifier_rain_value

var base_dust_value: float = 100.0
var modifier_dust_value: float = 1.0
var adjusted_dust_value: float = base_dust_value * modifier_dust_value

var base_rain_size: float = 100.0
var modifier_rain_size: float = 1.0
var adjusted_rain_size: float = base_rain_size * modifier_rain_size

var base_dust_size: float = 100.0
var modifier_dust_size: float = 1.0
var adjusted_dust_size: float = base_dust_size * modifier_dust_size

var base_rain_lifetime: float = 100.0
var modifier_rain_lifetime: float = 1.0
var adjusted_rain_lifetime: float = base_rain_lifetime * modifier_rain_lifetime

var base_dust_lifetime: float = 100.0
var modifier_dust_lifetime: float = 1.0
var adjusted_dust_lifetime: float = base_dust_lifetime * modifier_dust_lifetime

var base_rain_bounce: float = 100.0
var modifier_rain_bounce: float = 1.0
var adjusted_rain_bounce: float = base_rain_bounce * modifier_rain_bounce

var base_dust_bounce: float = 100.0
var modifier_dust_bounce: float = 1.0
var adjusted_dust_bounce: float = base_dust_bounce * modifier_dust_bounce

var base_collector_width: float = 100.0
var modifier_collector_width: float = 1.0
var adjusted_collector_width: float = base_collector_width * modifier_collector_width

var base_collector_height: float = 100.0
var modifier_collector_height: float = 1.0
var adjusted_collector_height: float = base_collector_height * modifier_collector_height

var base_arms_size: float = 100.0
var modifier_arms_size: float = 1.0
var adjusted_arms_size: float = base_arms_size * modifier_arms_size

var base_robot_size: float = 100.0
var modifier_robot_size: float = 1.0
var adjusted_robot_size: float = base_robot_size * modifier_robot_size
#########################################################################################################

var base_elixer_chance: float = 100.0
var modifier_elixer_chance: float = 1.0
var adjusted_elixer_chance: float = base_elixer_chance * modifier_elixer_chance

var base_gold_chance: float = 100.0
var modifier_gold_chance: float = 1.0
var adjusted_gold_chance: float = base_gold_chance * modifier_gold_chance











func _process(delta: float) -> void:
	# ADJUSTED VALUES
	adjusted_movement_speed = base_movement_speed * modifier_movement_speed
	adjusted_cloud_spawn = base_cloud_spawn * modifier_cloud_spawn
	adjusted_rain_spawn = base_rain_spawn * modifier_rain_spawn
	adjusted_dust_spawn = base_dust_spawn * modifier_dust_spawn
	adjusted_rain_value = base_rain_value * modifier_rain_value
	adjusted_dust_value = base_dust_value * modifier_dust_value
	adjusted_rain_size = base_rain_size * modifier_rain_size
	adjusted_dust_size = base_dust_size * modifier_dust_size
	adjusted_rain_lifetime = base_rain_lifetime * modifier_rain_lifetime
	adjusted_dust_lifetime = base_dust_lifetime * modifier_dust_lifetime
	adjusted_rain_bounce = base_rain_bounce * modifier_rain_bounce
	adjusted_dust_bounce = base_dust_bounce * modifier_dust_bounce
	adjusted_collector_width = base_collector_width * modifier_collector_width
	adjusted_collector_height = base_collector_height * modifier_collector_height
	adjusted_arms_size = base_arms_size * modifier_arms_size
	adjusted_robot_size = base_robot_size * modifier_robot_size
	
	adjusted_elixer_chance = base_elixer_chance * modifier_elixer_chance
	adjusted_gold_chance = base_gold_chance * modifier_gold_chance
	
	
	
	# ACTUALLY SETTING VALUES
	dust_spawn_rate = 2.0 * (1 / (adjusted_dust_spawn / 100.0))
	cloud_spawn_rate = 25.0 * (1 / (adjusted_cloud_spawn / 100.0))
	cloud_ball_spawn_rate = 2.0 * (1 / (adjusted_rain_spawn / 100.0))
	move_speed = 160.0 * (adjusted_movement_speed / 100.0)
	rain_value = 1.0 * (adjusted_rain_value / 100.0)
	dust_value = 1.0 * (adjusted_dust_value / 100.0)
	rain_size = 1.0 * (adjusted_rain_size / 100)
	dust_size = 1.0 * (adjusted_dust_size / 100)
	rain_lifetime = 10.0 * (adjusted_rain_lifetime / 100)
	dust_lifetime = 20.0 * (adjusted_dust_lifetime / 100)
	rain_bounce = min(0.3 * (adjusted_rain_bounce / 100), 1.0)
	dust_bounce = min(0.3 * (adjusted_dust_bounce / 100), 1.0)
	collector_width = 1.0 * (adjusted_collector_width / 100)
	collector_height = 1.0 * (adjusted_collector_height / 100)
	arms_size = 1.0 * (adjusted_arms_size / 100)
	robot_size = 1.0 * (adjusted_robot_size / 100)
	
	elixer_chance = 1.0 * (adjusted_elixer_chance / 100)
	gold_chance = 1.0 * (adjusted_gold_chance / 100)
	
	
	

# IMPORTANT VALUES
var dust_spawn_rate: float = 2.0
var cloud_spawn_rate: float = 25.0
var cloud_ball_spawn_rate: float = 2.0
var move_speed: float = 160.0
var dust_value: float = 1.0
var rain_value: float = 1.0
var money: int = 1000.0
var dust_size: float = 1.0
var rain_size: float = 1.0
var rain_lifetime: float = 10.0
var dust_lifetime: float = 20.0
var dust_bounce: float = 0.3
var rain_bounce: float = 0.3
var collector_width: float = 1.0
var collector_height: float = 1.0
var arms_size: float = 1.0
var robot_size: float = 1.0

var elixer_chance: float = 1.0
var gold_chance: float = 1.0







var shrink_speed: float = 0.01
var cloud_min_speed: float = 2.0
var cloud_max_speed: float = 20.0
var cloud_min_lifetime: float = 7.0
var cloud_max_lifetime: float = 14.0
var cloud_min_size: float = 1.0
var cloud_max_size: float = 2.5

###########################################################   IMPORTANT
var round_progression_rate: float = 5.0


var round: int = 1
var base_reroll_costs: Array[int] = [5,10,20,30,50,80,120,200,300,400,550,750,1000,1500,2500,3500]
var reroll_cost: int = 5

var shop_rarity_rates: Array[float] = [35,30,20,10,5]

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
