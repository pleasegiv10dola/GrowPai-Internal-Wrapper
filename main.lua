-- ----------------------------------------------------------------------[-]-[o]-[×]--
-- - GrowPai Wrapper
-- -----------------------------------------------------------------------------------
-- - Originally made by purpl3r0se#0001, ported to GrowPai by dart
-- - License: MIT
-- - Wrapper Version: v1.1.4
-- -----------------------------------------------------------------------------------
-- - Created for GrowPai
-- - Contributors: arky#0086 (on teohook)
-- - purpl3r0se (for originally making this)
-- - nabhek (colorMode, sendFunctionlist)
-- -----------------------------------------------------------------------------------

function DropItem(itemID, count)
	SendPacket(2, "action|drop\n|itemID|" .. itemID)
	SendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemID .. "|\ncount|" .. count)
end

function JoinWorld(world)
	SendPacket(3, "action|join_request\nname|" .. world .. "\ninvitedWorld|0")
end

function WrenchTile(x, y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = 32
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end

function FaceSide(side)
	if side == "left" then
		local packet = {}
		packet.type = 0
		packet.pos_x = GetLocal().pos_x
		packet.pos_y = GetLocal().pos_y
		packet.flags = 48
		SendPacketRaw(packet)
		return
    elseif side == "right" then
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

function HitTile(x, y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = 18
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end

function PlaceTile(id, x, y)
    local pkt = {}
    pkt.type = 3
    pkt.int_data = id
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end

function SendFunctionList()
    log([[DropItem(itemID, count) - Drops a specific item with a specified item id and item count.
    JoinWorld(world) - Joins the world specified.
    WrenchTile(x, y) - Wrenches a tile at that specific x and y coordinate.
    FaceSide(side) - Face left or right side.
    HitTile(x,y) - Punches a tile at that specific x and y coordinate.
    PlaceTile(id, x, y) - Places a tile at that specific x and y coordinate with the specified block id.
    SendFunctionList() - Sends this message.
    ColorMode(bool, pps) - true/false rgb from black to white color, dependable on pps (packet per second)
    Teleport(world, x, y) - Teleports you to a world at that exact x, y (exploit)]])
end

function ColorMode(bool, pps)
    local Colors = {1348237567, 1685231359, 2022356223, 2190853119, 2527912447, 2864971775, 3033464831, 3370516479, 3033464831, 2864971775, 2527912447, 2190853119, 2022356223, 1685231359, 1348237567}
    _G.toggle = bool

    if pps > 100 then
        print("You cannot have "..pps.." packets per second, Exceeded the maximum amount(can cause you to get banned / shadowbanned")
    else
        while _G.toggle do Sleep()
            pps = 1000 / pps
            for index, var in pairs (Colors) do Sleep(pps)
                SendPacket(2,"action|setSkin\ncolor|"..var)
            end
        end
    end
end

function Teleport(world, x, y)
    SendPacket(3, "action|join_request\nname|start\ninvitedWorld|0")
    Sleep(5000)
    SendPacket(3, "action|join_request\nname|" .. world .. "\ninvitedWorld|0")
    Sleep(650)
    SendPacket(3, "action|quit_to_exit")
    FindPath(x, y)
    Sleep(400)
    SendPacket(3, "action|quit_to_exit")
end

ColorMode(true, 30)