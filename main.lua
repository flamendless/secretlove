--secretlove simple usage

--require the module
local secretlove = require("secretlove")
secretlove:setDebug() --to get outputs in terminal/console

--BASIC USAGE:
--create tables of secret code
local jejemoncode = {
	a = "4",
	e = "3",
	i = "1",
	o = "0",
	u = "oo",
	s = {"xh", "sx", "cx"} --you can also have tables here for random 
} --note, I am not a jejemon!
local personalcode = {
	a = "...",
	e = "..",
	i = "....",
	o = "........",
	u = "......"
}

--create secretlove objects that takes the table of secret code as parameter
local jejemon = secretlove:new(jejemoncode)
local personal = secretlove:new(personalcode)

--then to convert it now!
--print to check

print("USING JEJEMON")
print(jejemon:encode("KAmusta, ako ay purong Filipino"))
print("USING CUSTOM-PERSONAL")
print(personal:encode("I don't know morse codes to be honest")
)

--OTHER FREEBIES/FEATURES!
--the library will also include famous codes so you won't have to to do it yourself. Now talk about secret love!
local inverted = secretlove:new("invert") --invert the alphabet
local caesar = secretlove:new("caesar", 3) --3 is the shift value
print("USING INVERTED ALPHABET")
print(inverted:encode("abc is now xyz"))
print("USING CAESAR'S CIPHER with shift value of 3")
print(caesar:encode("xyz is now abc"))
