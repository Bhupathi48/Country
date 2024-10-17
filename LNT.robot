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
TC#1_AddProspectandAddContact
    [Documentation]    TestCase#1_AddProspectandAddContact
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC001
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact

TC#5_AddOpportunity
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC005
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Opportunity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddOpportunity
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder


TC#6_RemoveOpportunity
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC006
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_RemoveOpportunity
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#4_EditContact
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC004
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_EditContact
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#7_EditOpportunity
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set global variable  ${TestCaseID}  TC007
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_EditOpportunity
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Edit Opportunity Test Case Execution
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Cancel_EditOpportunity
    ...  ELSE  log to console  \nEdit Opportunity Flow was not successful , hence skipping Cancell- Edit Opportunity Test Case Execution
    close all browsers

TC#8_DeleteOpportunityClientFolder
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC008
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_DeleteOpportunityClientFolder
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution


TC#9_AddUpdateDeleteActivity
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC009
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Activity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddUpdateDeleteActivity
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder

TC#10_ContactInfoValidation
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC010
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_ContactInfoValidation
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution


TC#11_AddOutreachActivity_Call
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC011
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddOutreachActivity_Call
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution


TC#12_EditOutreachActivity_Call
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC012
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_EditOutreachActivity_Call
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#13_RepInformation
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC013
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_RepInformation
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#14_SalesOpportunities_Viewclientfolder
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC014
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_SalesOpportunities_Viewclientfolder
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#15_ContactInfo_Schedulefollowup_Activity
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC015
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_ContactInfo_Schedulefollowup_Activity_Email
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#16_SalesOpportunities_DragandDrop
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC016
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_SalesOpportunities_DragandDrop
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#17_Client_Specific_SalesOpportunities
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC017
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_Client_Specific_SalesOpportunities
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#18_Validate_LNTLinks
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC018
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_Validate_LNTLinks
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution


TC#019_DeleteProspect_ThroughLNT
    [Documentation]    TestCase#019_DeleteProspect_ThroughLNT
    [Tags]    LNT-TestCases
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


TC#20_AddProspect_LNTFlow
    [Documentation]    TestCase#20_AddProspectThroughLNTFlow
    [Tags]    LNT-TestCases
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

