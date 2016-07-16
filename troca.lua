--
-- Mod Tror
--
-- Operador de trocas
--


-- Verificar viabilidade de uma troca
tror.verificar = function(player, item_rem, item_add)

	if not player or not item_add or not item_rem then
		minetest.log("error", "[Tror] Faltou dados em (em tror.verificar)")
		return false
	end
	
	local inv = player:get_inventory()
	
	-- Verificar jogador
	if not inv:contains_item("main", item_rem) then
		return 1 -- Jogador nao pode pagar
	elseif not inv:room_for_item("main", item_add) then
		return 2 -- Jogador com inventario lotado
	end
	
	return true
end

-- Realizar uma troca entre com um jogador
tror.trocar = function(player, item_rem, item_add, msg)
	
	if not player or not item_add or not item_rem then
		minetest.log("error", "[Tror] Faltou dados em (em tror.trocar)")
		return false
	end
	
	
	local v = tror.verificar(player, item_rem, item_add)
	if v ~= true then
		if v == 1 then
			if msg and msg.ins then
				minetest.chat_send_player(player:get_player_name(), msg.ins)
			end
			return 1
		elseif v == 2 then
			if msg and msg.lot then
				minetest.chat_send_player(player:get_player_name(), msg.lot)
			end
			return 2
		else
			minetest.log("error", "[Tror] Resultado inesperado em tror.trocar (v = "..dump(v)..")")
			return false
		end
	end
	
	local inv = player:get_inventory()
	
	-- Retirar itens do inventario
	local i = string.split(item_rem, " ")
	local n = i[2] or 1
	i = i[1]
	for r=1, tonumber(n) do -- 1 eh o tanto que quero tirar
		inv:remove_item("main", i) -- tira 1 por vez
	end
	
	inv:add_item("main", item_add)
	
	
	if msg and msg.ok then
		minetest.chat_send_player(player:get_player_name(), msg.ok)
	end
	return true
	
end
