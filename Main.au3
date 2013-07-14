
Func GetLoginInfo()

	$Temp = IniReadSection($USERPATH & "User.ini", "Login")

	if @error = 1 Then Return

	Return($Temp)

EndFunc

Func ParseUniverse($Universe)
	Return($Universe & ".ogame.de")
EndFunc

Func ExecuteLogin()
			If _FFConnect(Default, Default, 500) Then

				BlockInput(1)
				WinActive("[CLASS:MozillaWindowClass]")
				WinActivate("[CLASS:MozillaWindowClass]", "")
				WinMove("[CLASS:MozillaWindowClass]", "", GetOffsetX(0), GetOffsetY(0), 1000, @DesktopHeight, 2)
				_FFOpenURL("http://www.ogame.de")

				$Temp = GetLoginInfo()
				LogMeIn(ParseUniverse($Temp[3][1]), $Temp[1][1], $Temp[2][1])

				_FFDisConnect()

				BlockInput(0)

			Else

				MsgBox(64, "Existing...", "There went something wrong but at this point I only can shoot a guess:"&@CRLF&@CRLF&"* You did not start Firefox"&@CRLF&"*There are no login credentials (debug tag)")
				Exit

			EndIf
EndFunc


; Keep in mind, that's the way it could working too
;Const $oGAME_FLEET_PAGE = "http://"&$Server&"/game/index.php?page=fleet1"

Func Main()

	if MsgBox(4, "Welcome", "Ready to make some magic?"&@CRLF&"(Click yes and wait until the page is loaded. If it so, you will get an fancy message) "&@CRLF&@CRLF&"CHECKLIST:"&@CRLF&"* Firefox is running the hell"&@CRLF&"* Firefox has NO Menu Bar and NO Nav Bar"&@CRLF&"* Firefox AddOn MozRepl is installed and RUNNING"&@CRLF&@CRLF&"(And \btw ESC is your PANIC BUTTON)") = 6 Then

		WinActive("[CLASS:MozillaWindowClass]", "")
		WinActivate("[CLASS:MozillaWindowClass]", "")
		WinMove("[CLASS:MozillaWindowClass]", "", GetOffsetX(0), GetOffsetY(0), 1000, @DesktopHeight, 2)

		if(MsgBox(4, "", "Do Login Check?") = 6) Then

			ExecuteLogin()

			MsgBox(0, "Exiting...", "It's done")

		EndIf

	Else
		Exit
	EndIf

EndFunc