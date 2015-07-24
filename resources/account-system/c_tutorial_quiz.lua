﻿--========================= TUTORIAL SCRIPT ==============================================

-- Concrete Gaming Roleplay Server - Tutorial and Quiz script for un-registerd players - written by Peter Gibbons (aka Jason Moore)

local tutorialStage = {}
	tutorialStage[1] = {1942.0830078125, -1738.974609375, 16.3828125, 1942.0830078125, -1760.5703125, 13.3828125} -- idlewood gas station//
	tutorialStage[2] = {1538.626953125, -1675.9375, 19.546875, 1553.8388671875, -1675.6708984375, 16.1953125} --LSPD//
	tutorialStage[3] = {2317.6123046875, -1664.6640625, 17.215812683105, 2317.4755859375, -1651.1640625, 17.221110343933} -- 10 green bottles//
	tutorialStage[4] = {1742.623046875, -1847.7109375, 16.579560279846, 1742.1884765625, -1861.3564453125, 13.577615737915} -- Unity Station//
	tutorialStage[5] = {1685.3681640625, -2309.9150390625, 16.546875, 1685.583984375, -2329.4443359375, 13.546875} -- Airport//
	tutorialStage[6] = {368.0419921875, -2008.1494140625, 7.671875, 383.765625, -2020.935546875, 10.8359375} -- Pier//
	tutorialStage[7] = {1411.384765625, -870.787109375, 78.552024841309, 1415.9248046875, -810.15234375, 78.552024841309} -- Vinewood sign//
	tutorialStage[8] = {1893.955078125, -1165.79296875, 27.048973083496, 1960.4404296875, -1197.3486328125, 26.849721908569} -- Glen Park//
	tutorialStage[9] = {2817.37890625, -1865.7998046875, 14.219080924988, 2858.4248046875, -1849.91796875, 14.084205627441} -- East Beach
	
local stageTime = 15000
local fadeTime = 2000
local fadeDelay = 300

local tutorialTitles = {}
	tutorialTitles[1] = "�dv�zl�nk"
	tutorialTitles[2] = "Te neved"
	tutorialTitles[3] = "Szerepj�t�kr�l"
	tutorialTitles[4] = "IC �s OOC"
	tutorialTitles[5] = "Szerver Szab�lyzat"
	tutorialTitles[6] = "Bugok,Csal�sok"
	tutorialTitles[7] = "Nyelvek"
	tutorialTitles[8] = "Munk�k"
	tutorialTitles[9] = "MORE INFORMATION"
	

local tutorialText = {}
		tutorialText[1] = {"�dv�zl�nk a Fly Roleplay szerver�n.",
					"L�tom te �j vagy itt, ez�rt k�rem, Hadja,hogy 2 perc alatt,bemutassam �nnek a szervert.",
					"H b�rmi segits�gre.t�bb inform�ci�ra van sz�ks�ged fordulj bizalommal az adminokhoz,vagy l�togass el a weboldalunkra www.flymta.eu"}
	
	tutorialText[2] = 		{"Szerepj�t�k (RP) egy j�t�k,ahol a j�t�kosok bet�ltheti az egy �ltala kital�lt szem�ly szerep�t",
					"Keresztn�v Vezet�kn�v. Ez b�rmi lehet, amit csak akarsz, p�ld�ul: Yamazaky Chang",}
	
	tutorialText[3] = 		{"Szerepj�t�k: Ez azt jelenti, meghatalmazotti min�s�gben, ahogy azt a ",
					"val�s �letben tenn�d.",
					"Annak ellen�re, hogy vannak a  szerveren frakci�k, ez�rt szerepet j�tszhat, ahogy szeretne,",
					"felt�ve, hogy k�veti a Szerver alapszab�lyokat."}
	
	tutorialText[4] = 		{"In Character (IC) �s az Out of Character (OOC) alapvet� fontoss�g a szerveren",
					"OOC:ide azt irjuk ami nem a j�t�kkal kapcsolatos p�ld�ul:J�ssz ts?",
					"Ezekkel tudunk OOC besz�lni, parancsok: /o, /b �s /pm.",
					"OOC ben val� dolgokat k�rj�k ne keverd az IC fogalmakkal �ssze."}
	
	tutorialText[5] = 		{"Fontos a szerepj�t�kban a  kifejez�sek, hogy egyszer� legyen meg�rteni, a fogalmakat mint pl.:a'Metagaming'",
					"(OOC inform�ci� felhaszn�l�sa IC inorm�ci�k�nt),  'Powergaming' (H�sk�d�s pl.: fegyvert fognak r�m �n meg elfutok)",
					"Tov�bbi inform�ci��rt nyomja meg az f1 billenty�t �s kiadja a t�bbi segits�get",}
	
	tutorialText[6] = 		{"Szerveren Csalni TILOS.",
					"Bugot �szleltek vagy csal�t azonnal jelents�tek a j�t�k�lm�ny fenakad�sa miatt.",
					"Ezt k�t f�le k�pp megtehetitek Szerverene:/report,weboldalon bug topic" }
					  
	tutorialText[7] = 		{"Szerveren t�bb fajta idegen nyelvet meglehet tanulni.",
					"Angol nyelvet tanult�l meg akkor aki spanyol nyelvet tud az nem �rti Ic be amit besz�lsz.",
					"OOC-be mindk�t f�l l�thatja amit besz�l nyelvt�l f�ggetlen�l",}
	
	tutorialText[8] = 		{"Munk�t a V�rosh�z�n az �gyint�z�n�l tudsz felvenni",
					"Szerveren t�bb fajta munka lehet�s�g tal�lhat� amib�l kedvedre v�logathatsz",}

				   
	tutorialText[9] = 	{"Inform�ci�kkat a szerveren az f1 billenty�vel,milletve a /report parancsal tudsz k�rni",
					"Veboldalunkon �rdemes regisztr�lni mivel ott folyamatosan nyomon k�vetheted a fejleszt�seket.",
					"B�rmif�le segits�gre szorulsz �rj nyugodtan egy adminnak �s segit",}
					
					

