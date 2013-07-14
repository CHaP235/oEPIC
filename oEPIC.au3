; I need it for some actions like BlockInput but be carefull
; #RequireAdmin

#region SYS LIBRARIES
#include <FF.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Date.au3>
#include <Array.au3>
#endregion SYS LIBRARIES

; Activate event mode for form
Opt("GUIOnEventMode", 1)
; Emercency thing - Not working if in admin mode (BlockInput)
HotKeySet("{ESC}", "GoExit")
Func GoExit()
	MsgBox(0,"","Don't Panic!")
	Exit
EndFunc

#region FORM
#include <Form.au3>
#include <FormEvents.au3>
#endregion FORM

#region SUB INCLUDES
#include <Declares.au3>
#include <Initiates.au3>
#include <Calculations.au3>
#include <DoLogIn.au3>
#include <DoTransfer.au3>
#include <DoAttack.au3>
#include <Main.au3>
#endregion INCLUDES

#region MAIN
GUISetState(@SW_SHOW)
DirCreate($USERPATH)
; Always on top, eh?
; WinSetOnTop("oEPIC","",1)
Main()

GUICtrlSetData($lNotes, LoadReleaseNotes())
LoadPlayerPlanets()
LoadFriendPlanets()
LoadEnemyPlanets()
LoadTransferPlan(0)
LoadAttackPlan(0)
LoadDebugSettings()
#endregion MAIN

#region SANDBOX
#endregion SANDBOX

; Main loop for dippy-wippy actions and gui events
While 1

	; Debug stuff
	$pos = MouseGetPos()
	GUICtrlSetData($lDebugMouse, "Mouse X " & $pos[0] & " Y " & $pos[1])
	GUICtrlSetData($lTime, _NowTime())

	CheckTranfer()
	CheckAttack()

	CheckNotifiLine()

	GUICtrlSetData($lSelectedTranferPlan, ($aActiveTransferPlan + 1))
	GUICtrlSetData($lSelectedAttackPlan, ($aActiveAttackPlan + 1))

	CheckCursorInfo(GUIGetCursorInfo())

	Sleep(1000)

WEnd

Func CheckCursorInfo($Info)

EndFunc

Func CheckNotifiLine()

	For $iCount = 0 To 5 Step 1

		If GUICtrlRead($lTransferStatus[$iCount]) <> "READY" Then
			$Temp = "!! TRANSFER PLAN ONGOING !!"

			if (GUICtrlGetState($lTransferNotifyLine) == 80) Then
				GUICtrlSetState($lTransferNotifyLine, $GUI_DISABLE)
			Else
				GUICtrlSetState($lTransferNotifyLine, $GUI_ENABLE)
			EndIf

			ExitLoop
		Else
			$Temp = "NO TRANSFER"
			GUICtrlSetState($lTransferNotifyLine, $GUI_DISABLE)
		EndIf
	Next

	GUICtrlSetData($lTransferNotifyLine,$Temp)

	For $iCount = 0 To 5 Step 1
		$Temp = "NO ATTACK"
		If GUICtrlRead($lAttackStatus[$iCount]) <> "READY" Then
			$Temp = "!! ATTACK PLAN ONGOING !!"

			if (GUICtrlGetState($lAttackNotifyLine) == 80) Then
				GUICtrlSetState($lAttackNotifyLine, $GUI_DISABLE)
			Else
				GUICtrlSetState($lAttackNotifyLine, $GUI_ENABLE)
			EndIf

			ExitLoop
		Else
			$Temp = "NO ATTACK"
			GUICtrlSetState($lAttackNotifyLine, $GUI_DISABLE)
		EndIf
	Next

	GUICtrlSetData($lAttackNotifyLine,$Temp)

EndFunc
