
#region MAIN GUI WINDOW
GUISetOnEvent($GUI_EVENT_CLOSE, "eClose")
Func eClose()
	Exit
EndFunc
#endregion

#region DEBUG TAB
GUICtrlSetOnEvent($btnDebugSaveAll, "eSaveDebug")
Func eSaveDebug()

	Local $User[3][2]

	$User[0][0] = "User"
	$User[0][1] = GUICtrlRead($iLoginName)
	$User[1][0] = "Pass"
	$User[1][1] = GUICtrlRead($iLoginPass)
	$User[2][0] = "Uni"
	$User[2][1] = GUICtrlRead($iLoginUni)

	Local $Delay[2][2]

	$Delay[0][0] = "Click"
	$Delay[0][1] = GUICtrlRead($iDebugDelayClick)
	$Delay[1][0] = "Input"
	$Delay[1][1] = GUICtrlRead($iDebugDelayInput)

	IniWriteSection($USERPATH & "User.ini", "Login", $User, 0)
	IniWriteSection($USERPATH & "User.ini", "Delay", $Delay, 0)

EndFunc
#endregion

#region TRANSFER TAB

; Declares
Global $aActiveTransferPlan = 0;

; Events
GUICtrlSetOnEvent($btnTranferSelectPlan[0], "eSelectTransfer0")
GUICtrlSetOnEvent($btnTranferSelectPlan[1], "eSelectTransfer1")
GUICtrlSetOnEvent($btnTranferSelectPlan[2], "eSelectTransfer2")
GUICtrlSetOnEvent($btnTranferSelectPlan[3], "eSelectTransfer3")
GUICtrlSetOnEvent($btnTranferSelectPlan[4], "eSelectTransfer4")
GUICtrlSetOnEvent($btnTranferSelectPlan[5], "eSelectTransfer5")
GUICtrlSetOnEvent($btnTranferGo, "eGoTransferPlan")
GUICtrlSetOnEvent($btnTranferHold, "eHoldTransferPlan")
GUICtrlSetOnEvent($cbTransferFrom,"GetTransferFromPreviewName")
GUICtrlSetOnEvent($cbTransferTo,"GetTransferToPreviewName")
GUICtrlSetOnEvent($cbTransferToKind,"GetTransferToPreviewName")

Func GetTransferFromPreviewName()
	GUICtrlSetData($lTransferFromNamePreview, GUICtrlRead($aPP[((4 * (GUICtrlRead($cbTransferFrom) - 1)) + 0)]))
EndFunc
Func GetTransferToPreviewName()
	If GUICtrlRead($cbTransferToKind) = "P" Then GUICtrlSetData($lTransferToNamePreview, GUICtrlRead($aPP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 0)]))
	If GUICtrlRead($cbTransferToKind) = "F" Then GUICtrlSetData($lTransferToNamePreview, GUICtrlRead($aFP[((4 * (GUICtrlRead($cbTransferTo) - 1)) + 0)]))
EndFunc

; Functions
#region FUNCTIONS
Func eSelectTransfer0()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	$aActiveTransferPlan = 0;
	LoadTransferPlan($aActiveTransferPlan)
EndFunc
Func eSelectTransfer1()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	$aActiveTransferPlan = 1;
	LoadTransferPlan($aActiveTransferPlan)
EndFunc
Func eSelectTransfer2()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	$aActiveTransferPlan = 2;
	LoadTransferPlan($aActiveTransferPlan)
EndFunc
Func eSelectTransfer3()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	$aActiveTransferPlan = 3;
	LoadTransferPlan($aActiveTransferPlan)
EndFunc
Func eSelectTransfer4()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	$aActiveTransferPlan = 4;
	LoadTransferPlan($aActiveTransferPlan)
EndFunc
Func eSelectTransfer5()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	$aActiveTransferPlan = 5;
	LoadTransferPlan($aActiveTransferPlan)
EndFunc
Func eGoTransferPlan()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	GoTransfer($aActiveTransferPlan)
EndFunc
Func eHoldTransferPlan()
	SaveTransferPlan($aActiveTransferPlan)
	RefreshTransferLabels($aActiveTransferPlan)
	StopTransfer($aActiveTransferPlan)
EndFunc
#endregion

#endregion

;~ #region ATTACK TAB

; Declares
Global $aActiveAttackPlan = 0;

