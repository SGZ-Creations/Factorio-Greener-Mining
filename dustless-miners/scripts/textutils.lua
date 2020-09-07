local textutils = {}

local function serializeImpl(t, tTracking, sIndent)
    local sType = type(t)
    if sType == "table" then
        if tTracking[t] ~= nil then
        	return "RECURSIVE"
        end
        tTracking[t] = true

        if next(t) == nil then
            -- Empty tables are simple
            return "{}"
        else
            -- Other tables take more work
            local sResult = "{\n"
            local sSubIndent = sIndent .. "  "
            local tSeen = {}
            for k, v in ipairs(t) do
                tSeen[k] = true
                sResult = sResult .. sSubIndent .. serializeImpl(v, tTracking, sSubIndent) .. ",\n"
            end
            for k, v in pairs(t) do
                if not tSeen[k] then
                    local sEntry
                    if type(k) == "string" and string.match(k, "^[%a_][%a%d_]*$") then
                        sEntry = k .. " = " .. serializeImpl(v, tTracking, sSubIndent) .. ",\n"
                    else
                        sEntry = "[ " .. serializeImpl(k, tTracking, sSubIndent) .. " ] = " .. serializeImpl(v, tTracking, sSubIndent) .. ",\n"
                    end
                    sResult = sResult .. sSubIndent .. sEntry
                end
            end
            sResult = sResult .. sIndent .. "}"
            return sResult
        end
    elseif sType == "string" then
        return string.format("%q", t)
    elseif sType == "number" or sType == "boolean" or sType == "nil" then
        return tostring(t)
    else
		return "NON_SERIALIZABLE"
    end
end

function textutils.serialize(t)
    local tTracking = {}
    return serializeImpl(t, tTracking, "")
end

return textutils