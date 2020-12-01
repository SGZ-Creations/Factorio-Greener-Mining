local deepcopy = require("scripts.deepcopy")
local dusthandling = {
	DUST_PER_ORE = 1,
	recipes = {},
	technologies = {}
}

local items = data.raw["item"]
local items = {
	data.raw["wall"],
	data.raw["tool"],
	data.raw["repair-tool"],
	data.raw["module"],
	data.raw["item"],
	data.raw["item-with-entity-data"],
	data.raw["item-with-inventory"],
	data.raw["item-with-label"],
	data.raw["item-with-tags"],
	data.raw["gun"],
	data.raw["fluid"],
	data.raw["capsule"],
	data.raw["armor"],
	data.raw["ammo"],
}
local recipes = data.raw["recipe"]
local technologies = data.raw["technology"]

local function getOverridenTechnology(techName)
	for k, v in pairs(dusthandling.technologies) do
		if v.name == techName then
			return v
		end
	end
	return nil
end

local function replaceItemInIngredientList(ingredients, item, itemToReplace)
	if not ingredients then
		return
	end

	for k, v in pairs(ingredients) do
		-- Check if table does not contain name nor amount which means the values are like {1 = name, 2 = amount}
		if not v.name and not v.amount then
			if v[1] == itemToReplace then
				ingredients[k] = {
					type = "item",
					name = item,
					amount = math.min(v[2] * dusthandling.DUST_PER_ORE, 65535)
				}
			else
				ingredients[k] = {
					type = "item",
					name = v[1],
					amount = v[2]
				}
			end
		else
			if v.name == itemToReplace then
				v.name = item
				v.amount = math.min(v.amount * dusthandling.DUST_PER_ORE, 65535)
			end
		end
	end
end

local function isItemInIngredientList(ingredients, item)
	if not ingredients then
		return false
	end

	for k, v in pairs(ingredients) do
		-- Check if table does not contain name nor amount which means the values are like {1 = name, 2 = amount}
		if not v.name and not v.amount then
			if v[1] == item then
				return true
			end
		else
			if v.name == item then
				return true
			end
		end
	end
	return false
end

local function editTechToUnlockRecipe(newRecipe, originalRecipe, tech)
	if tech.effects then
		local edit = false
		for k, v in pairs(tech.effects) do
			if v.type == "unlock-recipe" and v.recipe and v.recipe == originalRecipe then
				edit = true
				break
			end
		end

		if edit then
			table.insert(tech.effects, { type = "unlock-recipe", recipe = newRecipe })
		end
	end
end

local function addRecipeToTech(newRecipe, originalRecipe, tech)
	if tech.effects then
		local edit = false
		for k, v in pairs(tech.effects) do
			if v.type == "unlock-recipe" and v.recipe and v.recipe == originalRecipe then
				edit = true
				break
			end
		end

		if edit then
			local newTech = deepcopy.deepcopy(tech)
			table.insert(newTech.effects, { type = "unlock-recipe", recipe = newRecipe })
			table.insert(dusthandling.technologies, newTech)
		end
	end
end

local function addRecipeToAllTechThatUnlocksRecipe(newRecipe, originalRecipe)
	for k, v in pairs(technologies) do
		local overridenTech = getOverridenTechnology(v.name)
		if overridenTech then
			editTechToUnlockRecipe(newRecipe, originalRecipe, overridenTech)
		else
			addRecipeToTech(newRecipe, originalRecipe, v)
		end
	end
end

