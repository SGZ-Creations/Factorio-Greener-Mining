local deepcopy = require("scripts/deepcopy")

local resources = data.raw["resource"]
local recipes = data.raw["recipe"]
local technologies = data.raw["technology"]

local DUST_PER_ORE = 5

local newDustClouds = {}
local newDust = {}
local newDustCloudsToDustRecipes = {}
local newDustToPlateRecipes = {}
local techOverrides = {}

local function makeDustCloud(name, localised_name, color, flow_color)
	return
		{
			type = "fluid",
			name = name,
			localised_name = localised_name,
			base_color = color or { r = 0.5, g = 0.5, b = 0.5 },
			flow_color = flow_color or { r = 0.5, g = 0.5, b = 0.5 },
			default_temperature = 15,
			max_temperature = 100,
			heat_capacity = "0.2KJ",
			icons = {
				{
					icon = "__dustless-miners__/graphics/icons/dust-cloud.png",
					icon_size = 128, icon_mipmaps = 2,
					tint = color or { r = 1.0, g = 1.0, b = 1.0 }
				}
			},
			order = "b[dust]-a[" .. name .. "]"
		}
end

local function makeDust(name, localised_name, color, stack_size)
	return
		{
			type = "item",
			name = name,
			localised_name = localised_name,
			icons = {
				{
					icon = "__dustless-miners__/graphics/icons/dust.png",
					icon_size = 64,
					tint = color or { r = 0.5, g = 0.5, b = 0.5 }
				}
			},
			subgroup = "base-dust",
			order = "a[" .. name .. "]",
			stack_size = stack_size
		}
end

local function makeDustCloudToDustRecipe(name, dustCloud, dust, primary, secondary, tertiary, quaternary)
	return
		{
			type = "recipe",
			name = name,
			category = "chemistry",
			energy_required = 1,
			ingredients = {
				{ type = "fluid", name = "water", amount = 100 },
				{ type = "fluid", name = dustCloud, amount = 50 },
			},
			results = {
				{ type = "item", name = dust, amount = 1 }
			},
			crafting_machine_tint = {
				primary = primary or { r = 0.5, g = 0.5, b = 0.5 },
				secondary = secondary or { r = 0.5, g = 0.5, b = 0.5 },
				tertiary = tertiary or { r = 0.5, g = 0.5, b = 0.5 },
				quaternary = quaternary or { r = 0.5, g = 0.5, b = 0.5 }
			}
		}
end

local function makeDustToPlateSmeltingRecipe(name, energyRequired, dust, dustAmount, plate, plateAmount)
	return
		{
			type = "recipe",
			name = name,
			category = "smelting",
			energy_required = energyRequired,
			ingredients = {{ name = dust, amount = dustAmount }},
			result = plate,
			result_count = plateAmount
		}
end

local function addRecipeToTech(newRecipe, originalRecipe, tech)
	if tech.effects then
		local update = false
		for k, v in pairs(tech.effects) do
			if v.type == "unlock-recipe" and v.recipe and v.recipe == originalRecipe then
				update = true
				break
			end
		end

		if update then
			local newTech = deepcopy.deepcopy(tech)
			table.insert(newTech.effects, { type = "unlock-recipe", recipe = newRecipe })
			table.insert(techOverrides, newTech)
		end
	end
end

local function addRecipeToAllTechThatUnlocksRecipe(newRecipe, originalRecipe)
	for k, v in pairs(technologies) do
		addRecipeToTech(newRecipe, originalRecipe, v)
	end
end

