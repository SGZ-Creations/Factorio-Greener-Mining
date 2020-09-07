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

function dust.makeDustCloud(name, localised_name, color)
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
					icon = "__dustless-miners__/graphics/icons/dust-cloud.png",
					icon_size = 128, icon_mipmaps = 2,
					tint = color
				}
			},
			order = "z[dust]-a[" .. name .. "]"
		}
end

function dust.makeDust(name, localised_name, color, stack_size)
	return
		{
			type = "item",
			name = name,
			localised_name = localised_name,
			icons = {
				{
					icon = "__dustless-miners__/graphics/icons/dust.png",
					icon_size = 128, icon_mipmaps = 2,
					tint = color
				}
			},
			subgroup = "base-dust",
			order = "a[" .. name .. "]",
			stack_size = stack_size
		}
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
			local oreStackSize = items[oreName].stack_size

			local prettyName = string.gsub(oreName, "-", " ")
			prettyName = string.upper(string.sub(prettyName, 1, 1)) .. string.sub(prettyName, 2, string.len(prettyName))
			local dustCloudPrettyName = prettyName .. " dust cloud"
			local dustPrettyName = prettyName .. " dust"
			local dustCloudName = oreName .. "-dustcloud"
			local dustName = oreName .. "-dust"

			table.insert(dust.fluids, dust.makeDustCloud(dustCloudName, dustCloudPrettyName, oreColor))
			table.insert(dust.items, dust.makeDust(dustName, dustPrettyName, oreColor, oreStackSize * dust.DUST_PER_ORE))

			-- Dust Clouds to Dust in Chemical Plant
			table.insert(dust.recipes, dust.makeDustCloudToDustRecipe(dustName, dustCloudName, dustName, oreColor))

			table.insert(dust.dusts, { dustPrettyName = dustPrettyName, dustName = dustName, oreName = oreName, oreColor = oreColor })
		end
	end

	local dustCloudToDustTechnology = {
		type = "technology",
		name = "dustless-dustcloud-dust",
		icon_size = 128,
		icon = "__dustless-miners__/graphics/icons/dustcloud-to-dust.png",
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
