﻿local rbWindow, rbList, bUse, bClose, tempObject, tempObjectID, tempObjectRot = nil
local tempObjectPosX, tempObjectPosY, tempObjectPosZ, tempObjectPosRot, tempObjectZfix = nil

local roadblockID = 	{	"978",					"981", 					"3578", 			"1228", 				"1282", 						"1422", 				"1424", 				"1425",					"1459", 				"3091", 		"1593", 				"2899",						"2892",					"1238",			"1237",				"2930"} -- objectid
local roadblockTypes = 	{ 	"Terelés ->", 			"Nagy útzár", 			"Sárga útzár",		"Kis fakerítés", 		"Kis figyelmeztető", 			"Kő útzár",				"Fém kerítés", 			"Haladási irány ->", 	"Figyelmeztető tábla", 	"Autóval ->",	"Kis szögesdrót",		"Közepes szögesdrót",		"Nagy szögesdrót",		"Bólya",		"Vizes bólya",		"Rács"} -- name
local roadblockRot = 	{	"180",					"0", 					"0",				"90",					"90",							"0",					"0",					"0",					"0",					"0",			"90",					"90",						"0", 					"0",			"0",				"90"} -- rotation needed to face to player
local roadblockZ = 		{	"0",					"0",					"0",				"0",					"0",							"0",					"0",					"0",					"0",					"0",			"-0.4",					"-0.4",						"-0.42",					"-0.18",		"-0.45",  			"2.25"} -- Height fix				
local thePlayer = getLocalPlayer()

function enableRoadblockGUI(parameter)
	if not (rbWindow) then
		local width, height = 400, 350
		local scrWidth, scrHeight = guiGetScreenSize()
		
		local x = scrWidth*0.8 - (width/2)
		local y = scrHeight*0.65 - (height/2)
	
		rbWindow = guiCreateWindow ( x, y, width, height, "Útzár létrehozása", false)
		rbList = guiCreateGridList(0.05, 0.05, 0.9, 0.8, true, rbWindow)
		addEventHandler("onClientGUIDoubleClick", rbList, selectRoadblockGUI, false)
		local column = guiGridListAddColumn(rbList, "ID", 0.2)
		local column2 = guiGridListAddColumn(rbList, "Tipus", 0.5)
		local column3 = guiGridListAddColumn(rbList, "Forgatás", 0.15)
		local column4 = guiGridListAddColumn(rbList, "Z", 0.1)
		
		for key, value in ipairs(roadblockID) do
			local newRow = guiGridListAddRow(rbList)
			guiGridListSetItemText(rbList, newRow, column, roadblockID[key], true, false)
			guiGridListSetItemText(rbList, newRow, column2, roadblockTypes[key], false, false)
			guiGridListSetItemText(rbList, newRow, column3, roadblockRot[key], false, false)
			guiGridListSetItemText(rbList, newRow, column4, roadblockZ[key], false, false)
		end

		bUse = guiCreateButton(0.05, 0.85, 0.45, 0.1, "Kiválaszt", true, rbWindow)
		addEventHandler("onClientGUIClick", bUse, selectRoadblockGUI, false)
		
		bClose = guiCreateButton(0.5, 0.85, 0.45, 0.1, "Bezár", true, rbWindow)
		addEventHandler("onClientGUIClick", bClose, cancelRoadblockGUI, false)
		outputChatBox("Válassz ki egy útlezárást, majd helyezd a kívánt helyre!", 0, 255, 0)
		outputChatBox("Nyomd meg a BAL ALT gombot, hogy letedd, az útzárat!", 0, 255, 0)
	
		showCursor(true)
	else
		cleanupRoadblockGUI()
	end
end

function cleanupRoadblockGUI()
	cleanupRoadblock()
	destroyElement(rbWindow)
	rbWindow = nil
	showCursor(false)
end

function cleanupRoadblock()
	if (isElement(tempObject)) then
		destroyElement(tempObject)
		tempObjectPosX, tempObjectPosY, tempObjectPosZ, tempObjectPosRot = nil
		tempObjectID, tempObjectRot = nil
		unbindKey ( "lalt", "down", convertTempToRealObject)
	end
	removeEventHandler("onClientPreRender",getRootElement(),updateRoadblockObject)
end

function selectRoadblockGUI(button, state)
	if (source==bUse) and (button=="left") or (source==rbList) and (button=="left") then
		local row, col = guiGridListGetSelectedItem(rbList)
		
		if (row==-1) or (col==-1) then
			outputChatBox("Kérjük, válassza ki a típust!", 255, 0, 0)
		else
			if (isElement(tempObject)) then
				destroyElement(tempObject)
			end
			
			local objectid = tonumber(guiGridListGetItemText(rbList, guiGridListGetSelectedItem(rbList), 1))
			local objectrot = tonumber(guiGridListGetItemText(rbList, guiGridListGetSelectedItem(rbList), 3))
			local objectz = tonumber(guiGridListGetItemText(rbList, guiGridListGetSelectedItem(rbList), 4))
			spawnTempObject(objectid, objectrot, objectz)
			showCursor(false)
		end
	end
end

function spawnTempObject(objectid, objectrot, objectz)
	-- create temporary object
	tempObjectID = objectid
	tempObjectRot = objectrot
	tempObjectZfix = objectz
	tempObject = createObject( objectid, 0, 0, 0, 0, 0, 0)
	setElementAlpha(tempObject, 150)
	setElementInterior ( tempObject, getElementInterior ( thePlayer ) )
	setElementDimension ( tempObject, getElementDimension ( thePlayer ) )

	bindKey ( "lalt", "down", convertTempToRealObject)
	updateRoadblockObject()
	addEventHandler("onClientPreRender",getRootElement(),updateRoadblockObject)
end

function convertTempToRealObject(key, keyState)
	if (isElement(tempObject)) then
		triggerServerEvent("roadblockCreateWorldObject", thePlayer, tempObjectID, tempObjectPosX, tempObjectPosY, tempObjectPosZ, tempObjectPosRot)
		cleanupRoadblock()
		showCursor(true)
	end
end

function updateRoadblockObject(key, keyState)
	if (isElement(tempObject)) then
		local distance = 6
		local px, py, pz = getElementPosition ( thePlayer )
		local rz = getPedRotation ( thePlayer )    

		local x = distance*math.cos((rz+90)*math.pi/180)
		local y = distance*math.sin((rz+90)*math.pi/180)
		local b2 = 15 / math.cos(math.pi/180)
		local nx = px + x
		local ny = py + y
		local nz = pz - 0.5
		  
		local objrot =  rz + tempObjectRot
		if (objrot > 360) then
			objrot = objrot-360
		end
		  
		nz = nz + tempObjectZfix
		  
		setElementRotation ( tempObject, 0, 0, objrot )
		moveObject ( tempObject, 10, nx, ny, nz)
		
		tempObjectPosX = nx
		tempObjectPosY = ny
		tempObjectPosZ = nz
		tempObjectPosRot = objrot
	end
end

function cancelRoadblockGUI(button, state)
	if (source==bClose) and (button=="left") then
		cleanupRoadblockGUI()
	end
end

addEvent( "enableRoadblockGUI", true )
addEventHandler( "enableRoadblockGUI", getRootElement(), enableRoadblockGUI )