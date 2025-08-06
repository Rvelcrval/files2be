-- wget macro
local component = require("component")
local internet = require("internet")
local shell = require("shell")
local text = require("text")

if not component.isAvailable("internet") then
  io.stderr:write("This program requires an internet card to run.")
  return
end

local repo = "https://raw.githubusercontent.com/Rvelcrval/files2be/refs/heads/main/oc/"

local args, options = shell.parse(...)
options.q = options.q or options.Q

if #args < 1 then
  io.write("Usage: rvget [-fq] <url> [<filename>]\n")
  io.write(" -*: Same as wget, check wget man instead.\n")
  return
end

local url = text.trim(args[1])
local filename = args[2]

local str_args = ""
if #options > 0 then
    str_args = " -"
    for k,_ in pairs(options) do str_args = str_args .. k end
end

shell.execute("wget" .. str_args .. " " .. repo .. url .. (filename and (" " .. filename) or ""))

return true