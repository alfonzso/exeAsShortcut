; // make this a console program
OpenConsole()

; Result$ = ProgramParameter()

appArgs$ = ""

For n=0 To CountProgramParameters()
  ; PrintN(ProgramParameter(n))
  appArgs$ = appArgs$ + " " + ProgramParameter(n)
Next

; Debug Result$
PrintN("This is quite a long string." + appArgs$)
; // specify path to another executable
currentWorkDir$ = ""
exePath$ = ""

If ReadFile(0, "exeAsShortcut.cfg")   ; if the file could be read, we continue...
  whileIdx.i = 0
  Dim MyArray.s(1)
  While Eof(0) = 0            
    MyArray(whileIdx) = ReadString(0)
    whileIdx = whileIdx + 1
  Wend
  If CountString(LCase(MyArray(0)), "true")
    currentWorkDir$ = GetCurrentDirectory()
  EndIf
  exePath$ = MyArray(1)
    
  CloseFile(0)               ; close the previously opened file
Else
  MessageRequester("Information","Couldn't open the file!")
EndIf

pathToExecutable$ = currentWorkDir$ + exePath$

; Debug pathToExecutable$;
PrintN(currentWorkDir$)
PrintN(exePath$)
; // use RunProgram to launch another executable
x = RunProgram(pathToExecutable$, appArgs$, "")

; IDE Options = PureBasic 6.00 LTS (Windows - x64)
; CursorPosition = 18
; FirstLine = 13
; EnableXP
; DPIAware
; Executable = keke.exe
; CommandLine = "-d ffefefef"