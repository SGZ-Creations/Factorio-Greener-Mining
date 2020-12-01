local deepcopy = require("scripts.deepcopy")

local dust = {
	DUST_PER_ORE = 1,
	fluids = {},
	items = {},
	recipes = {},
	technologies = {},
	dusts = {}
}

local items = data.raw["item"]
local resources = data.raw["resource"]

local function getFuelAmount(fuel_value, divisor)
	if not fuel_value then
		return nil
	end

	local strLen = string.len(fuel_value)
	local fuelString = strLen - 2

	local number = tonumber(string.sub(fuel_value, 0, fuelString))
	local joulesStr = string.sub(fuel_value, fuelString, strLen)

	return (number / divisor) .. joulesStr
end

function dust.makeDustCloud(name, localised_name, color, ore)
	return
		{
			type = "fluid",
			name = name,
			localised_name = localised_name,
			base_color = color,
			flow_color = color,
			default_temperature = 15,
			max_temperature = 100,
			heat_capacity = "0.2KJ",
			icons = {
				{
					icon = "__greener-miners__/graphics/icons/dust-cloud.png",
					icon_size = 128, icon_mipmaps = 2,
					tint = color
				}
			},
			fuel_value = getFuelAmount(ore.fuel_value, dust.DUST_PER_ORE * 50),
			emissions_multiplier = ore.fuel_emissions_multiplier,
			gas_temperature = 250,
			order = "z[dust]-a[" .. name .. "]"
		}
end

function dust.makeDust(name, localised_name, color, ore)
	local dustItem = deepcopy.deepcopy(ore)
	dustItem.name = name
	dustItem.localised_name = localised_name
	dustItem.icons = {
		{
			icon = "__greener-miners__/graphics/icons/dust.png",
			icon_size = 128, icon_mipmaps = 2,
			tint = color
		}
	}
	dustItem.subgroup = "base-dust"
	dustItem.order = "a[" .. name .. "]"
	dustItem.stack_size = dustItem.stack_size * dust.DUST_PER_ORE
	if dustItem.fuel_acceleration_multiplier then
		dustItem.fuel_acceleration_multiplier = dustItem.fuel_acceleration_multiplier / dust.DUST_PER_ORE
	end
	dustItem.fuel_value = getFuelAmount(dustItem.fuel_value, dust.DUST_PER_ORE)
	if dustItem.fuel_top_speed_multiplier then
		dustItem.fuel_top_speed_multiplier = dustItem.fuel_top_speed_multiplier / dust.DUST_PER_ORE
	end
	if dustItem.fuel_emissions_multiplier then
		dustItem.fuel_emissions_multiplier = dustItem.fuel_emissions_multiplier / dust.DUST_PER_ORE
	end
	dustItem.icon = nil
	dustItem.icon_size = nil
	dustItem.icon_mipmaps = nil
	dustItem.dark_background_icon = nil
	dustItem.pictures = nil
	dustItem.place_as_tile = nil
	dustItem.place_result = nil
	dustItem.placed_as_equipment_result = nil
	return dustItem
end

function dust.makeDustCloudToDustRecipe(name, dustCloud, dust, color)
	return
		{
			type = "recipe",
			name = name,
			category = "chemistry",
			enabled = false,
			energy_required = 3,
			ingredients = {
				{ type = "fluid", name = "water", amount = 100 },
				{ type = "fluid", name = dustCloud, amount = 50 }
			},
			results = {
				{ type = "item", name = dust, amount = 1 }
			},
			crafting_machine_tint = {
				primary = color,
				secondary = color,
				tertiary = color,
				quaternary = color
			}
		}
end

function dust.makeDustsForModpack()
	for k, v in pairs(resources) do
		if v.type and v.type == "resource" and (v.category == nil or v.category == "basic-solid") and v.minable and (v.minable.result or (v.minable.results and #v.minable.results > 0)) then
			local oreName = v.minable.result or v.minable.results[1].name
			local oreColor = v.mining_visualisation_tint or v.map_color
			local oreItem = items[oreName]

			local prettyName = string.gsub(oreName, "-", " ")
			prettyName = string.upper(string.sub(prettyName, 1, 1)) .. string.sub(prettyName, 2, string.len(prettyName))
			local dustCloudPrettyName = prettyName .. " dust cloud"
			local dustPrettyName = prettyName .. " dust"
			local dustCloudName = oreName .. "-dustcloud"
			local dustName = oreName .. "-dust"

			table.insert(dust.fluids, dust.makeDustCloud(dustCloudName, dustCloudPrettyName, oreColor, oreItem))
			table.insert(dust.items, dust.makeDust(dustName, dustPrettyName, oreColor, oreItem))

			-- Dust Clouds to Dust in Chemical Plant
			table.insert(dust.recipes, dust.makeDustCloudToDustRecipe(dustName, dustCloudName, dustName, oreColor))

			table.insert(dust.dusts, { dustPrettyName = dustPrettyName, dustName = dustName, oreName = oreName, oreColor = oreColor })
		end
	end

	local dustCloudToDustTechnology = {
		type = "technology",
		name = "dustless-dustcloud-dust",
		icon_size = 128,
		icon = "__greener-miners__/graphics/icons/dustcloud-to-dust.png",
		effects = {},
		unit = {
			count = 50,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 }
			},
			time = 10
		},
		prerequisites = { "oil-processing" },
		order = "c-b[dustless-dustcloud-to-dust]"
	}
	for k, v in pairs(dust.dusts) do
		table.insert(dustCloudToDustTechnology.effects, { type = "unlock-recipe", recipe = v.dustName })
	end
	table.insert(dust.technologies, dustCloudToDustTechnology)
end

function dust.extendData()
	if dust.fluids then
		data:extend(dust.fluids)
	end
	if dust.items then
		data:extend(dust.items)
	end
	if dust.recipes then
		data:extend(dust.recipes)
	end
	if dust.technologies then
		data:extend(dust.technologies)
	end
end

return dust
