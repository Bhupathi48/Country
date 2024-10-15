########################################################################
*** Settings ***
########################################################################
#Library    Selenium2Library
Library    SeleniumLibrary  10  5  run_on_failure=None
Library    ExcelLibrary
Library    Collections
Library    robot.libraries.DateTime
Library    String
Resource    CommonKeywords.robot
Resource    DataVariables/LNT_GlobalVariables.robot
Resource    Locators/LNT_ReUsableLocators.robot
Library    UserKeywordsPython.py
Resource    Common_ApplicationFlows/LaunchApplication.robot
Resource    LNT_ApplicationFlows/OpportunityFlows.robot
Resource    LNT_ApplicationFlows/ProspectFlows.robot
Resource    Common_ApplicationFlows/SearchHH.robot
########################################################################
*** Variables ***
########################################################################
${row_Count}  0
${rowFlag}  0
${colFlag}  0
${RANGEVAL}  1
########################################################################
*** Keywords ***
########################################################################
Keyword_GetCurrentDateTime
    ${currenttime}    Get Current Date    result_format=%y_%b_%d %H_%M_%S
    set global variable  ${timestamp}  ${currenttime}
    set global variable  ${TestCaseID}
#saves screenshot with timestamp
Keyword_SaveScreenshot
    [Arguments]  ${ScreenshotName}
    Keyword_GetCurrentDateTime
    Capture Page Screenshot     ${TestCaseID} _${ScreenshotName}_${timestamp}.png

Keyword_Window_SaveScreenshot
    [Arguments]  ${ScreenshotName}
    Keyword_GetCurrentDateTime
    Capture Element Screenshot  //html  ${TestCaseID} _${ScreenshotName}_${timestamp}.png
        
Keyword_OpenExcel
    open excel document  ${TestData_Path}  ${False}
Keyword_ReadCellData
    [Arguments]  ${sheetname}  ${ColumnName}  ${TCID}
    ${Sheet1} =      Read Excel Row  1
    ${index}  Get Length  ${Sheet1}
    ${rowVal}  Keyword_GetRowVal  ${sheetname}  ${TCID}
    FOR     ${col}  IN RANGE  0  ${index}
#        log to console  column ${col} value is ${Sheet1}[${col}]
         EXIT FOR LOOP IF  '${Sheet1}[${col}]'=='${ColumnName}'
    END
    ${col}  Evaluate  ${col}+1
#    log to console  ${rowVal}
#    log to console  ${col}
    ${cellValue}  read excel cell  ${rowVal}   ${col}   ${sheetname}
#    log to console  ${cellValue}
    [return]  ${cellValue}

Keyword_GetRowVal
    [Arguments]  ${sheetname}  ${TestCaseID}
    ${Sheet2} =   read excel column  col_num=1  sheet_name=${sheetname}
    ${rowindex}  Get Length  ${Sheet2}
    FOR     ${row}    IN RANGE  0  ${rowindex}
#        log to console  row ${row} value is ${Sheet2}[${row}]
         EXIT FOR LOOP IF  '${Sheet2}[${row}]'=='${TestCaseID}'
    END
    ${row}  Evaluate  ${row}+1
    [return]  ${row}

Keyword_CreateFolder
        Keyword_GetCurrentDateTime
        create folder   ${ResultDirPath}\\${timestamp}
        Set Screenshot Directory  ${output_dir}
Keyword_SuiteSetup
    Set Library Search Order    SeleniumLibrary     UserLibraries
    ${resultsFolderName}=   UserKeywordsPython.create Test Result Folder
    log to console  resultsFolderName=${resultsFolderName}
    run keyword if  '${RunfromGIT}' == 'Y'
    ...  run keywords
    ...  Set Screenshot Directory  ../LNT-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  ${CURDIR}/TestData/NavigatorPOCTestData.xlsx   ${False}
    ...  AND  set variable  ${downloadDir}  ../LNT-TestCases/results/${resultsFolderName}
    ...  ELSE
    ...  run keywords
    ...  Set Screenshot Directory  ../LNT-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  C:\\NavPOCScript\\POCScript\\TestData\\NavigatorPOCTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../LNT-TestCases/results/${resultsFolderName}

Keyword_SuiteSetup_BrainBox
    Set Library Search Order    UserLibraries   SeleniumLibrary
    ${resultsFolderName}=   UserKeywordsPython.create Test Result Folder
    log to console  resultsFolderName=${resultsFolderName}
    run keyword if  '${RunfromGIT}' == 'Y'
    ...  run keywords
    ...  Set Screenshot Directory  ../BrainBox-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  ${CURDIR}/TestData/BrainBoxTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../BrainBox-TestCases/results/${resultsFolderName}
    ...  ELSE
    ...  run keywords
    ...  Set Screenshot Directory  ../BrainBox-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  C:\\NavPOCScript\\POCScript\\TestData\\BrainBoxTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../BrainBox-TestCases/results/${resultsFolderName}

