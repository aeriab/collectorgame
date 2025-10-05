extends Button

var upgrade_cost: int
var rarity: int = randi_range(min_rarity,max_rarity)

var common_color: Color = Color("#ffffff")
var uncommon_color: Color = Color("#9af1a8")
var rare_color: Color = Color("#72e2f6")
var epic_color: Color = Color("#db95e3")
var legendary_color: Color = Color("#ffae00")

var common_upgrades = [
	#{"name": "Hammer", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 10, "type": "flat"},
	{"name": "Kite", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 10, "type": "flat"},
	{"name": "Puddle", "stat1": "Rain rate", "target_global_var1": "base_rain_spawn", "value": 10, "type": "flat"},
	{"name": "Dirt", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 10, "type": "flat"},
	{"name": "Drips", "stat1": "Rain size", "target_global_var1": "modifier_rain_size", "value": 0.9, "type": "mult"},
	{"name": "Grains", "stat1": "Dust size", "target_global_var1": "modifier_dust_size", "value": 0.9, "type": "mult"},
	{"name": "Popper", "stat1": "Dust bounce", "target_global_var1": "base_dust_bounce", "value": 25, "type": "flat"},
	{"name": "Beach Ball", "stat1": "Rain bounce", "target_global_var1": "base_rain_bounce", "value": 25, "type": "flat"},
]

var uncommon_upgrades = [
	{"name": "Wrench", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 20, "type": "flat"},
	{"name": "Wind Vane", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 20, "type": "flat"},
	{"name": "Water Bottle", "stat1": "Rain rate", "target_global_var1": "base_rain_spawn", "value": 20, "type": "flat"},
	{"name": "Drought", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 40, "type": "flat", "stat2": "Rain rate", "target_global_var2": "modifier_rain_spawn", "value2": 0.8, "type2": "mult"},
	{"name": "Lasting Lint", "stat1": "Dust lifetime", "target_global_var1": "base_dust_lifetime", "value": 40, "type": "flat"},
	{"name": "Stable Concoction", "stat1": "Rain lifetime", "target_global_var1": "modifier_rain_lifetime", "value": 1.3, "type": "mult"},
	{"name": "Unstable Concoction", "stat1": "Elixer chance", "target_global_var1": "base_elixer_chance", "value": 40, "type": "flat"},
	{"name": "Gold Pan", "stat1": "Gold chance", "target_global_var1": "base_gold_chance", "value": 40, "type": "flat"},
	{"name": "Leg Day", "stat1": "Robot size", "target_global_var1": "modifier_robot_size", "value": 1.4, "type": "mult", "stat2": "Arms size", "target_global_var2": "modifier_arms_size", "value2": 0.8, "type2": "mult"},
]

var rare_upgrades = [
	#{"name": "Screwdriver", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 50, "type": "flat"},
	{"name": "Barometer", "stat1": "Cloud rate", "target_global_var1": "modifier_cloud_spawn", "value": 1.2, "type": "mult"},
	{"name": "Watering Can", "stat1": "Rain rate", "target_global_var1": "base_rain_spawn", "value": 50, "type": "flat"},
	{"name": "Soil", "stat1": "Dust rate", "target_global_var1": "modifier_dust_spawn", "value": 1.2, "type": "mult"},
	{"name": "Pay Dirt", "stat1": "Dust value", "target_global_var1": "base_dust_value", "value": 100.0, "type": "flat", "stat2": "Gold chance", "target_global_var2": "modifier_gold_chance", "value2": 1.5, "type2": "mult"},
	{"name": "Honey", "stat1": "Rain value", "target_global_var1": "base_rain_value", "value": 150.0, "type": "flat", "stat2": "Movement speed", "target_global_var2": "modifier_movement_speed", "value2": 0.8, "type2": "mult"},
	{"name": "Nectar", "stat1": "Rain lifetime", "target_global_var1": "base_rain_lifetime", "value": 100.0, "type": "flat"},
	{"name": "Granite", "stat1": "Soil lifetime", "target_global_var1": "modifier_dust_lifetime", "value": 2.0, "type": "mult"},
	{"name": "Mining Gear", "stat1": "Gold chance", "target_global_var1": "base_gold_chance", "value": 100, "type": "flat"},
	{"name": "Juice Spill", "stat1": "Elixer chance", "target_global_var1": "modifier_elixer_chance", "value": 2.0, "type": "mult"},
	{"name": "Overgrow", "stat1": "Robot size", "target_global_var1": "modifier_robot_size", "value": 1.3, "type": "mult", "stat2": "Movement speed", "target_global_var2": "modifier_movement_speed", "value2": 0.9, "type2": "mult"},
	
]