-- function starts the tutorial
function showTutorial()

	local thePlayer = getLocalPlayer()

	-- set the player to not logged in so they don't see any other random chat
	triggerServerEvent("player:loggedout", getLocalPlayer())
		
	-- if the player hasn't got an element data, set it to 1
	if not (getElementData(thePlayer, "tutorialStage")) then
		setElementData(thePlayer, "tutorialStage", 0, false)
	end
	
	-- ionc
	setElementData(thePlayer, "tutorialStage", getElementData(thePlayer, "tutorialStage")+1, false)

	
	-- stop the player from using any controls to move around or chat
	toggleAllControls (  false )
	-- fade the camera to black so they don't see the teleporting renders
	fadeCamera ( false, fadeTime/1000 ,0,0,0)
	
	-- timer to move the camera to the first location as soon as the screen has gone black.
	setTimer(function()
		
		-- timer to set camera position and fade in after the camera has faded out to black
		setTimer(function()
				
			local stage = getElementData(thePlayer, "tutorialStage")
			
			local camX = tutorialStage[stage][1]
			local camY = tutorialStage[stage][2]
			local camZ = tutorialStage[stage][3]
			local lookX = tutorialStage[stage][4]
			local lookY = tutorialStage[stage][5]
			local lookZ = tutorialStage[stage][6]
			
			setCameraMatrix(camX, camY, camZ, lookX, lookY, lookZ)
			
			-- set the element to outside and dimension 0 so they see th eother players
			setElementInterior(thePlayer, 0)
			setElementDimension(thePlayer, 0)
			
			-- fade the camera in
			fadeCamera( true, fadeTime/1000)
			
			-- call function to output the text
			outputTutorialText(stage)
			
			-- function to fade out after message has been displayed a read
			setTimer(function()
								
				local lastStage = getLastStage()
				
				-- if the player is on the last stage of the tutorial, fade their camera out and...
				if(stage == lastStage) then
					fadeCamera( false, fadeTime/1000, 0,0,0)
					
					setTimer(function()

						-- show the quiz after a certain time
						endTutorial()
						
						setElementData ( thePlayer, "tutorialStage", 0, false )
						
					end, fadeTime+fadeDelay,1 )
				else -- else more stages to go, show the next stage
					showTutorial(thePlayer)
				end
			end, stageTime, 1)
		end, 150, 1)
	end, fadeTime+fadeDelay , 1)
end



-- function returns the number of stages
function getLastStage()

	local lastStage = 0
	
	if(tutorialStage) then
		for i, j in pairs(tutorialStage) do
			lastStage = lastStage + 1
		end
	end
	
	return lastStage
end


-- function outputs the text during the tutorial
function outputTutorialText( stage)
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(tutorialTitles[stage],  255, 0,0, true)
	outputChatBox(" ")
	
	if(tutorialText[stage]) then
		for i, j in pairs(tutorialText[stage]) do
				outputChatBox(j)
		end
	end

end