; Events
GUICtrlSetOnEvent($btnAttackSelectPlan[0], "eSelectAttack0")
GUICtrlSetOnEvent($btnAttackSelectPlan[1], "eSelectAttack1")
GUICtrlSetOnEvent($btnAttackSelectPlan[2], "eSelectAttack2")
GUICtrlSetOnEvent($btnAttackSelectPlan[3], "eSelectAttack3")
GUICtrlSetOnEvent($btnAttackSelectPlan[4], "eSelectAttack4")
GUICtrlSetOnEvent($btnAttackSelectPlan[5], "eSelectAttack5")
GUICtrlSetOnEvent($btnAttackGo, "eGoAttackPlan")
GUICtrlSetOnEvent($btnAttackHold, "eHoldAttackPlan")
GUICtrlSetOnEvent($cbAttackFrom,"GetAttackFromPreviewName")
GUICtrlSetOnEvent($cbAttackTo,"GetAttackToPreviewName")
GUICtrlSetOnEvent($cbAttackToKind,"GetAttackToPreviewName")

Func GetAttackFromPreviewName()
	GUICtrlSetData($lAttackFromNamePreview, GUICtrlRead($aPP[((4 * (GUICtrlRead($cbAttackFrom) - 1)) + 0)]))
EndFunc
Func GetAttackToPreviewName()
	GUICtrlSetData($lAttackToNamePreview, GUICtrlRead($aEP[((4 * (GUICtrlRead($cbAttackTo) - 1)) + 0)]))
EndFunc

; Functions
#region FUNCTIONS
Func eSelectAttack0()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveTransferPlan)
	$aActiveAttackPlan = 0;
	LoadAttackPlan($aActiveAttackPlan)
EndFunc
Func eSelectAttack1()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 1;
	LoadAttackPlan($aActiveAttackPlan)
EndFunc
Func eSelectAttack2()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 2;
	LoadAttackPlan($aActiveAttackPlan)
EndFunc
Func eSelectAttack3()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 3;
	LoadAttackPlan($aActiveAttackPlan)
EndFunc
Func eSelectAttack4()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 4;
	LoadAttackPlan($aActiveAttackPlan)
EndFunc
Func eSelectAttack5()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 5;
	LoadAttackPlan($aActiveAttackPlan)
EndFunc
Func eGoAttackPlan()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	GoAttack($aActiveAttackPlan)
EndFunc
Func eHoldAttackPlan()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	StopAttack($aActiveAttackPlan)
EndFunc
#endregion

#endregion

#region PLAYER PLANET BUTTONS
GUICtrlSetOnEvent($aPPBtnClear[0], "eClearPPField0")
GUICtrlSetOnEvent($aPPBtnClear[1], "eClearPPField1")
GUICtrlSetOnEvent($aPPBtnClear[2], "eClearPPField2")
GUICtrlSetOnEvent($aPPBtnClear[3], "eClearPPField3")
GUICtrlSetOnEvent($aPPBtnClear[4], "eClearPPField4")
GUICtrlSetOnEvent($aPPBtnClear[5], "eClearPPField5")
GUICtrlSetOnEvent($PPSave, "ePPSave")
GUICtrlSetOnEvent($PPLoad, "LoadPlayerPlanets")
#endregion

#region FRIEND PLANET BUTTONS
GUICtrlSetOnEvent($aFPBtnClear[0], "eClearFPField0")
GUICtrlSetOnEvent($aFPBtnClear[1], "eClearFPField1")
GUICtrlSetOnEvent($aFPBtnClear[2], "eClearFPField2")
GUICtrlSetOnEvent($aFPBtnClear[3], "eClearFPField3")
GUICtrlSetOnEvent($aFPBtnClear[4], "eClearFPField4")
GUICtrlSetOnEvent($aFPBtnClear[5], "eClearFPField5")
GUICtrlSetOnEvent($FPSave, "eFPSave")
GUICtrlSetOnEvent($FPLoad, "LoadFriendPlanets")
#endregion

#region ENEMY PLANET BUTTONS
GUICtrlSetOnEvent($aEPBtnClear[0], "eClearEPField0")
GUICtrlSetOnEvent($aEPBtnClear[1], "eClearEPField1")
GUICtrlSetOnEvent($aEPBtnClear[2], "eClearEPField2")
GUICtrlSetOnEvent($aEPBtnClear[3], "eClearEPField3")
GUICtrlSetOnEvent($aEPBtnClear[4], "eClearEPField4")
GUICtrlSetOnEvent($aEPBtnClear[5], "eClearEPField5")
GUICtrlSetOnEvent($EPSave, "eEPSave")
GUICtrlSetOnEvent($EPLoad, "LoadEnemyPlanets")
#endregion

