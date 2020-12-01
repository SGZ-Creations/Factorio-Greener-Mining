require ("__base__.prototypes.entity.demo-pipecovers")
require ("__base__.prototypes.entity.assemblerpipes")

local hit_effects = require ("__base__.prototypes.entity.demo-hit-effects")
local sounds = require("__base__.prototypes.entity.demo-sounds")

local electric_drill_animation_speed = 0.4
local electric_drill_animation_sequence =
	{
		1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
		21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1
	}

local electric_drill_animation_shadow_sequence =
	{
		1, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
		21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1
	}

local function electric_mining_drill_smoke()
	return
		{
			priority = "high",
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-smoke.png",
			line_length = 6,
			width = 24,
			height = 38,
			frame_count = 30,
			animation_speed = electric_drill_animation_speed,
			direction_count = 1,
			shift = util.by_pixel(0, 2),
			hr_version =
			{
				priority = "high",
				filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-smoke.png",
				line_length = 6,
				width = 48,
				height = 72,
				frame_count = 30,
				animation_speed = electric_drill_animation_speed,
				direction_count = 1,
				shift = util.by_pixel(0, 3),
				scale = 0.5,
			}
		}
end

local function electric_mining_drill_animation()
	return
		{
			priority = "high",
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill.png",
			line_length = 6,
			width = 84,
			height = 80,
			frame_count = 30,
			animation_speed = electric_drill_animation_speed,
			frame_sequence = electric_drill_animation_sequence,
			direction_count = 1,
			shift = util.by_pixel(0, -12),
			hr_version =
			{
				priority = "high",
				filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill.png",
				line_length = 6,
				width = 162,
				height = 156,
				frame_count = 30,
				animation_speed = electric_drill_animation_speed,
				frame_sequence = electric_drill_animation_sequence,
				direction_count = 1,
				shift = util.by_pixel(1, -11),
				scale = 0.5,
			}
		}
end

local function electric_mining_drill_shadow_animation(name)
	return
		{
			priority = "high",
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-shadow.png",
			line_length = 7,
			width = 112,
			height = 26,
			frame_count = 21,
			animation_speed = electric_drill_animation_speed,
			frame_sequence = electric_drill_animation_shadow_sequence,
			draw_as_shadow = true,
			shift = util.by_pixel(20, 6),
			hr_version =
			{
				priority = "high",
				filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-shadow.png",
				line_length = 7,
				width = 218,
				height = 56,
				frame_count = 21,
				animation_speed = electric_drill_animation_speed,
				frame_sequence = electric_drill_animation_shadow_sequence,
				draw_as_shadow = true,
				shift = util.by_pixel(21, 5),
				scale = 0.5,
			}
		}
end

local function electric_mining_drill_horizontal_animation(name)
	return
		{
			priority = "high",
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal.png",
			line_length = 6,
			width = 40,
			height = 80,
			frame_count = 30,
			animation_speed = electric_drill_animation_speed,
			frame_sequence = electric_drill_animation_sequence,
			direction_count = 1,
			shift = util.by_pixel(2, -12),
			hr_version =
			{
				priority = "high",
				filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-horizontal.png",
				line_length = 6,
				width = 80,
				height = 160,
				frame_count = 30,
				animation_speed = electric_drill_animation_speed,
				frame_sequence = electric_drill_animation_sequence,
				direction_count = 1,
				shift = util.by_pixel(2, -12),
				scale = 0.5,
			}
		}
end

local function electric_mining_drill_horizontal_front_animation(name)
	return
		{
			priority = "high",
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal-front.png",
			line_length = 6,
			width = 32,
			height = 76,
			frame_count = 30,
			animation_speed = electric_drill_animation_speed,
			frame_sequence = electric_drill_animation_sequence,
			direction_count = 1,
			shift = util.by_pixel(-2, 4),
			hr_version =
			{
				priority = "high",
				filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-horizontal-front.png",
				line_length = 6,
				width = 66,
				height = 154,
				frame_count = 30,
				animation_speed = electric_drill_animation_speed,
				frame_sequence = electric_drill_animation_sequence,
				direction_count = 1,
				shift = util.by_pixel(-3, 3),
				scale = 0.5,
			}
		}
end

local function electric_mining_drill_horizontal_shadow_animation(name)
	return
		{
			priority = "high",
			filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-horizontal-shadow.png",
			line_length = 7,
			width = 92,
			height = 80,
			frame_count = 21,
			animation_speed = electric_drill_animation_speed,
			frame_sequence = electric_drill_animation_shadow_sequence,
			draw_as_shadow = true,
			shift = util.by_pixel(32, 2),
			hr_version =
			{
				priority = "high",
				filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-horizontal-shadow.png",
				line_length = 7,
				width = 180,
				height = 164,
				frame_count = 21,
				animation_speed = electric_drill_animation_speed,
				frame_sequence = electric_drill_animation_shadow_sequence,
				draw_as_shadow = true,
				shift = util.by_pixel(33, 1),
				scale = 0.5,
			}
		}
end

