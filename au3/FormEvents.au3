
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

#region ATTACK TAB

; Declares
Global $aActiveAttackPlan = 0;

; Events
; I wish I could pass some parameters...
GUICtrlSetOnEvent($btnAttackSelectPlan[0], "eSelectAttack0")
GUICtrlSetOnEvent($btnAttackSelectPlan[1], "eSelectAttack1")
GUICtrlSetOnEvent($btnAttackSelectPlan[2], "eSelectAttack2")
GUICtrlSetOnEvent($btnAttackSelectPlan[3], "eSelectAttack3")
GUICtrlSetOnEvent($btnAttackSelectPlan[4], "eSelectAttack4")
GUICtrlSetOnEvent($btnAttackSelectPlan[5], "eSelectAttack5")
GUICtrlSetOnEvent($btnAttackSelectPlan[6], "eSelectAttack6")
GUICtrlSetOnEvent($btnAttackSelectPlan[7], "eSelectAttack7")
GUICtrlSetOnEvent($btnAttackSelectPlan[8], "eSelectAttack8")
GUICtrlSetOnEvent($btnAttackSelectPlan[9], "eSelectAttack9")
GUICtrlSetOnEvent($btnAttackSelectPlan[10], "eSelectAttack10")
GUICtrlSetOnEvent($btnAttackSelectPlan[11], "eSelectAttack11")
GUICtrlSetOnEvent($btnAttackSelectPlan[12], "eSelectAttack12")
GUICtrlSetOnEvent($btnAttackSelectPlan[13], "eSelectAttack13")
GUICtrlSetOnEvent($btnAttackSelectPlan[14], "eSelectAttack14")
GUICtrlSetOnEvent($btnAttackSelectPlan[15], "eSelectAttack15")
GUICtrlSetOnEvent($btnAttackSelectPlan[16], "eSelectAttack16")
GUICtrlSetOnEvent($btnAttackSelectPlan[17], "eSelectAttack17")
GUICtrlSetOnEvent($btnAttackSelectPlan[18], "eSelectAttack18")
GUICtrlSetOnEvent($btnAttackSelectPlan[19], "eSelectAttack19")
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
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack1()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 1;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack2()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 2;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack3()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 3;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack4()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 4;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack5()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 5;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack6()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 6;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack7()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 7;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack8()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 8;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack9()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 9;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack10()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 10;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack11()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 11;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack12()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 12;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack13()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 13;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack14()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 14;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack15()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 15;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack16()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 16;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack17()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 17;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack18()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 18;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
EndFunc
Func eSelectAttack19()
	SaveAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
	$aActiveAttackPlan = 19;
	LoadAttackPlan($aActiveAttackPlan)
	RefreshAttackLabels($aActiveAttackPlan)
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
GUICtrlSetOnEvent($aEPBtnClear[6], "eClearEPField6")
GUICtrlSetOnEvent($aEPBtnClear[7], "eClearEPField7")
GUICtrlSetOnEvent($aEPBtnClear[8], "eClearEPField8")
GUICtrlSetOnEvent($aEPBtnClear[9], "eClearEPField9")
GUICtrlSetOnEvent($aEPBtnClear[10], "eClearEPField10")
GUICtrlSetOnEvent($aEPBtnClear[11], "eClearEPField11")
GUICtrlSetOnEvent($aEPBtnClear[12], "eClearEPField12")
GUICtrlSetOnEvent($aEPBtnClear[13], "eClearEPField13")
GUICtrlSetOnEvent($aEPBtnClear[14], "eClearEPField14")
GUICtrlSetOnEvent($aEPBtnClear[15], "eClearEPField15")
GUICtrlSetOnEvent($aEPBtnClear[16], "eClearEPField16")
GUICtrlSetOnEvent($aEPBtnClear[17], "eClearEPField17")
GUICtrlSetOnEvent($aEPBtnClear[18], "eClearEPField18")
GUICtrlSetOnEvent($aEPBtnClear[19], "eClearEPField19")
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
Func eClearEPField6()
	PPFPEPClearFileds($aEP, 6)
EndFunc
Func eClearEPField7()
	PPFPEPClearFileds($aEP, 7)
EndFunc
Func eClearEPField8()
	PPFPEPClearFileds($aEP, 8)
EndFunc
Func eClearEPField9()
	PPFPEPClearFileds($aEP, 9)
EndFunc
Func eClearEPField10()
	PPFPEPClearFileds($aEP, 10)
EndFunc
Func eClearEPField11()
	PPFPEPClearFileds($aEP, 11)
EndFunc
Func eClearEPField12()
	PPFPEPClearFileds($aEP, 12)
EndFunc
Func eClearEPField13()
	PPFPEPClearFileds($aEP, 13)
EndFunc
Func eClearEPField14()
	PPFPEPClearFileds($aEP, 14)
EndFunc
Func eClearEPField15()
	PPFPEPClearFileds($aEP, 15)
EndFunc
Func eClearEPField16()
	PPFPEPClearFileds($aEP, 16)
EndFunc
Func eClearEPField17()
	PPFPEPClearFileds($aEP, 17)
EndFunc
Func eClearEPField18()
	PPFPEPClearFileds($aEP, 18)
EndFunc
Func eClearEPField19()
	PPFPEPClearFileds($aEP, 19)
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
	For $iCount = 0 To 20 Step 1
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
	PPFPEPSave($aPP, "PP.ini")
EndFunc

Func eFPSave()
	PPFPEPSave($aFP, "FP.ini")
EndFunc

Func eEPSave()
	EPSave($aEP, "EP.ini")
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

Func EPSave($Array, $File)
	Local $Temp[(4 * 20)][2]
	For $iCount = 0 To 19 Step 1
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
