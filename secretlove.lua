--Secret Love module
--parse/convert strings into secret codes!
--Created by Brandon Blanker Lim-it @flamendless
--this is in continuation of my prior simple tutorial on the same subject which you can see in my gist

local secretlove = { secret_code = {},}

local _debug = false
local predefined = {
	alphabet  = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'},
	reverse_alphabet = nil,
	caesar = nil,
	atbash = nil,
	jejemon = {
		a = {"4","ah","ha"},
		b = {"bh","vh","bb"},
		c = {"c","ch","ck","qh"},
		d = {"d","dh","hd"},
		e = {"3","33","eh","h3"},
		f = {"fh","ph"}, g = {"gh","gg"},
		h = "hh", i = {"ay","hay"}, k = {"ck","kk","q"},
		o = {"oo","0"}, p = {"ph","hp"}, q = {"qq","qh"},
		s = {"xh","sh","ch","xx"}, u = {"uu","oo","ooh","hoo"},
		y = {"yh","yy"}
	}
}
secretlove.__index = secretlove

local function string_to_table(str)
	assert(str, "string is required")
	local t = {}
	str:gsub(".", function(char) table.insert(t,char) end)
	return t
end

local function initATBASH()
	predefined.reverse_alphabet = {}
	for k = 0, #predefined.alphabet-1 do
		table.insert(predefined.reverse_alphabet,
			predefined.alphabet[#predefined.alphabet - k])
	end
	predefined.atbash = {}
	for k,v in pairs(predefined.alphabet) do
		local _v = predefined.reverse_alphabet[k]
		predefined.atbash[tostring(v)] = _v
	end
end

local function initCaesar(shift)
	predefined.caesar = {}
	for i = shift, #predefined.alphabet - 1 + shift do
		if predefined.alphabet[i] then
			table.insert(predefined.caesar,
				predefined.alphabet[i])
		else
			local _i = (i - #predefined.alphabet)
			table.insert(predefined.caesar,
				predefined.alphabet[_i])
		end
	end
	local i = 1
	local t = {}
	for k,v in pairs(predefined.alphabet) do
		t[v] = predefined.caesar[i]
		i = i + 1
	end
	predefined.caesar = t
end

function secretlove:setDebug(bool)
	_debug = bool
end

function secretlove:new(t,i)
	local obj = {}
	obj.__index = obj

	if type(t) == "table" then
		obj.secret_code = t
	elseif t == "atbash" then
		if predefined.reverse_alphabet == nil then
			initATBASH()
		end
		obj.secret_code = predefined[t]
	elseif t == "caesar" then
		if predefined.caesar == nil then
			initCaesar(i)
		end
		obj.secret_code = predefined[t]
	elseif t == "jejemon" then
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
		--make sure to consider uppercased letter
		local _v = string.lower(v)
		if secret_code[_v] then
			v = _v
		end
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
