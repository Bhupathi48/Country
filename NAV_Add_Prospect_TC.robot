########################################################################
*** Settings ***
########################################################################
#Library    Selenium2Library
Library    SeleniumLibrary  5  10  run_on_failure=None
Library    Collections
Library    ExcelLibrary
#Library    DatabaseLibrary
Library    robot.libraries.DateTime
Resource    ../Resources/CommonKeywords.robot
Resource    ../Resources/DataVariables/LNT_GlobalVariables.robot
Resource    ../Resources/DataVariables/BrainBox_GlobalVariables.robot
Resource    ../Resources/DataVariables/NAVengers_GlobalVariables.robot
Resource    ../Resources/Locators/LNT_ReUsableLocators.robot
Resource    ../Resources/Locators/BrainBox_ReUsableLocators.robot
Resource    ../Resources/Locators/NAVengers_ReUsableLocators.robot
Resource    ../Resources/Common_ApplicationFlows/Common_ApplicationFlows_Imports.resource
Resource    ../Resources/LNT_ApplicationFlows/LNT_Imports.resource
Resource    ../Resources/BrainBox_ApplicationFlows/BrainBox_Imports.resource
Resource    ../Resources/NAVengers_ApplicationFlows/NAVengers_Imports.resource
Library    ../Resources/UserKeywordsPython.py
#Suite Setup     open excel document  ../POCScript/TestData/NavigatorPOCTestData.xlsx  ${False}
#Library           AutoItLibrary
#Suite Setup     Keyword_SuiteSetup_NAVengers
Suite Setup     Keyword_SuiteSetup_Smoke
Test Teardown   Run Keyword If Test Failed    Keyword_SaveScreenshot  FailedScreenshot
Suite Teardown  Keyword_SuiteTeardown
######################################################################
*** Test Cases ***
########################################################################

TC#8_Dashboard_Add_Prospect_Individual
    [Tags]    NAVengers-TestCases
    set global variable  ${TestCaseID}  TC008
    set global variable  ${TCExecutionStatus}  False
    ${ExecuteTC}  Keyword_ReadCellData  ${NAVDatasheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_Dashboard_Add_Prospect_Individual
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    run keyword if   '${ExecuteTC}' == 'Y'  sleep  120
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder


