*** Settings ***
Library  ExcelLibrary


*** Variables ***
${EXCEL_PATH} =  C:\\development\\robot-scripts\\JobSearch\\Results\\JobSearch.xls
${EXCEL_PATH3} =  C:\\development\\robot-scripts\\JobSearch\\Results\\JobSearch3.xls
${RowNumber} =  1
@{SheetNames}
${ColumnCount}
${RowCount}

*** Keywords ***
Open Excel File
    Open Excel  ${EXCEL_PATH}

Log Results
    [Arguments]  &{RowContents}
    log variables
    @{SheetNames} =  Get Sheet Names
    log many
    ${ColumnCount} =  ExcelLibrary.Get Column Count  Posting
    log  ${ColumnCount}
    ${RowCount} =  ExcelLibrary.Get Row Count  @{SheetNames}[0]
    Log  ${RowCount}
    ExcelLibrary.Put String To Cell  @{SheetNames}[0]  0  ${RowNumber}  ${RowNumber}
    ExcelLibrary.Put String To Cell  Posting  1  ${RowNumber}  2
    ExcelLibrary.Put String To Cell  Posting  3  ${RowNumber}  &{RowContents}[Headline]
    ExcelLibrary.Put String To Cell  Posting  4  ${RowNumber}  &{RowContents}[Location]
    ExcelLibrary.Put String To Cell  Posting  5  ${RowNumber}  &{RowContents}[Pay]
    ExcelLibrary.Put String To Cell  Posting  6  ${RowNumber}  &{RowContents}[Type]
    ExcelLibrary.Put String To Cell  Posting  7  ${RowNumber}  &{RowContents}[URL]

Save Excel File
    Save Excel  ${EXCEL_PATH3}







