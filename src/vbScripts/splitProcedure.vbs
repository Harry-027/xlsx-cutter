Dim args, objExcel, WshShell, strCurDir

Set args = wscript.Arguments
Set objExcel = CreateObject("Excel.Application")

Set WshShell = CreateObject("WScript.Shell")
strCurDir    = WshShell.CurrentDirectory

objExcel.workbooks.open args(0)
objExcel.visible = True
objExcel.ActiveWorkbook.VBProject.VBComponents.Import strCurDir & "\vbScripts\splitWorkbook.bas"
objExcel.Run "SplitSheets"
objExcel.ActiveWorkbook.Close(0)
objExcel.Quit