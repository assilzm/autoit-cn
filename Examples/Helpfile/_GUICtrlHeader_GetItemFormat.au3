﻿#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

Opt('MustDeclareVars', 1)

$Debug_HDR = False ; Check ClassName being passed to functions, set to True and use a handle to another control to see it work

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $hImage

	; Create GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create ($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Create an image list with images
	$hImage = _GUIImageList_Create (11, 11)
	_GUIImageList_Add ($hImage, _WinAPI_CreateSolidBitmap ($hGUI, 0xFF0000, 11, 11))
	_GUIImageList_Add ($hImage, _WinAPI_CreateSolidBitmap ($hGUI, 0x00FF00, 11, 11))
	_GUIImageList_Add ($hImage, _WinAPI_CreateSolidBitmap ($hGUI, 0x0000FF, 11, 11))
	_GUICtrlHeader_SetImageList ($hHeader, $hImage)

	; Add columns
	_GUICtrlHeader_AddItem ($hHeader, "Column 1", 100, 0, 0)
	_GUICtrlHeader_AddItem ($hHeader, "Column 2", 100, 0, 1)
	_GUICtrlHeader_AddItem ($hHeader, "Column 3", 100, 0, 2)
	_GUICtrlHeader_AddItem ($hHeader, "Column 4", 100)

	; Set column 1 format
	_GUICtrlHeader_SetItemFormat ($hHeader, 0, BitOR($HDF_CENTER, $HDF_STRING))

	; Show column 1 format
	MemoWrite("Column 1 format: " & "0x" & Hex(_GUICtrlHeader_GetItemFormat ($hHeader, 0)))

	Sleep(1000)
	
	; Reset column 1 format
	_GUICtrlHeader_SetItemFormat ($hHeader, 0, BitOR($HDF_LEFT, $HDF_STRING, $HDF_IMAGE))

	; Show column 1 format
	MemoWrite("Column 1 format: " & "0x" & Hex(_GUICtrlHeader_GetItemFormat ($hHeader, 0)))

	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite