local credits = {}
local creditWideScreenDiff=math.ceil((SCREEN_HEIGHT-SCREEN_HEIGHT*WideScreenDiff())/24)
local creditsDiffuse = {
	[ 98+creditWideScreenDiff] = color("#76B1D5"),
	[146+creditWideScreenDiff] = color("#ffa800"),
	[149+creditWideScreenDiff] = color("#ffa800"),
	[150+creditWideScreenDiff] = color("#ddf3ff"),
	[157+creditWideScreenDiff] = color("#ffa800"),
	[158+creditWideScreenDiff] = color("#ddf3ff"),
	[163+creditWideScreenDiff] = color("#ffa800"),
	[164+creditWideScreenDiff] = color("#ddf3ff"),
	[169+creditWideScreenDiff] = color("#ffa800"),
	[170+creditWideScreenDiff] = color("#ddf3ff"),
	[175+creditWideScreenDiff] = color("#ffa800"),
	[176+creditWideScreenDiff] = color("#ddf3ff"),
	[181+creditWideScreenDiff] = color("#ffa800"),
	[182+creditWideScreenDiff] = color("#ddf3ff")
}

for i=1,math.ceil((SCREEN_HEIGHT-SCREEN_HEIGHT*WideScreenDiff())/24) do
	credits[#credits+1] = Def.ActorFrame{}
end

credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/lightning"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/kung"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/albeiro"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/angel"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/skin"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/rain"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/phrek"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/gutter"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/jbean"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/mj"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/foy"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/kyle"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/plague"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/eric"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/gact"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/link"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/vyhd"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("ScreenEndingOkay","overlay/credits/pat"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Test Team"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="G. PolloxxX"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Lil Lion"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Matt Vandermeulen"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Jeffrey Odendahl"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Carlos 'Wanny' Ortega"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="John 'GooFWeaR' Uhlman"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="AJ Kelly"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Steve 'Nevets933' Bauer"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Derek 'Whicker' Bauer"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Scott 'Scooter' Smiesko"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Max Racaud"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Josh Laughery"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Ryan Jackson"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Andrzej Poetek"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Grace 'GACT' Turner"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Tyler Thompson"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Ryan Lower"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Joseph Sherman"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Kevin 'PF3K' Lin"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Michael Porter"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Brian 'Red' Kurtz"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Valentina O'Donnell"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Bryan Wills"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Brandon Stokes"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Janel Yeager"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Brian Rudowski"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Ryan Campbell"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Jarad Kaplan"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Phil Eberhardt"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Chelsie Ehasz"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Adam Landes"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Patrick Richards"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Ian Hunsberger"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Carly Chiavaroli"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Huamid 'Moon' Alnuaimi"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Felicia 'Foola' Olawuni"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Sonia Leng"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Garrett Shourds"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Bradley Shank"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Jorrie Marie"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Jordan Miller"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Damien Diehl"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Jason 'TheGreat' Gilleece"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Justin 'Pags' Pagano"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Special Thanks to:"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.Sprite { Texture = THEME:GetPathB("","_thanks/_bx") }
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Boxorroxors"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="www.boxorroxors.net"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = loadfile(THEME:GetPathB("","_thanks/_sci"))()
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="SCI Recordings!"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="www.scirecordings.com"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.Sprite { Texture = THEME:GetPathB("","_thanks/_itgf") }
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="ITGfreak/Rhythmatic.net"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="www.rhythmatic.net"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.Sprite { Texture = THEME:GetPathB("","_thanks/_gs") }
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="GrooveStats"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="www.groovestats.com"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.Sprite { Texture = THEME:GetPathB("","_thanks/_n3k") }
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="Naota3k"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="www.naota3k.com"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.Sprite { Texture = THEME:GetPathB("","_thanks/_rx") }
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="RoXoR"}
credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="www.roxorgames.com"}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}
credits[#credits+1] = Def.ActorFrame{}

for i=0,math.ceil((SCREEN_HEIGHT-SCREEN_HEIGHT*WideScreenDiff())/24) do
	credits[#credits+1] = Def.ActorFrame{}
end

credits[#credits+1] = Def.BitmapText { File = "_r bold 30px", Text="THANK YOU FOR PLAYING!"}

return Def.ActorFrame{
    Def.ActorFrame{
		OnCommand=function(self) self:Center() end,
		Def.Sprite {
			Texture = THEME:GetPathG("credits","frame"),
			OnCommand=function(self) self:zoomx(WideScreenDiff()):croptop(1):fadetop(1):sleep(3):linear(0.8):croptop(-1):fadetop(-1) end
		},
		Def.ActorScroller{
			SecondsPerItem=51.25/#credits,
			NumItemsToDraw=23/WideScreenDiff(),
			OnCommand=function(self) self:SetLoop(false):ScrollThroughAllItems():SetCurrentAndDestinationItem(-16):SetDestinationItem(#credits) end,
			TransformFunction=function(self,offset,itemIndex,numItems)
				self:y(offset*24*WideScreenDiff()):zoom(0.7*WideScreenDiff()):ztest(1)
				if itemIndex <= 97+math.ceil((SCREEN_HEIGHT-SCREEN_HEIGHT*WideScreenDiff())/24) and itemIndex ~= 0 then self:zoom(1*WideScreenDiff()) end
				if creditsDiffuse[itemIndex] then self:diffuse(creditsDiffuse[itemIndex]) end
			end,
			children = credits
		}
	}
}