#region CLEAR PP FIELDS
; Don't ask... I'm seriuos! I can not do it like a pro *cauze OnEvent wont take parameters
Func eClearPPField0()
	PPFPEPClearFileds($aPP, 0)
EndFunc
Func eClearPPField1()
	PPFPEPClearFileds($aPP, 1)
EndFunc
Func eClearPPField2()
	PPFPEPClearFileds($aPP, 2)
EndFunc
Func eClearPPField3()
	PPFPEPClearFileds($aPP, 3)
EndFunc
Func eClearPPField4()
	PPFPEPClearFileds($aPP, 4)
EndFunc
Func eClearPPField5()
	PPFPEPClearFileds($aPP, 5)
EndFunc
#endregion

#region CLEAR FP FIELDS
; Don't ask... I'm seriuos! I can not do it like a pro *cauze OnEvent wont take parameters
Func eClearFPField0()
	PPFPEPClearFileds($aFP, 0)
EndFunc
Func eClearFPField1()
	PPFPEPClearFileds($aFP, 1)
EndFunc
Func eClearFPField2()
	PPFPEPClearFileds($aFP, 2)
EndFunc
Func eClearFPField3()
	PPFPEPClearFileds($aFP, 3)
EndFunc
Func eClearFPField4()
	PPFPEPClearFileds($aFP, 4)
EndFunc
Func eClearFPField5()
	PPFPEPClearFileds($aFP, 5)
EndFunc
#endregion

#region CLEAR EP FIELDS
; Don't ask... I'm seriuos! I can not do it like a pro *cauze OnEvent wont take parameters
Func eClearEPField0()
	PPFPEPClearFileds($aEP, 0)
EndFunc
Func eClearEPField1()
	PPFPEPClearFileds($aEP, 1)
EndFunc
Func eClearEPField2()
	PPFPEPClearFileds($aEP, 2)
EndFunc
Func eClearEPField3()
	PPFPEPClearFileds($aEP, 3)
EndFunc
Func eClearEPField4()
	PPFPEPClearFileds($aEP, 4)
EndFunc
Func eClearEPField5()
	PPFPEPClearFileds($aEP, 5)
EndFunc
#endregion

GUICtrlSetOnEvent($btnTranferRefreshAll, "RefreshTransferPlans")
Func RefreshTransferPlans()
	For $iCount = 0 To 5 Step 1
		LoadTransferPlan($iCount)
		RefreshTransferLabels($iCount)
		$aActiveTransferPlan = $iCount
	Next
EndFunc

GUICtrlSetOnEvent($btnAttackRefreshAll, "RefreshAttackPlans")
Func RefreshAttackPlans()
	For $iCount = 0 To 5 Step 1
		LoadAttackPlan($iCount)
		RefreshAttackLabels($iCount)
		$aActiveAttackPlan = $iCount
	Next
EndFunc

FUNC PPFPEPClearFileds($Array, $Pos)
	GUICtrlSetData($Array[((4 * $Pos) + 0)],"NULL "& ($Pos + 1))
	GUICtrlSetData($Array[((4 * $Pos) + 1)],"0")
	GUICtrlSetData($Array[((4 * $Pos) + 2)],"0")
	GUICtrlSetData($Array[((4 * $Pos) + 3)],"0")
EndFunc

Func ePPSave()
	PPFPEPSave($aPP,"PP.ini")
EndFunc

Func eFPSave()
	PPFPEPSave($aFP,"FP.ini")
EndFunc

Func eEPSave()
	PPFPEPSave($aEP,"EP.ini")
EndFunc

Func PPFPEPSave($Array, $File)
	Local $Temp[(4 * 6)][2]
	For $iCount = 0 To 5 Step 1
		$Temp[((4 * $iCount) + 0)][0] &= "Name"
		$Temp[((4 * $iCount) + 0)][1] &= GUICtrlRead($Array[((4 * $iCount) + 0)])
		$Temp[((4 * $iCount) + 1)][0] &= "X"
		$Temp[((4 * $iCount) + 1)][1] &= GUICtrlRead($Array[((4 * $iCount) + 1)])
		$Temp[((4 * $iCount) + 2)][0] &= "Y"
		$Temp[((4 * $iCount) + 2)][1] &= GUICtrlRead($Array[((4 * $iCount) + 2)])
		$Temp[((4 * $iCount) + 3)][0] &= "Z"
		$Temp[((4 * $iCount) + 3)][1] &= GUICtrlRead($Array[((4 * $iCount) + 3)])
	Next
	IniWriteSection($USERPATH & $File, "Planets", $Temp, 0)
EndFunc