Keyword_SuiteSetup_Smoke
    Set Library Search Order    UserLibraries   SeleniumLibrary
    ${resultsFolderName}=   UserKeywordsPython.create Test Result Folder
    log to console  resultsFolderName=${resultsFolderName}
    run keyword if  '${RunfromGIT}' == 'Y'
    ...  run keywords
    ...  Set Screenshot Directory  ../Smoke-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  ${CURDIR}/TestData/NAVengersTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../Smoke-TestCases/results/${resultsFolderName}
    ...  ELSE
    ...  run keywords
    ...  Set Screenshot Directory  ../Smoke-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  C:\\NavPOCScript\\POCScript\\TestData\\NAVengersTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../Smoke-TestCases/results/${resultsFolderName}

Keyword_SuiteSetup_BrainBox_old
    Set Library Search Order    UserLibraries   SeleniumLibrary
    ${resultsFolderName}=   UserKeywordsPython.create Test Result Folder
    log to console  resultsFolderName=${resultsFolderName}
    run keyword if  '${RunfromGIT}' == 'Y'
    ...  run keywords
    ...  SeleniumLibrary.Set Screenshot Directory  ../BrainBox-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  ${CURDIR}/TestData/BrainBoxTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../BrainBox-TestCases/results/${resultsFolderName}
    ...  ELSE
    ...  run keywords
    ...  SeleniumLibrary.Set Screenshot Directory  ../BrainBox-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  C:\\NavPOCScript\\POCScript\\TestData\\BrainBoxTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../BrainBox-TestCases/results/${resultsFolderName}


Keyword_SuiteSetup_NAVengers
    Set Library Search Order    SeleniumLibrary     UserLibraries
    ${resultsFolderName}=   UserKeywordsPython.create Test Result Folder
    log to console  resultsFolderName=${resultsFolderName}
    run keyword if  '${RunfromGIT}' == 'Y'
    ...  run keywords
    ...  Set Screenshot Directory  ../NAVengers-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  ${CURDIR}/TestData/NAVengersTestData.xlsx  ${False}
     ...  AND  set variable  ${downloadDir}  ../NAVengers-TestCases/results/${resultsFolderName}
    ...  ELSE
    ...  run keywords
    ...  Set Screenshot Directory  ../NAVengers-TestCases/results/${resultsFolderName}
    ...  AND  open excel document  C:\\NavPOCScript\\POCScript\\TestData\\NAVengersTestData.xlsx  ${False}
    ...  AND  set variable  ${downloadDir}  ../NAVengers-TestCases/results/${resultsFolderName}

Keyword_SuiteTeardown
    log to console  Suite Teardown started
    close all excel documents


Keyword_Download_Should_Be_Done
    [Arguments]    ${directory}
    [Documentation]    Verifies that the directory has only one folder and it is not a temp file.
    ...
    ...    Returns path to the file
    ${files}    List Files In Directory    ${directory}
    Length Should Be    ${files}    1    Should be only one file in the download folder
    Should Not Match Regexp    ${files[0]}    (?i).*\\.tmp    Chrome is still downloading a file
    ${file}    Join Path    ${directory}    ${files[0]}
    Log    File was successfully downloaded to ${file}
    log to console    File was successfully downloaded to ${file}
    [Return]    ${file}    

Keyword_CurrentDate_Required_Fromat
    [Arguments]    ${Date_Format}   # %m/%d/%Y  %Y-%m-%d
    ${Date_Today}=  robot.libraries.DateTime.Get Current Date  Local  exclude_millis=yes
#    ${Date_Today}=  robot.libraries.DateTime.Get Current Date  UTC  exclude_millis=yes
    log to console  TodatsDate-${Date_Today}
    ${converted_Date}=  Convert Date  ${Date_Today}  result_format=${Date_Format}
    log to console  ConvertedDate-${converted_Date}
    [Return]    ${converted_Date}

Keyword_ConvertDate_%m/%d/%Y_Format
    [Arguments]    ${Date}
    ${converted_Date}=  Convert Date  ${Date}  result_format=%m/%d/%Y
    log to console  ConvertedDate-${converted_Date}
    [Return]    ${converted_Date}

Keyword_ConvertDate_%Y-%m-%d_Format
    [Arguments]    ${Date}
    ${converted_Date}=  Convert Date  ${Date}  result_format=%Y-%m-%d
    log to console  ConvertedDate-${converted_Date}
    [Return]    ${converted_Date}

Keyword_ConvertDate_%Y-%m-%d_Format_From_Source_Fromat
    [Arguments]    ${Date}  ${Source_Date_Format}
    ${converted_Date}=  Convert Date  ${Date}  result_format=%Y-%m-%d  date_format=${Source_Date_Format}  exclude_millis=yes
    log to console  ConvertedDate-${converted_Date}
    [Return]    ${converted_Date}