TC#021_Create_CallActivity_FromNewProspects
    [Documentation]    TestCase#021_Create_CallActivity_FromNewProspects
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC021
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Call_Activity}    ${HouseHoldNameFull}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_CallActivity_FromNewProspects   ${HouseHoldNameFull_Add_Call_Activity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_CallActivity_FromNewProspects

TC#022_Create_CallActivity_FromInfoIcon
    [Documentation]    TestCase#022_Create_CallActivity_FromInfoIcon
    [Tags]    LNT-InfoIcon
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC022
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Call_Activity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_CallActivity_FromInfoIcon   ${HouseHoldNameFull_Add_Call_Activity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_CallActivity_FromInfoIcon
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder

TC#023_Create_LogCall_From_NewProspect
    [Documentation]    TestCase#023_Create_LogCall_From_NewProspect
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC023
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_LogCall_Activity}    ${HouseHoldNameFull}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_LogCall_From_NewProspect   ${HouseHoldNameFull_LogCall_Activity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_LogCall_From_NewProspect

TC#24_ProspectReassignment_AOA_User
    [Documentation]    TestCase#024_ProspectReassignment_AOA_User
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC024
    set global variable  ${TCExecutionStatus}  False
    set local variable  ${ProspectToBeReassinged}  ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_ProspectReassignment_AOA_User
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_ProspectReassignment_Data_Reset
    ...  ELSE  log to console  \nProspect Reassignment Failed, hence skipping ProspectReassignment_Data_Reset

TC#25_ProspectReassignment_HO_User
    [Documentation]    TestCase#025_ProspectReassignment_HO_User
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC025
    set global variable  ${TCExecutionStatus}  False
    set local variable  ${ProspectToBeReassinged}  ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_ProspectReassignment_HO_User
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_ProspectReassignment_HOUser_Data_Reset
    ...  ELSE  log to console  \nProspect Reassignment Failed, hence skipping ProspectReassignment_Data_Reset

TC#026_Validate_ContactInfo_FromInfoIcon
    [Documentation]    TestCase#026_Validate_ContactInfo_FromInfoIcon
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC026
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_ContactInfo_InfoIcon}    ${HouseHoldNameFull}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'  Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'  Keyword_InfoIcon_Detail_Page_Validation  ${HouseHoldNameFull_ContactInfo_InfoIcon}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_CallActivity_FromInfoIcon

TC#027_Create_MailActivity_FromNewProspects
    [Documentation]    TestCase#027_Create_MailActivity_FromNewProspects
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC027
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Mail_Activity}    ${HouseHoldNameFull}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_MailActivity_FromNewProspects   ${HouseHoldNameFull_Add_Mail_Activity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_CallActivity_FromNewProspects

TC#28_AddOutreachActivity_Mail
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC028
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddOutreachActivity_Mail
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution


TC#29_EditOutreachActivity_Mail
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC029
    set Test variable  ${Loc_Updated_EmailActivity_MailPiece_Locator}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_EditOutreachActivity_Mail
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#30_AddOutreachActivity_Email
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC030
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddOutreachActivity_Email
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#31_EditOutreachActivity_Email
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC031
    set Test variable  ${Loc_Updated_EmailActivity_MailPiece_Locator}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_EditOutreachActivity_Email
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#032_Create_LogCall_From_InfoIcon
    [Documentation]    TestCase#032_Create_LogCall_From_InfoIcon
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC032
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_LogCall_Activity}    ${HouseHoldNameFull}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_LogCall_From_InfoIcon   ${HouseHoldNameFull_LogCall_Activity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_LogCall_From_InfoIcon

TC#33_AddProspect_Through_Opportunity
    [Documentation]    TestCase#33_AddProspectandAddContact
    [Tags]    LNT-TestCases
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC033
    set local variable  ${AddOpportunity}  True
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect_Through_Opportunity     ${AddOpportunity}
    ...  ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact


TC#34_SalesOpportunity_Kanban_UpdateStatus
    [Documentation]    TestCase#34_SalesOpportunity_Kanban_UpdateStatus
    [Tags]    LNT-Opportunities
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC034
    set local variable  ${AddOpportunity}  True
    set local variable  ${LNTFlow}  False
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Opportunity}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_SalesOpportunities_Kanban_StausUpdate   ${HouseHoldNameFull_Opportunity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping SalesOpportunities_Kanban_StausUpdate
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder   ${HouseHoldNameFull_Opportunity}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder

TC#035_Create_Opportunity_FromNewProspects
    [Documentation]    TestCase#035_Create_Opportunity_FromNewProspects
    [Tags]    LNT-NewProspect_Create_Opportunity
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC035
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Opportunity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_Opportunity_FromNewProspects   ${HouseHoldNameFull_Add_Opportunity}  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_Opportunity_FromNewProspects
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder   ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder

TC#036_LogCall_ThroughAddOpportunity_NewProspects
    [Documentation]    TestCase#036_LogCall_ThroughAddOpportunity_NewProspects
    [Tags]    LNT-NewProspect_LogCall_Through_Opportunity
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC036
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Opportunity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_LogCall_ThroughAddOpportunity_NewProspects   ${HouseHoldNameFull_Add_Opportunity}  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping LogCall_ThroughAddOpportunity_NewProspects
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder   ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder

TC#037_Create_Opportunity_FromInfoIcon
    [Documentation]    TestCase#037_Create_Opportunity_FromInfoIcon
    [Tags]    LNT-NewProspect_InfoCall_Add_Opportunity
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC037
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Opportunity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Create_Opportunity_FromInfoIcon   ${HouseHoldNameFull_Add_Opportunity}  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Create_Opportunity_FromInfoIcon
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder   ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder

TC#038_LogCall_Followedby_AddOpportunity_InfoIconflow
    [Documentation]    TestCase#038_LogCall_Followedby_AddOpportunity_InfoIconflow
    [Tags]    LNT-NewProspect_LogCall_Followedby_AddOpportunity
    set global variable  ${TCExecutionStatus}  False
    set global variable  ${TestCaseID}  TC038
    set local variable  ${AddOpportunity}  False
    set local variable  ${LNTFlow}  False
    set local variable  ${Prospect_Name}
    set local variable  ${ExpectedName_Locator}
    set Test variable  ${HouseHoldNameFull}    ABC
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_AddProspect     ${AddOpportunity}   ${LNTFlow}
    ...  ELSE    log to console  \nExecute Flag is N, skexipping the Test case Execution
    set Test variable  ${HouseHoldNameFull_Add_Opportunity}    ${HouseHoldNameFull}
    set Test variable  ${HouseHoldName_First&Last}    ${HouseHoldName}
    log to console  ${TCExecutionStatus}
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_AddContact
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping add contact contact
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_LogCall_Followedby_AddOpportunity_InfoIconflow  ${HouseHoldNameFull_Add_Opportunity}  ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping LogCall_Followedby_AddOpportunity_InfoIconflow
    run keyword if   '${TCExecutionStatus}' == 'True'    Keyword_Delete_Specific_ClientFolder   ${HouseHoldName_First&Last}
    ...  ELSE  log to console  \nProspect is not added successfully, hence skipping Delete_Specific_ClientFolder



TC#2_Run_Report_Validation
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC002
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_Run_Report_Validation
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#3_MarketingCampaign_Validation
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC003
    set Test variable  ${HBDProspectFound}  False
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_MarketingCampaign_Validation
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#61_RetirementOpportunityCleanUp
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC061
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_RetirementOpportunityCleanUp
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

TC#62_Validate_ExportToExcel_NewProspectPage
    [Tags]    LNT-TestCases
    set global variable  ${TestCaseID}  TC062
    ${ExecuteTC}  Keyword_ReadCellData  ${sheet}  Execute  ${TestCaseID}
    run keyword if   '${ExecuteTC}' == 'Y'  Keyword_Validate_ExportToExcel_NewProspectPage
    ...    ELSE    log to console  \nExecute Flag is N, skipping the Test case Execution

