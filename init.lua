--
-- Mod Tror
--
-- Inicializador de scripts Lua
--

-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[TROR]"..msg)
	end
end

local modpath = minetest.get_modpath("tror")

-- Variavel global
tror = {}

-- Carregar scripts
notificar("Carregando scripts...")
dofile(modpath.."/troca.lua")
notificar("OK")

