


Local $_AttackOngoing[20] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
Local $_AttackDelay[20] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

Func StopAttack($Plan)
	$_AttackOngoing[$Plan] = 0
EndFunc

Func GoAttack($Plan)
	$_AttackOngoing[$Plan] = 2
	; Save delay for backup / reset
	$_AttackDelay[$Plan] = GUICtrlRead($iAttackDelay)
	GUICtrlSetData($lAttackDelay[$Plan], GUICtrlRead($iAttackDelay))
EndFunc

Func RefreshAttackStatus($Plan)

	Local $m_strTemp

	if $_AttackOngoing[$Plan] = 0 Then
		$m_strTemp = StringUpper("Ready")
		GUICtrlSetColor($lAttackStatus[$Plan], 0x00E900)
	ElseIf $_AttackOngoing[$Plan] > 0 Then
		$m_strTemp = StringUpper("Ongoing")
		GUICtrlSetColor($lAttackStatus[$Plan], 0xE9E900)
		if GUICtrlRead($lAttackDelay[$Plan]) <= 20 Then
			$m_strTemp = StringUpper("Warning !! Attack is imminent")
			GUICtrlSetColor($lAttackStatus[$Plan], 0xE90000)
		Endif

	Endif

	GUICtrlSetData($lAttackStatus[$Plan], $m_strTemp)

	; FLashy flashy
	; If Random(0, 5, 1) < 4 Then
		if (GUICtrlGetState($lAttackStatus[$Plan]) == 80) Then
			GUICtrlSetState($lAttackStatus[$Plan], $GUI_DISABLE)
		Else
			GUICtrlSetState($lAttackStatus[$Plan], $GUI_ENABLE)
		EndIf
	; Endif

EndFunc

Func CheckAttack()

For $Plan = 0 To 19 Step 1

; Greater than o? The Attack is activated and ready for check
	if $_AttackOngoing[$Plan] > 0 Then


		if GUICtrlRead($lAttackDelay[$Plan]) <= 0 Then $_AttackOngoing[$Plan] = 1

		if $_AttackOngoing[$Plan] = 1 Then
			LoadAttackPlan($Plan)
			StartAttack(GUICtrlRead($btnDebugSimMouse))
			GUICtrlSetData($lAttackDelay[$Plan], $_AttackDelay[$Plan])
			if $_AttackDelay[$Plan] = 0 Then
				StopAttack($Plan)
			Else
				GoAttack($Plan)
			EndIf
		EndIf

		if $_AttackOngoing[$Plan] = 2 Then GUICtrlSetData($lAttackDelay[$Plan], (GUICtrlRead($lAttackDelay[$Plan]) - 1))

	Endif

	RefreshAttackStatus($Plan)

Next

EndFunc

Func StartAttack($DBG_ExcludeEngage)
	; BlockInput(1)
	If WinActivate("[CLASS:MozillaWindowClass]") Then

		WinMove("[CLASS:MozillaWindowClass]", "", GetOffsetX(0), GetOffsetY(0), 1000, @DesktopHeight, 2)
		DoAttackSequence($DBG_ExcludeEngage)

	Else
		MsgBox(0,"Existing...","Dude... Are you high? There is no Firefox")
	Endif
	BlockInput(0)
EndFunc

