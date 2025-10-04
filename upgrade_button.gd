extends Button

@onready var cost_label: Label = $CostLabel
var upgrade_cost: int
var rarity: int = randi_range(1,5)

var common_upgrades = [
	{"name": "Wrench", "stat1": "movement_speed", "value": 10, "type": "flat"},
]

var common_upgrade_names: Array[String] = ["Wrench","Watering can","Map","Soil","Cardboard"]
# Wrench increases movement speed, Watering can increases cloud drops, Map increases cloud spawns, soil increases dust spawning, cardboard increases collector size
var uncommon_upgrade_names: Array[String] = []

func _ready():
	_on_shop_reset()
	Global.shop_reset.connect(_on_shop_reset)

func _on_shop_reset():
	rarity = randi_range(1,5)
	upgrade_cost = Global.base_reroll_costs[Global.round-1] * rarity
	cost_label.text = "$" + str(upgrade_cost)

func _on_pressed() -> void:
	pass # Replace with function body.
