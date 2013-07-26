#region LOAD RELEASE NOTE
Func LoadReleaseNotes()
	; Declares
	Local $FileHandle = FileOpen("README.md", 0)
	Local $m_Temp
	; File not there?
	if $FileHandle <> -1 Then
		While 1
			$m_Temp &= FileReadLine($FileHandle)

			; Add some \n
			$m_Temp &= @CRLF
			if @error = -1 Then ExitLoop
		WEnd
	EndIf
	; FIll edit
	Return ($m_Temp)
EndFunc
#endregion

#region LOAD PLANETS
Func LoadPlayerPlanets()
	LoadPPFPEPPlanets($aPP, "PP.ini")
EndFunc
Func LoadFriendPlanets()
	LoadPPFPEPPlanets($aFP, "FP.ini")
EndFunc
Func LoadEnemyPlanets()
	EPLoad($aEP, "EP.ini")
EndFunc

#endregion

Func LoadPPFPEPPlanets($Array, $File)

	Local $Temp = IniReadSection($USERPATH & $File, "Planets")

	If @error = 1 Then Return

		For $iCount = 0 To 5 Step 1

			GUICtrlSetData($Array[((4 * $iCount) + 0)],$Temp[((4 * $iCount) + 1)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 0)],$Temp[((4 * $iCount) + 1)][1])
			GUICtrlSetData($Array[((4 * $iCount) + 1)],$Temp[((4 * $iCount) + 2)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 1)],$Temp[((4 * $iCount) + 2)][1])
			GUICtrlSetData($Array[((4 * $iCount) + 2)],$Temp[((4 * $iCount) + 3)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 2)],$Temp[((4 * $iCount) + 3)][1])
			GUICtrlSetData($Array[((4 * $iCount) + 3)],$Temp[((4 * $iCount) + 4)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 3)],$Temp[((4 * $iCount) + 4)][1])

		Next

EndFunc

Func EPLoad($Array, $File)

	Local $Temp = IniReadSection($USERPATH & $File, "Planets")

	If @error = 1 Then Return

		For $iCount = 0 To 19 Step 1

			GUICtrlSetData($Array[((4 * $iCount) + 0)],$Temp[((4 * $iCount) + 1)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 0)],$Temp[((4 * $iCount) + 1)][1])
			GUICtrlSetData($Array[((4 * $iCount) + 1)],$Temp[((4 * $iCount) + 2)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 1)],$Temp[((4 * $iCount) + 2)][1])
			GUICtrlSetData($Array[((4 * $iCount) + 2)],$Temp[((4 * $iCount) + 3)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 2)],$Temp[((4 * $iCount) + 3)][1])
			GUICtrlSetData($Array[((4 * $iCount) + 3)],$Temp[((4 * $iCount) + 4)][0])
			GUICtrlSetData($Array[((4 * $iCount) + 3)],$Temp[((4 * $iCount) + 4)][1])

		Next

EndFunc

Func LoadDebugSettings()

	$User = IniReadSection($USERPATH & "User.ini", "Login")

	If @error <> 1 Then
		GUICtrlSetData($iLoginName, $User[1][1])
		GUICtrlSetData($iLoginPass, $User[2][1])
		GUICtrlSetData($iLoginUni, $User[3][1])
	EndIf

	$Delay = IniReadSection($USERPATH & "User.ini", "Delay")
	If @error <> 1 Then
		GUICtrlSetData($iDebugDelayClick, $Delay[1][1])
		GUICtrlSetData($iDebugDelayInput, $Delay[2][1])
	EndIf
EndFunc
