local component = require("component")
local internet = require("internet")
local shell = require("shell")

if not component.isAvailable("internet") then
  io.stderr:write("This program requires an internet card to run.")
  return
end

local repo = "https://raw.githubusercontent.com/Rvelcrval/files2be/refs/heads/main/oc/"

local args, options = shell.parse(...)

-- install macro for wget
shell.execute("wget " .. repo .. "rvget.lua /bin/rvget.lua")

if args[1] == "update" then
    shell.execute("rvget -f patches.lua /home/patches.lua")
end

-- replace boot.lua
shell.execute("rm /lib/core/boot.lua")
shell.execute("rvget boot.lua /lib/core/boot.lua")