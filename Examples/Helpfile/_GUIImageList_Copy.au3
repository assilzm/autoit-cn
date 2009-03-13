﻿#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $listview, $hImage, $AutoItDir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt", "InstallDir")
	
	GUICreate("ImageList Copy", 410, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 404, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState()

	; Create an image list with images
	$hImage = _GUIImageList_Create(11, 11)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\filetype1.ico") & @LF)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\filetype2.ico") & @LF)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\filetype3.ico") & @LF)
	ConsoleWrite(_GUIImageList_AddIcon($hImage, $AutoItDir & "\Icons\filetype3.ico") & @LF)
	_GUIImageList_Copy($hImage, 0, 3)
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	; Add columns
	_GUICtrlListView_AddColumn($listview, "Column 1", 100, 1, 0, True)
	_GUICtrlListView_AddColumn($listview, "Column 2", 100, 0, 1, True)
	_GUICtrlListView_AddColumn($listview, "Column 3", 100, 2, 2, True)
	_GUICtrlListView_AddColumn($listview, "Column 4", 100, 0, 3)
	
	; Loop until user exits
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main