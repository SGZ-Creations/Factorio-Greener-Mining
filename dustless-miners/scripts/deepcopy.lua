local deepcopy = {}

local function deepcopyImpl(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[deepcopyImpl(k, s)] = deepcopyImpl(v, s) end
  return res
end

function deepcopy.deepcopy(t)
	return deepcopyImpl(t, nil)
end

return deepcopy