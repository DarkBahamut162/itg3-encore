local t = Def.ActorFrame{
	LoadActor("_bottom")..{
		InitCommand=function(self) self:Center():FullScreen():diffusealpha(0) end;
		OnCommand=function(self) self:accelerate(0.3):diffusealpha(1) end;
	};
	LoadActor("lines")..{
		InitCommand=function(self) self:Center():FullScreen():diffusealpha(0) end;
		OnCommand=function(self) self:accelerate(0.3):diffusealpha(1) end;
	};
	Def.Banner{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+103):blend(Blend.Add):fadetop(0.3):croptop(0.3):diffusetopedge(color("#FFFFFF00")):ztest(true) end;
		OnCommand=function(self) self:playcommand("Set"):rotationz(180):zoomx(-1):linear(1):y(SCREEN_CENTER_Y+70):diffusealpha(0.2) end;
		SetCommand=function(self)
			local sel
			if GAMESTATE:IsCourseMode() then
				sel = GAMESTATE:GetCurrentCourse()
				if sel then self:LoadFromCourse(sel) end
			else
				sel = GAMESTATE:GetCurrentSong()
				if sel then self:LoadFromSong(sel) end
			end
			self:scaletoclipped(292,114);
		end;
	};
	LoadActor("_flaremask")..{
		InitCommand=function(self) self:Center():FullScreen():zbuffer(true):blend('BlendMode_NoEffect') end;
	};
	LoadActor(THEME:GetPathB("ScreenStageInformation","in/_flares"))..{
		InitCommand=function(self) self:Center():ztest(true):diffusealpha(1):zoom(1) end;
		OnCommand=function(self) self:linear(1):rotationz(-250):diffusealpha(0) end;
	};
	LoadActor("bar")..{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+156):visible(not GAMESTATE:IsCourseMode()):zoomtowidth(SCREEN_WIDTH):faderight(0.8):fadeleft(0.8):cropright(1) end;
		OnCommand=function(self) self:linear(0.7):cropright(0) end;
	};
	LoadFont("_r bold 30px")..{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+147):maxwidth(SCREEN_WIDTH/8*7):shadowlength(2):horizalign(center):zoom(0.5):diffusealpha(0) end;
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local text
			if song then
				text = song:GetDisplayFullTitle()
			else
				text = ""
			end
			self:settext(text)
		end;
		OnCommand=function(self) self:playcommand("Set"):sleep(0.1):linear(0.3):diffusealpha(1) end;
	};
	LoadFont("_r bold 30px")..{
		InitCommand=function(self) self:CenterX():y(SCREEN_CENTER_Y+167):maxwidth(SCREEN_WIDTH/8*6.8):shadowlength(2):horizalign(center):zoom(0.4):diffusealpha(0) end;
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			local text
			if song then
				text = song:GetDisplayArtist()
			else
				text = ""
			end
			self:settext(text)
		end;
		OnCommand=function(self) self:playcommand("Set"):sleep(0.1):linear(0.3):diffusealpha(1) end;
	};
};

return t;