data:extend({
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t1",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "electric-mining-drill", 1 }, { "pump", 3 }, { "electronic-circuit", 5 }, { "copper-cable", 4 }},
		result = "dustless-electric-mining-drill-t1"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t2",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t1", 1 }, { "pump", 5 }, { "advanced-circuit", 5 }, { "electric-engine-unit", 1 }},
		result = "dustless-electric-mining-drill-t2"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t3",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t2", 1 }, { "pump", 8 }, { "advanced-circuit", 30 }, { "electric-engine-unit", 8 }},
		result = "dustless-electric-mining-drill-t3"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t4",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t3", 1 }, { "pump", 15 }, { "processing-unit", 5 }, { "electric-engine-unit", 16 }},
		result = "dustless-electric-mining-drill-t4"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t5",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t4", 1 }, { "pump", 24 }, { "processing-unit", 25 }, { "electric-engine-unit", 32 }},
		result = "dustless-electric-mining-drill-t5"
	}
})