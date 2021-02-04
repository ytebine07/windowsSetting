#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; キーリスト
; http://ahkwiki.net/KeyList

;-------------------------------
; include
;-------------------------------
#Include %A_ScriptDir%
;-------------------------------
; 全体共通
;-------------------------------
; Alt + e で Windows + e(Windowsエクスプローラを開く)
LAlt & e::
send,#e
return

;右Altをアプリケーションキー
RAlt::
send,{AppsKey}
return

;-------------------------------
; 全体共通(英語キーボード用)
; 先頭の$は、無限ループに陥るのを回避してる
;-------------------------------
; ; で :
$`;::
send,`:
return

;Shift + : で ;
$+`;::
send,;
return

;-------------------------------
; 全体共通(特定アプリケーション以外)
; - Clibor(クリップボード監視）
; - git bash
;-------------------------------
#IF !WinActive("ahk_class TFrm_Clibor") AND !WinActive("ahk_class mintty")
    ; Ctrl + j で エンター
    ^j::
    send,{return}
    return

    ; Ctrl + h で バックスペース
    ^h::
    send,{BS}
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
    ; - VSCodeでは設定したくない
    ; - VSCode以外では設定したい
    ; そのため、ブサイクだがここで個別設定している
    #IF !WinActive("ahk_exe Code.exe")
        ^k::
        send,+{END}
        send,{BS}
        return
    #IF

    ; Ctrl + : でF10(Macと揃える)
    ^vkBA::
    send,{F10}
    return

    ; Alt + C でコピー（Macぽく）
    LAlt & c::
    send,^c
    return

    ; Alt + x でカット（Macぽく）
    LAlt & x::
    send,^x
    return

    ; Alt + v で貼り付け（Macぽく）
    LAlt & v::
    send,^v
    return

    ; Alt + s で保存（Macぽく）
    LAlt & s::
    send,^s
    return

    ; Alt + f でCtrl + f(Macぽく)
    LAlt & f::
    send,^f
    return

    ; Alt + z でCtrl + z(Macぽく)
    LAlt & z::
    send,^z
    return

    ; デバッグ用
    ;^q::
    ;MsgBox, "hoge"
    ;return
#IF
;-------------------------------
; Atom設定
;-------------------------------
#ifWinActive ahk_exe atom.exe
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
; Chrome
;-------------------------------
#ifWinActive ahk_exe chrome.exe
    ; Ctrl + p で上
    ^p::
    send {UP}
    return

    ; Ctrl + n で下
    ^n::
    send {DOWN}
    return

    ; Ctrl + b で右
    ^b::
    send,{LEFT}
    return

    ; Ctrl + l で左
    ^l::
    send,{RIGHT}
    return

#IF
;-------------------------------
; Evernote設定
;-------------------------------
#IF WinActive("ahk_exe Evernote.exe")
    ^n::
    send {DOWN}
    return

    ^k::
    send {UP}
    return

    ^p::
    send {UP}
    return

    ^b::
    send,{LEFT}
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
; VSCode設定
; VSCodeの設定はWin,Mac共用したいので、基本的にVSCodeで設定する。
; Winのみのキーマップはここで設定している。
;-------------------------------
#IfWinActive ahk_exe Code.exe

    ^n::
    send,{DOWN}
    return

    ^p::
    send,{UP}
    return

#IF
;-------------------------------
; Bashのプロンプト設定
;-------------------------------
#IfWinActive ahk_exe mintty.exe
    ; 右クリック で貼り付け
    RButton::
    send {Shift}{Ins}
    return
#IF
;-------------------------------
; 電卓設定
;-------------------------------
#ifWinActive ahk_exe ApplicationFrameHost.exe

    ^w::
    send !{F4}
    return

#IF
;-------------------------------
; LINE設定
;-------------------------------
#ifWinActive ahk_class Qt5QWindowIcon

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
; KeePass設定
;-------------------------------
#ifWinActive ahk_class WindowsForms10.Window.8.app.0.30495d1_r6_ad1

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
; Windows Power Lancher
;-------------------------------
#IfWinActive ahk_exe PowerLauncher.exe
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
#z::
    sleep,100
    MsgBox,リロードしました！
    Reload
    return
