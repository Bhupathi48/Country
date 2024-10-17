########################################################################
*** Settings ***
########################################################################
#Library    Selenium2Library
Library    SeleniumLibrary  10  5  run_on_failure=None
Library    ExcelLibrary
Library    Collections
Library    robot.libraries.DateTime
Library    String
Resource    ../CommonKeywords.robot
Resource    ../DataVariables/LNT_GlobalVariables.robot
Resource    ../Locators/LNT_ReUsableLocators.robot
Library    ../UserKeywordsPython.py
#Resource    LaunchApplication.robot
#Resource    ../LNT_ApplicationFlows/OpportunityFlows.robot
#Resource    ../LNT_ApplicationFlows/ProspectFlows.robot
Resource    Common_ApplicationFlows_Imports.resource
Resource    ../NAVengers_ApplicationFlows/NAVengers_Imports.resource
########################################################################
*** Keywords ***
########################################################################

Keyword_BookofBusiness_SearchHH
    [arguments]  ${HHName}
#    Keyword_GoToHomeScreen
    #Click Element  ${Loc_Nav_Home}
    #sleep  5
    wait until element is visible  ${HomeDropdown}   timeout=10  error=Home link is not clickable
    #Click Link  ${HomeDropdown}
#    sleep  5
    Keyword_Restablish_HomePage_Frame
#    ${HHFrame}=  Run Keyword And Return Status  wait until page contains element  ${HomePage_Frame}  timeout=5
#    run keyword if  ${HHFrame}  select frame    ${HomePage_Frame}      # comment this line for old Dashboard
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${HHName}
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${HHName}
    Keyword_NSF_Search_Reestablish_Frame
    ${HHSearch}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${Loc_NSF_SearchResult_First_Entiry}  60  Search Not Successfull
    log to console  ${HHSearch}
    run keyword if  '${HHSearch}'=='False'  Click Element  ${Loc_NSF_QuickSearch_Search_Button}  #//*[@id="refineMessage"]/a[1]
    Wait Until Element Is Visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=60  error=second Search Not Successfull
    run keyword if  '${gEnvironment}' != 'Production'   Keyword_Apply_Filter_Mybookofbusiness
    Wait Until Element Is Visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=60  error=second Search Not Successfull
    Click Element  ${Loc_NSF_SearchResult_First_Entiry}
    log to console  HH search is successfull
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}
    Keyword_SaveScreenshot  HHSearchissuccessful

Keyword_SearchHH
    [arguments]  ${HHName}
#    Keyword_GoToHomeScreen
    #Click Element  ${Loc_Nav_Home}
    #sleep  5
    wait until element is visible  ${HomeDropdown}   timeout=10  error=Home link is not clickable
    Keyword_Restablish_HomePage_Frame
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${HHName}
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${HHName}
    Keyword_NSF_Search_Reestablish_Frame
    Keyword_Wait_for_DataLoad_Spinners_to_Disapper
    ${HHSearch}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${Loc_SearchResult_First_Entiry}  timeout=30  error=Search Not Successful
    log to console  ${HHSearch}
    ${HHSearch_New}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=30  error=Search Not Successful
    log to console  ${HHSearch_New}
#    run keyword if  '${HHSearch}'=='False'  Click Element  ${Loc_QuickSearch_Search_Button}  #//*[@id="refineMessage"]/a[1]
    run keyword if  '${HHSearch}'=='True'  Click Element  ${Loc_SearchResult_First_Entiry}
    run keyword if  '${HHSearch_New}'=='True'  Click Element  ${Loc_NSF_SearchResult_First_Entiry}
    log to console  HH search is successfull
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}
    #wait until element is visible  ${WhatsNewModelWindow}    timeout=10  error=Whats New Modal window did not show up
    #CLICK ELEMENT  ${WhatsNewModelWindow_CloseButton}
    Keyword_SaveScreenshot  HHSearchissuccessful

Keyword_SearchHH_OLD_Dashboard
    [arguments]  ${HHName}
    wait until element is visible  ${Loc_HH_Search_Input_Old}   timeout=10  error=Search Input Text Box is not displayed
    Input Text  ${Loc_HH_Search_Input_Old}  ${HHName}
    press keys  ${Loc_HH_Search_Input_Old}  ENTER


Keyword_Search_Entity
    [arguments]  ${Entity_Details}
    log to console  Entity being Searched-${Entity_Details}
    Keyword_Restablish_HomePage_Frame