var epic_upgrades = [
	{"name": "Compressed Air", "stat1": "Movement speed", "target_global_var1": "modifier_movement_speed", "value": 1.5, "type": "mult"},
	{"name": "Propeller", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 100, "type": "flat"},
	{"name": "Rain Barrel", "stat1": "Rain rate", "target_global_var1": "modifier_rain_spawn", "value": 1.5, "type": "mult"},
	{"name": "Earth", "stat1": "Dust rate", "target_global_var1": "modifier_dust_spawn", "value": 1.5, "type": "mult"},
	{"name": "Fancy Fluff", "stat1": "Dust value", "target_global_var1": "base_dust_value", "value": 200.0, "type": "flat"},
	{"name": "Royal Jelly", "stat1": "Rain value", "target_global_var1": "base_rain_value", "value": 200.0, "type": "flat"},
	{"name": "Tumbleweed", "stat1": "Dust size", "target_global_var1": "modifier_dust_size", "value": 2.0, "type": "mult", "stat2": "Dust value", "target_global_var2": "modifier_dust_value", "value2": 2.0, "type2": "mult"},
	{"name": "Micro Drops", "stat1": "Rain size", "target_global_var1": "modifier_rain_size", "value": 0.6, "type": "mult", "stat2": "Rain rate", "target_global_var2": "modifier_rain_spawn", "value2": 1.3, "type2": "mult"},
	
]

var legendary_upgrades = [
	#{"name": "Engine", "stat1": "Movement speed", "target_global_var1": "modifier_movement_speed", "value": 2.0, "type": "mult"},
	{"name": "Weather Balloon", "stat1": "Cloud rate", "target_global_var1": "modifier_cloud_spawn", "value": 2.0, "type": "mult"},
	{"name": "Water Tower", "stat1": "Rain rate", "target_global_var1": "modifier_rain_spawn", "value": 2.0, "type": "mult"},
	{"name": "Terra Firma", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 500, "type": "flat", "stat2": "Gold chance", "target_global_var2": "base_gold_chance", "value2": 500, "type2": "flat"},
	{"name": "Lavish Lint", "stat1": "Dust value", "target_global_var1": "modifier_dust_value", "value": 1.5, "type": "mult", "stat2": "Dust lifetime", "target_global_var2": "modifier_dust_lifetime", "value2": 2.0, "type2": "mult"},
	{"name": "Universal Solvent", "stat1": "Rain value", "target_global_var1": "modifier_rain_value", "value": 1.5, "type": "mult", "stat2": "Rain lifetime", "target_global_var2": "modifier_rain_lifetime", "value2": 2.0, "type2": "mult"},
	{"name": "Pancake", "stat1": "Collector width", "target_global_var1": "modifier_collector_width", "value": 1.5, "type": "mult", "stat2": "Collector height", "target_global_var2": "modifier_collector_height", "value2": 0.6, "type2": "mult"},
	{"name": "Popeye's Fury", "stat1": "Arms size", "target_global_var1": "modifier_arms_size", "value": 1.7, "type": "mult", "stat2": "Robot size", "target_global_var2": "modifier_robot_size", "value2": 0.9, "type2": "mult"},
	{"name": "Worth The Squeeze", "stat1": "Elixer chance", "target_global_var1": "base_elixer_chance", "value": 999, "type": "flat", "stat2": "Rain rate", "target_global_var2": "modifier_rain_spawn", "value2": 0.5, "type2": "mult"},
	
]


