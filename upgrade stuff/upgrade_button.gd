extends Button

var upgrade_cost: int
var rarity: int = randi_range(min_rarity,max_rarity)

var common_color: Color = Color("#ffffff")
var uncommon_color: Color = Color("#9af1a8")
var rare_color: Color = Color("#72e2f6")
var epic_color: Color = Color("#db95e3")
var legendary_color: Color = Color("#ffae00")

var common_upgrades = [
	{"name": "Hammer", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 10, "type": "flat"},
	{"name": "Kite", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 10, "type": "flat"},
	{"name": "Puddle", "stat1": "Rain rate", "target_global_var1": "base_rain_spawn", "value": 10, "type": "flat"},
	{"name": "Dirt", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 10, "type": "flat"},
]

var uncommon_upgrades = [
	{"name": "Wrench", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 20, "type": "flat"},
	{"name": "Wind vane", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 20, "type": "flat"},
	{"name": "Water bottle", "stat1": "Rain rate", "target_global_var1": "base_rain_spawn", "value": 20, "type": "flat"},
	{"name": "Mud", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 20, "type": "flat"},
]

var rare_upgrades = [
	{"name": "Screwdriver", "stat1": "Movement speed", "target_global_var1": "base_movement_speed", "value": 50, "type": "flat"},
	{"name": "Barometer", "stat1": "Cloud rate", "target_global_var1": "modifier_cloud_spawn", "value": 1.2, "type": "mult"},
	{"name": "Watering can", "stat1": "Rain rate", "target_global_var1": "base_rain_spawn", "value": 50, "type": "flat"},
	{"name": "Soil", "stat1": "Dust rate", "target_global_var1": "modifier_dust_spawn", "value": 1.2, "type": "mult"},
	{"name": "Pay dirt", "stat1": "Dust value", "target_global_var1": "base_dust_value", "value": 1.0, "type": "flat"},
	{"name": "Honey", "stat1": "Rain value", "target_global_var1": "base_rain_value", "value": 1.0, "type": "flat"},
]

var epic_upgrades = [
	{"name": "Compressed air", "stat1": "Movement speed", "target_global_var1": "modifier_movement_speed", "value": 1.5, "type": "mult"},
	{"name": "Propeller", "stat1": "Cloud rate", "target_global_var1": "base_cloud_spawn", "value": 100, "type": "flat"},
	{"name": "Rain barrel", "stat1": "Rain rate", "target_global_var1": "modifier_rain_spawn", "value": 1.5, "type": "mult"},
	{"name": "Earth", "stat1": "Dust rate", "target_global_var1": "modifier_dust_spawn", "value": 1.5, "type": "mult"},
	{"name": "Fancy fluff", "stat1": "Dust value", "target_global_var1": "base_dust_value", "value": 2.0, "type": "flat"},
	{"name": "Nectar", "stat1": "Rain value", "target_global_var1": "base_rain_value", "value": 2.0, "type": "flat"},
]

var legendary_upgrades = [
	{"name": "Engine", "stat1": "Movement speed", "target_global_var1": "modifier_movement_speed", "value": 2.0, "type": "mult"},
	{"name": "Weather balloon", "stat1": "Cloud rate", "target_global_var1": "modifier_cloud_spawn", "value": 2.0, "type": "mult"},
	{"name": "Water tower", "stat1": "Rain rate", "target_global_var1": "modifier_rain_spawn", "value": 2.0, "type": "mult"},
	{"name": "Terra firma", "stat1": "Dust rate", "target_global_var1": "base_dust_spawn", "value": 500, "type": "flat"},
	{"name": "Lavish lint", "stat1": "Dust value", "target_global_var1": "modifier_dust_value", "value": 1.5, "type": "mult"},
	{"name": "Royal jelly", "stat1": "Rain value", "target_global_var1": "modifier_rain_value", "value": 1.5, "type": "mult"},
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
		text = chosen_upgrade.name + "\n-----------------------------\n" + "x" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\n-----------------------------" + "\n$" + str(upgrade_cost)
	elif chosen_upgrade.type == "flat":
		text = chosen_upgrade.name + "\n-----------------------------\n" + "+" + str(chosen_upgrade.value) + " " + chosen_upgrade.stat1 + "\n-----------------------------" + "\n$" + str(upgrade_cost)

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
