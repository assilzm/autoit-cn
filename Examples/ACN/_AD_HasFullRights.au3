#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ��ǰ�û�Ϊ���Ա������б�. Ȼ���鵱ǰ�û��������е��׸������Ƿ������ȫȨ��
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ��ȡ��ǰ�û�Ϊ���Ա������б�
Global $aMemberOf = _AD_GetUserGroups()

; ��鵱ǰ�û��������е��׸������Ƿ������ȫȨ��
Global $sUser = @UserName
If _AD_HasFullRights($aMemberOf[1], $sUser) Then
	msgbox(64, "Active Directory Functions", "User'" & $sUser & "'has full rights on group'" & $aMemberOf[1] & "'")
Else
	msgbox(64, "Active Directory Functions", "User'" & $sUser & "'does not have full rights on group'" & $aMemberOf[1] & "'")
EndIf

; �ر�Active Directory����
_AD_Close()