var all_upgrades = [common_upgrades, uncommon_upgrades, rare_upgrades, epic_upgrades, legendary_upgrades]
# Wrench increases movement speed, Watering can increases cloud drops, Map increases cloud spawns, soil increases dust spawning, cardboard increases collector size

func _ready():
	_on_shop_reset()
	Global.shop_reset.connect(_on_shop_reset)

var min_rarity: int = 1
var max_rarity: int = 5
var chosen_upgrade
func _on_shop_reset():
	modulate.a = 1.0
	disabled = false
	rarity = set_rarity_value()
	if rarity == 1:
		modulate = common_color
	elif rarity == 2:
		modulate = uncommon_color
	elif rarity == 3:
		modulate = rare_color
	elif rarity == 4:
		modulate = epic_color
	elif rarity == 5:
		modulate = legendary_color
	
	chosen_upgrade = all_upgrades[rarity-1].pick_random()
	upgrade_cost = Global.base_reroll_costs[Global.round-1] * rarity
	if chosen_upgrade.type == "mult":
		text = chosen_upgrade.name + "\n-----------------------------\n" + "x" + str(chosen_upgrade.value) + " \n" + chosen_upgrade.stat1 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
	elif chosen_upgrade.type == "flat":
		text = chosen_upgrade.name + "\n-----------------------------\n" + "+" + str(chosen_upgrade.value) + " \n" + chosen_upgrade.stat1 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
	
	if "stat2" in chosen_upgrade:
		if chosen_upgrade.type == "mult":
			if chosen_upgrade.type2 == "mult":
				text = chosen_upgrade.name + "\n-----------------------------\n" + "x" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\nx" + str(chosen_upgrade.value2) + " " + chosen_upgrade.stat2 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
			elif chosen_upgrade.type2 == "flat":
				text = chosen_upgrade.name + "\n-----------------------------\n" + "x" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\n+" + str(chosen_upgrade.value2) + " " + chosen_upgrade.stat2 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
		elif chosen_upgrade.type == "flat":
			if chosen_upgrade.type2 == "mult":
				text = chosen_upgrade.name + "\n-----------------------------\n" + "+" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\nx" + str(chosen_upgrade.value2) + " " + chosen_upgrade.stat2 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
			elif chosen_upgrade.type2 == "flat":
				text = chosen_upgrade.name + "\n-----------------------------\n" + "+" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\n+" + str(chosen_upgrade.value2) + " " + chosen_upgrade.stat2 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
	
	
	
	

func set_rarity_value() -> int:
	var total_weight = 0.0
	for rate in Global.shop_rarity_rates:
		total_weight += rate
	
	var roll = randf_range(0.0, total_weight)
	var cumulative_weight = 0.0
	for i in range(Global.shop_rarity_rates.size()):
		cumulative_weight += Global.shop_rarity_rates[i]
		if roll < cumulative_weight:
			return (i + 1) # Return the 0-based index of the chosen rarity

	return -1 # Fallback, should not happen if weights are valid

func _on_pressed() -> void:
	if Global.money >= upgrade_cost:
		Global.money -= upgrade_cost
		modulate.a = 0.0
		disabled = true
		if chosen_upgrade.type == "mult":
			Global.set(chosen_upgrade.target_global_var1, Global.get(chosen_upgrade.target_global_var1) * chosen_upgrade.value)
		elif chosen_upgrade.type == "flat":
			Global.set(chosen_upgrade.target_global_var1, Global.get(chosen_upgrade.target_global_var1) + chosen_upgrade.value)
		
		if "stat2" in chosen_upgrade:
			if chosen_upgrade.type2 == "mult":
				Global.set(chosen_upgrade.target_global_var2, Global.get(chosen_upgrade.target_global_var2) * chosen_upgrade.value2)
			elif chosen_upgrade.type == "flat":
				Global.set(chosen_upgrade.target_global_var2, Global.get(chosen_upgrade.target_global_var2) + chosen_upgrade.value2)
		
