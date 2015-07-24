-----------------------
--   LSES Website   ---
-----------------------

-- Website owner's forum name: fallenmaster1
-- Website owner's Character's name: John Brenkly


function www_mento_hu_about()
	---------------------
	-- Page Properties --
	---------------------
	local page_length = 390 
	guiSetText(internet_address_label, "Fly Mta Országos Mentőszolgálat! TEL: 104") -- This text is displayed at the top of the browser window when the page is opened. It is the same as the <title> tag used in the meta of a real webpage.
	guiSetText(address_bar,"www.mento.hu/About") -- The url of the page. This should be the same as the function name but with the original "."s and "/". Example www.google.com.
	
	---------------------------------------------- Start of webpage design ----------------------------------------------
	
	----------------------------
	-- Page Background Colour --
	----------------------------
	bg = guiCreateStaticImage(0,0,460,page_length,"websites/colours/31.png",false,internet_pane)
		
	------------
	-- Header --
	------------
	local link_1_bg = guiCreateStaticImage(0,4,76,24,"websites/colours/3.png",false,bg)
	local link_1_hl = guiCreateStaticImage(12,6,50,2,"websites/colours/1.png",false,bg)
	local link_1 = guiCreateLabel(2,10,72,16,"Home Page",false,bg)
	guiLabelSetColor(link_1,255,255,255)
	guiLabelSetHorizontalAlign(link_1,"center")
	addEventHandler("onClientGUIClick",link_1,function()
		local url = tostring("www.mento.hu") -- Put hyperlink url in quotation marks
		get_page(url)
	end,false)
	
	local link_2_bg = guiCreateStaticImage(78,4,76,24,"websites/colours/45.png",false,bg)
	local link_2_hl = guiCreateStaticImage(90,6,50,2,"websites/colours/36.png",false,bg)
	local link_2 = guiCreateLabel(80,10,72,16,"Rólunk",false,bg)
	guiLabelSetColor(link_2,255,255,255)
	guiLabelSetHorizontalAlign(link_2,"center")
	addEventHandler("onClientGUIClick",link_2,function()
		local url = tostring("www.mento.hu/About") -- Put hyperlink url in quotation marks
		get_page(url)
	end,false)
	
	local link_3_bg = guiCreateStaticImage(156,4,76,24,"websites/colours/45.png",false,bg)
	local link_3_hl = guiCreateStaticImage(168,6,50,2,"websites/colours/36.png",false,bg)
	local link_3 = guiCreateLabel(158,10,72,16,"Tagjaink",false,bg)
	guiLabelSetColor(link_3,255,255,255)
	guiLabelSetHorizontalAlign(link_3,"center")
	addEventHandler("onClientGUIClick",link_3,function()
		local url = tostring("www.mento.hu/Members") -- Put hyperlink url in quotation marks
		get_page(url)
	end,false)
	
	local link_4_bg = guiCreateStaticImage(234,4,76,24,"websites/colours/45.png",false,bg)
	local link_4_hl = guiCreateStaticImage(246,6,50,2,"websites/colours/36.png",false,bg)
	local link_4 = guiCreateLabel(236,10,72,16,"Csatlakozz",false,bg)
	guiLabelSetColor(link_4,255,255,255)
	guiLabelSetHorizontalAlign(link_4,"center")
	addEventHandler("onClientGUIClick",link_4,function()
		local url = tostring("www.mento.hu/Join") -- Put hyperlink url in quotation marks
		get_page(url)
	end,false)
	
	local link_end_bg = guiCreateStaticImage(312,4,148,24,"websites/colours/3.png",false,bg)
	local url_label_shadow = guiCreateLabel(325,11,130,16,"Los Santos Országos Mentőszolgálat",false,bg)
	guiLabelSetColor(url_label_shadow,30,30,30)
	guiLabelSetHorizontalAlign(url_label_shadow,"center")
	local url_label = guiCreateLabel(324,10,130,16,"Szolgáltatások",false,bg)
	guiLabelSetColor(url_label,255,255,255)
	guiLabelSetHorizontalAlign(url_label,"center")
	
	local header_bg = guiCreateStaticImage(0,28,460,34,"websites/colours/3.png",false,bg)
	local header_label = guiCreateLabel(15,38,122,16,"Kezdőlap",false,bg)
	guiSetFont(header_label,"default-bold-smal")
	guiLabelSetColor(header_label,255,255,255)
	
	local header_shadow = guiCreateStaticImage(0,61,460,1,"websites/colours/13.png",false,bg)
	
	
	-------------
	-- Content --
	-------------
	local side_text = guiCreateLabel(10,110,105,120,"OMSZ\
												\
												Óvjuk az egészségét!",false,bg)
	-- Header 1
	local header_1_bg_shadow = guiCreateStaticImage(107,67,353,25,"websites/colours/13.png",false,bg)
	local header_1_bg = guiCreateStaticImage(108,66,353,25,"websites/colours/3.png",false,bg)
	local header_1_ul = guiCreateStaticImage(108,66,353,1,"websites/colours/1.png",false,bg)
	local header_1 = guiCreateLabel(131,70,200,16,"Mi a teendő?",false,bg)
	local para1 = guiCreateLabel(128,94,329,70,"Ha rosszul van, esetleg családja és barátai rosszul lesznek, balesetet lát? Netán balesetet szenved? Hívja a 104-et és máris útonvagyunk, gyors megbízható csapat vagyunk!",false,bg) 
	guiLabelSetHorizontalAlign(para1,"left",true)
	
	-- Header 2
	local header_2_bg_shadow = guiCreateStaticImage(107,167,353,25,"websites/colours/13.png",false,bg)
	local header_2_bg = guiCreateStaticImage(108,166,353,25,"websites/colours/3.png",false,bg)
	local header_2_ul = guiCreateStaticImage(108,166,353,1,"websites/colours/1.png",false,bg)
	local header_2 = guiCreateLabel(131,170,200,16,"Mi a célunk?",false,bg)
	local para2 = guiCreateLabel(128,194,329,70,"A célunk egyszerű, az hogy mindenki egyészségben és biztonságban éljen! ",false,bg) 
	guiLabelSetHorizontalAlign(para2,"left",true)
	
	-- Header 3
	local header_3_bg_shadow = guiCreateStaticImage(107,267,353,25,"websites/colours/13.png",false,bg)
	local header_3_bg = guiCreateStaticImage(108,266,353,25,"websites/colours/3.png",false,bg)
	local header_3_ul = guiCreateStaticImage(108,266,353,1,"websites/colours/1.png",false,bg)
	local header_3 = guiCreateLabel(131,270,200,16,"Mivel gyógyítunk?",false,bg)
	local para3 = guiCreateLabel(128,294,329,70,"Nálunk vannak a világon a legképzetebb orvosok és a legfejletebb műszereink! ",false,bg) 
	guiLabelSetHorizontalAlign(para3,"left",true)
	
	----------------------------------------------- End of webpage -- Do not edit below this line. -----------------------------------------------
	
	if(page_length>=397)then
		guiScrollPaneSetScrollBars(bg,false,true)
	else
		guiSetSize(bg,460,397,false)
		guiScrollPaneSetScrollBars(internet_pane, false, false)
	end
	
end


