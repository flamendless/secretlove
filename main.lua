--secretlove simple usage

--require the module
local secretlove = require("secretlove")
secretlove:setDebug(true) --to get outputs in terminal/console
--BASIC USAGE:
--create tables of secret code
local personalcode = {
	a = "...",
	e = "..",
	i = "....",
	o = "........",
	u = "......",
	d = {"dd","hd"} --or a table for randomization!
}
--create secretlove objects that takes the table of secret code as parameter
local personal = secretlove:new(personalcode)
--then to convert it now!
--print to check
print("USING CUSTOM-PERSONAL")
print(personal:encode("I don't know morse codes to be honest")
)

--OTHER FEATURES!

--the library will also include famous codes so you won't have to to do it yourself. Now talk about effort in secret love!
local inverted = secretlove:new("atbash") --invert the alphabet (reverse)
local caesar = secretlove:new("caesar", 3) --3 is the shift value
local jejemon = secretlove:new("jejemon")
print("USING ATBASH ALPHABET")
print(inverted:encode("abc is now xyz"))
print("USING CAESAR'S CIPHER with shift value of 3")
print(caesar:encode("xyz is now abc"))
print("USING JEJEMON")
print(jejemon:encode("Kamusta po kayo?"))
