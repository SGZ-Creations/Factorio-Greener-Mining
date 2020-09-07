local function setupModMapData()
	global.dustlessMiners = {}
	global.dustlessMiners.nthTickRate = settings.global["dustless-tickspeed"].value
	global.dustlessMiners.deltaNthTick = global.dustlessMiners.nthTickRate / 60.0
	global.dustlessMiners.minersPerTick = settings.global["dustless-miners-per-tick"].value
	global.dustlessMiners.t1DustProductionPerSecond = settings.global["dustless-t1-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	global.dustlessMiners.t2DustProductionPerSecond = settings.global["dustless-t2-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	global.dustlessMiners.t3DustProductionPerSecond = settings.global["dustless-t3-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	global.dustlessMiners.t4DustProductionPerSecond = settings.global["dustless-t4-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	global.dustlessMiners.t5DustProductionPerSecond = settings.global["dustless-t5-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	global.dustlessMiners.handlingVersion = 2
	global.dustlessMiners.currentMiner = 1
	global.dustlessMiners.minersProcessedLastTick = 0
	global.dustlessMiners.miners = {}

	for k, surface in pairs(game.surfaces) do
		for i = 1, 5, 1 do
			local miners = surface.find_entities_filtered{ name = "dustless-electric-mining-drill-t" .. i }
			for k1, miner in pairs(miners) do
				table.insert(global.dustlessMiners.miners, { miner = miner, tier = i })
			end
		end
	end
end

local function updateToNewerVersion()
	global.dustlessMiners = nil
	setupModMapData()
end

local function checkIfModGood()
	if global.dustlessMiners == nil then
		setupModMapData()
	elseif global.dustlessMiners.handlingVersion or 0 < 1 then
		updateToNewerVersion()
	elseif global.dustlessMiners.handlingVersion or 0 > 1 then
		error("Trying to run on an older version of miner handling which is illegal and causes unknown issues!", 0)
	end
end

local function getMinerDustCloudFluid(miner, tier, deltaTick)
	local miningTarget = miner.mining_target
	if miningTarget and miningTarget.prototype and miningTarget.prototype.mineable_properties and miningTarget.prototype.mineable_properties.products then
		local dustcloudName = miningTarget.prototype.mineable_properties.products[1].name
		if dustcloudName then
			if tier == 1 then
				return {
					name = dustcloudName .. "-dustcloud",
					amount = global.dustlessMiners.t1DustProductionPerSecond * deltaTick
				}
			elseif tier == 2 then
				return {
					name = dustcloudName .. "-dustcloud",
					amount = global.dustlessMiners.t2DustProductionPerSecond * deltaTick
				}
			elseif tier == 3 then
				return {
					name = dustcloudName .. "-dustcloud",
					amount = global.dustlessMiners.t3DustProductionPerSecond * deltaTick
				}
			elseif tier == 4 then
				return {
					name = dustcloudName .. "-dustcloud",
					amount = global.dustlessMiners.t4DustProductionPerSecond * deltaTick
				}
			elseif tier == 5 then
				return {
					name = dustcloudName .. "-dustcloud",
					amount = global.dustlessMiners.t5DustProductionPerSecond * deltaTick
				}
			end
		end
	end
	return nil
end

local function processMiner(miner, tier, deltaTick)
	if miner.status == defines.entity_status.working then
		local dust = getMinerDustCloudFluid(miner, tier, deltaTick)
		if dust and dust.amount > 0 then
			miner.insert_fluid(dust)
		end
	elseif miner.status == defines.entity_status.no_minable_resources then
		miner.update_connections()
	end
end

local function processMiners()
	if not global.dustlessMiners then
		global.dustlessMiners = nil
		setupModMapData();
		game.print("Im happy to see you're using Dustless Miners, to get some information from the mod run the command '/dustlessminers info'")
	elseif global.dustlessMiners.handlingVersion < 2 then
		local previousHandling = global.dustlessMiners.handlingVersion
		global.dustlessMiners = nil
		setupModMapData();
		game.print("Migrated Dustless Miners from handling version: " .. previousHandling .. " to " .. global.dustlessMiners.handlingVersion)
	elseif global.dustlessMiners.handlingVersion > 2 then
		local previousHandling = global.dustlessMiners.handlingVersion
		global.dustlessMiners = nil
		setupModMapData();
		game.print("Migrated Dustless Miners from handling version: " .. previousHandling .. " to " .. global.dustlessMiners.handlingVersion .. ". Disclaimer: migration to older version might cause unexcepted issues!")
	end

	local minersToTick = math.min(#global.dustlessMiners.miners, global.dustlessMiners.minersPerTick)
	local deltaTick = math.floor(#global.dustlessMiners.miners / minersToTick)
	global.dustlessMiners.minersProcessedLastTick = 0
	for i = 1, minersToTick, 1 do
		local minerData = global.dustlessMiners.miners[global.dustlessMiners.currentMiner]
		if minerData and minerData.miner.valid then
			processMiner(minerData.miner, minerData.tier, deltaTick)
			global.dustlessMiners.minersProcessedLastTick = 1 + global.dustlessMiners.minersProcessedLastTick
			global.dustlessMiners.currentMiner = 1 + global.dustlessMiners.currentMiner
			if global.dustlessMiners.currentMiner > #global.dustlessMiners.miners then
				global.dustlessMiners.currentMiner = 1
			end
		else
			table.remove(global.dustlessMiners.miners, global.dustlessMiners.currentMiner)
		end
	end
end

local function builtEntity(entity)
	if not global.dustlessMiners then
		global.dustlessMiners = nil
		setupModMapData();
		game.print("Im happy to see you're using Dustless Miners, to get some information from the mod run the command '/dustlessminers info'")
	elseif global.dustlessMiners.handlingVersion < 2 then
		local previousHandling = global.dustlessMiners.handlingVersion
		global.dustlessMiners = nil
		setupModMapData();
		game.print("Migrated Dustless Miners from handling version: " .. previousHandling .. " to " .. global.dustlessMiners.handlingVersion)
	elseif global.dustlessMiners.handlingVersion > 2 then
		local previousHandling = global.dustlessMiners.handlingVersion
		global.dustlessMiners = nil
		setupModMapData();
		game.print("Migrated Dustless Miners from handling version: " .. previousHandling .. " to " .. global.dustlessMiners.handlingVersion .. ". Disclaimer: migration to older version might cause unexcepted issues!")
	end

	if not entity then
		return
	end

	if entity.name == "dustless-electric-mining-drill-t1" then
		table.insert(global.dustlessMiners.miners, { miner = entity, tier = 1 })
	elseif entity.name == "dustless-electric-mining-drill-t2" then
		table.insert(global.dustlessMiners.miners, { miner = entity, tier = 2 })
	elseif entity.name == "dustless-electric-mining-drill-t3" then
		table.insert(global.dustlessMiners.miners, { miner = entity, tier = 3 })
	elseif entity.name == "dustless-electric-mining-drill-t4" then
		table.insert(global.dustlessMiners.miners, { miner = entity, tier = 4 })
	elseif entity.name == "dustless-electric-mining-drill-t5" then
		table.insert(global.dustlessMiners.miners, { miner = entity, tier = 5 })
	end
end

local function onRuntimeModSettingChanged(playerIndex, setting, settingType)
	if setting == "dustless-tickspeed" then
		script.on_nth_tick(global.dustlessMiners.nthTickRate, nil)
		global.dustlessMiners.nthTickRate = settings.global["dustless-tickspeed"].value
		global.dustlessMiners.deltaNthTick = global.dustlessMiners.nthTickRate / 60.0
		script.on_nth_tick(global.dustlessMiners.nthTickRate, function() processMiners() end)
	elseif setting == "dustless-miners-per-tick" then
		global.dustlessMiners.minersPerTick = settings.global["dustless-miners-per-tick"].value
	elseif setting == "dustless-t1-dust-cloud-production-per-second" then
		global.dustlessMiners.t1DustProductionPerSecond = settings.global["dustless-t1-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	elseif setting == "dustless-t2-dust-cloud-production-per-second" then
		global.dustlessMiners.t2DustProductionPerSecond = settings.global["dustless-t2-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	elseif setting == "dustless-t3-dust-cloud-production-per-second" then
		global.dustlessMiners.t3DustProductionPerSecond = settings.global["dustless-t3-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	elseif setting == "dustless-t4-dust-cloud-production-per-second" then
		global.dustlessMiners.t4DustProductionPerSecond = settings.global["dustless-t4-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	elseif setting == "dustless-t5-dust-cloud-production-per-second" then
		global.dustlessMiners.t5DustProductionPerSecond = settings.global["dustless-t5-dust-cloud-production-per-second"].value * global.dustlessMiners.deltaNthTick
	end
end

local function dustlessMinersInfo(commandData)
	local messages = {}
	table.insert(messages, "Dustless Miners")
	if global.dustlessMiners then
		if global.dustlessMiners.handlingVersion then
			table.insert(messages, "  - Handling version: " .. global.dustlessMiners.handlingVersion)
		else
			table.insert(messages, "  - Handling version: Not Defined")
		end
		if global.dustlessMiners.miners then
			table.insert(messages, "  - Number of miners: " .. #global.dustlessMiners.miners)
		else
			table.insert(messages, "  - Number of miners: 0")
		end
		table.insert(messages, "  - Update speed: " .. global.dustlessMiners.nthTickRate)
		if global.dustlessMiners.minersProcessedLastTick then
			table.insert(messages, "  - Processed " .. global.dustlessMiners.minersProcessedLastTick .. "/" .. global.dustlessMiners.minersPerTick .. " miners last tick")
		else
			table.insert(messages, "  - Processed 0/" .. global.dustlessMiners.minersPerTick .. " miners last tick")
		end
	else
		table.insert(messages, "  - Handling version: Not Defined")
		table.insert(messages, "  - Number of miners: 0")
		table.insert(messages, "  - Update speed: " .. global.dustlessMiners.nthTickRate)
		table.insert(messages, "  - Processed 0/" .. global.dustlessMiners.minersPerTick .. " miners last tick")
	end

	if commandData.player_index then
		local player = game.get_player(commandData.player_index)
		for _, message in pairs(messages) do
			player.print(message)
		end
	else
		for _, message in pairs(messages) do
			print(message)
		end
	end
end

local function dustlessMinersResetData(commandData)
	global.dustlessMiners = nil
	setupModMapData()
	if commandData.player_index then
		game.get_player(commandData.player_index).print("Reset Dustless Miners")
	else
		print("Reset Dustless Miners")
	end
	dustlessMinersInfo(commandData)
end

local function dustlessMinersCommand(commandData)
	if commandData.parameter and string.len(commandData.parameter) > 0 then
		local args = {}
		for arg in string.gmatch(commandData.parameter, "%S+") do
			table.insert(args, arg)
		end

		if #args > 0 then
			if args[1] == "info" then
				dustlessMinersInfo(commandData)
			elseif args[1] == "reset" then
				local player = game.get_player(commandData.player_index)
				if player.permission_group and player.permission_group.allows_action(defines.input_action.change_multiplayer_config) then
					dustlessMinersResetData(commandData)
				else
					player.print("  - You do not have the neccessary permissions to execute this command", { 1, 0, 0 })
				end
			end
		end
	else
		if commandData.player_index then
			local player = game.get_player(commandData.player_index)
			player.print("Dustless Miners Usages:")
			player.print("  - 'dustlessminers info' - Prints info about the state of the mod on this map")
			if player.permission_group and player.permission_group.allows_action(defines.input_action.change_multiplayer_config) then
				player.print("  - 'dustlessminers reset' - Resets the map data and prints the info as from '/dustlessminers info'")
			end
		else
			print("Dustless Miners Usages:")
			print("  - 'dustlessminers info' - Prints info about the state of the mod on this map")
			print("  - 'dustlessminers reset' - Resets the map data and prints the info as from '/dustlessminers info'")
		end
	end
end

-- Register builtEntity events
script.set_event_filter(defines.events.on_built_entity, {{ filter = "type", type = "mining-drill" }})
script.set_event_filter(defines.events.on_robot_built_entity, {{ filter = "type", type = "mining-drill" }})
script.set_event_filter(defines.events.script_raised_built, {{ filter = "type", type = "mining-drill" }})
script.set_event_filter(defines.events.script_raised_revive, {{ filter = "type", type = "mining-drill" }})

script.on_event(defines.events.on_built_entity, function(event) builtEntity(event.created_entity) end)
script.on_event(defines.events.on_robot_built_entity, function(event) builtEntity(event.created_entity) end)
script.on_event(defines.events.script_raised_built, function(event) builtEntity(event.entity or event.created_entity) end)
script.on_event(defines.events.script_raised_revive, function(event) builtEntity(event.entity or event.created_entity) end)

-- Register on runtime mod setting changed
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event) onRuntimeModSettingChanged(event.player_index, event.setting, event.setting_type) end)

-- Register tick event
script.on_nth_tick(settings.global["dustless-tickspeed"].value, function() processMiners() end)

-- Add console commands
-- commands.add_command("dustlessminers", "Gets info about the dustless miners mod!", function(commandData) dustlessMinersInfo(commandData) end)
-- commands.add_command("dustlessminersresetdata", "Resets all map data from this mod!", function(commandData) dustlessMinersResetData(commandData) end)
commands.add_command("dustlessminers", "Dustless Miners base command", function(commandData) dustlessMinersCommand(commandData) end)
