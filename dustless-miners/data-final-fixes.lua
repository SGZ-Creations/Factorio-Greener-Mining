local dust = require("scripts.dust")
local dusthandling = require("scripts.dusthandling")

dust.DUST_PER_ORE = settings.startup["dustless-dust-to-ore-ratio"].value
dusthandling.DUST_PER_ORE = dust.DUST_PER_ORE

dust.makeDustsForModpack()
dust.extendData()

dusthandling.duplicateAndChangeRecipesForDusts(dust.dusts)
dusthandling.makeDustToOreRecipes(dust.dusts)
dusthandling.extendData()
