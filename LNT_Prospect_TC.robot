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
Resource    ../Resources/Locators/LNT_ReUsableLocators.robot
Resource    ../Resources/Common_ApplicationFlows/Common_ApplicationFlows_Imports.resource
Resource    ../Resources/LNT_ApplicationFlows/LNT_Imports.resource
Library    ../Resources/UserKeywordsPython.py
#Suite Setup     open excel document  ../POCScript/TestData/NavigatorPOCTestData.xlsx  ${False}
#Library           AutoItLibrary
Suite Setup     Keyword_SuiteSetup
Test Teardown   Run Keyword If Test Failed    Keyword_SaveScreenshot  FailedScreenshot
Suite Teardown  Keyword_SuiteTeardown
######################################################################
*** Test Cases ***
########################################################################
TC#1_AddProspectandAddUpdateContact
    [Documentation]    TestCase#1_AddProspectandAddContact
    [Tags]    LNT-ProspectFlow
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC001
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_EditContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
        run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_DeleteProspect
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete Prospect Flow

################################################################################################################################
# Below Test case is merged into TC#1
#TC#4_EditContact
#    [Tags]    LNT-ProspectFlow
#    set global variable  ${TestCaseID}  TC004
#    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
#    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_EditContact
#    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

################################################################################################################################

TC#019_DeleteProspect_ThroughLNT
    [Documentation]    TestCase#019_DeleteProspect_ThroughLNT
    [Tags]    LNT-ProspectFlow
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC019
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFullToBeDeleted}    ${HouseHoldNameFull}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Prospect_ThroughLNT   ${HouseHoldNameFullToBeDeleted}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping DeleteProspect_ThroughLNT

################################################################################################################################

TC#20_AddProspect_LNTFlow
    [Documentation]    TestCase#20_AddProspectThroughLNTFlow
    [Tags]    LNT-ProspectFlow
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC020
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  True
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact


################################################################################################################################

TC#33_AddProspect_Through_Opportunity
    [Documentation]    TestCase#33_AddProspectandAddContact
    [Tags]    LNT-ProspectFlow
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC033
    set local variable  ${AddOpportunity}  True
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect_Through_Opportunity     ${AddOpportunity}
    ...  ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact