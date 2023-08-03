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
    LCtrl & j::
    send,{return}
    return

    ; Ctrl + h で バックスペース
    LCtrl & h::
    send,{BS}
    return

    ; Ctrl + l で 右に移動
    LCtrl & l::
    send,{RIGHT}
    return

    ; Ctrl + f で 右に移動
    ; Macと揃える
    LCtrl & f::
    send,{RIGHT}
    return

    ; Ctrl + a で行頭
    LCtrl & a::
    send,{HOME}
    return

    ; Ctrl + e で 行末
    LCtrl & e::
    send,{END}
    return


    ; Ctrl + k で選択箇所から後ろを削除
    ; - VSCodeでは設定したくない
    ; - VSCode以外では設定したい
    ; そのため、ブサイクだがここで個別設定している
    #IF !WinActive("ahk_exe Code.exe")
        LCtrl & k::
        send,+{END}
        send,{BS}
        return
    #IF

    ; Ctrl + ' でF10(Macと揃える)
    LCtrl & '::
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
    ;LCtrl & q::
    ;MsgBox, "hoge"
    ;return
#IF
;-------------------------------
; Atom設定
;-------------------------------
#ifWinActive ahk_exe atom.exe
    ; 移動系
    LCtrl & b::
    send {LEFT}
    return
    LCtrl & n::
    send {DOWN}
    return
    LCtrl & j::
    send {return}
    return
    LCtrl & k::
    send {UP}
    return
    LCtrl & p::
    send {UP}
    return
#IF
;-------------------------------
; Chrome
;-------------------------------
#ifWinActive ahk_exe chrome.exe
    ; Ctrl + p で上
    LCtrl & p::
    send {UP}
    return

    ; Ctrl + n で下
    LCtrl & n::
    send {DOWN}
    return

    ; Ctrl + b で右
    LCtrl & b::
    send,{LEFT}
    return

    ; Ctrl + l で左
    LCtrl & l::
    send,{RIGHT}
    return

#IF
;-------------------------------
; Evernote設定
;-------------------------------
#IF WinActive("ahk_exe Evernote.exe")
    LCtrl & n::
    send {DOWN}
    return

    LCtrl & k::
    send {UP}
    return

    LCtrl & p::
    send {UP}
    return

    LCtrl & b::
    send,{LEFT}
    return

    LCtrl & l::
    send,{RIGHT}
    return
#IF
;-------------------------------
; Clibor設定
;-------------------------------
#ifWinActive ahk_class TFrm_Clibor
    LCtrl & n::
    send,{DOWN}
    return
    Tab::
    send,{DOWN}
    return
    LCtrl & p::
    send,{UP}
    return
    LCtrl & k::
    send,{UP}
    return
    LCtrl & Tab::
    send,{UP}
    return
    LCtrl & l::
    send,{RIGHT}
    return
    LCtrl & j::
    send,{return}
    return
    LCtrl & c::
    send,{ESC}
    return
    ; Ctrl + q で検索
    LCtrl & q::
    send,{Tab}
    return
#IF
;-------------------------------
; VSCode設定
; VSCodeの設定はWin,Mac共用したいので、基本的にVSCodeで設定する。
; Winのみのキーマップはここで設定している。
;-------------------------------
#IfWinActive ahk_exe Code.exe

    LCtrl & n::
    send,{DOWN}
    return

    LCtrl & p::
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

    LCtrl & w::
    send !{F4}
    return

#IF
;-------------------------------
; LINE設定
;-------------------------------
#ifWinActive ahk_class Qt5QWindowIcon

    LCtrl & n::
    send {DOWN}
    return
    LCtrl & k::
    send {UP}
    return
    LCtrl & p::
    send {UP}
    return
    LCtrl & l::
    send,{RIGHT}
    return

#IF
;-------------------------------
; KeePass設定
;-------------------------------
#ifWinActive ahk_class WindowsForms10.Window.8.app.0.30495d1_r6_ad1

    LCtrl & n::
    send {DOWN}
    return
    LCtrl & k::
    send {UP}
    return
    LCtrl & p::
    send {UP}
    return
    LCtrl & l::
    send,{RIGHT}
    return

#IF
;-------------------------------
; エクスプローラ設定
;-------------------------------
#ifWinActive ahk_class CabinetWClass
    LCtrl & n::
    send,{DOWN}
    return
    LCtrl & p::
    send,{UP}
    return
#IF
;-------------------------------
; Windows Power Lancher
;-------------------------------
#IfWinActive ahk_exe PowerLauncher.exe
    LCtrl & n::
    send,{DOWN}
    return
    LCtrl & p::
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
