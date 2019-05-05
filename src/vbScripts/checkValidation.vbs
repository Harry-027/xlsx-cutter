Dim args, objExcel
Set args = wscript.Arguments
Set objExcel = CreateObject("Excel.Application")
objExcel.workbooks.open args(0)
Dim VBC
Set VBC = objExcel.ActiveWorkbook.VBproject
On Error GoTo 0
objExcel.Quit
