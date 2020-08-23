data:extend({
	{
		type = "technology",
		name = "dustless-electric-mining-drill-1",
		localised_name = { "technology-name.dustless-electric-mining-drill-t1" },
		localised_description = { "technology-description.dustless-electric-mining-drill-t1" },
		icon_size = 128,
		icon = "__dustless-miners__/graphics/icons/dustless-electric-mining-drill-t1-tech.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "dustless-electric-mining-drill-t1"
			}
		},
		unit = {
			count = 75,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 }
			},
			time = 10
		},
		prerequisites = { "fluid-handling" },
		order = "c-b[dustless-electric-mining-drill-1]"
	},
	{
		type = "technology",
		name = "dustless-electric-mining-drill-2",
		localised_name = { "technology-name.dustless-electric-mining-drill-t2" },
		localised_description = { "technology-description.dustless-electric-mining-drill-t2" },
		icon_size = 128,
		icon = "__dustless-miners__/graphics/icons/dustless-electric-mining-drill-t2-tech.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "dustless-electric-mining-drill-t2"
			}
		},
		unit = {
			count = 60,
			ingredients = {
				{ "automation-science-pack", 2 },
				{ "logistic-science-pack", 2 },
				{ "chemical-science-pack", 1 }
			},
			time = 20
		},
		prerequisites = { "dustless-electric-mining-drill-1", "electric-engine", "advanced-electronics" },
		order = "c-b[dustless-electric-mining-drill-2]"
	},
	{
		type = "technology",
		name = "dustless-electric-mining-drill-3",
		localised_name = { "technology-name.dustless-electric-mining-drill-t3" },
		localised_description = { "technology-description.dustless-electric-mining-drill-t3" },
		icon_size = 128,
		icon = "__dustless-miners__/graphics/icons/dustless-electric-mining-drill-t3-tech.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "dustless-electric-mining-drill-t3"
			}
		},
		unit = {
			count = 120,
			ingredients = {
				{ "automation-science-pack", 2 },
				{ "logistic-science-pack", 2 },
				{ "chemical-science-pack", 1 }
			},
			time = 30
		},
		prerequisites = { "dustless-electric-mining-drill-2" },
		order = "c-b[dustless-electric-mining-drill-3]"
	},
	{
		type = "technology",
		name = "dustless-electric-mining-drill-4",
		localised_name = { "technology-name.dustless-electric-mining-drill-t4" },
		localised_description = { "technology-description.dustless-electric-mining-drill-t4" },
		icon_size = 128,
		icon = "__dustless-miners__/graphics/icons/dustless-electric-mining-drill-t4-tech.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "dustless-electric-mining-drill-t4"
			}
		},
		unit = {
			count = 240,
			ingredients = {
				{ "automation-science-pack", 2 },
				{ "logistic-science-pack", 2 },
				{ "chemical-science-pack", 1 }
			},
			time = 40
		},
		prerequisites = { "dustless-electric-mining-drill-3", "advanced-electronics-2" },
		order = "c-b[dustless-electric-mining-drill-4]"
	},
	{
		type = "technology",
		name = "dustless-electric-mining-drill-5",
		localised_name = { "technology-name.dustless-electric-mining-drill-t5" },
		localised_description = { "technology-description.dustless-electric-mining-drill-t5" },
		icon_size = 128,
		icon = "__dustless-miners__/graphics/icons/dustless-electric-mining-drill-t5-tech.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "dustless-electric-mining-drill-t5"
			}
		},
		unit = {
			count = 400,
			ingredients = {
				{ "automation-science-pack", 2 },
				{ "logistic-science-pack", 2 },
				{ "chemical-science-pack", 1 }
			},
			time = 50
		},
		prerequisites = { "dustless-electric-mining-drill-4" },
		order = "c-b[dustless-electric-mining-drill-5]"
	}
})