local function electric_mining_drill_status_colors()
	return
		{
			-- If no_power, idle, no_minable_resources, disabled, insufficient_input or full_output is used, always_draw of corresponding layer must be set to true to draw it in those states.

			no_power = { 0, 0, 0, 0 },                  -- If no_power is not specified or is nil, it defaults to clear color {0,0,0,0}

			idle = { 1, 0, 0, 1 },                      -- If idle is not specified or is nil, it defaults to white.
			no_minable_resources = { 1, 0, 0, 1 },      -- If no_minable_resources, disabled, insufficient_input or full_output are not specified or are nil, they default to idle color.
			insufficient_input = { 1, 1, 0, 1 },
			full_output = { 1, 1, 0, 1 },
			disabled = { 1, 1, 0, 1 },

			working = { 0, 1, 0, 1 },                   -- If working is not specified or is nil, it defaults to white.
			low_power = { 1, 1, 0, 1 },                 -- If low_power is not specified or is nil, it defaults to working color.
		}
end

local function electric_mining_drill_status_leds_working_visualisation(name)
	local led_blend_mode = nil -- "additive"
	local led_tint = {1,1,1,0.5}
	return
		{
			apply_tint = "status",
			always_draw = true,
			draw_as_sprite = true,
			-- draw_as_light = true,
			north_animation =
			{
				filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-light.png",
				width = 16,
				height = 16,
				blend_mode = led_blend_mode,
				tint = led_tint,
				shift = util.by_pixel(26, -48),
				hr_version =
				{
					filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-light.png",
					width = 32,
					height = 32,
					blend_mode = led_blend_mode,
					tint = led_tint,
					shift = util.by_pixel(26, -48),
					scale = 0.5,
				}
			},
			east_animation =
			{
				filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-light.png",
				width = 16,
				height = 18,
				blend_mode = led_blend_mode,
				tint = led_tint,
				shift = util.by_pixel(38, -32),
				hr_version =
				{
					filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-light.png",
					width = 32,
					height = 34,
					blend_mode = led_blend_mode,
					tint = led_tint,
					shift = util.by_pixel(38, -32),
					scale = 0.5,
				}
			},
			south_animation =
			{
				filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-light.png",
				width = 20,
				height = 24,
				blend_mode = led_blend_mode,
				tint = led_tint,
				shift = util.by_pixel(26, 26),
				hr_version =
				{
					filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-light.png",
					width = 38,
					height = 46,
					blend_mode = led_blend_mode,
					tint = led_tint,
					shift = util.by_pixel(26, 26),
					scale = 0.5,
				}
			},
			west_animation =
			{
				filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-light.png",
				width = 18,
				height = 18,
				blend_mode = led_blend_mode,
				tint = led_tint,
				shift = util.by_pixel(-40, -32),
				hr_version =
				{
					filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-light.png",
					width = 32,
					height = 34,
					blend_mode = led_blend_mode,
					tint = led_tint,
					shift = util.by_pixel(-39, -32),
					scale = 0.5,
				}
			}
		}
end

local function electric_mining_drill_add_light_offsets(t)
	t.north_position = { 0.8, -1.5}
	t.east_position =  { 1.2, -1}
	t.south_position = { 0.8,  0.8}
	t.west_position =  {-1.2, -1}
	return t
end

local electric_mining_drill_primary_light =
	electric_mining_drill_add_light_offsets(
		{
			light = { intensity = 1, size = 3, color={r=1, g=1, b=1}, minimum_darkness = 0.1 }
		})

local electric_mining_drill_secondary_light =
	electric_mining_drill_add_light_offsets(
		{
			always_draw = true,
			apply_tint = "status",
			light = { intensity = 0.8, size = 1.5, color={r=1, g=1, b=1}, minimum_darkness = 0.1 }
		})

