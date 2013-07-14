
; Main
$fMain = GUICreate("oEPIC - Be A Smart Player", 540, 340, 1000, 0)
$lTime = GUICtrlCreateLabel("NULL", 350, 5, 100, 20)
$lTransferNotifyLine = GUICtrlCreateLabel("NULL", 20, 320, 250, 20)
GUICtrlSetColor(-1, 0xFF0000)
$lAttackNotifyLine = GUICtrlCreateLabel("NULL", 200, 320, 250, 20)
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlCreateLabel("build x86 0.04", 450, 5, 100, 20)
$guiTabs = GUICtrlCreateTab(10,10,500,300)

#region DEBUG
$tiDebug = GUICtrlCreateTabItem("Debug")
$lDebugMouse = GUICtrlCreateLabel("NULL", 20, 40, 150, 20)
$btnDebugSimMouse = GUICtrlCreateCheckbox("Exclude 'Engage' Click", 300, 40, 200, 20)
$lOffset = GUICtrlCreateLabel("Browser Offset", 20, 65, 300, 20)
$iWinOffsetX = GUICtrlCreateInput("0", 30, 90, 40, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$iWinOffsetY = GUICtrlCreateInput("0", 80, 90, 40, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlCreateLabel("Login Credentials", 30, 130, 150, 20)
$iLoginName = GUICtrlCreateInput("NULL", 30, 150, 120, 20)
$iLoginPass = GUICtrlCreateInput("NULL", 30, 180, 120, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD))
$iLoginUni = GUICtrlCreateCombo("uni80", 30, 210, 120, 20, BitOR($CBS_DROPDOWN, $CBS_DROPDOWNLIST))
GUICtrlSetData(-1, "uni81|uni82")
GUICtrlCreateLabel("Mouse Delay (Click / Input)", 200, 130, 150, 20)
$iDebugDelayClick = GUICtrlCreateInput("1200", 200, 150, 80, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$iDebugDelayInput = GUICtrlCreateInput("100", 290, 150, 80, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$btnDebugSaveAll = GUICtrlCreateButton("Save All", 320, 250, 60, 20)
GUISetState()
#endregion

#region PLAYER
Global $aPP[(4 * 6)]
Global $aPPBtnClear[6]

$tiPlayer = GUICtrlCreateTabItem("Player")
$PPSave = GUICtrlCreateButton("Save", 100, 250, 40, 20)
$PPLoad = GUICtrlCreateButton("Load", 150, 250, 40, 20)
; -1 becauze this crapy - erm - lovely for loop counts to exact the TO-VALUE
For $iCount = 0 To 5 Step 1
	GUICtrlCreateLabel("["& ($iCount + 1) &"]", 20, (40 + ($iCount * 20)), 20, 20)
	$aPP[((4 * $iCount) + 0)] = GUICtrlCreateInput("NULL"& ($iCount + 1), 50, (40 + ($iCount * 20)), 120, 20)
	; Coords
	$aPP[((4 * $iCount) + 1)] = GUICtrlCreateInput("0", 180, (40 + ($iCount * 20)), 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aPP[((4 * $iCount) + 2)] = GUICtrlCreateInput("0", 210, (40 + ($iCount * 20)), 40, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aPP[((4 * $iCount) + 3)] = GUICtrlCreateInput("0", 260, (40 + ($iCount * 20)), 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aPPBtnClear[$iCount] = GUICtrlCreateButton("X", 290, (40 + ($iCount * 20)), 20, 20)
Next
GUISetState()
#endregion

#region FIREND
Global $aFP[(4 * 6)]
Global $aFPBtnClear[6]

$tiFriend = GUICtrlCreateTabItem("Friends")
$FPSave = GUICtrlCreateButton("Save", 100, 250, 40, 20)
$FPLoad = GUICtrlCreateButton("Load", 150, 250, 40, 20)
; -1 becauze this crapy - erm - lovely for loop counts to exact the TO-VALUE
For $iCount = 0 To 5 Step 1
	GUICtrlCreateLabel("["& ($iCount + 1) &"]", 20, (40 + ($iCount * 20)), 20, 20)
	$aFP[((4 * $iCount) + 0)] = GUICtrlCreateInput("NULL"& ($iCount + 1), 50, (40 + ($iCount * 20)), 120, 20)
	; Coords
	$aFP[((4 * $iCount) + 1)] = GUICtrlCreateInput("0", 180, (40 + ($iCount * 20)), 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aFP[((4 * $iCount) + 2)] = GUICtrlCreateInput("0", 210, (40 + ($iCount * 20)), 40, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aFP[((4 * $iCount) + 3)] = GUICtrlCreateInput("0", 260, (40 + ($iCount * 20)), 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aFPBtnClear[$iCount] = GUICtrlCreateButton("X", 290, (40 + ($iCount * 20)), 20, 20)
Next
GUISetState()
#endregion

#region ENEMY
Global $aEP[(4 * 6)]
Global $aEPBtnClear[6]

$tiEnemy = GUICtrlCreateTabItem("Enemies")
$EPSave = GUICtrlCreateButton("Save", 100, 250, 40, 20)
$EPLoad = GUICtrlCreateButton("Load", 150, 250, 40, 20)
; -1 becauze this crapy - erm - lovely for loop counts to exact the TO-VALUE
For $iCount = 0 To 5 Step 1
	GUICtrlCreateLabel("["& ($iCount + 1) &"]", 20, (40 + ($iCount * 20)), 20, 20)
	$aEP[((4 * $iCount) + 0)] = GUICtrlCreateInput("NULL"& ($iCount + 1), 50, (40 + ($iCount * 20)), 120, 20)
	; Coords
	$aEP[((4 * $iCount) + 1)] = GUICtrlCreateInput("0", 180, (40 + ($iCount * 20)), 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aEP[((4 * $iCount) + 2)] = GUICtrlCreateInput("0", 210, (40 + ($iCount * 20)), 40, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aEP[((4 * $iCount) + 3)] = GUICtrlCreateInput("0", 260, (40 + ($iCount * 20)), 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
	$aEPBtnClear[$iCount] = GUICtrlCreateButton("X", 290, (40 + ($iCount * 20)), 20, 20)
Next
GUISetState()
#endregion

#region TRANSFER TAB
$tiTransfer = GUICtrlCreateTabItem("Transfer")

$iTransferDelay = GUICtrlCreateInput("0", 370, 60, 80, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$btnTranferGo = GUICtrlCreateButton(">", 320, 60, 20, 20)
$btnTranferHold = GUICtrlCreateButton("||", 340, 60, 20, 20)
GUICtrlCreateLabel("From", 20, 40)
$lTransferFromNamePreview = GUICtrlCreateLabel("NULL", 50, 40, 150, 20)
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlCreateLabel("To", 200, 40)
$lTransferToNamePreview = GUICtrlCreateLabel("NULL", 220, 40, 150, 20)
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlCreateLabel("Little / Big Freighters", 80, 40)
GUICtrlCreateLabel("Loop Delay", 370, 40)
$lSelectedTranferPlan = GUICtrlCreateLabel("1", 480, 40,20,30)
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetFont(-1, 20)
GUICtrlCreateLabel("Resources", 20, 90)
$btnTranferRefreshAll = GUICtrlCreateButton("Refresh Plans", 60, 250, 80, 20)

Local $btnTranferSelectPlan[6], $lTransferStatus[6], $lTransferDelay[6], $lTransferFromName[6], $lTransferToName[6]

For $iCount = 0 To 5 Step 1
	GUICtrlCreateLabel(($iCount + 1), 20, (120 + ($iCount * 20)), 20, 20)
	$lTransferFromName[$iCount] = GUICtrlCreateLabel("[refresh missing]", 50, (120 + ($iCount * 20)), 80, 20)
	$lTransferToName[$iCount] = GUICtrlCreateLabel("[refresh missing]", 140, (120 + ($iCount * 20)), 80, 20)
	$lTransferDelay[$iCount] = GUICtrlCreateLabel("[refresh missing]", 340, (120 + ($iCount * 20)), 80, 20)
	$btnTranferSelectPlan[$iCount] = GUICtrlCreateButton(">>>", 230, (120 + ($iCount * 20)), 30, 15)
	$lTransferStatus[$iCount] = GUICtrlCreateLabel("NULL", 270, (120 + ($iCount * 20)), 300, 20)
Next

; From
$cbTransferFrom = GUICtrlCreateCombo("1", 20, 60, 40, 20, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData(-1,"2|3|4|5|6")
; Freighters
$iTransferLittleFreighter = GUICtrlCreateInput("0", 80, 60, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetLimit(-1, 2)
$iTransferBigFreighter = GUICtrlCreateInput("0", 110, 60, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetLimit(-1, 2)
; Resources
$iTransferMetal = GUICtrlCreateInput("0", 80, 90, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
$iTransferCrystal = GUICtrlCreateInput("0", 150, 90, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)
$iTransferDeutherium = GUICtrlCreateInput("0", 210, 90, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 7)

; To
$cbTransferToKind = GUICtrlCreateCombo("P", 200, 60, 40, 20, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData(-1,"F")
$cbTransferTo = GUICtrlCreateCombo("1", 250, 60, 40, 20, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData(-1,"2|3|4|5|6")
GUISetState()
#endregion

#region ATTACK TAB
$tiAttack = GUICtrlCreateTabItem("Attack")

$iAttackDelay = GUICtrlCreateInput("0", 370, 60, 80, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
$btnAttackGo = GUICtrlCreateButton(">", 320, 60, 20, 20)
$btnAttackHold = GUICtrlCreateButton("||", 340, 60, 20, 20)
GUICtrlCreateLabel("From", 20, 40)
$lAttackFromNamePreview = GUICtrlCreateLabel("NULL", 50, 40, 150, 20)
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlCreateLabel("To", 200, 40)
$lAttackToNamePreview = GUICtrlCreateLabel("NULL", 220, 40, 150, 20)
GUICtrlSetColor(-1, 0xFF00FF)
GUICtrlCreateLabel("Ships", 90, 70)
GUICtrlCreateLabel("Loop Delay", 370, 40)
$lSelectedAttackPlan = GUICtrlCreateLabel("1", 480, 40,20,30)
GUICtrlSetColor(-1, 0xFF0000)
GUICtrlSetFont(-1, 20)
$btnAttackRefreshAll = GUICtrlCreateButton("Refresh Plans", 60, 250, 80, 20)

Local $btnAttackSelectPlan[6], $lAttackStatus[6], $lAttackDelay[6], $lAttackFromName[6], $lAttackToName[6]

For $iCount = 0 To 5 Step 1
	GUICtrlCreateLabel(($iCount + 1), 20, (120 + ($iCount * 20)), 20, 20)
	$lAttackFromName[$iCount] = GUICtrlCreateLabel("[refresh missing]", 50, (120 + ($iCount * 20)), 80, 20)
	$lAttackToName[$iCount] = GUICtrlCreateLabel("[refresh missing]", 140, (120 + ($iCount * 20)), 80, 20)
	$lAttackDelay[$iCount] = GUICtrlCreateLabel("[refresh missing]", 340, (120 + ($iCount * 20)), 80, 20)
	$btnAttackSelectPlan[$iCount] = GUICtrlCreateButton(">>>", 230, (120 + ($iCount * 20)), 30, 15)
	$lAttackStatus[$iCount] = GUICtrlCreateLabel("NULL", 270, (120 + ($iCount * 20)), 300, 20)
Next

; From
$cbAttackFrom = GUICtrlCreateCombo("1", 20, 60, 40, 20, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData(-1,"2|3|4|5|6")
; Non-Civil Ships
$iAttackSmallFighter = GUICtrlCreateInput("0", 20, 90, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetBkColor(-1, 0xFF0000)
GUICtrlSetLimit(-1, 2)
$iAttackHeavyFighter = GUICtrlCreateInput("0", 50, 90, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetBkColor(-1, 0xFF0000)
GUICtrlSetLimit(-1, 2)
; Civil Ships
$iAttackSmallFreighter = GUICtrlCreateInput("0", 220, 90, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetLimit(-1, 2)
$iAttackHeavyFreighter = GUICtrlCreateInput("0", 250, 90, 20, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetBkColor(-1, 0x00FF00)
GUICtrlSetLimit(-1, 2)

; To
$cbAttackToKind = GUICtrlCreateCombo("E", 200, 60, 40, 20, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
; GUICtrlSetData(-1,"F")
$cbAttackTo = GUICtrlCreateCombo("1", 250, 60, 40, 20, BitOR($CBS_DROPDOWN, $CBS_AUTOHSCROLL, $CBS_DROPDOWNLIST))
GUICtrlSetData(-1,"2|3|4|5|6")
GUISetState()
#endregion

#region ABOUT
$tiAbout = GUICtrlCreateTabItem("oEPIC")
$lNotes = GUICtrlCreateEdit("", 20, 40, 400, 250, BitOR($ES_READONLY, $WS_VSCROLL))
GUISetState()
#endregion

GUICtrlCreateTabItem("")
GUISetState()










