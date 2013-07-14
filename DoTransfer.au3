



Local $_TransferOngoing[6] = [0,0,0,0,0,0]
Local $_TransferDelay[6] = [0,0,0,0,0,0]

Func StopTransfer($Plan)
	$_TransferOngoing[$Plan] = 0
EndFunc

Func GoTransfer($Plan)
	$_TransferOngoing[$Plan] = 2
	; Save delay for backup / reset
	$_TransferDelay[$Plan] = GUICtrlRead($iTransferDelay)
	GUICtrlSetData($lTransferDelay[$Plan], GUICtrlRead($iTransferDelay))
EndFunc

Func RefreshTransferStatus($Plan)

	Local $m_strTemp

	if $_TransferOngoing[$Plan] = 0 Then
		$m_strTemp = StringUpper("Ready")
		GUICtrlSetColor($lTransferStatus[$Plan], 0x00E900)
	ElseIf $_TransferOngoing[$Plan] > 0 Then
		$m_strTemp = StringUpper("Ongoing")
		GUICtrlSetColor($lTransferStatus[$Plan], 0xE9E900)
		if GUICtrlRead($lTransferDelay[$Plan]) <= 20 Then
			$m_strTemp = StringUpper("Warning !! Departure is imminent")
			GUICtrlSetColor($lTransferStatus[$Plan], 0xE90000)
		Endif

	Endif

	GUICtrlSetData($lTransferStatus[$Plan], $m_strTemp)

	; FLashy flashy
	; If Random(0, 5, 1) < 4 Then
		if (GUICtrlGetState($lTransferStatus[$Plan]) == 80) Then
			GUICtrlSetState($lTransferStatus[$Plan], $GUI_DISABLE)
		Else
			GUICtrlSetState($lTransferStatus[$Plan], $GUI_ENABLE)
		EndIf
	; Endif

EndFunc

Func CheckTranfer()

For $Plan = 0 To 5 Step 1

; Greater than o? The transfer is activated and ready for check
	if $_TransferOngoing[$Plan] > 0 Then


		if GUICtrlRead($lTransferDelay[$Plan]) <= 0 Then $_TransferOngoing[$Plan] = 1

		if $_TransferOngoing[$Plan] = 1 Then
			LoadTransferPlan($Plan)
			StartTransfer(GUICtrlRead($btnDebugSimMouse))
			GUICtrlSetData($lTransferDelay[$Plan], $_TransferDelay[$Plan])
			if $_TransferDelay[$Plan] = 0 Then
				StopTransfer($Plan)
			Else
				GoTransfer($Plan)
			EndIf
		EndIf

		if $_TransferOngoing[$Plan] = 2 Then GUICtrlSetData($lTransferDelay[$Plan], (GUICtrlRead($lTransferDelay[$Plan]) - 1))

	Endif

	RefreshTransferStatus($Plan)

Next

EndFunc

Func StartTransfer($DBG_ExcludeEngage)
	BlockInput(1)
	If WinActivate("[CLASS:MozillaWindowClass]") Then

		WinMove("[CLASS:MozillaWindowClass]", "", GetOffsetX(0), GetOffsetY(0), 1000, @DesktopHeight, 2)
		DoTransferSequence($DBG_ExcludeEngage)

	Else
		MsgBox(0,"Existing...","Dude... Are you high? There is no Firefox")
	Endif
	BlockInput(0)
EndFunc

