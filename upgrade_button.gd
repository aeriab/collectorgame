extends Button

var upgrade_cost: int
var rarity: int = randi_range(min_rarity,max_rarity)

var common_upgrades = [
	{"name": "Wrench", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 10, "type": "flat"},
	{"name": "Watering can", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 10, "type": "flat"},
	{"name": "Soil", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 10, "type": "flat"},
]

var uncommon_upgrades = [
	{"name": "Wrench", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 20, "type": "flat"},
	{"name": "Watering can", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 20, "type": "flat"},
	{"name": "Soil", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 20, "type": "flat"},
]

var all_upgrades = [common_upgrades, uncommon_upgrades]
# Wrench increases movement speed, Watering can increases cloud drops, Map increases cloud spawns, soil increases dust spawning, cardboard increases collector size

func _ready():
	_on_shop_reset()
	Global.shop_reset.connect(_on_shop_reset)

var min_rarity: int = 1
var max_rarity: int = 2
var chosen_upgrade
func _on_shop_reset():
	rarity = randi_range(min_rarity,max_rarity)
	chosen_upgrade = all_upgrades[rarity-1].pick_random()
	upgrade_cost = Global.base_reroll_costs[Global.round-1] * rarity
	text = chosen_upgrade.name + "\n" + "+" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\n........................................" + "\n$" + str(upgrade_cost)

func _on_pressed() -> void:
	pass # Replace with function body.
