; // make this a console program
OpenConsole()

appArgs$ = ""

For n=0 To CountProgramParameters()
  appArgs$ = appArgs$ + " " + ProgramParameter(n)
Next

currentWorkDir$ = ""
exePath$ = ""

If ReadFile(0, "exeAsShortcut.cfg")
  arrayCounter.i = 0
  Dim ConfigArray.s(1)
  While Eof(0) = 0
    ConfigArray(arrayCounter) = ReadString(0)
    arrayCounter = arrayCounter + 1
  Wend
  If CountString(LCase(ConfigArray(0)), "true")
    currentWorkDir$ = GetCurrentDirectory()
  EndIf
  exePath$ = ConfigArray(1)

  CloseFile(0)
Else
  MessageRequester("Information","Couldn't open the file!")
EndIf

pathToExecutable$ = currentWorkDir$ + exePath$

PrintN(currentWorkDir$)
PrintN(exePath$)
x = RunProgram(pathToExecutable$, appArgs$, "")