Func DoTransferSequence($DBG_ExcludeEngage)

	ExecuteLogin()

	$ClickDelay = GUICtrlRead($iDebugDelayClick)
	$InputDelay = GUICtrlRead($iDebugDelayInput)

	; Select Planet
	DoMove(GetSelectPlanet(GUICtrlRead($cbTransferFrom)))
	DoClick(0, $ClickDelay)

	; Select Menu
	DoMove(GetSelectMenu($MENU_FLEET))
	DoClick(0, $ClickDelay)

	; Select Freighters
	; Little
	DoMove(GetSelectShipInput($SHIP_SMALL_FREIGHTER))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iTransferLittleFreighter))

	; Big
	DoMove(GetSelectShipInput($SHIP_HEAVY_FREIGHTER))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iTransferBigFreighter))

	; Next Button
	DoMove(GetSelectActions($ACTION_ONFLEET_NEXT))
	DoClick(0, $ClickDelay)

	; Set Target
	; Galaxy
	DoMove(GetSelectTarget(1))
	DoClick(0, $InputDelay)
	if GUICtrlRead($cbTransferToKind) = "P" Then Send(GUICtrlRead($aPP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 1)]))
	if GUICtrlRead($cbTransferToKind) = "F" Then Send(GUICtrlRead($aFP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 1)]))
	; System
	DoMove(GetSelectTarget(2))
	DoClick(0, $InputDelay)
	if GUICtrlRead($cbTransferToKind) = "P" Then Send(GUICtrlRead($aPP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 2)]))
	if GUICtrlRead($cbTransferToKind) = "F" Then Send(GUICtrlRead($aFP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 2)]))
	; Planet
	DoMove(GetSelectTarget(3))
	DoClick(0, $InputDelay)
	if GUICtrlRead($cbTransferToKind) = "P" Then Send(GUICtrlRead($aPP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 3)]))
	if GUICtrlRead($cbTransferToKind) = "F" Then Send(GUICtrlRead($aFP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 3)]))

	; Next Button
	DoMove(GetSelectActions($ACTION_ONTARGET_NEXT))
	DoClick(0, $ClickDelay)

	; Mission
	DoMove(GetSelectMission($MISSION_TRANSFER))
	DoClick(0, $ClickDelay)

	; Resources
	; Metal
	DoMove(GetSelectResource(1))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iTransferMetal))
	; Crystal
	DoMove(GetSelectResource(2))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iTransferCrystal))
	; Deutherium
	DoMove(GetSelectResource(3))
	DoClick(0, $InputDelay)
	Send(GUICtrlRead($iTransferDeutherium))

	; Engage
	DoMove(GetSelectActions($ACTION_ONMISSION_ENGAGE))
	DoClick($DBG_ExcludeEngage, $ClickDelay)

EndFunc

Func LoadTransferPlan($Plan)

	Local $Temp = IniReadSection($USERPATH & "TransferPlans.ini", "Plan"&$Plan)

	if @error = 1 Then Return

	GUICtrlSetData($cbTransferFrom, $Temp[1][1])
	GUICtrlSetData($cbTransferToKind, $Temp[2][1])
	GUICtrlSetData($cbTransferTo, $Temp[3][1])
	GUICtrlSetData($iTransferLittleFreighter, $Temp[4][1])
	GUICtrlSetData($iTransferBigFreighter, $Temp[5][1])
	GUICtrlSetData($iTransferDelay, $Temp[6][1])
	GUICtrlSetData($iTransferMetal, $Temp[7][1])
	GUICtrlSetData($iTransferCrystal, $Temp[8][1])
	GUICtrlSetData($iTransferDeutherium, $Temp[9][1])

EndFunc

Func SaveTransferPlan($Plan)

	Local $Temp[9][2]

	$Temp[0][0] = "From"
	$Temp[0][1] = GUICtrlRead($cbTransferFrom)
	$Temp[1][0] = "ToKind"
	$Temp[1][1] = GUICtrlRead($cbTransferToKind)
	$Temp[2][0] = "To"
	$Temp[2][1] = GUICtrlRead($cbTransferTo)
	$Temp[3][0] = "LittleFreigthers"
	$Temp[3][1] = GUICtrlRead($iTransferLittleFreighter)
	$Temp[4][0] = "BigFreigthers"
	$Temp[4][1] = GUICtrlRead($iTransferBigFreighter)
	$Temp[5][0] = "Delay"
	$Temp[5][1] = GUICtrlRead($iTransferDelay)
	$Temp[6][0] = "Metal"
	$Temp[6][1] = GUICtrlRead($iTransferMetal)
	$Temp[7][0] = "Crystal"
	$Temp[7][1] = GUICtrlRead($iTransferCrystal)
	$Temp[8][0] = "Deutherium"
	$Temp[8][1] = GUICtrlRead($iTransferDeutherium)

	IniWriteSection($USERPATH & "TransferPlans.ini", "Plan"&$Plan, $Temp, 0)

EndFunc

Func RefreshTransferLabels($Plan)

	Local $PPTemp = IniReadSection($USERPATH & "PP.ini", "Planets")
	Local $FPTemp = IniReadSection($USERPATH & "FP.ini", "Planets")

	if @error = 1 Then Return

	GUICtrlSetData($lTransferFromName[$Plan], $PPTemp[(4 * (GUICtrlRead($cbTransferFrom) - 1) + 1)][1])

	if GUICtrlRead($cbTransferToKind) = "P" Then

		GUICtrlSetData($lTransferToName[$Plan], $PPTemp[(4 * (GUICtrlRead($cbTransferTo) - 1) + 1)][1])

	ElseIf GUICtrlRead($cbTransferToKind) = "F" Then

		GUICtrlSetData($lTransferToName[$Plan], $FPTemp[(4 * (GUICtrlRead($cbTransferTo) - 1) + 1)][1])

	EndIf


EndFunc

