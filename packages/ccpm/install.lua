--[[
	ccpm install wrapper, for use with ccpm itself
]]

--Source URL
local url = "https://raw.githubusercontent.com/emil1003/ccpm/master/ccpm.lua"

--Runnable location
local location = "/ccpm.lua"

local function out(s,c)
	term.setTextColor(c or 1)
	print(s)
end

out("Fetching source at "..url.."...")

local h = http.get(url)

if not h then
	error("Fetching source failed")
end

out("Preparing to replace "..location.."...")

local fh = fs.open(location, "w")
fh.write(h.readAll())
fh.close()

h.close()

out("Replaced "..location)