local function makeDrill(name, health, mining_speed, energy_usage, pollution, volume)
	return
		{
			type = "mining-drill",
			name = name,
			icon = "__greener-miners__/graphics/icons/" .. name .. ".png",
			icon_size = 64, icon_mipmaps = 4,
			flags = {"placeable-neutral", "player-creation"},
			minable = {mining_time = 0.3, result = name},
			max_health = health,
			resource_categories = {"basic-solid"},
			corpse = "electric-mining-drill-remnants",
			dying_explosion = "electric-mining-drill-explosion",
			collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
			selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
			damaged_trigger_effect = hit_effects.entity(),
			input_fluid_box = (not data.is_demo) and
			{
				production_type = "input-output",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 2,
				base_level = -1,
				pipe_connections =
				{
					{ position = {-2, 0} },
					{ position = {2, 0} }
				}
			} or nil,
			output_fluid_box = (not data.is_demo) and
			{
				production_type = "output",
				pipe_picture = assembler2pipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 1,
				height = 1000,
				base_level = 200,
				pipe_connections = {{ position = { 0, 2 } }}
			} or nil,
			working_sound =
			{
				sound =
				{
					filename = "__greener-miners__/sound/" .. name .. ".ogg",
					volume = volume
				},
				audible_distance_modifier = 0.6,
				fade_in_ticks = 4,
				fade_out_ticks = 20,
			},
			vehicle_impact_sound = sounds.generic_impact,
			open_sound = sounds.machine_open,
			close_sound = sounds.machine_close,

			graphics_set = {
				drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
				animation_progress = 1,
				min_animation_progress = 0,
				max_animation_progress = 30,

				status_colors = electric_mining_drill_status_colors(),

				circuit_connector_layer = "object",
				circuit_connector_secondary_draw_order = { north = 14, east = 48, south = 48, west = 48 },

				animation =
				{
					north =
					{
						layers =
						{
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								repeat_count = 5,
								shift = { 2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									repeat_count = 5,
									shift = { 2, 0 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								draw_as_shadow = true,
								repeat_count = 5,
								shift = { 2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east-shadow.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									draw_as_shadow = true,
									repeat_count = 5,
									shift = { 2, 0 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								repeat_count = 5,
								shift = { -2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									repeat_count = 5,
									shift = { -2, 0 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								draw_as_shadow = true,
								repeat_count = 5,
								shift = { -2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west-shadow.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									draw_as_shadow = true,
									repeat_count = 5,
									shift = { -2, 0 }
								}
							},
							{
								priority = "high",
								filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-N-wet.png",
								line_length = 1,
								width = 96,
								height = 100,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(0, -8),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-N-wet.png",
									line_length = 1,
									width = 190,
									height = 198,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -7),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-output.png",
								line_length = 5,
								width = 32,
								height = 34,
								frame_count = 5,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(-4, -44),
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-output.png",
									line_length = 5,
									width = 60,
									height = 66,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-3, -44),
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-shadow.png",
								line_length = 1,
								width = 124,
								height = 110,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(12, 2),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-shadow.png",
									line_length = 1,
									width = 248,
									height = 222,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(12, 1),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
					west =
					{
						layers =
						{
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								repeat_count = 5,
								shift = { 0, 2 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									repeat_count = 5,
									shift = { 0, 2 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								draw_as_shadow = true,
								repeat_count = 5,
								shift = { 0, 2 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south-shadow.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									draw_as_shadow = true,
									repeat_count = 5,
									shift = { 0, 2 }
								}
							},
							{
								priority = "high",
								filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-W-wet.png",
								line_length = 1,
								width = 96,
								height = 106,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(2, -10),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-W-wet.png",
									line_length = 1,
									width = 194,
									height = 208,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(1, -9),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-output.png",
								line_length = 5,
								width = 24,
								height = 28,
								frame_count = 5,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(-30, -12),
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-output.png",
									line_length = 5,
									width = 50,
									height = 60,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-31, -13),
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-shadow.png",
								line_length = 1,
								width = 132,
								height = 102,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(8, 6),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-shadow.png",
									line_length = 1,
									width = 260,
									height = 202,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(9, 6),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
					south =
					{
						layers =
						{
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								repeat_count = 5,
								shift = { 2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									repeat_count = 5,
									shift = { 2, 0 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-east-shadow.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								draw_as_shadow = true,
								repeat_count = 5,
								shift = { 2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-east-shadow.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									draw_as_shadow = true,
									repeat_count = 5,
									shift = { 2, 0 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								repeat_count = 5,
								shift = { -2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									repeat_count = 5,
									shift = { -2, 0 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-west-shadow.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								draw_as_shadow = true,
								repeat_count = 5,
								shift = { -2, 0 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-west-shadow.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									draw_as_shadow = true,
									repeat_count = 5,
									shift = { -2, 0 }
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet.png",
								line_length = 1,
								width = 98,
								height = 106,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(0, -6),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet.png",
									line_length = 1,
									width = 192,
									height = 208,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(1, -5),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-shadow.png",
								line_length = 1,
								width = 124,
								height = 98,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(12, 4),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-shadow.png",
									line_length = 1,
									width = 248,
									height = 192,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(12, 5),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
					east =
					{
						layers =
						{
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								repeat_count = 5,
								shift = { 0, 2 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									repeat_count = 5,
									shift = { 0, 2 }
								}
							},
							{
								filename = "__base__/graphics/entity/pipe-covers/pipe-cover-south-shadow.png",
								priority = "extra-high",
								width = 64,
								height = 64,
								draw_as_shadow = true,
								repeat_count = 5,
								shift = { 0, 2 },
								hr_version = {
									filename = "__base__/graphics/entity/pipe-covers/hr-pipe-cover-south-shadow.png",
									priority = "extra-high",
									width = 128,
									height = 128,
									scale = 0.5,
									draw_as_shadow = true,
									repeat_count = 5,
									shift = { 0, 2 }
								}
							},
							{
								priority = "high",
								filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-E-wet.png",
								line_length = 1,
								width = 98,
								height = 106,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(-2, -10),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-E-wet.png",
									line_length = 1,
									width = 194,
									height = 208,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -9),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-output.png",
								line_length = 5,
								width = 26,
								height = 38,
								frame_count = 5,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(30, -8),
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-output.png",
									line_length = 5,
									width = 50,
									height = 74,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(30, -8),
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-shadow.png",
								line_length = 1,
								width = 112,
								height = 100,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(10, 6),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-shadow.png",
									line_length = 1,
									width = 226,
									height = 202,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(9, 5),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
				},

				shift_animation_waypoints =
				{
					-- Movement should be between 0.25-0.4 distance
					-- Bounds -0.5 - 0.2
					north = { {0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2} },
					-- Bounds -0.3 - 0
					east = { {0, 0}, {-0.3, 0}, {0, 0}, {-0.25, 0} },
					-- Bounds -0.7 - 0
					south = { {0, 0}, {0, -0.4}, {0, -0.7}, {0, -0.3} },
					-- Bounds 0 - 0.3
					west = { {0, 0}, {0.3, 0}, {0, 0}, {0.25, 0} },
				},

				shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
				shift_animation_transition_duration = 30 / electric_drill_animation_speed,

				working_visualisations =
				{
					-- dust animation directional 1
					{
						constant_speed = true,
						fadeout = true,
						apply_tint = "resource-color",
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-smoke.png",
									line_length = 5,
									width = 24,
									height = 30,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -44),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-smoke.png",
										line_length = 5,
										width = 42,
										height = 58,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-1, -44),
										scale = 0.5,
									}
								}
							}
						},
						east_animation = nil,
						south_animation = nil,
						west_animation = nil
					},

					-- drill back animation
					{
						animated_shift = true,
						always_draw = true,
						north_animation =
						{
							layers =
							{
								electric_mining_drill_animation(),
								electric_mining_drill_shadow_animation()
							}
						},
						east_animation =
						{
							layers =
							{
								electric_mining_drill_horizontal_animation(),
								electric_mining_drill_horizontal_shadow_animation()
							}
						},
						south_animation =
						{
							layers =
							{
								electric_mining_drill_animation(),
								electric_mining_drill_shadow_animation()
							}
						},
						west_animation =
						{
							layers =
							{
								electric_mining_drill_horizontal_animation(),
								electric_mining_drill_horizontal_shadow_animation()
							}
						},
					},

					-- dust animation directional 2
					{
						constant_speed = true,
						fadeout = true,
						apply_tint = "resource-color",
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-smoke.png",
									line_length = 5,
									width = 24,
									height = 28,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(24, -12),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-smoke.png",
										line_length = 5,
										width = 46,
										height = 56,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(24, -12),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-smoke.png",
									line_length = 5,
									width = 24,
									height = 18,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, 20),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-smoke.png",
										line_length = 5,
										width = 48,
										height = 36,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, 20),
										scale = 0.5,
									}
								}
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-smoke.png",
									line_length = 5,
									width = 26,
									height = 30,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-26, -12),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-smoke.png",
										line_length = 5,
										width = 46,
										height = 54,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-25, -11),
										scale = 0.5,
									}
								}
							}
						}
					},

					-- fluid window background (bottom)
					{
						-- render_layer = "lower-object-above-shadow",
						secondary_draw_order = -49,
						always_draw = true,
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-window-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-window-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-window-background.png",
									line_length = 1,
									width = 16,
									height = 12,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -44),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-window-background.png",
										line_length = 1,
										width = 30,
										height = 20,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, -43),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-window-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-window-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid base (bottom)
					{
						always_draw = true,
						-- render_layer = "lower-object-above-shadow",
						secondary_draw_order = -48,
						apply_tint = "input-fluid-base-color",
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-background.png",
									line_length = 1,
									width = 14,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -42),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-background.png",
										line_length = 1,
										width = 28,
										height = 18,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, -43),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid flow (bottom)
					{
						--render_layer = "lower-object-above-shadow",
						secondary_draw_order = -47,
						always_draw = true,
						apply_tint = "input-fluid-flow-color",
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-flow.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-flow.png",
										line_length = 1,
										width = 24,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-flow.png",
									line_length = 1,
									width = 14,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -42),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-flow.png",
										line_length = 1,
										width = 26,
										height = 16,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, -42),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-flow.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-flow.png",
										line_length = 1,
										width = 24,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- drill front animation
					{
						animated_shift = true,
						always_draw = true,
						--north_animation = util.empty_sprite(),
						east_animation = electric_mining_drill_horizontal_front_animation(name),
						--south_animation = util.empty_sprite(),
						west_animation = electric_mining_drill_horizontal_front_animation(name),
					},

					-- fluid window background (front)
					{
						always_draw = true,
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-window-background.png",
									line_length = 1,
									width = 86,
									height = 44,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-window-background.png",
										line_length = 1,
										width = 172,
										height = 90,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 9),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-window-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-window-background-front.png",
										line_length = 1,
										width = 80,
										height = 106,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(14, 10),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-window-background-front.png",
									line_length = 1,
									width = 86,
									height = 14,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -8),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-window-background-front.png",
										line_length = 1,
										width = 172,
										height = 22,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -7),
										scale = 0.5,
									}
								}
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-window-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-window-background-front.png",
										line_length = 1,
										width = 82,
										height = 110,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-15, 9),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid base (front)
					{
						always_draw = true,
						apply_tint = "input-fluid-base-color",
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-fluid-background.png",
									line_length = 1,
									width = 90,
									height = 46,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-fluid-background.png",
										line_length = 1,
										width = 178,
										height = 94,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 9),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-background-front.png",
										line_length = 1,
										width = 80,
										height = 102,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(14, 11),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-background-front.png",
									line_length = 1,
									width = 90,
									height = 16,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -8),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-background-front.png",
										line_length = 1,
										width = 178,
										height = 28,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -7),
										scale = 0.5,
									}
								}
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-background-front.png",
										line_length = 1,
										width = 82,
										height = 106,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-15, 10),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid flow (front)
					{
						always_draw = true,
						apply_tint = "input-fluid-flow-color",
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-fluid-flow.png",
									line_length = 1,
									width = 86,
									height = 44,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-fluid-flow.png",
										line_length = 1,
										width = 172,
										height = 88,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 10),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-flow-front.png",
									line_length = 1,
									width = 40,
									height = 50,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(14, 12),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-flow-front.png",
										line_length = 1,
										width = 78,
										height = 102,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(14, 11),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-flow-front.png",
									line_length = 1,
									width = 86,
									height = 12,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -8),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-flow-front.png",
										line_length = 1,
										width = 172,
										height = 22,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -8),
										scale = 0.5,
									}
								}
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-flow-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-flow-front.png",
										line_length = 1,
										width = 78,
										height = 106,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-14, 10),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- front frame (wet)
					{
						always_draw = true,
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-front.png",
									line_length = 1,
									width = 100,
									height = 66,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 16),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-front.png",
										line_length = 1,
										width = 200,
										height = 130,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 16),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-W-wet-front.png",
									line_length = 1,
									width = 104,
									height = 72,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-4, 12),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-W-wet-front.png",
										line_length = 1,
										width = 208,
										height = 144,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-4, 12),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-S-output.png",
									line_length = 5,
									width = 44,
									height = 28,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									shift = util.by_pixel(-2, 34),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-S-output.png",
										line_length = 5,
										width = 84,
										height = 56,
										frame_count = 5,
										animation_speed = electric_drill_animation_speed,
										shift = util.by_pixel(-1, 34),
										scale = 0.5,
									}
								},
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-S-wet-front.png",
									line_length = 1,
									width = 96,
									height = 70,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									repeat_count = 5,
									shift = util.by_pixel(0, 18),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-S-wet-front.png",
										line_length = 1,
										width = 192,
										height = 140,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										repeat_count = 5,
										shift = util.by_pixel(0, 18),
										scale = 0.5,
									}
								},
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-E-wet-front.png",
									line_length = 1,
									width = 106,
									height = 76,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(2, 10),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-E-wet-front.png",
										line_length = 1,
										width = 208,
										height = 148,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(3, 11),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- LEDs
					electric_mining_drill_status_leds_working_visualisation(name),

					-- light
					electric_mining_drill_primary_light,
					electric_mining_drill_secondary_light
				}
			},

			wet_mining_graphics_set =
			{
				drilling_vertical_movement_duration = 10 / electric_drill_animation_speed,
				animation_progress = 1,
				min_animation_progress = 0,
				max_animation_progress = 30,

				status_colors = electric_mining_drill_status_colors(),

				circuit_connector_layer = "object",
				circuit_connector_secondary_draw_order = { north = 14, east = 48, south = 48, west = 48 },

				animation =
				{
					north =
					{
						layers =
						{
							{
								priority = "high",
								filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-N-wet.png",
								line_length = 1,
								width = 96,
								height = 100,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(0, -8),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-N-wet.png",
									line_length = 1,
									width = 190,
									height = 198,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -7),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-output.png",
								line_length = 5,
								width = 32,
								height = 34,
								frame_count = 5,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(-4, -44),
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-output.png",
									line_length = 5,
									width = 60,
									height = 66,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-3, -44),
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-shadow.png",
								line_length = 1,
								width = 124,
								height = 110,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(12, 2),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-shadow.png",
									line_length = 1,
									width = 248,
									height = 222,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(12, 1),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
					west =
					{
						layers =
						{
							{
								priority = "high",
								filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-W-wet.png",
								line_length = 1,
								width = 96,
								height = 106,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(2, -10),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-W-wet.png",
									line_length = 1,
									width = 194,
									height = 208,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(1, -9),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-output.png",
								line_length = 5,
								width = 24,
								height = 28,
								frame_count = 5,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(-30, -12),
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-output.png",
									line_length = 5,
									width = 50,
									height = 60,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-31, -13),
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-shadow.png",
								line_length = 1,
								width = 132,
								height = 102,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(8, 6),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-shadow.png",
									line_length = 1,
									width = 260,
									height = 202,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(9, 6),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
					south =
					{
						layers =
						{
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet.png",
								line_length = 1,
								width = 98,
								height = 106,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(0, -6),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet.png",
									line_length = 1,
									width = 192,
									height = 208,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(1, -5),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-shadow.png",
								line_length = 1,
								width = 124,
								height = 98,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(12, 4),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-shadow.png",
									line_length = 1,
									width = 248,
									height = 192,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(12, 5),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
					east =
					{
						layers =
						{
							{
								priority = "high",
								filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-E-wet.png",
								line_length = 1,
								width = 98,
								height = 106,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(-2, -10),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-E-wet.png",
									line_length = 1,
									width = 194,
									height = 208,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -9),
									repeat_count = 5,
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-output.png",
								line_length = 5,
								width = 26,
								height = 38,
								frame_count = 5,
								animation_speed = electric_drill_animation_speed,
								direction_count = 1,
								shift = util.by_pixel(30, -8),
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-output.png",
									line_length = 5,
									width = 50,
									height = 74,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(30, -8),
									scale = 0.5,
								}
							},
							{
								priority = "high",
								filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-shadow.png",
								line_length = 1,
								width = 112,
								height = 100,
								frame_count = 1,
								animation_speed = electric_drill_animation_speed,
								draw_as_shadow = true,
								shift = util.by_pixel(10, 6),
								repeat_count = 5,
								hr_version =
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-shadow.png",
									line_length = 1,
									width = 226,
									height = 202,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									draw_as_shadow = true,
									shift = util.by_pixel(9, 5),
									repeat_count = 5,
									scale = 0.5,
								}
							}
						}
					},
				},

				shift_animation_waypoints =
				{
					-- Movement should be between 0.25-0.4 distance
					-- Bounds -0.5 - 0.2
					north = { {0, 0}, {0, -0.4}, {0, -0.1}, {0, 0.2} },
					-- Bounds -0.3 - 0
					east = { {0, 0}, {-0.3, 0}, {0, 0}, {-0.25, 0} },
					-- Bounds -0.7 - 0
					south = { {0, 0}, {0, -0.4}, {0, -0.7}, {0, -0.3} },
					-- Bounds 0 - 0.3
					west = { {0, 0}, {0.3, 0}, {0, 0}, {0.25, 0} },
				},

				shift_animation_waypoint_stop_duration = 195 / electric_drill_animation_speed,
				shift_animation_transition_duration = 30 / electric_drill_animation_speed,

				working_visualisations =
				{
					-- dust animation directional 1
					{
						constant_speed = true,
						fadeout = true,
						apply_tint = "resource-color",
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-smoke.png",
									line_length = 5,
									width = 24,
									height = 30,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -44),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-smoke.png",
										line_length = 5,
										width = 42,
										height = 58,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-1, -44),
										scale = 0.5,
									}
								}
							}
						},
						east_animation = nil,
						south_animation = nil,
						west_animation = nil
					},

					-- drill back animation
					{
						animated_shift = true,
						always_draw = true,
						north_animation =
						{
							layers =
							{
								electric_mining_drill_animation(),
								electric_mining_drill_shadow_animation()
							}
						},
						east_animation =
						{
							layers =
							{
								electric_mining_drill_horizontal_animation(),
								electric_mining_drill_horizontal_shadow_animation()
							}
						},
						south_animation =
						{
							layers =
							{
								electric_mining_drill_animation(),
								electric_mining_drill_shadow_animation()
							}
						},
						west_animation =
						{
							layers =
							{
								electric_mining_drill_horizontal_animation(),
								electric_mining_drill_horizontal_shadow_animation()
							}
						},
					},

					-- dust animation directional 2
					{
						constant_speed = true,
						fadeout = true,
						apply_tint = "resource-color",
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-smoke.png",
									line_length = 5,
									width = 24,
									height = 28,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(24, -12),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-smoke.png",
										line_length = 5,
										width = 46,
										height = 56,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(24, -12),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-smoke.png",
									line_length = 5,
									width = 24,
									height = 18,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, 20),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-smoke.png",
										line_length = 5,
										width = 48,
										height = 36,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, 20),
										scale = 0.5,
									}
								}
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-smoke.png",
									line_length = 5,
									width = 26,
									height = 30,
									frame_count = 10,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-26, -12),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-smoke.png",
										line_length = 5,
										width = 46,
										height = 54,
										frame_count = 10,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-25, -11),
										scale = 0.5,
									}
								}
							}
						}
					},

					-- fluid window background (bottom)
					{
						-- render_layer = "lower-object-above-shadow",
						secondary_draw_order = -49,
						always_draw = true,
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-window-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-window-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-window-background.png",
									line_length = 1,
									width = 16,
									height = 12,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -44),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-window-background.png",
										line_length = 1,
										width = 30,
										height = 20,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, -43),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-window-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-window-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid base (bottom)
					{
						always_draw = true,
						-- render_layer = "lower-object-above-shadow",
						secondary_draw_order = -48,
						apply_tint = "input-fluid-base-color",
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-background.png",
									line_length = 1,
									width = 14,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -42),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-background.png",
										line_length = 1,
										width = 28,
										height = 18,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, -43),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-background.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-background.png",
										line_length = 1,
										width = 22,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid flow (bottom)
					{
						--render_layer = "lower-object-above-shadow",
						secondary_draw_order = -47,
						always_draw = true,
						apply_tint = "input-fluid-flow-color",
						north_animation = nil,
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-flow.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-flow.png",
										line_length = 1,
										width = 24,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-flow.png",
									line_length = 1,
									width = 14,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-2, -42),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-flow.png",
										line_length = 1,
										width = 26,
										height = 16,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-2, -42),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-flow.png",
									line_length = 1,
									width = 12,
									height = 8,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -52),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-flow.png",
										line_length = 1,
										width = 24,
										height = 14,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -52),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- drill front animation
					{
						animated_shift = true,
						always_draw = true,
						--north_animation = util.empty_sprite(),
						east_animation = electric_mining_drill_horizontal_front_animation(name),
						--south_animation = util.empty_sprite(),
						west_animation = electric_mining_drill_horizontal_front_animation(name),
					},

					-- fluid window background (front)
					{
						always_draw = true,
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-window-background.png",
									line_length = 1,
									width = 86,
									height = 44,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-window-background.png",
										line_length = 1,
										width = 172,
										height = 90,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 9),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-window-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-window-background-front.png",
										line_length = 1,
										width = 80,
										height = 106,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(14, 10),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-window-background-front.png",
									line_length = 1,
									width = 86,
									height = 14,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -8),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-window-background-front.png",
										line_length = 1,
										width = 172,
										height = 22,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -7),
										scale = 0.5,
									}
								}
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-window-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-window-background-front.png",
										line_length = 1,
										width = 82,
										height = 110,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-15, 9),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid base (front)
					{
						always_draw = true,
						apply_tint = "input-fluid-base-color",
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-fluid-background.png",
									line_length = 1,
									width = 90,
									height = 46,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-fluid-background.png",
										line_length = 1,
										width = 178,
										height = 94,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 9),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-background-front.png",
										line_length = 1,
										width = 80,
										height = 102,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(14, 11),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-background-front.png",
									line_length = 1,
									width = 90,
									height = 16,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -8),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-background-front.png",
										line_length = 1,
										width = 178,
										height = 28,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -7),
										scale = 0.5,
									}
								}
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-background-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-background-front.png",
										line_length = 1,
										width = 82,
										height = 106,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-15, 10),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- fluid flow (front)
					{
						always_draw = true,
						apply_tint = "input-fluid-flow-color",
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-fluid-flow.png",
									line_length = 1,
									width = 86,
									height = 44,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-fluid-flow.png",
										line_length = 1,
										width = 172,
										height = 88,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 10),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-wet-fluid-flow-front.png",
									line_length = 1,
									width = 40,
									height = 50,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(14, 12),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-wet-fluid-flow-front.png",
										line_length = 1,
										width = 78,
										height = 102,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(14, 11),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-wet-fluid-flow-front.png",
									line_length = 1,
									width = 86,
									height = 12,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, -8),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-wet-fluid-flow-front.png",
										line_length = 1,
										width = 172,
										height = 22,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, -8),
										scale = 0.5,
									}
								}
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-wet-fluid-flow-front.png",
									line_length = 1,
									width = 40,
									height = 54,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-14, 10),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-wet-fluid-flow-front.png",
										line_length = 1,
										width = 78,
										height = 106,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-14, 10),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- front frame (wet)
					{
						always_draw = true,
						north_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-wet-front.png",
									line_length = 1,
									width = 100,
									height = 66,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(0, 16),
									hr_version =
									{
										priority = "high",
										filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-wet-front.png",
										line_length = 1,
										width = 200,
										height = 130,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(0, 16),
										scale = 0.5,
									}
								},
							}
						},
						west_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-W-wet-front.png",
									line_length = 1,
									width = 104,
									height = 72,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(-4, 12),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-W-wet-front.png",
										line_length = 1,
										width = 208,
										height = 144,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(-4, 12),
										scale = 0.5,
									}
								}
							}
						},
						south_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-S-output.png",
									line_length = 5,
									width = 44,
									height = 28,
									frame_count = 5,
									animation_speed = electric_drill_animation_speed,
									shift = util.by_pixel(-2, 34),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-S-output.png",
										line_length = 5,
										width = 84,
										height = 56,
										frame_count = 5,
										animation_speed = electric_drill_animation_speed,
										shift = util.by_pixel(-1, 34),
										scale = 0.5,
									}
								},
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-S-wet-front.png",
									line_length = 1,
									width = 96,
									height = 70,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									repeat_count = 5,
									shift = util.by_pixel(0, 18),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-S-wet-front.png",
										line_length = 1,
										width = 192,
										height = 140,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										repeat_count = 5,
										shift = util.by_pixel(0, 18),
										scale = 0.5,
									}
								},
							}
						},
						east_animation =
						{
							layers =
							{
								{
									priority = "high",
									filename = "__greener-miners__/graphics/entity/" .. name .. "/" .. name .. "-E-wet-front.png",
									line_length = 1,
									width = 106,
									height = 76,
									frame_count = 1,
									animation_speed = electric_drill_animation_speed,
									direction_count = 1,
									shift = util.by_pixel(2, 10),
									hr_version =
									{
										priority = "high",
										filename = "__greener-miners__/graphics/entity/" .. name .. "/hr-" .. name .. "-E-wet-front.png",
										line_length = 1,
										width = 208,
										height = 148,
										frame_count = 1,
										animation_speed = electric_drill_animation_speed,
										direction_count = 1,
										shift = util.by_pixel(3, 11),
										scale = 0.5,
									}
								},
							}
						},
					},

					-- LEDs
					electric_mining_drill_status_leds_working_visualisation(name),

					-- light
					electric_mining_drill_primary_light,
					electric_mining_drill_secondary_light
				}
			},

			integration_patch =
			{
				north =
				{
					priority = "high",
					filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-N-integration.png",
					line_length = 1,
					width = 110,
					height = 108,
					frame_count = 1,
					animation_speed = electric_drill_animation_speed,
					direction_count = 1,
					shift = util.by_pixel(-2, 2),
					repeat_count = 5,
					hr_version =
					{
						priority = "high",
						filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-N-integration.png",
						line_length = 1,
						width = 216,
						height = 218,
						frame_count = 1,
						animation_speed = electric_drill_animation_speed,
						direction_count = 1,
						shift = util.by_pixel(-1, 1),
						repeat_count = 5,
						scale = 0.5,
					}
				},
				east =
				{
					priority = "high",
					filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-E-integration.png",
					line_length = 1,
					width = 116,
					height = 108,
					frame_count = 1,
					animation_speed = electric_drill_animation_speed,
					direction_count = 1,
					shift = util.by_pixel(4, 2),
					repeat_count = 5,
					hr_version =
					{
						priority = "high",
						filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-E-integration.png",
						line_length = 1,
						width = 236,
						height = 214,
						frame_count = 1,
						animation_speed = electric_drill_animation_speed,
						direction_count = 1,
						shift = util.by_pixel(3, 2),
						repeat_count = 5,
						scale = 0.5,
					}
				},
				south =
				{
					priority = "high",
					filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-S-integration.png",
					line_length = 1,
					width = 108,
					height = 114,
					frame_count = 1,
					animation_speed = electric_drill_animation_speed,
					direction_count = 1,
					shift = util.by_pixel(0, 4),
					repeat_count = 5,
					hr_version =
					{
						priority = "high",
						filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-S-integration.png",
						line_length = 1,
						width = 214,
						height = 230,
						frame_count = 1,
						animation_speed = electric_drill_animation_speed,
						direction_count = 1,
						shift = util.by_pixel(0, 3),
						repeat_count = 5,
						scale = 0.5,
					}
				},
				west =
				{
					priority = "high",
					filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-W-integration.png",
					line_length = 1,
					width = 118,
					height = 106,
					frame_count = 1,
					animation_speed = electric_drill_animation_speed,
					direction_count = 1,
					shift = util.by_pixel(-4, 2),
					repeat_count = 5,
					hr_version =
					{
						priority = "high",
						filename = "__base__/graphics/entity/electric-mining-drill/hr-electric-mining-drill-W-integration.png",
						line_length = 1,
						width = 234,
						height = 214,
						frame_count = 1,
						animation_speed = electric_drill_animation_speed,
						direction_count = 1,
						shift = util.by_pixel(-4, 1),
						repeat_count = 5,
						scale = 0.5,
					}
				}
			},

			mining_speed = mining_speed,
			energy_source =
			{
				type = "electric",
				usage_priority = "secondary-input",
				emissions_per_minute = pollution
			},
			energy_usage = energy_usage,
			resource_searching_radius = 2.49,
			vector_to_place_result = {0, -1.85},
			module_specification =
			{
				module_slots = 3
			},
			radius_visualisation_picture =
			{
				filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
				width = 10,
				height = 10
			},
			monitor_visualization_tint = {r=78, g=173, b=255},
			fast_replaceable_group = "mining-drill",

			circuit_wire_connection_points = circuit_connector_definitions["electric-mining-drill"].points,
			circuit_connector_sprites = circuit_connector_definitions["electric-mining-drill"].sprites,
			circuit_wire_max_distance = default_circuit_wire_max_distance
		}