Keyword_AddDaysTimes_%Y-%m-%d_Format
    [Arguments]    ${Date}  ${Days_Time_To_Add}
    ${New_Date}  add time to date  ${Date}  ${Days_Time_To_Add}
    log to console  ConvertedDate-${New_Date}
    [Return]    ${New_Date}

Keyword_SubtractDaysTimes_%Y-%m-%d_Format
    [Arguments]    ${Date}  ${Days_Time_To_Subtract}
    ${New_Date}  subtract time from date  ${Date}  ${Days_Time_To_Subtract}
    log to console  ConvertedDate-${New_Date}
    [Return]    ${New_Date}

Keyword_Generate_Date_%m/%d/%Y_Last_XX_days
    [Arguments]    ${Days}
    ${Last_Review_Date_%Y-%m-%d_Format}  Keyword_CurrentDate_Required_Fromat  %Y-%m-%d
    log to console  Number of days to be subtracted from current date-${Days}
    ${New_Last_Review_Date_%Y-%m-%d_Format}=  Keyword_SubtractDaysTimes_%Y-%m-%d_Format  ${Last_Review_Date_%Y-%m-%d_Format}  ${Days} days
    ${New_Last_Review_Date_%m/%d/%Y_Format}=  Keyword_ConvertDate_%m/%d/%Y_Format  ${New_Last_Review_Date_%Y-%m-%d_Format}
    [Return]    ${New_Last_Review_Date_%m/%d/%Y_Format}

Keyword_Generate_RandomDate_%m/%d/%Y_Last_10_days
    ${Last_Review_Date_%Y-%m-%d_Format}  Keyword_CurrentDate_Required_Fromat  %Y-%m-%d
    ${Random_Days}=  generate random string  1  123456789
    log to console  Number of days to be subtracted from current date-${Random_Days}
    ${New_Last_Review_Date_%Y-%m-%d_Format}=  Keyword_SubtractDaysTimes_%Y-%m-%d_Format  ${Last_Review_Date_%Y-%m-%d_Format}  ${Random_Days} days
    ${New_Last_Review_Date_%m/%d/%Y_Format}=  Keyword_ConvertDate_%m/%d/%Y_Format  ${New_Last_Review_Date_%Y-%m-%d_Format}
    [Return]    ${New_Last_Review_Date_%m/%d/%Y_Format}

Keyword_Generate_Date_%m/%d/%Y_Next_10_days
    ${Last_Review_Date_%Y-%m-%d_Format}  Keyword_CurrentDate_Required_Fromat  %Y-%m-%d
    ${Random_Days}=  generate random string  1  123456789
    log to console  Number of days to be subtracted from current date-${Random_Days}
    ${New_Last_Review_Date_%Y-%m-%d_Format}=  Keyword_SubtractDaysTimes_%Y-%m-%d_Format  ${Last_Review_Date_%Y-%m-%d_Format}  ${Random_Days} days
    ${New_Last_Review_Date_%m/%d/%Y_Format}=  Keyword_ConvertDate_%m/%d/%Y_Format  ${New_Last_Review_Date_%Y-%m-%d_Format}
    [Return]    ${New_Last_Review_Date_%m/%d/%Y_Format}

Keyword_Generate_RandomDate_%m/%d/%Y_Last_10_days_from_Specific_Date_OLD
    ${Last_Review_Date_%Y-%m-%d_Format}  Keyword_CurrentDate_Required_Fromat  %Y-%m-%d
    ${Random_Days}=  generate random string  1  123456789
    log to console  Number of days to be subtracted from current date-${Random_Days}
    ${New_Last_Review_Date_%Y-%m-%d_Format}=  Keyword_SubtractDaysTimes_%Y-%m-%d_Format  ${Last_Review_Date_%Y-%m-%d_Format}  ${Random_Days} days
    ${New_Last_Review_Date_%m/%d/%Y_Format}=  Keyword_ConvertDate_%m/%d/%Y_Format  ${New_Last_Review_Date_%Y-%m-%d_Format}
    [Return]    ${New_Last_Review_Date_%m/%d/%Y_Format}

Keyword_Generate_RandomDate_%m/%d/%Y_Last_10_days_from_Specific_Date
    [Arguments]    ${Date}
    ${Last_Review_Date_%Y-%m-%d_Format}  Keyword_ConvertDate_%Y-%m-%d_Format_From_Source_Fromat  ${Date}   %m/%d/%Y
    ${Random_Days}=  generate random string  1  11111111
    log to console  Number of days to be subtracted from current date-${Random_Days}
    ${New_Last_Review_Date_%Y-%m-%d_Format}=  Keyword_AddDaysTimes_%Y-%m-%d_Format  ${Last_Review_Date_%Y-%m-%d_Format}  ${Random_Days} days
    ${New_Last_Review_Date_%m/%d/%Y_Format}=  Keyword_ConvertDate_%m/%d/%Y_Format  ${New_Last_Review_Date_%Y-%m-%d_Format}
    [Return]    ${New_Last_Review_Date_%m/%d/%Y_Format}