-- function fade in the camera and sets the player to the quiz room so they can do the quiz
function endTutorial()

	local thePlayer = getLocalPlayer()
	
	-- set the player to not logged in so they don't see the chat
	triggerServerEvent("player:loggedout", getLocalPlayer())
	toggleAllControls(false)
			
	
	setTimer(function()
		setCameraMatrix(368.0419921875, -2008.1494140625, 7.671875, 383.765625, -2020.935546875, 10.8359375)
		
		-- fade the players camera in
		fadeCamera(true, 2)
		
		-- trigger the client to start showing the quiz
		setTimer(function()
			triggerEvent("onClientStartQuiz", thePlayer)
			
		end, 2000, 1)
		
		
	end, 100, 1)

end




   ------------ TUTORIAL QUIZ SECTION - SCRIPTED BY PETER GIBBONS, AKA JASON MOORE --------------
   
   
   
   questions = { }
questions[1] = {"Mit jelent az RP?", "Idi�taj�t�k", "Szerepj�t�k", "Felv�tel", "Csal�s", 2}
questions[2] = {"Szabad a szerverhirdet�s?", "Igen /ad", "Igen /reportba adminnak", " Igen OOC chatben", "Soha mert bannolnak", 4}
questions[3] = {"Mi a teend�, ha l�tod, hogy valaki Csal?", "Azonnal jelentem egy adminnak /report", "Oda se figyelek", "�n is neki �llok csalni", "Mek�rem,hogy segitsen nekem is csalni", 1}
questions[4] = {"Mi a c�me a weboldalnak �s f�rumnak?", "www.google.hu", "www.freemail.hu", "www.flymta.eu", "www.fly.hu", 3} 
questions[5] = {"El szeretn�k jutni egyik helyr�l a m�sikra mit teszek?", "H�vok egy admint,hogy teleport�ljon oda", "H�vok egy taxit �s elvitetem magam", "Bekapcsolom a csal�st", "Lopok egy kocsit �s azzal megyek oda", 2}
questions[6] = {"Melyik a helyes N�v a szerveren", "Vezet�kn�v", "Vezet�kn�v Keresztn�v", "Keresztn�v Vezet�kn�v", "B�rmi lehet", 2}
questions[7] = {"Szerinted melyik a helyes n�v a szerveren", "Bunko_Pista", "Niko Harrison", "asd 150", "b�rmi lehet", 2}
questions[8] = {"Mikor kell Rp-ni a szerveren", "Mindig", "Soha", "Csak ha admin figyel", 1}
questions[9] = {"Mit kell tenni ha �tk�z�nk?", "Semmit tov�bb megyek", "M�gegyszer megcsin�lom", "OOC be leirom mi t�rt�nt", "/me beverte a fej�t", 4}
questions[10] = {"Csatlakozni szeretn�k egy szervezethez mit kell tennem?", "Sz�lok egy adminnak tegyen be a szervezetbe", "OOC-be megirod nekik,hogy vegyenek be", "Sz�pen le rp-zem ahogy illik", "semmit nem csin�lok", 3}
questions[11] = {"Mit jelent az OOC?", "Trafipaxx", "Szerepen kiv�li dolgok", "Tankol�s", "Igyunk egy k�v�t", 2}
questions[12] = {"Mit jelent az IC?", "Szerepen bel�li dolgok", "Kocsikulcs", "Csal�st", "Semmit", 1}
questions[13] = {"Mit jelent az Metagaming", "Ok n�lk�li �l�s", "H�sk�d�s", "Sz�guldoz�st", "OOC adatok Ic-ben val� felhaszn�l�sa", 4}
questions[14] = {"Milyen nyelven van a szerver", "Francia", "Magyar", "H�ber", "Latin", 2}
questions[15] = {"Mikor besz�l egy m�sik j�t�kos az �n anyanyelv�n?", "Ha kitanulta", "Csak OOC-be", "Soha.", 1}
questions[16] = {"Mitjelent a DM?", "Szerepj�t�k", "Ok n�l�li �l�s", "Nincs autom", "Eggyiksem", 2}
questions[17] = {"Mit jelent a PG?", "H�sk�d�s", "OOC-Chat", "Gyilkol�s", "Bankrabl�s", 1}

-- variable for the max number of possible questions
local NoQuestions = 17
local NoQuestionToAnswer = 10
local correctAnswers = 0
local passPercent = 90
		
selection = {}


