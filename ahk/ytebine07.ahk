#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;-------------------------------
; include
;-------------------------------
#Include %A_ScriptDir%


;-------------------------------
; �S�̋���
;-------------------------------
; �EShift + ���ŃA���_�[�o�[
>+UP::
send,_
return


;-------------------------------
; �S�̋���(����A�v���P�[�V�����ȊO)
;-------------------------------
#IfWinNotActive ahk_class PuTTY
    ; Ctrl + j �� �G���^�[
    ^j::
    send,{return}
    return

    ; Ctrl + h �� �o�b�N�X�y�[�X
    ^h::
    send,{BS}
    return

    ; Ctrl + b �� ���Ɉړ�
    ^b::
    send,{LEFT}
    return

    ; Ctrl + a �ōs��
    ^a::
    send,{HOME}
    return

    ; Ctrl + e �� �s��
    ^e::
    send,{END}
    return

    ; Ctrl + k �őI���ӏ���������폜
    ^k::
    send,+{END}
    send,{BS}
    return

    ; Ctrl + ; ��F10(Mac�Ƒ�����)
    ^;::
    send,{F10}
    return

    ; �f�o�b�O�p
    ;^q::
    ;getIMEMode := IME_Get()
    ;MsgBox, %getIMEMode%
    ;return

#IF

;-------------------------------
; �G�ېݒ�
;-------------------------------
#ifWinActive ahk_class Hidemaru32Class

    ; �ړ��n
    ^b::
    send {LEFT}
    return

#IF

;-------------------------------
; ahk�����[�h
;-------------------------------
#IfWinActive, tebine.ahk
    ; �ۑ��Ɠ����Ƀ����[�h
    ^s::
        Send,^s
        Reload
    return
#IfWinActive
