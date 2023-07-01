;/*****************在非代码编辑器内实现括号补全*****************************/
    ;|+=======================================================+|
    ;||                热键 caps + 9                          ||
    ;|+=======================================================+|
        #if
            CapsLock & 6::
                bracketAutoCpOn := !bracketAutoCpOn
        Return
        #if bracketAutoCpOn
        {
            $(::
                send,{(}
                send,{)}
                send,{left}
            return
            $[::
                send,{[}
                send,{]}
                send,{left}
            return
            ${::
                send,{{}
                send,{}}
                send,{left}
            return
            $"::
                send,{"}
                send,{"}
                send,{left}
            return
            $'::
                send,{'}
                send,{'}
                send,{left}
            return
        }
        #if

;/**************************系统按键修改*****************************/
    ;|+=======================================================+|
    ;||       CapsLock & a      |       Caps                  ||
    ;|+=======================================================+|
	CapsLock::
		return
    CapsLock & a::
    GetKeyState, CapsLockState, CapsLock, T
    if CapsLockState = D
        SetCapsLockState, AlwaysOff
    else
        SetCapsLockState, AlwaysOn
    KeyWait, a


;/***********************键盘编辑用的热键*****************************/
    ;|+=======================================================+|
    ;||      CapsLock & [       |      WheelUp                ||
    ;||      CapsLock & ]       |      WheelDown              ||
    ;||      CapsLock & 1       |        `                    ||
    ;||      CapsLock & 2       |        ~                    ||
    ;|+-------------------------+-----------------------------+|
    ;||      CapsLock & ijkl    |        上下左右             ||
    ;||  CapsLock & alt & ik    |        sublime 内光标       ||
    ;||  CapsLock & alt & jl    |        单词移动             ||
    ;||  CapsLock & ctl & + jl  |        选中单词             ||
    ;||  CapsLock & ctr & jk    |        sublime 内 行移动    ||
    ;|+-------------------------+-----------------------------+|
    ;||    CapsLock & g         |         AppsKey             ||
    ;||    CapsLock & o         |         delete              ||
    ;||    CapsLock & p         |         BackSpace           ||
    ;||    CapsLock & h         |         Home                ||
    ;||    CapsLock & n         |         End                 ||
    ;|| CapsLock & shift & h    |         shift+home          ||
    ;|| CapsLock & shift & n    |         shift+end           ||
    ;|| CapsLock & alt & h      |         ctrl+home           ||
    ;|| CapsLock & alt & n      |         ctrl+end            ||
    ;||  win & ctrl & tab       |      ctrl+win+{right}       ||
    ;||  win & ctrl & shift+tab |      ctrl+win+{left}        ||
    ;||    CapsLock & ;         |            =                ||
    ;||    CapsLock & '         |            +                ||
    ;|+-------------------------------------------------------+|
    ;||                      音量控制                         ||
    ;|+-------------------------+-----------------------------+|
    ;||         XButton1        |         Volume_Up           ||
    ;||         XButton2        |         Volume_Down         ||
    ;|| XButton2 &  WheelDown   |         Volume_Down         ||
    ;|| XButton2 &  WheelUp     |         Volume_Up           ||
    ;|| CapsLock & PgUp         |         Volume_Up           ||
    ;|| CapsLock & PgDn         |         Volume_Down         ||
    ;|+=======================================================+|
    ;滑动
    CapsLock & [::send,{WheelUp}
    CapsLock & ]::send,{WheelDown}
    ;`&&~
    CapsLock & 1::send,``
    CapsLock & 2::send,{~}
    ; move left
    CapsLock & j::
    if GetKeyState("LShift", "P")
        send, +{Left}
    else if GetKeyState("LAlt", "P")
        send,^{left}
    else if GetKeyState("LControl", "P")
        send,^+{left}
    else
        send, {Left}
    Return
    !j::send,!{left}
    Return
    ; move right
    CapsLock & l::
    if GetKeyState("LShift", "P")
        send, +{right}
    else if GetKeyState("LAlt", "P")
        send,^{right}
    else if GetKeyState("LControl", "P")
        send,^+{right}
    else
        send, {right}
    Return
    !l::send,!{right}
    ; move up
    CapsLock & i::
    if GetKeyState("LShift", "P")
        send, +{up}
    else if GetKeyState("LAlt", "P")
        send,^{up}
    else if GetKeyState("LControl", "P")
        send,^+{up}
    else
        send, {up}
    Return
    ; move down
    CapsLock & k::
    if GetKeyState("LShift", "P")
        send, +{down}
    else if GetKeyState("LAlt", "P")
        send,^{down}
    else if GetKeyState("LControl", "P")
        send,^+{down}
    else
        send, {down}
    Return
    ;home
    CapsLock & h::
    if GetKeyState("LControl", "P")
        send, +{home}
    else if GetKeyState("LAlt", "P")
        send, ^{home}
    else
        send, {home}
    Return
    ; end
    CapsLock & n::
        if GetKeyState("LControl", "P")
            send, +{end}
        else if GetKeyState("LAlt", "P")
            send, ^{end}
        else
            send, {end}
    Return
    ;ctrl win {left/right}
    Lwin & tab::
        if GetKeyState("LCtrl","P")
            if GetKeyState("Lshift","P")
                send,^#{left}
            else
                send,^#{right}
        Else
            send,#{tab}
    Return
    ;AppsKey
    CapsLock & g:: Send, {AppsKey}
    ;delelte
	CapsLock & o::
	if GetKeyState("LAlt", "P")
		send, ^{delete}
	else
		send, {delete}
	Return
	;BackSpace
	CapsLock & p::
	if GetKeyState("LAlt", "P")
		send, ^{BackSpace}
	else
		send, {BackSpace}
	Return
    ;= + ()
    CapsLock & `;::send,{=}
    CapsLock & '::send,{+}
    ;!F4
    LCtrl & w::
        if GetKeyState("alt"){
            Send, !{F4}
        }Else{
            Send, ^w
        }                                                                                                                                    ;|
    return

;鼠标键盘控制音量
    XButton2 & WheelDown::send,{Volume_Down}
    XButton2 & WheelUp::send,{Volume_Up}
    CapsLock & PgUp::send,{Volume_Up}
    CapsLock & PgDn::send,{Volume_Down}

; 打开文件夹
    CapsLock & r::
        FileSelectFolder, OutputVar, *D:\mygit, 3
        OutputVar := RegExReplace(Folder, "\\$")  ; 移除默认的反斜杠, 如果存在.
        if OutputVar =
            MsgBox, You didn't select a folder.
        else
            MsgBox, You selected folder "%OutputVar%".
    Return

    ;CapsLock & c::
      ;  run calc.exe
   ; Return
; 获取路径
    ^#c::
        send ^c
        sleep,200
        clipboard=%clipboard% ;%null%
        tooltip,%clipboard%
        sleep,500
        tooltip,
    return
; 循环（重复）按键
    ^#a::
        Input,AUTOCLICK, L1 M
        ToolTip, 连续点击{%AUTOCLICK%}键中，按右Shift取消连点
        SetTimer, RemoveToolTip, -1000
        Sleep,300
        loop
        {
            Send,{%AUTOCLICK%}
            Sleep,70
            if GetKeyState("RShift","P") 
            {
                SetTimer, RemoveToolTip, -10
                break
            }
        }
    Return
; 媒体键增强
    >!>^Right::send,{Media_Next}
    >!>^Left::send,{Media_Prev}
    >!>^Space::send,{Media_Play_Pause}
;额外补充
::email::默认文本填充
RemoveToolTip:
ToolTip
return