Func DoAttackSequence($DBG_ExcludeEngage)


	ExecuteLogin()

	$ClickDelay = GUICtrlRead($iDebugDelayClick)
	$InputDelay = GUICtrlRead($iDebugDelayInput)

	; Select Planet
	DoMove(GetSelectPlanet(GUICtrlRead($cbAttackFrom)))
	DoClick(0, $ClickDelay)

	; Select Menu
	DoMove(GetSelectMenu($MENU_FLEET))
	DoClick(0, $ClickDelay)

	; Select Non-Civil Ships
	; Little Fighter
	DoMove(GetSelectShipInput($SHIP_SMALL_FIGHTER))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iAttackSmallFighter))

	; Big Fighter
	DoMove(GetSelectShipInput($SHIP_HEAVY_FIGHTER))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iAttackHeavyFighter))

	; Select Civil Ships
	; Little Freighter
	DoMove(GetSelectShipInput($SHIP_SMALL_FREIGHTER))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iAttackSmallFreighter))

	; Big Freighters
	DoMove(GetSelectShipInput($SHIP_HEAVY_FREIGHTER))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iAttackHeavyFreighter))

	; Next Button
	DoMove(GetSelectActions($ACTION_ONFLEET_NEXT))
	DoClick(0, $ClickDelay)

	; Set Target
	; Galaxy
	DoMove(GetSelectTarget(1))
	DoClick(0, $InputDelay)
	if GUICtrlRead($cbAttackToKind) = "E" Then Send(GUICtrlRead($aEP[((4 * (GUICtrlRead($cbAttackTo) - 1)) + 1)]))
	; System
	DoMove(GetSelectTarget(2))
	DoClick(0, $InputDelay)
	if GUICtrlRead($cbAttackToKind) = "E" Then Send(GUICtrlRead($aEP[((4 * (GUICtrlRead($cbAttackTo) - 1)) + 2)]))
	; Planet
	DoMove(GetSelectTarget(3))
	DoClick(0, $InputDelay)
	if GUICtrlRead($cbAttackToKind) = "E" Then Send(GUICtrlRead($aEP[((4 * (GUICtrlRead($cbAttackTo) - 1)) + 3)]))

	; Next Button
	DoMove(GetSelectActions($ACTION_ONTARGET_NEXT))
	DoClick(0, $ClickDelay)

	; Mission
	DoMove(GetSelectMission($MISSION_ATTACK))
	DoClick(0, $ClickDelay)

	; Engage
	DoMove(GetSelectActions($ACTION_ONMISSION_ENGAGE))
	DoClick($DBG_ExcludeEngage, $ClickDelay)

EndFunc

Func LoadAttackPlan($Plan)

	Local $Temp = IniReadSection($USERPATH & "AttackPlans.ini", "Plan"&$Plan)

	if @error = 1 Then Return

	GUICtrlSetData($cbAttackFrom, 			$Temp[1][1])
	GUICtrlSetData($cbAttackToKind, 		$Temp[2][1])
	GUICtrlSetData($cbAttackTo, 			$Temp[3][1])
	GUICtrlSetData($iAttackSmallFighter, 	$Temp[4][1])
	GUICtrlSetData($iAttackHeavyFighter, 	$Temp[5][1])
	GUICtrlSetData($iAttackSmallFreighter, 	$Temp[6][1])
	GUICtrlSetData($iAttackHeavyFreighter, 	$Temp[7][1])
	GUICtrlSetData($iAttackDelay, 			$Temp[8][1])

EndFunc

Func SaveAttackPlan($Plan)

	Local $Temp[8][2]

	$Temp[0][0] = "From"
	$Temp[0][1] = GUICtrlRead($cbAttackFrom)
	$Temp[1][0] = "ToKind"
	$Temp[1][1] = GUICtrlRead($cbAttackToKind)
	$Temp[2][0] = "To"
	$Temp[2][1] = GUICtrlRead($cbAttackTo)
	$Temp[3][0] = "SmallFighters"
	$Temp[3][1] = GUICtrlRead($iAttackSmallFighter)
	$Temp[4][0] = "HeavyFighters"
	$Temp[4][1] = GUICtrlRead($iAttackHeavyFighter)
	$Temp[5][0] = "SmallFreighters"
	$Temp[5][1] = GUICtrlRead($iAttackSmallFreighter)
	$Temp[6][0] = "HeavyFreigthers"
	$Temp[6][1] = GUICtrlRead($iAttackHeavyFreighter)
	$Temp[7][0] = "Delay"
	$Temp[7][1] = GUICtrlRead($iAttackDelay)

	IniWriteSection($USERPATH & "AttackPlans.ini", "Plan"&$Plan, $Temp, 0)

EndFunc

Func RefreshAttackLabels($Plan)

	Local $PPTemp = IniReadSection($USERPATH & "PP.ini", "Planets")
	Local $EPTemp = IniReadSection($USERPATH & "EP.ini", "Planets")

	if @error = 1 Then Return

	GUICtrlSetData($lAttackFromName[$Plan], $PPTemp[(4 * (GUICtrlRead($cbAttackFrom) - 1) + 1)][1])

	if GUICtrlRead($cbAttackToKind) = "E" Then

		GUICtrlSetData($lAttackToName[$Plan], $EPTemp[(4 * (GUICtrlRead($cbAttackTo) - 1) + 1)][1])

	EndIf


EndFunc

