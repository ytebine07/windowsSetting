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
; Ctrl + q でClibor呼び出し
; Ctrl + F1 でClibor起動は、Clibor側の設定
^q::
send,^{F1}
return
;-------------------------------
; 全体共通(特定アプリケーション以外)
;-------------------------------
#IF !WinActive("ahk_class PuTTY") AND !WinActive("ahk_class TFrm_Clibor")
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
    ; Ctrl + l で 右に移動
    ^l::
    send,{RIGHT}
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
    ;MsgBox, "hoge"
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
    ^n::
    send {DOWN}
    return
    ^j::
    send {return}
    return
    ^k::
    send {UP}
    return
    ^p::
    send {UP}
    return
#IF
;-------------------------------
; メーラー設定
;-------------------------------
#ifWinActive ahk_class rctrl_renwnd32
    ; 移動系
    ^n::
    send {DOWN}
    return
    ^p::
    send {UP}
    return
#IF
;-------------------------------
; Chrome
;-------------------------------
#ifWinActive ahk_class Chrome_WidgetWin_1
    ^l::
    send {RIGHT}
    return
    ; Ctrl + n で左タブへ
    ^n::
    send ^+{Tab}
    return
    ; Ctrl + p で右タブへ
    ^p::
    send ^{Tab}
    return
#IF
;-------------------------------
; Evernote設定
;-------------------------------
#IF WinActive("ahk_class ENMainFrame") OR WinActive("ahk_class ENSingleNoteView")
    ^n::
    send {DOWN}
    return
    ^k::
    send {UP}
    return
    ^p::
    send {UP}
    return
    ^l::
    send,{RIGHT}
    return
#IF
;-------------------------------
; Clibor設定
;-------------------------------
#ifWinActive ahk_class TFrm_Clibor
    ^n::
    send,{DOWN}
    return
    Tab::
    send,{DOWN}
    return
    ^p::
    send,{UP}
    return
    ^k::
    send,{UP}
    return
    ^Tab::
    send,{UP}
    return
    ^l::
    send,{RIGHT}
    return
    ^j::
    send,{return}
    return
    ^c::
    send,{ESC}
    return
    ; Ctrl + q で検索
    ^q::    
    send,{Tab}
    return
#IF
;-------------------------------
; 電卓設定
;   windows7まで
;   windows10の電卓には閉じるをキーボードで送れない
;-------------------------------
#ifWinActive ahk_class CalcFrame

    ; Ctrl + w で閉じる
    ^w::
    send,!{F4}
    return

#IF
;-------------------------------
; エクスプローラ設定
;-------------------------------
#ifWinActive ahk_class CabinetWClass
    ^n::
    send,{DOWN}
    return
    ^p::
    send,{UP}
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