--Secret Love module
--parse/convert strings into secret codes!
--Created by Brandon Blanker Lim-it @flamendless
--this is in continuation of my prior simple tutorial on the same subject which you can see in my gist

local secretlove = {
	secret_code = {},
}

local _debug = false
local predefined = {
	alphabet  = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'},
	reverse_alphabet = {},
	reverse = {}
}
secretlove.__index = secretlove

local function initReverse()
	for k = 0, #predefined.alphabet-1 do
		table.insert(predefined.reverse_alphabet,
			predefined.alphabet[#predefined.alphabet - k])
	end
	for k,v in pairs(predefined.alphabet) do
		local _v = predefined.reverse_alphabet[k]
		predefined.reverse[tostring(v)] = _v
	end
end

local function string_to_table(str)
	assert(str, "string is required")
	local t = {}
	str:gsub(".", function(char) table.insert(t,char) end)
	return t
end

function secretlove:setDebug()
	_debug = true
end

function secretlove:new(t)
	local obj = {}
	obj.__index = obj

	if type(t) == "table" then
		obj.secret_code = t
	elseif t == "reverse" then
		if predefined.reverse[1] == nil then
			initReverse()
		end
		obj.secret_code = predefined[t]
	end

	setmetatable(obj, self)
	return obj
end

function secretlove:encode(str)
	if _debug then
		print("original text: " .. str)
	end
	local secret_code = self.secret_code
	local str = str
	local t = string_to_table(str)
	for k,v in pairs(t) do
		if secret_code[v] then
			if type(secret_code[v]) == "table" then
				local r = math.random(1, #secret_code[v])
				t[k] = secret_code[v][r]
			else
				t[k] = secret_code[v]
			end
		else
			t[k] = v
		end
	end
	if _debug then
		print("decoded: " .. table.concat(t))
	end
	return table.concat(t)
end

return secretlove
