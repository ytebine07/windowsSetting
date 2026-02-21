#Requires AutoHotkey v2.0
;--------------------------------
; キーリスト
; http://ahkwiki.net/KeyList
;--------------------------------

;-------------------------------
; 全体共通
;-------------------------------
; Ctrl + j で エンター
^j::Send "{Enter}"

; 右Altをアプリケーションキー
RAlt::Send "{AppsKey}"

;Shift + SpaceでIME切り換え
+Space:: {
    Send "{vkF3sc029}"
}


;-------------------------------
; 全体共通(英語キーボード用)
; 先頭の$は、無限ループに陥るのを回避してる
;-------------------------------

; ; で :
$`;::Send ":"

; Shift + ; で ;
$+`;::Send ";"

;-------------------------------
; 全体共通(特定アプリケーション以外)
; - Clibor(クリップボード監視）
; - git bash (mintty)
;-------------------------------
#HotIf !WinActive("ahk_class TFrm_Clibor") && !WinActive("ahk_class mintty")

; Ctrl + j で エンター
LCtrl & j::Send "{Enter}"

; Ctrl + h で バックスペース
LCtrl & h::Send "{BS}"

; Ctrl + l で 右に移動
LCtrl & l::Send "{Right}"

; Ctrl + f で 右に移動（Macと揃える）
LCtrl & f::Send "{Right}"

; Ctrl + a で行頭
LCtrl & a::Send "{Home}"

; Ctrl + e で 行末
LCtrl & e::Send "{End}"

; Ctrl + k で選択箇所から後ろを削除（VSCode以外）
#HotIf !WinActive("ahk_class TFrm_Clibor") && !WinActive("ahk_class mintty") && !WinActive("ahk_exe Code.exe")
LCtrl & k::
{
    Send "+{End}"
    Send "{BS}"
}
#HotIf !WinActive("ahk_class TFrm_Clibor") && !WinActive("ahk_class mintty")

; Ctrl + ' でF10(Macと揃える)
LCtrl & '::Send "{F10}"

; Alt + C でコピー（Macぽく）
LAlt & c::Send "^c"

; Alt + x でカット（Macぽく）
LAlt & x::Send "^x"

; Alt + v で貼り付け（Macぽく）
LAlt & v::Send "^v"

; Alt + s で保存（Macぽく）
LAlt & s::Send "^s"

; Alt + f でCtrl + f(Macぽく)
LAlt & f::Send "^f"

; Alt + z でCtrl + z(Macぽく)
LAlt & z::Send "^z"

#HotIf
;-------------------------------
; Atom設定
;-------------------------------
#HotIf WinActive("ahk_exe atom.exe")

LCtrl & b::Send "{Left}"
LCtrl & n::Send "{Down}"
LCtrl & j::Send "{Enter}"
LCtrl & k::Send "{Up}"
LCtrl & p::Send "{Up}"

#HotIf
;-------------------------------
; Chrome
;-------------------------------
#HotIf WinActive("ahk_exe chrome.exe")

LCtrl & p::Send "{Up}"
LCtrl & n::Send "{Down}"
LCtrl & b::Send "{Left}"
LCtrl & l::Send "{Right}"

#HotIf
;-------------------------------
; Evernote設定
;-------------------------------
#HotIf WinActive("ahk_exe Evernote.exe")

LCtrl & n::Send "{Down}"
LCtrl & k::Send "{Up}"
LCtrl & p::Send "{Up}"
LCtrl & b::Send "{Left}"
LCtrl & l::Send "{Right}"

#HotIf
;-------------------------------
; Clibor設定
;-------------------------------
#HotIf WinActive("ahk_class TFrm_Clibor")

LCtrl & n::Send "{Down}"
Tab::Send "{Down}"
LCtrl & p::Send "{Up}"
LCtrl & k::Send "{Up}"
LCtrl & Tab::Send "{Up}"
LCtrl & l::Send "{Right}"
LCtrl & j::Send "{Enter}"
LCtrl & c::Send "{Esc}"
LCtrl & q::Send "{Tab}" ; 検索

#HotIf
;-------------------------------
; VSCode設定
;-------------------------------
#HotIf WinActive("ahk_exe Code.exe")

LCtrl & n::Send "{Down}"
LCtrl & p::Send "{Up}"

#HotIf
;-------------------------------
; Bashのプロンプト設定 (mintty)
;-------------------------------
#HotIf WinActive("ahk_exe mintty.exe")

; 右クリック で貼り付け
RButton::Send "+{Ins}"

#HotIf
;-------------------------------
; 電卓設定
;-------------------------------
#HotIf WinActive("ahk_exe ApplicationFrameHost.exe")

LCtrl & w::Send "!{F4}"

#HotIf
;-------------------------------
; LINE設定
;-------------------------------
#HotIf WinActive("ahk_class Qt5QWindowIcon")

LCtrl & n::Send "{Down}"
LCtrl & k::Send "{Up}"
LCtrl & p::Send "{Up}"
LCtrl & l::Send "{Right}"

#HotIf
;-------------------------------
; KeePass設定
;-------------------------------
#HotIf WinActive("ahk_class WindowsForms10.Window.8.app.0.30495d1_r6_ad1")

LCtrl & n::Send "{Down}"
LCtrl & k::Send "{Up}"
LCtrl & p::Send "{Up}"
LCtrl & l::Send "{Right}"

#HotIf
;-------------------------------
; 秀丸設定
;-------------------------------
#HotIf WinActive("ahk_class Hidemaru32Class")

LCtrl & n::Send "{Down}"
LCtrl & k::Send "{Up}"
LCtrl & p::Send "{Up}"
LCtrl & l::Send "{Right}"
LCtrl & b::Send "{Left}"

#HotIf
;-------------------------------
; エクスプローラ設定
;-------------------------------
#HotIf WinActive("ahk_class CabinetWClass")

LCtrl & n::Send "{Down}"
LCtrl & p::Send "{Up}"

#HotIf
;-------------------------------
; Windows Power Launcher
;-------------------------------
#HotIf WinActive("ahk_exe PowerLauncher.exe")

LCtrl & n::Send "{Down}"
LCtrl & p::Send "{Up}"

#HotIf
;-------------------------------
; PowerToys Run
;-------------------------------
#HotIf WinActive("ahk_exe PowerToys.PowerLauncher.exe")

LCtrl & n::Send "{Down}"
LCtrl & p::Send "{Up}"

#HotIf
;-------------------------------
; ahkリロード
;-------------------------------
#z::
{
    Sleep 100
    MsgBox "リロードしました！"
    Reload
}