-- functon makes the intro window for the quiz
function createQuizIntroWindow()

	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	guiIntroWindow = guiCreateWindow ( X , Y , Width , Height , "Rp-teszt" , false )
	
	guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "banner.png", true, guiIntroWindow)
	
	guiIntroLabel1 = guiCreateLabel(0, 0.3,1, 0.5, "	Akkor most k�vetkezz�k az a teszt\
										 ", true, guiIntroWindow)
	
	guiLabelSetHorizontalAlign ( guiIntroLabel1, "center")
	guiSetFont ( guiIntroLabel1,"default-bold-small")
	
	guiIntroProceedButton = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Teszt Indul" , true ,guiIntroWindow)
	
	guiSetVisible(guiIntroWindow, true)
	
	addEventHandler ( "onClientGUIClick", guiIntroProceedButton,  function(button, state)
		if(button == "left" and state == "up") then
		
			-- start the quiz and hide the intro window
			startQuiz()
			guiSetVisible(guiIntroWindow, false)
		
		end
	end, false)

end


-- function create the question window
function createQuestionWindow(number)

	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	-- create the window
	guiQuestionWindow = guiCreateWindow ( X , Y , Width , Height , "Question "..number.." of "..NoQuestionToAnswer , false )
	
	guiQuestionLabel = guiCreateLabel(0.1, 0.2, 0.9, 0.1, selection[number][1], true, guiQuestionWindow)
	guiSetFont ( guiQuestionLabel,"default-bold-small")
	
	
	if not(selection[number][2]== "nil") then
		guiQuestionAnswer1Radio = guiCreateRadioButton(0.1, 0.3, 0.9,0.1, selection[number][2], true,guiQuestionWindow)
	end
	
	if not(selection[number][3] == "nil") then
		guiQuestionAnswer2Radio = guiCreateRadioButton(0.1, 0.4, 0.9,0.1, selection[number][3], true,guiQuestionWindow)
	end
	
	if not(selection[number][4]== "nil") then
		guiQuestionAnswer3Radio = guiCreateRadioButton(0.1, 0.5, 0.9,0.1, selection[number][4], true,guiQuestionWindow)
	end
	
	if not(selection[number][5] == "nil") then
		guiQuestionAnswer4Radio = guiCreateRadioButton(0.1, 0.6, 0.9,0.1, selection[number][5], true,guiQuestionWindow)
	end
	
	-- if there are more questions to go, then create a "next question" button
	if(number < NoQuestionToAnswer) then
		guiQuestionNextButton = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Next Question" , true ,guiQuestionWindow)
		
		addEventHandler ( "onClientGUIClick", guiQuestionNextButton,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1Radio)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2Radio)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3Radio)) then
					selectedAnswer = 3
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer4Radio)) then
					selectedAnswer = 4
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][6]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create a new window for the next question
					guiSetVisible(guiQuestionWindow, false)
					createQuestionWindow(number+1)
				end
			end
		end, false)
		
	else
		guiQuestionSumbitButton = guiCreateButton ( 0.4 , 0.75 , 0.3, 0.1 , "Submit Answers" , true ,guiQuestionWindow)
		
		-- handler for when the player clicks submit
		addEventHandler ( "onClientGUIClick", guiQuestionSumbitButton,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1Radio)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2Radio)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3Radio)) then
					selectedAnswer = 3
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer4Radio)) then
					selectedAnswer = 4
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][6]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create the finish window
					guiSetVisible(guiQuestionWindow, false)
					createFinishQuizWindow()


				end
			end
		end, false)
	end
end