#    ${HHFrame}=  Run Keyword And Return Status  wait until page contains element  ${HomePage_Frame}  timeout=30
#    run keyword if  ${HHFrame}  select frame    ${HomePage_Frame}      # comment this line for old Dashboard
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${Entity_Details}
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${Entity_Details}
    ${HHSearch}=  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="resultList"]/li/h4/a  60  Search Not Successfull
    log to console  ${HHSearch}
    run keyword if  ${HHSearch}
    ...  run keywords
    ...  Keyword_SaveScreenshot  HHSearchissuccessful
    ...  AND  log to console  Entity Search was successful in First Attempt
    ...  ELSE  Keyword_QuickSearch_Entity  ${Entity_Details}
    Keyword_SaveScreenshot  HHSearchissuccessful


Keyword_Search_Entity_Blank
    [arguments]  ${Entity_Details}
    log to console  Entity being Searched-${Entity_Details}
    Keyword_Restablish_HomePage_Frame
#    ${HHFrame}=  Run Keyword And Return Status  wait until page contains element  ${HomePage_Frame}  timeout=30
#    run keyword if  ${HHFrame}  select frame    ${HomePage_Frame}      # comment this line for old Dashboard
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${Entity_Details}
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${Entity_Details}
    ${HHSearch_Blank}=  Run Keyword And Return Status  wait until element is not visible  ${Loc_SearchResult_First_Entiry}  timeout=10
    log to console  ${HHSearch_Blank}
    run keyword if  ${HHSearch_Blank}
    ...  run keywords
    ...  Keyword_SaveScreenshot  HHSearch_Blank_issuccessful
    ...  AND  log to console  Entity Search for Blank was successful
    ...  ELSE  Fail  Entity Search for Blank failed and retrived Data

Keyword_NSF_Search_Entity_Blank
    [arguments]  ${Entity_Details}
    log to console  Entity being Searched-${Entity_Details}
    Keyword_Restablish_HomePage_Frame
#    ${HHFrame}=  Run Keyword And Return Status  wait until page contains element  ${HomePage_Frame}  timeout=30
#    run keyword if  ${HHFrame}  select frame    ${HomePage_Frame}      # comment this line for old Dashboard
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${Entity_Details}
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${Entity_Details}
    run keyword if  '${gEnvironment}' == 'Production'  sleep  15
    run keyword if  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  Waiting_SSO_Login_Vanished
    run keyword if  '${gEnvironment}' == 'eINT6'  run keyword and ignore error  Keyword_NSF_Search_Environment_Workaroud
    Keyword_NSF_Search_Reestablish_Frame
    ${HHSearch_Blank}=  Run Keyword And Return Status  wait until element is not visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=10
    log to console  ${HHSearch_Blank}
    run keyword if  ${HHSearch_Blank}
    ...  run keywords
    ...  Keyword_SaveScreenshot  HHSearch_Blank_issuccessful
    ...  AND  log to console  Entity Search for Blank was successful
    ...  ELSE  Fail  Entity Search for Blank failed and retrived Data

Keyword_Validate_No_SearchResults
    log to console  Validating that Search result did not retrun any record
    ${HHSearch_Blank}=  Run Keyword And Return Status  wait until element is not visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=10
    log to console  ${HHSearch_Blank}
    run keyword if  ${HHSearch_Blank}
    ...  run keywords
    ...  Keyword_SaveScreenshot  No_SearchResults
    ...  AND  log to console  Serach result did not retrive any record as expected
    ...  ELSE  Fail  Serach result retrived atleast one record

Keyword_Validate_Search_Success
    log to console  Validating that Search result did not retrun any record
    ${HHSearch_Success}=  Run Keyword And Return Status  wait until element is visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=10
    log to console  ${HHSearch_Success}
    run keyword if  ${HHSearch_Success}
    ...  run keywords
    ...  Keyword_SaveScreenshot  HHSearch_Success
    ...  AND  log to console  Serach result retrived atleast one record
    ...  ELSE  Fail  Serach result did not retrive any record

Keyword_NSF_Search_Reestablish_Frame
    log to console  Reestablishing NSF_Search Frame
    Keyword_Validate_SearchPage_Launched
    ${SearchPageFrame}=  Run Keyword And Return Status  wait until page contains element  ${Loc_Search_Page_iframe}  timeout=10
    run keyword if  ${SearchPageFrame}  select frame    ${Loc_Search_Page_iframe}

