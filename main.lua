--secretlove simple usage

--require the module
local secretlove = require("secretlove")
--secretlove:setDebug() --to get outputs in terminal/console

--here are the sample strings/texts we will convert
local str_to_jejemon = "Kamusta, ako ay purong Filipino"
local str_to_morse = "I don't know morse codes to be honest"
local str_to_reverse = "hahaha, abcd, xyz"

--create a new secretlove object for jejemon codes
--pass the table which contains the chars to be converted
--you can pass the table directly as an argument
local jejemoncode = secretlove:new({
		a = "4",
		e = "3",
		i = "1",
		o = "0",
		u = "oo",
		s = {"xh", "sx", "cx"}
	}
)

--OR you could do it this way!
--create a new secretlove object for morse codes
local tbl_morsecode = {
	a = "...",
	e = "..",
	i = "....",
	o = "........",
	u = "......"
}
--you can pass the table here
local morsecode = secretlove:new(tbl_morsecode)
local reversecode = secretlove:new("reverse")

--then to convert it now!
str_to_jejemon = jejemoncode:encode(str_to_jejemon)
str_to_morse = morsecode:encode(str_to_morse)

--the library will also include famous codes so you won't have to to do it yourself. Now talk about secret love!
str_to_reverse = reversecode:encode(str_to_reverse)

--print to see the changes
print(str_to_jejemon)
print(str_to_morse)
print(str_to_reverse)
