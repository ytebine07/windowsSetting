#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;-------------------------------
; include
;-------------------------------
#Include %A_ScriptDir%


;-------------------------------
; 全体共通
;-------------------------------
; 右Shift + ↑でアンダーバー
>+UP::
send,_
return


;-------------------------------
; 全体共通(特定アプリケーション以外)
;-------------------------------
#IfWinNotActive ahk_class PuTTY
    ; Ctrl + j で エンター
    ^j::
    send,{return}
    return

    ; Ctrl + h で バックスペース
    ^h::
    send,{BS}
    return

    ; Ctrl + b で 左に移動
    ^b::
    send,{LEFT}
    return

    ; Ctrl + a で行頭
    ^a::
    send,{HOME}
    return

    ; Ctrl + e で 行末
    ^e::
    send,{END}
    return

    ; Ctrl + k で選択箇所から後ろを削除
    ^k::
    send,+{END}
    send,{BS}
    return

    ; Ctrl + ; でF10(Macと揃える)
    ^;::
    send,{F10}
    return

    ; デバッグ用
    ;^q::
    ;getIMEMode := IME_Get()
    ;MsgBox, %getIMEMode%
    ;return

#IF

;-------------------------------
; 秀丸設定
;-------------------------------
#ifWinActive ahk_class Hidemaru32Class

    ; 移動系
    ^b::
    send {LEFT}
    return

#IF

;-------------------------------
; ahkリロード
;-------------------------------
#IfWinActive, tebine.ahk
    ; 保存と同時にリロード
    ^s::
        Send,^s
        Reload
    return
#IfWinActive
