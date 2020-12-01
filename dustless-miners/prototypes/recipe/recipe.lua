data:extend({
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t1",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "electronic-circuit", 5 }, { "engine-unit", 5 }, { "iron-gear-wheel", 10 }, { "iron-plate", 15 }},
		result = "dustless-electric-mining-drill-t1"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t2",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t1", 1 }, { "electronic-circuit", 10 }, { "advanced-circuit", 5 }, { "engine-unit", 10 }, { "steel-plate", 10 }},
		result = "dustless-electric-mining-drill-t2"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t3",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t2", 1 }, { "electronic-circuit", 15 }, { "advanced-circuit", 10 }, { "engine-unit", 10 }, { "electric-engine-unit", 10 }, { "steel-plate", 10 }},
		result = "dustless-electric-mining-drill-t3"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t4",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t3", 1 }, { "advanced-circuit", 10 }, { "processing-unit", 5 }, { "electric-engine-unit", 15 }, { "steel-plate", 10 }},
		result = "dustless-electric-mining-drill-t4"
	},
	{
		type = "recipe",
		name = "dustless-electric-mining-drill-t5",
		energy_required = 2,
		enabled = false,
		ingredients = {{ "dustless-electric-mining-drill-t4", 1 }, { "processing-unit", 10 }, { "electric-engine-unit", 25 }, { "low-density-structure", 2 }},
		result = "dustless-electric-mining-drill-t5"
	}
})