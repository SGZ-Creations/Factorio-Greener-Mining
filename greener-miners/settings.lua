data:extend({
	{
		type = "int-setting",
		name = "dustless-dust-to-ore-ratio",
		setting_type = "startup",
		minimum_value = 1,
		default_value = 5,
		order = "b-a[dust-to-ore]"
	},
	{
		type = "double-setting",
		name = "dustless-t1-mining-speed",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 0.6,
		order = "b-t1-1"
	},
	{
		type = "int-setting",
		name = "dustless-t1-power",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 130,
		order = "b-t1-2"
	},
	{
		type = "int-setting",
		name = "dustless-t1-health",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 400,
		order = "b-t1-3"
	},
	{
		type = "double-setting",
		name = "dustless-t1-pollution",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 4,
		order = "b-t1-4"
	},
	{
		type = "double-setting",
		name = "dustless-t2-mining-speed",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 1.4,
		order = "b-t2-1"
	},
	{
		type = "int-setting",
		name = "dustless-t2-power",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 180,
		order = "b-t2-2"
	},
	{
		type = "int-setting",
		name = "dustless-t2-health",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 550,
		order = "b-t2-3"
	},
	{
		type = "double-setting",
		name = "dustless-t2-pollution",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 2,
		order = "b-t2-4"
	},
	{
		type = "double-setting",
		name = "dustless-t3-mining-speed",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 2.0,
		order = "b-t3-1"
	},
	{
		type = "int-setting",
		name = "dustless-t3-power",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 260,
		order = "b-t3-2"
	},
	{
		type = "int-setting",
		name = "dustless-t3-health",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 750,
		order = "b-t3-3"
	},
	{
		type = "double-setting",
		name = "dustless-t3-pollution",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 0,
		order = "b-t3-4"
	},
	{
		type = "double-setting",
		name = "dustless-t4-mining-speed",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 4.0,
		order = "b-t4-1"
	},
	{
		type = "int-setting",
		name = "dustless-t4-power",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 430,
		order = "b-t4-2"
	},
	{
		type = "int-setting",
		name = "dustless-t4-health",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 1000,
		order = "b-t4-3"
	},
	{
		type = "double-setting",
		name = "dustless-t4-pollution",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 0,
		order = "b-t4-4"
	},
	{
		type = "double-setting",
		name = "dustless-t5-mining-speed",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 8.0,
		order = "b-t5-1"
	},
	{
		type = "int-setting",
		name = "dustless-t5-power",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 670,
		order = "b-t5-2"
	},
	{
		type = "int-setting",
		name = "dustless-t5-health",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 1400,
		order = "b-t5-3"
	},
	{
		type = "double-setting",
		name = "dustless-t5-pollution",
		setting_type = "startup",
		minimum_value = 0,
		default_value = 0,
		order = "b-t5-4"
	}
})

data:extend({
	{
		type = "int-setting",
		name = "dustless-tickspeed",
		setting_type = "runtime-global",
		mining_value = 1,
		default_value = 1,
		order = "a-a-a"
	},
	{
		type = "int-setting",
		name = "dustless-miners-per-tick",
		setting_type = "runtime-global",
		minimum_value = 1,
		default_value = 60,
		order = "a-a-b"
	},
	{
		type = "double-setting",
		name = "dustless-t1-dust-cloud-production-per-second",
		setting_type = "runtime-global",
		minimum_value = 6,
		default_value = 6,
		order = "a-b-t1"
	},
	{
		type = "double-setting",
		name = "dustless-t2-dust-cloud-production-per-second",
		setting_type = "runtime-global",
		minimum_value = 6,
		default_value = 8,
		order = "a-b-t2"
	},
	{
		type = "double-setting",
		name = "dustless-t3-dust-cloud-production-per-second",
		setting_type = "runtime-global",
		minimum_value = 6,
		default_value = 10,
		order = "a-b-t3"
	},
	{
		type = "double-setting",
		name = "dustless-t4-dust-cloud-production-per-second",
		setting_type = "runtime-global",
		minimum_value = 6,
		default_value = 12,
		order = "a-b-t4"
	},
	{
		type = "double-setting",
		name = "dustless-t5-dust-cloud-production-per-second",
		setting_type = "runtime-global",
		minimum_value = 6,
		default_value = 14,
		order = "a-b-t5"
	}
})