local function duplicateAndChangeRecipeForDust(prettyName, recipe, dust, ore)
	local duplicate = false

	-- Check if recipe has expensive mode and one of the ingredients is the ore
	if recipe.expensive and recipe.expensive ~= false then
		if isItemInIngredientList(recipe.expensive.ingredients, ore) then
			duplicate = true
		end
	end

	-- Check if recipe has normal mode and one of the ingredients is the ore
	if not duplicate and recipe.normal and recipe.normal ~= false then
		if isItemInIngredientList(recipe.normal.ingredients, ore) then
			duplicate = true
		end
	end

	-- Check if recipe has the ore as an ingredient
	if not duplicate and recipe.ingredients then
		if isItemInIngredientList(recipe.ingredients, ore) then
			duplicate = true
		end
	end

	-- Duplicate the recipe
	if duplicate then
		local recipeResultPrettyName = string.gsub(recipe.name, "-", " ")
		recipeResultPrettyName = string.upper(string.sub(recipeResultPrettyName, 1, 1)) .. string.sub(recipeResultPrettyName, 2, string.len(recipeResultPrettyName))
		local newRecipe = deepcopy.deepcopy(recipe)
		newRecipe.name = dust .. "-" .. recipe.name
		newRecipe.localised_name = recipeResultPrettyName .. " (" .. prettyName .. ")"
		local originalRecipe = deepcopy.deepcopy(recipe)

		-- Check if recipe has expensive mode and one of the ingredients is the ore
		if newRecipe.expensive and newRecipe.expensive ~= false then
			replaceItemInIngredientList(newRecipe.expensive.ingredients, dust, ore)
		end

		-- Check if recipe has normal mode and one of the ingredients is the ore
		if newRecipe.normal and newRecipe.normal ~= false then
			replaceItemInIngredientList(newRecipe.normal.ingredients, dust, ore)
		end

		-- Check if recipe has the ore as an ingredient
		if newRecipe.ingredients then
			replaceItemInIngredientList(newRecipe.ingredients, dust, ore)
		end

		if newRecipe.order then
			newRecipe.order = newRecipe.order .. "-a"
			originalRecipe.order = originalRecipe.order .. "-z"
		else
			local recipeResultItem
			if newRecipe.result then
				for k, v in pairs(items) do
					recipeResultItem = v[newRecipe.result]
					if recipeResultItem then
						break
					end
				end
			elseif newRecipe.results then
				local firstResult = newRecipe.results[1]
				if not firstResult.name and not firstResult.amount then
					for k, v in pairs(items) do
						recipeResultItem = v[firstResult[1]]
						if recipeResultItem then
							break
						end
					end
				else
					for k, v in pairs(items) do
						recipeResultItem = v[firstResult.name]
						if recipeResultItem then
							break
						end
					end
				end
			end
			if recipeResultItem and recipeResultItem.order then
				local itemOrder = recipeResultItem.order
				newRecipe.order = itemOrder .. "-a"
				originalRecipe.order = itemOrder .. "-z"
			end
		end

		table.insert(dusthandling.recipes, newRecipe)
		table.insert(dusthandling.recipes, originalRecipe)

		-- Find all technologies that unlock the original recipe and add this recipe to it
		addRecipeToAllTechThatUnlocksRecipe(newRecipe.name, recipe.name)
	end
end

function dusthandling.duplicateAndChangeRecipesForDust(prettyName, dust, ore)
	for k, v in pairs(recipes) do
		duplicateAndChangeRecipeForDust(prettyName, v, dust, ore)
	end
end

function dusthandling.duplicateAndChangeRecipesForDusts(dusts)
	for k, v in pairs(dusts) do
		dusthandling.duplicateAndChangeRecipesForDust(v.dustPrettyName, v.dustName, v.oreName)
	end
end

function dusthandling.makeDustToOreRecipe(prettyName, dust, ore, color)
	return
		{
			type = "recipe",
			name = dust .. "-" .. ore,
			category = "chemistry",
			enabled = false,
			energy_required = 8,
			ingredients = {
				{ type = "item", name = dust, amount = dusthandling.DUST_PER_ORE },
				{ type = "fluid", name = "sulfuric-acid", amount = 30 }
			},
			subgroup = "dust-to-ore",
			order = "a[" .. dust .. "-" .. ore .. "]",
			results = {
				{ type = "item", name = ore, amount = 1 }
			},
			crafting_machine_tint = {
				primary = color,
				secondary = color,
				tertiary = color,
				quaternary = color
			}
		}
end

function dusthandling.makeDustToOreRecipes(dusts)
	local dustToOreTechnology = {
		type = "technology",
		name = "dustless-dust-ore",
		icon_size = 128,
		icon = "__greener-miners__/graphics/icons/dust-to-ore.png",
		effects = {},
		unit = {
			count = 140,
			ingredients = {
				{ "automation-science-pack", 2 },
				{ "logistic-science-pack", 2 },
				{ "chemical-science-pack", 3 },
				{ "production-science-pack", 1 }
			},
			time = 45
		},
		prerequisites = { "dustless-electric-mining-drill-3" },
		order = "c-b[dustless-dust-ore]"
	}
	table.insert(dusthandling.technologies, dustToOreTechnology)

	for k, v in pairs(dusts) do
		local dustToOreRecipe = dusthandling.makeDustToOreRecipe(v.prettyName, v.dustName, v.oreName, v.oreColor)

		table.insert(dusthandling.recipes, dustToOreRecipe)
		table.insert(dustToOreTechnology.effects, { type = "unlock-recipe", recipe = v.dustName .. "-" .. v.oreName })
	end
end

function dusthandling.extendData()
	if dusthandling.recipes then
		data:extend(dusthandling.recipes)
	end
	if dusthandling.technologies then
		data:extend(dusthandling.technologies)
	end
end

return dusthandling