-- funciton create the window that tells the
function createFinishQuizWindow()

	local score = (correctAnswers/NoQuestionToAnswer)*100

	local screenwidth, screenheight = guiGetScreenSize ()
		
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
		
	-- create the window
	guiFinishWindow = guiCreateWindow ( X , Y , Width , Height , "End of Quiz", false )
	
	if(score >= passPercent) then
	
		local xmlRoot = xmlCreateFile("vgrptut.xml", "passedtutorial")
		xmlSaveFile(xmlRoot)
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "pass.png", true, guiFinishWindow)
	
		guiFinalPassLabel = guiCreateLabel(0, 0.3, 1, 0.1, "Congratulations! You have passed!", true, guiFinishWindow)
		guiSetFont ( guiFinalPassLabel,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalPassLabel, "center")
		guiLabelSetColor ( guiFinalPassLabel ,0, 255, 0 )
		
		guiFinalPassTextLabel = guiCreateLabel(0, 0.4, 1, 0.4, "You scored "..score.."%, and the pass mark is "..passPercent.."%. Well done!\
											Please remember to register at the forums (www.mta.vg)\
											if you have not done so.\
											\
											Thank you for playing at Valhalla Gaming MTA!" ,true, guiFinishWindow)
		guiLabelSetHorizontalAlign ( guiFinalPassTextLabel, "center")
		
		guiFinalRegisterButton = guiCreateButton ( 0.35 , 0.8 , 0.3, 0.1 , "Continue" , true ,guiFinishWindow)
		
		-- if the player has passed the quiz and clicks on register
		addEventHandler ( "onClientGUIClick", guiFinalRegisterButton,  function(button, state)
			if(button == "left" and state == "up") then
				-- reset their correct answers
				correctAnswers = 0
				guiSetVisible(guiFinishWindow, false)
				toggleAllControls ( true )
				triggerClientEvent(thePlayer, "onClientPlayerWeaponCheck", thePlayer)
				if createXMB then
					createXMB()
				else
					createMainUI(getThisResource())
				end
			end
		end, false)
		
	else -- player has failed, 
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "fail.png", true, guiFinishWindow)
	
		guiFinalFailLabel = guiCreateLabel(0, 0.3, 1, 0.1, "Sorry, you have not passed this time.", true, guiFinishWindow)
		guiSetFont ( guiFinalFailLabel,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalFailLabel, "center")
		guiLabelSetColor ( guiFinalFailLabel ,255, 0, 0 )
		
		guiFinalFailTextLabel = guiCreateLabel(0, 0.4, 1, 0.4, "You scored "..math.ceil(score).."%, and the pass mark is "..passPercent.."%.\
											You can retake the quiz as many times as you like, so have another shot!\
											\
											Thank you for playing at Valhalla Gaming MTA!" ,true, guiFinishWindow)
		guiLabelSetHorizontalAlign ( guiFinalFailTextLabel, "center")
		
		guiFinalRetakeButton = guiCreateButton ( 0.2 , 0.8 , 0.25, 0.1 , "Take Quiz Again" , true ,guiFinishWindow)
		guiFinalTutorialButton = guiCreateButton ( 0.55 , 0.8 , 0.25, 0.1 , "Show Tutorial" , true ,guiFinishWindow)
		
		-- if player click the retake button
		addEventHandler ( "onClientGUIClick", guiFinalRetakeButton,  function(button, state)
			if(button == "left" and state == "up") then
				-- reset their correct answers
				correctAnswers = 0
				guiSetVisible(guiFinishWindow, false)
				startShowQuizIntro()
			end
		end, false)
		
		-- if player click the show tutorial
		addEventHandler ( "onClientGUIClick", guiFinalTutorialButton,  function(button, state)
			if(button == "left" and state == "up") then
				-- reset their correct answers and hide the window
				correctAnswers = 0
				guiSetVisible(guiFinishWindow, false)
				guiSetInputEnabled(false)
				
				-- trigger server event to show the tutorial
				showTutorial()
			end
		end, false)
	
	
	
	end

end


-- function is triggerd by the server when it is time for the player to take the quiz
function startShowQuizIntro()
	
	clearChatBox()
	-- reset the players correct answers to 0
	correctAnswers = 0
	-- create the intro window
	createQuizIntroWindow()
	-- Set input enabled
	guiSetInputEnabled(true)

end
 addEvent("onClientStartQuiz", true)
 addEventHandler( "onClientStartQuiz", getLocalPlayer() ,  startShowQuizIntro)
 
 
 -- function starts the quiz
 function startQuiz()
 
	-- choose a random set of questions
	chooseQuizQuestions()
	-- create the question window with question number 1
	createQuestionWindow(1)
 
 end
 
 
 
 
 -- functions chooses the questions to be used for the quiz
 function chooseQuizQuestions()
 
	-- loop through selections and make each one a random question
	for i=1, 10 do
		-- pick a random number between 1 and the max number of questions
		local number = math.random(1, NoQuestions)
		
		-- check to see if the question has already been selected
		if(questionAlreadyUsed(number)) then
			repeat -- if it has, keep changing the number until it hasn't
				number = math.random(1, NoQuestions)
			until (questionAlreadyUsed(number) == false)
		end
		
		-- set the question to the random one
		selection[i] = questions[number]
	end
 end
 
 
 -- function returns true if the queston is already used
 function questionAlreadyUsed(number)
 
	local same = 0
 
	-- loop through all the current selected questions
	for i, j in pairs(selection) do
		-- if a selected question is the same as the new question
		if(j[1] == questions[number][1]) then
			same = 1 -- set same to 1
		end
		
	end
	
	-- if same is 1, question already selected to return true
	if(same == 1) then
		return true
	else
		return false
	end
  
 end