local function makeFromRecipe(prettyName, recipe, dust, ore)
	local createNew = false

	-- Check if recipe has expensive mode and one of the ingredients is the ore
	if recipe.expensive and recipe.expensive ~= false then
		for k, v in pairs(recipe.expensive.ingredients) do
			if not v.name and not v.amount then
				if v[1] == ore then
					createNew = true
				end
			else
				if v.name == ore then
					createNew = true
					break
				end
			end
		end
	end

	-- Check if recipe has normal mode and one of the ingredients is the ore
	if not createNew and recipe.normal and recipe.normal ~= false then
		for k, v in pairs(recipe.normal.ingredients) do
			if not v.name and not v.amount then
				if v[1] == ore then
					createNew = true
				end
			else
				if v.name == ore then
					createNew = true
					break
				end
			end
		end
	end

	-- Check if recipe has the ore as an ingredient
	if not createNew and recipe.ingredients then
		for k, v in pairs(recipe.ingredients) do
			if not v.name and not v.amount then
				if v[1] == ore then
					createNew = true
				end
			else
				if v.name == ore then
					createNew = true
					break
				end
			end
		end
	end

	if createNew then
		local recipeResultPrettyName = string.gsub(recipe.name, "-", " ")
		recipeResultPrettyName = string.upper(string.sub(recipeResultPrettyName, 1, 1)) .. string.sub(recipeResultPrettyName, 2, string.len(recipeResultPrettyName))
		local newRecipe = deepcopy.deepcopy(recipe)
		newRecipe.name = dust .. "-" .. recipe.name
		newRecipe.localised_name = recipeResultPrettyName .. " (" .. prettyName .. ")"

		if newRecipe.ingredients then
			for k, v in pairs(newRecipe.ingredients) do
				-- Check if table does not contain name nor amount which means the values are like {1 = name, 2 = amount}
				if not v.name and not v.amount then
					if v[1] == ore then
						newRecipe.ingredients[k] = { type = "item", name = dust, amount = v[2] * DUST_PER_ORE }
					else
						newRecipe.ingredients[k] = { type = "item", name = v[1], amount = v[2] }
					end
				else
					if v.name == ore then
						v.name = dust
						v.amount = v.amount * DUST_PER_ORE
					end
				end
			end
		else
			if newRecipe.expensive and newRecipe.expensive ~= false then
				for k, v in pairs(newRecipe.expensive.ingredients) do
					-- Check if table does not contain name nor amount which means the values are like {1 = name, 2 = amount}
					if not v.name and not v.amount then
						if v[1] == ore then
							newRecipe.expensive.ingredients[k] = { type = "item", name = dust, amount = v[2] * DUST_PER_ORE }
						else
							newRecipe.expensive.ingredients[k] = { type = "item", name = v[1], amount = v[2] }
						end
					else
						if (v.name == ore) then
							v.name = dust
							v.amount = v.amount * DUST_PER_ORE
						end
					end
				end
			end

			if newRecipe.normal and newRecipe.normal ~= false then
				for k, v in pairs(newRecipe.normal.ingredients) do
					-- Check if table does not contain name nor amount which means the values are like {1 = name, 2 = amount}
					if not v.name and not v.amount then
						if v[1] == ore then
							newRecipe.normal.ingredients[k] = { type = "item", name = dust, amount = v[2] * DUST_PER_ORE }
						else
							newRecipe.normal.ingredients[k] = { type = "item", name = v[1], amount = v[2] }
						end
					else
						if v.name == ore then
							v.name = dust
							v.amount = v.amount * DUST_PER_ORE
						end
					end
				end
			end
		end

		table.insert(newDustToPlateRecipes, newRecipe)

		-- Find all technologies that unlock the original recipe and add this recipe to it
		addRecipeToAllTechThatUnlocksRecipe(newRecipe.name, recipe.name)
	end
end

local function makeFromAllRecipes(prettyName, dust, ore)
	for k, v in pairs(recipes) do
		makeFromRecipe(prettyName, v, dust, ore)
	end
end

for k,v in pairs(resources) do
	if v.type and v.type == "resource" and (v.category == nil or v.category == "basic-solid") then
		local prettyName = string.gsub(v.name, "-", " ")
		prettyName = string.upper(string.sub(prettyName, 1, 1)) .. string.sub(prettyName, 2, string.len(prettyName))
		local dustCloudPrettyName = prettyName .. " dust cloud"
		local dustPrettyName = prettyName .. " dust"
		local dustCloudName = v.name .. "-dustcloud"
		local dustName = v.name .. "-dust"
		table.insert(newDustClouds, makeDustCloud(dustCloudName, dustCloudPrettyName, v.mining_visualisation_tint or v.map_color, v.mining_visualisation_tint or v.map_color))
		table.insert(newDust, makeDust(dustName, dustPrettyName, v.mining_visualisation_tint or v.map_color, 200))
		-- Dust Clouds to Dust in Chemical Plant
		table.insert(newDustCloudsToDustRecipes, makeDustCloudToDustRecipe(dustName, dustCloudName, dustName, v.mining_visualisation_tint or v.map_color, v.mining_visualisation_tint or v.map_color, v.mining_visualisation_tint or v.map_color, v.mining_visualisation_tint or v.map_color))

		-- Make duplicate recipes for stuff that needs the ores to use the dust instead
		makeFromAllRecipes(dustPrettyName, dustName, v.name)
	end
end

data:extend(newDustClouds)
data:extend(newDust)
data:extend(newDustCloudsToDustRecipes)
data:extend(newDustToPlateRecipes)
data:extend(techOverrides)