end

data:extend({
	makeDrill("dustless-electric-mining-drill-t1", settings.startup["dustless-t1-health"].value, settings.startup["dustless-t1-mining-speed"].value, settings.startup["dustless-t1-power"].value .. "kW", settings.startup["dustless-t1-pollution"].value, 0.5),
	makeDrill("dustless-electric-mining-drill-t2", settings.startup["dustless-t2-health"].value, settings.startup["dustless-t2-mining-speed"].value, settings.startup["dustless-t2-power"].value .. "kW", settings.startup["dustless-t2-pollution"].value, 0.5),
	makeDrill("dustless-electric-mining-drill-t3", settings.startup["dustless-t3-health"].value, settings.startup["dustless-t3-mining-speed"].value, settings.startup["dustless-t3-power"].value .. "kW", settings.startup["dustless-t3-pollution"].value, 0.0),
	makeDrill("dustless-electric-mining-drill-t4", settings.startup["dustless-t4-health"].value, settings.startup["dustless-t4-mining-speed"].value, settings.startup["dustless-t4-power"].value .. "kW", settings.startup["dustless-t4-pollution"].value, 0.0),
	makeDrill("dustless-electric-mining-drill-t5", settings.startup["dustless-t5-health"].value, settings.startup["dustless-t5-mining-speed"].value, settings.startup["dustless-t5-power"].value .. "kW", settings.startup["dustless-t5-pollution"].value, 0.0)
})
