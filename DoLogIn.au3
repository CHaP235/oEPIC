

Func LogMeIn($Server, $Name, $Pass)

	$Temp = _FFObjGet("loginSubmit", "id")
	If Not ($Temp) Then
		$Temp = _FFObjGet("loginBtn", "id")
		_FFClick($Temp)
	EndIf

	DoIt($Server, $Name, $Pass)

	Sleep(1700)

EndFunc

Func DoIt($Server, $Name, $Pass)

	$Temp = _FFObjGet("serverLogin", "id")
	_FFObj($Temp, "value", $Server)

	$Temp = _FFObjGet("usernameLogin", "id")
	_FFObj($Temp, "value", $Name)

	$Temp = _FFObjGet("passwordLogin", "id")
	_FFObj($Temp, "value", $Pass)

	_FFClick(_FFObjGet("loginSubmit", "id"))


EndFunc