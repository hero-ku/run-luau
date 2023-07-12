local RunLuau = {}

local Fiu = require(script.Fiu)
local LuauInLuau = require(script.LuauInLuau)

function RunLuau.Compile(source: string) : (boolean, string, string)
    return LuauInLuau.Compile(source)
end

function RunLuau.RunBytecode(bytecode: string, env: {any})
    Fiu.luau_load(bytecode, env)()
end

function RunLuau.RunSource(source: string, env: {any})
    local success, bytecode = LuauInLuau.Compile(source)
    if not success then return end

    Fiu.luau_load(bytecode, env)
end

return RunLuau