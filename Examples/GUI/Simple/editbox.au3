﻿;====================================================
;================= Example of a GUI =================
;====================================================
; AutoIt version: 3.0.103
; Language:       English
; Author:         "SlimShady"
;
; ----------------------------------------------------------------------------
; Script Start
; ----------------------------------------------------------------------------

;Include constants
#include <GUIConstantsEx.au3>


_Main()

Func _Main()

	;Initialize variables
	Local $GUIWidth = 300, $GUIHeight = 250
	Local $Edit_1, $OK_Btn, $Cancel_Btn, $msg

	#forceref $Edit_1

	;Create window
GUICreate("新 GUI", $GUIWidth, $GUIHeight)

	;Create an edit box with no text in it
	$Edit_1 = GUICtrlCreateEdit("", 10, 10, 280, 190)

	;Create an "OK" button
$OK_Btn = GUICtrlCreateButton("确定", 75, 210, 70, 25)

	;Create a "CANCEL" button
	$Cancel_Btn = GUICtrlCreateButton("取消", 165, 210, 70, 25)

	;Show window/Make the window visible
	GUISetState(@SW_SHOW)

	;Loop until:
	;- user presses Esc
	;- user presses Alt+F4
	;- user clicks the close button
	While 1
		;After every loop check if the user clicked something in the GUI window
		$msg = GUIGetMsg()

		Select

			;Check if user clicked on the close button
			Case $msg = $GUI_EVENT_CLOSE
				;Destroy the GUI including the controls
				GUIDelete()
				;Exit the script
				Exit

				;Check if user clicked on the "OK" button
			Case $msg = $OK_Btn
         MsgBox(64, "新 GUI", "您单击了[确定]按钮!")

				;Check if user clicked on the "CANCEL" button
			Case $msg = $Cancel_Btn
         MsgBox(64, "新 GUI", "您单击了取消按钮!")

		EndSelect

	WEnd
EndFunc   ;==>_Main
