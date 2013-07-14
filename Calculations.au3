Func GetOffsetX($Value)
	Return($Value + GUICtrlRead($iWinOffsetX))
EndFunc

Func GetOffsetY($Value)
	Return($Value + GUICtrlRead($iWinOffsetY))
EndFunc

; Not possible?! Seriously?
; Func GetSelectPlanet(($Number - 1))
Func GetSelectPlanet($Number)
	; Of course...
	; $Number--
	$Number -= 1
	Local $q[2]
	$q[0] = GetOffsetX(925)
	$q[1] = GetOffsetY((258 + (97 * $Number)))
	Return($q)
EndFunc

Func GetSelectMenu($Number)
	$Number -= 1
	Local $q[2]
	$q[0] = GetOffsetX(69)
	$q[1] = GetOffsetY((243 + (29 * $Number)))
	Return($q)
EndFunc

Func GetSelectActions($Number)
	Local $q[2]
	switch($Number)
		case $ACTION_ONFLEET_NEXT
			$q[0] = 770
			$q[1] = 860
		case $ACTION_ONTARGET_NEXT
			; Target Next Button
			$q[0] = 770
			$q[1] = 770
		case $ACTION_ONMISSION_ENGAGE
			; Engage Button
			$q[0] = 660
			; You ask y so deep? Well if JOINTFORCE selected the button goes a little lower. Simple, is'n it?
			$q[1] = 928
	EndSwitch
	Return($q)
EndFunc

Func GetSelectShipInput($Number)
	Local $q[2]
	switch($Number)
		case $SHIP_SMALL_FREIGHTER
			$q[0] = GetOffsetX((230 + (4 * 90)))
			$q[1] = GetOffsetY((670 + (0 * 120)))
		case $SHIP_HEAVY_FREIGHTER
			$q[0] = GetOffsetX((230 + (5 * 90)))
			$q[1] = GetOffsetY((670 + (0 * 120)))
		case $SHIP_SMALL_FIGHTER
			$q[0] = GetOffsetX((230 + (0 * 90)))
			$q[1] = GetOffsetY((670 + (0 * 120)))
		case $SHIP_HEAVY_FIGHTER
			$q[0] = GetOffsetX((230 + (1 * 90)))
			$q[1] = GetOffsetY((670 + (0 * 120)))
	EndSwitch
	if $q[0] > GetOffsetX((230 + (3 * 90))) Then $q[0] += 25
	Return($q)
EndFunc

Func GetSelectMission($Number)
	$Number -= 1
	Local $q[2]
	$q[0] = GetOffsetX((220 + ($Number * 65)))
	$q[1] = GetOffsetY(575)
	Return($q)
EndFunc

Func GetSelectResource($Number)
	$Number -= 1
	Local $q[2]
	$q[0] = GetOffsetY(615)
	$q[1] = GetOffsetX((745 + ($Number * 45)))
	Return($q)
EndFunc

Func GetSelectTarget($Number)
	$Number -= 1
	Local $q[2]
	$q[0] = GetOffsetX((510 + ($Number * 50)))
	$q[1] = GetOffsetY(620)
	Return($q)
EndFunc

Func DoClick($WithClick, $Delay)
	if $WithClick <> 1 Then
		MouseClick("primary")
		Sleep($Delay)
	EndIf
EndFunc

Func DoMove($Temp)
	; WTF?! I can't accses a function with an array-index for the return value - oh boy...
	; MouseMove(GetSelectPlanet(1)[0], GetSelectPlanet(1)[1], 5)
	MouseMove($Temp[0], $Temp[1], 5)
EndFunc