Keyword_Validate_SearchPage_Launched
    ${Search_Page}=  Run Keyword And Return Status  wait until element is visible  ${Loc_Search_Page}  timeout=10
    run keyword if  ${Search_Page}
    ...  run keywords
    ...  log to console  Search page is displayed
    ...  AND  Keyword_SaveScreenshot  Search_Page
    ...  ELSE  Fail  Search page is not displayed

Keyword_NSF_Search_OKTA_Authenticaion
    log to console  Performing NSF_Search_OKTA_Authenticaion


Keyword_NSF_Search_Environment_Workaroud
    log to console  This work around will take care of url repositioning to correct environment. specifically meant for eINT6
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    ${SearchResult_url}  get location
    log to console  current search url-${SearchResult_url}
    ${SearchPath}=  fetch from right  ${SearchResult_url}  .net/
    log to console   url to be redirected ${NavWeb_Reroutung_Url_${gEnvironment}}/${SearchPath}
    go to  ${NavWeb_Reroutung_Url_${gEnvironment}}/${SearchPath}
    sleep  5


Keyword_NSF_Search_Entity_Okta
    [arguments]  ${Entity_Details}
    log to console  Entity being Searched-${Entity_Details}
    Keyword_Restablish_HomePage_Frame
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${Entity_Details}
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${Entity_Details}
    run keyword if  '${gEnvironment}' == 'eINT6'  run keyword and ignore error  Keyword_NSF_Search_Environment_Workaroud
    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${FR_EB_uname}  ${FR_EB_password}
    Keyword_NSF_Search_Reestablish_Frame
#    wait until element is visible  ${Loc_Search_Page}  timeout=10  error=Search page is not displayed
#    ${SearchPageFrame}=  Run Keyword And Return Status  wait until page contains element  ${Loc_Search_Page_iframe}  timeout=10
#    run keyword if  ${SearchPageFrame}  select frame    ${Loc_Search_Page_iframe}
    ${HHSearch}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=60
    log to console  ${HHSearch}
    run keyword if  ${HHSearch}
    ...  run keywords
    ...  Keyword_SaveScreenshot  HHSearchissuccessful
    ...  AND  log to console  Entity Search was successful in First Attempt
    ...  ELSE  Keyword_NSF_QuickSearch_Entity  ${Entity_Details}
    Keyword_SaveScreenshot  HHSearchissuccessful

Keyword_NSF_Search_Entity
    [arguments]  ${Entity_Details}
    log to console  Entity being Searched-${Entity_Details}
    Keyword_Restablish_HomePage_Frame
    ${HHSearchInputNew}=  Run Keyword And Return Status  wait until element is visible  ${Loc_HH_Search_Input}   timeout=10
    run keyword if  ${HHSearchInputNew}
    ...  run keywords
    ...  Input Text  ${Loc_HH_Search_Input}  ${Entity_Details}
    ...  AND  Keyword_SaveScreenshot  Search_Input
    ...  AND  press keys  ${Loc_HH_Search_Input}  ENTER
    ...  AND  Keyword_SaveScreenshot  Search_Input_After_Enter
    ...  ELSE  Keyword_SearchHH_OLD_Dashboard  ${Entity_Details}
#    run keyword if  '${gEnvironment}' == 'Production'  log to console  production sleeping for 10 seconds
#    run keyword if  '${gEnvironment}' == 'Production'  sleep  10
#    run keyword if  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  Waiting_SSO_Login_Vanished
#    run keyword if  '${gEnvironment}' == 'eINT6'  run keyword and ignore error  Keyword_NSF_Search_Environment_Workaroud
#    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${FR_EB_uname}  ${FR_EB_password}
    Keyword_NSF_Search_Reestablish_Frame
    ${HHSearch}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${Loc_NSF_SearchResult_First_Entiry}  timeout=60
    log to console  ${HHSearch}
    run keyword if  ${HHSearch}
    ...  run keywords
    ...  Keyword_SaveScreenshot  HHSearchissuccessful
    ...  AND  log to console  Entity Search was successful in First Attempt
    ...  ELSE  Keyword_NSF_QuickSearch_Entity  ${Entity_Details}
    Keyword_SaveScreenshot  HHSearchissuccessful