Attribute VB_Name = "SplitMyWorkbook"
Option Explicit
 
Sub SplitSheets()
    Dim Sheet As Worksheet, SheetName$, MyFilePath$, N&
    MyFilePath$ = ActiveWorkbook.Path & "\" & _
    Left(ThisWorkbook.Name, Len(ThisWorkbook.Name) - 4)
    With Application
        .ScreenUpdating = False
        .DisplayAlerts = False
        On Error Resume Next
        MkDir MyFilePath
        For N = 1 To Sheets.Count
            Sheets(N).Activate
            SheetName = ActiveSheet.Name
            Cells.Copy
            Workbooks.Add (xlWBATWorksheet)
            With ActiveWorkbook
                With .ActiveSheet
                    .Paste
                    .Name = SheetName
                    [A1].Select
                End With
                .SaveAs Filename:=MyFilePath _
                & "\" & SheetName & ".xlsx"
                .Close
            End With
            .CutCopyMode = False
        Next
    End With
    Sheet1.Activate
End Sub

