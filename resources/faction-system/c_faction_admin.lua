-- ADMIN GUI's
wFactionList, bFactionListClose,gridFactions = nil
function showFactionList(factions)
	if not (wFactionList) then
		wFactionList = guiCreateWindow(0.25, 0.25, 0.5, 0.5, "Frakció lista", true)
		gridFactions = guiCreateGridList(0.025, 0.1, 0.95, 0.775, true, wFactionList)
		
		local colID = guiGridListAddColumn(gridFactions, "ID", 0.1)
		local colName = guiGridListAddColumn(gridFactions, "Frakció neve", 0.6)
		local colPlayers = guiGridListAddColumn(gridFactions, "Játékosok", 0.14)
		local colType = guiGridListAddColumn(gridFactions, "Típus", 0.14)
		
		for key, value in pairs(factions) do
			local factionID = factions[key][1]
			local factionName = tostring(factions[key][2])
			local factionType = tonumber(factions[key][3])
			local factionPlayers = factions[key][4]
			
			-- Parse the type
			if (factionType==0) then
				factionType = "Banda"
			elseif (factionType==1) then
				factionType = "Maffia"
			elseif (factionType==2) then
				factionType = "Rendvédelem"
			elseif (factionType==3) then
				factionType = "Állam"
			elseif (factionType==4) then
				factionType = "Egészségügy"
			elseif (factionType==5) then
				factionType = "Egyéb"
			elseif (factionType==6) then
				factionType = "Hírközlés"
			end
			
			local row = guiGridListAddRow(gridFactions)
			guiGridListSetItemText(gridFactions, row, colID, factionID, false, false)
			guiGridListSetItemText(gridFactions, row, colName, factionName, false, false)
			guiGridListSetItemText(gridFactions, row, colPlayers, factionPlayers, false, false)
			guiGridListSetItemText(gridFactions, row, colType, factionType, false, false)
		end
		
		addEventHandler( "onClientGUIDoubleClick", gridFactions,
			function( button )
				if button == "left" then
					local row, col = guiGridListGetSelectedItem( source )
					if row ~= -1 and col ~= -1 then
						local gridID = guiGridListGetItemText( source , row, col )
						
						triggerServerEvent("faction:admin:showplayers", getLocalPlayer(), gridID )
					else
						outputChatBox( "Ki kell választanod egy frakciót.", 255, 0, 0 )
					end
				end
			end,
			false
		)

		bFactionListClose = guiCreateButton(0.025, 0.9, 0.95, 0.1, "Bezár", true, wFactionList)
		addEventHandler("onClientGUIClick", bFactionListClose, closeFactionList, false)
	else
		guiSetInputEnabled(false)
		destroyElement(wFactionList)
		wFactionList = nil
	end
end
addEvent("showFactionList", true)
addEventHandler("showFactionList", getRootElement(), showFactionList)

function closeFactionList(button, state)
	if (source==bFactionListClose) and (button=="left") and (state=="up") then
		guiSetInputEnabled(false)
		destroyElement(wFactionList)
		wFactionList, bFactionListClose = nil, nil
	end
end