-- ----------------------------------------------------------------------[-]-[o]-[×]--
-- - GrowPai Wrapper                                                                 																	
-- -----------------------------------------------------------------------------------
-- - Originally made by Purpl3r0se Ported to hertz internal by dart 													   
-- - License: MIT                                                                    
-- - Wrapper Version: v1.4                                                           
-- -----------------------------------------------------------------------------------
-- - Created for GrowPai                                                       
-- - Contributors: arky#0086   (on teohook)
-- - purpl3r0se (for originally making this)                                                       
-- -----------------------------------------------------------------------------------

function dropItem(itemID, count)
	SendPacket(2, "action|drop\n|itemID|" .. itemID)
	SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
end

function joinWorld(world)
	SendPacket(3, "action|join_request\nname|" .. world .. "\ninvitedWorld|0")
end

function wrenchTile(x, y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = 32
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end

function faceSide(side)
	if side == "left" then
		local packet = {}
		packet.type = 0
		packet.pos_x = GetLocal().pos_x
		packet.pos_y = GetLocal().pos_y
		packet.flags = 48
		SendPacketRaw(packet)
		return
	end
	if side == "right" then
		local packet = {}
		packet.type = 0
		packet.pos_x = GetLocal().pos_x
		packet.pos_y = GetLocal().pos_y
		packet.flags = 32
		SendPacketRaw(packet)
		return
	end
	log("`cInvalid side chosen (`4" .. side .. "`c)")
end

function hitTile(x, y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = 18
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end

function placeTile(id, x, y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = id
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end

function sendFunctionList()
log([[dropItem(itemID, count), Basically drops(The specific id for the item and the count)
joinWorld(world), Should warp you to the world you want.
wrenchTile(x, y), Wrenches the specific tile pos
faceSide(side), right or left, To side your face
hitTile(x,y) to punch the specific tile
placeTile(id, x, y) to place the specific block with the specific tile pos
sendFunctionList() sends this
colorMode(bool, PPS) true/false rgb from black to white color, dependable on PPS(Packet per second)]])
end
