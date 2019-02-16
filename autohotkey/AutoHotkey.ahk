;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Reload any AHK script: On save (CTRL+S), if this script is running, reload it. Else re-send CTRL+S.
$^s::
SetTitleMatchMode RegEx
IfWinActive, %A_ScriptName%
{
   Send, ^s
   SplashTextOn,,25,AHK Reload,%A_ScriptName% Reloaded
   Sleep,500
   SplashTextOff
   Reload
}
else
   Send, ^s
return

:O:;ss::Thanks,{Enter}-sam
:O:;sh::Hope that helps,{Enter}-sam
:*:;name::Samuel Britt
:*:;fname::Samuel
:*:;lname::Britt
:*:;uname::samuelbritt
:*:;email::samuelbritt@gmail.com
:*:;phone::(205) 515-0618
:*:;addr::1467 Hembree Station Dr, Marietta, GA 30062
:*:;str::1467 Hembree Station Dr
:*:;city::Marietta
:*:;zip::30062

:*:;amail::anshepp@gmail.com
:*:;aphone::(404) 304-3208

:*:;wemail::sbritt@evestment.com
:*:;wphone::(877) 769 2388
:*:;waddr::100 Glenridge Point Parkway, Ste 100, Atlanta, GA 30342
:*:;wstr::100 Glenridge Point Parkway Ste 100
:*:;wcity::Atlanta
:*:;wzip::30342

; CTRL+; => 2005-09-01 3:53 PM
$^`;::
FormatTime, CurrentDateTime,, yyyy-MM-dd h:mm tt
SendInput %CurrentDateTime%
return

; CTRL+' => 2005-09-01
$^'::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

; CTRL+" => 20050901
$^"::
FormatTime, CurrentDateTime,, yyyyMMdd
SendInput %CurrentDateTime%
return

:*:[[::[[]]{LEFT 2}
:*:((::{(}{)}{LEFT 1}
:*:;hb::[[]]{LEFT 2}
:*:;ht::[[h{#}]]{LEFT 2}
:*:;hh::h{#}
:*:;rg::h{#} -  - {LEFT 6}
:*:;nw::<nowiki></nowiki>{LEFT 9}
:*:;tt::<tt></tt>{LEFT 5}
:*:;code::<code></code>{LEFT 7}
:*:;cb::<codeblock>`n</codeblock>{LEFT 13}
:*:;pcb::<perlcodeblock>`n</perlcodeblock>{LEFT 17}
:*:;scb::<sqlcodeblock>`n</sqlcodeblock>{LEFT 16}
:*:;mri::$MASTER_ROOT_INSTANCE
:*:;ah::$ATHENA_HOME
:*:;scd::SYSTEMCLOSEDATE

:*:;fb::FB
:*:;an::ANALYTICS-
:*:;do::DOPS-
:*:;su::SUP-
:*:;in::INSIGHTS-
:*:;tg::tag:""{LEFT 1}
:*:;ntg::-tag:""{LEFT 1}
:*:;nc::-tag:"-6 Completed"{LEFT 1}