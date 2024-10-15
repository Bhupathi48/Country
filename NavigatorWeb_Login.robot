*** Settings ***
Library    Collections

*** Variables ***

# OpenAM URLs and Host - Navigator Web Login Link
${OpenAM_Url_eINT1}  https://amint.countrypassport.net
${OpenAM_Url_eINT2}  https://amint.countrypassport.net
${OpenAM_Url_eINT3}  https://amint.countrypassport.net
${OpenAM_Url_eINT4}  https://amint.countrypassport.net
${OpenAM_Url_eINT5}  https://amint.countrypassport.net
${OpenAM_Url_eINT6}  https://amint.countrypassport.net
${OpenAM_Url_eQA}  https://access.countrypassport.net
${OpenAM_Url_ePreProd}  https://access.countrypassport.net
${OpenAM_Url_Production}  https://access.countrypassport.com
${AzureWebsites_OpenAM_Url_eQA}  https://voicecapture-np.azurewebsites.net

${Host_eINT1}  amint.countrypassport.net
${Host_eINT2}  amint.countrypassport.net
${Host_eINT3}  amint.countrypassport.net
${Host_eINT4}  amint.countrypassport.net
${Host_eINT5}  amint.countrypassport.net
${Host_eINT6}  amint.countrypassport.net

${Host_eQA}  access.countrypassport.net
${Host_ePreProd}  access.countrypassport.net
${Host_Production}   access.countrypassport.com
${Host_Azurewebsites_eQA}  voicecapture-np.azurewebsites.net

# Environment URLs - Navigator Web Login Link
${urlWebeINT1_Inactive}      https://navigatorint1-inactive.countrypassport.net
${urlWebeINT2_Inactive}      https://navigatorqa3-inactive.countrypassport.net
${urlWebeINT3_Inactive}      https://navigatorint3-inactive.countrypassport.net
${urlWebeINT4_Inactive}      https://navigatorint4-inactive.countrypassport.net  
${urlWebeINT5_Inactive}      https://navigatorint5-inactive.countrypassport.net
${urlWebINT6_Inactive}       https://navigatorint6-inactive.countrypassport.net
${urlWebeQA_Inactive}        https://navigatorqa-inactive.countrypassport.net
${urlWebePreProd_Inactive}   https://navigatorqa2-inactive.countrypassport.net
${urlWebProd_Inactive}       https://navigator-inactive.countrypassport.com
${Dashboard_Url_Production_Inactive}  https://navigator.countrypassport.com

${urlWebeINT1_Active}      https://navigatorint1.countrypassport.net 
${urlWebeINT2_Active}      https://navigatorqa3.countrypassport.net
${urlWebeINT3_Active}      https://navigatorint3.countrypassport.net
${urlWebeINT4_Active}      https://navigatorint4.countrypassport.net
${urlWebeINT5_Active}      https://navigatorint5.countrypassport.net
${urlWebINT6_Active}       https://navigatorint6.countrypassport.net
${urlWebeQA_Active}        https://navigatorqa.countrypassport.net
${urlWebePreProd_Active}   https://navigatorqa2.countrypassport.net
${urlWebProd_Active}       https://navigator.countrypassport.com
${Dashboard_Url_Production_Active}  https://navigator.countrypassport.com

# Environment URLs - Navigator Web Login Link
${urlWebeINT1}      https://navigatorint1.countrypassport.net
${urlWebeINT2}      https://navweb-qa3.intapps.cloud.countrypassport.net
${urlWebeINT3}      https://navweb-int3.intapps.cloud.countrypassport.net
${urlWebeINT4}      https://navweb-int4.intapps.cloud.countrypassport.net
${urlWebeINT5}      https://navweb-int5.intapps.cloud.countrypassport.net
${urlWebINT6}       https://navigatorint1.countrypassport.net
${urlWebeQA}        https://navigatorqa.countrypassport.net
${urlWebePreProd}   https://navigatorqa2.countrypassport.net
${urlWebProd}       https://navigator.countrypassport.com

${NavWeb_Reroutung_Url_eINT6}  https://navigatorint6.countrypassport.net

${url_CF.com_eQA}   https://qa.countryfinancial.net/  # refer latest link here https://wiki/mediawiki/index.php?title=Passport
${url_CF.com_eINT1}   https://int1.countryfinancial.net/  # refer latest link here https://wiki/mediawiki/index.php?title=Passport
${url_CF.com_eINT2}   https://int2.countryfinancial.net/  # refer latest link here https://wiki/mediawiki/index.php?title=Passport
${url_CF.com_eINT3}   https://int3.countryfinancial.net/  # refer latest link here https://wiki/mediawiki/index.php?title=Passport
${url_CF.com_eINT4}   https://int4.countryfinancial.net/  # refer latest link here https://wiki/mediawiki/index.php?title=Passport
${url_CF.com_Production}   https://www.countryfinancial.com/  # refer latest link here https://wiki/mediawiki/index.php?title=Passport

${url_CF.com_Referral_eQA}    https://qa.countryfinancial.net/en/landing/refer-a-friend.html?producerNumber=04347  #https://qa.countryfinancial.net/en/landing/refer-a-friend.html
${url_CF.com_SearchRep_eQA}   https://qa.countryfinancial.net/services/forms?configNodePath=%2Fcontent%2Fcfin%2Fen%2Fjcr%3Acontent%2FrepLocator&cfLang=en&repSearchType=queryByName&latitude=&longitude=&repSearchValue=Eric+Blankenship
${url_CF.com_Referral_eINT1}  https://qa.countryfinancial.net/en/josh-test.html
${url_CF.com_Referral_eINT2}  https://qa.countryfinancial.net/en/josh-test.html
${url_CF.com_Referral_eINT3}  https://qa.countryfinancial.net/en/josh-test.html
${url_CF.com_Referral_eINT4}  https://qa.countryfinancial.net/en/josh-test.html
${url_CF.com_Referral_Production}  https://qa.countryfinancial.net/en/josh-test.html

${Navesig-frontend_url_eINT1}  https://esig-frontend-int1.agencypub.countrypassport.net
${Navesig-frontend_url_eINT2}  https://esig-frontend-int2.agencypub.countrypassport.net
${Navesig-frontend_url_eINT3}  https://esig-frontend-int3.agencypub.countrypassport.net
${Navesig-frontend_url_eINT4}  https://esig-frontend-int4.agencypub.countrypassport.net
${Navesig-frontend_url_eINT5}  https://esig-frontend-int5.agencypub.countrypassport.net
${Navesig-frontend_url_eINT6}  https://esig-frontend-int6.agencypub.countrypassport.net
${Navesig-frontend_url_eQA}  https://esig-frontend-qa.agencypub.countrypassport.net
${Navesig-frontend_url_ePreProd}  https://esig-frontend-qa2.agencypub.countrypassport.net
${Navesig-frontend_url_Production}  https://esig-frontend-prod.agencypub.countrypassport.com   #https://navesig-frontend-prod.apps.cloud.countrypassport.com   https://esig-frontend-prod.agencypub.countrypassport.com

${Url_VoiceCapture_eQA}  https://voicecapture-np.azurewebsites.net/Voicecapture/Voicecapture.aspx?userId=ID46200&claimNumber=6500000207
${Url_Azure_Portal}  https://portal.azure.com
${Url_VC_Azure_SavetoCM_eQA}  https://voicecapture-np.azurewebsites.net/Handler.svc/SaveToCM
${Url_VC_Azure_SavetoCM_Production}  https://voicecapture-prod.azurewebsites.net/Handler.svc/SaveToCM
${Fetch_Redis_Url_eQA}  https://cers-nice-qa.intapps.cloud.countrypassport.net
${VoiceCapture_Submission_Url_eQA}  https://voicecapture-np.azurewebsites.net

${Url_ClaimCenter_eQA}  https://claimcenterqa.countrypassport.net/cc/ClaimCenter.do
${Url_ClaimCenter_Production}  https://claimcenter.countrypassport.com/cc/ClaimCenter.do

${Dashboard_Url_eINT1}  https://navdashboard-frontend-int1.agencypub.countrypassport.net/  #https://navdashboard-int1.apps.cloud.countrypassport.net/  #https://navweb-int1.intapps.cloud.countrypassport.net/home  #https://navdashboard-int1.apps.cloud.countrypassport.net/
${Dashboard_Url_eINT2}  https://navdashboard-frontend-qa3.agencypub.countrypassport.net/
${Dashboard_Url_eINT3}  https://navdashboard-frontend-int3.agencypub.countrypassport.net/
${Dashboard_Url_eINT4}  https://navdashboard-frontend-int4.agencypub.countrypassport.net/
${Dashboard_Url_eINT5}  https://navdashboard-frontend-int5.agencypub.countrypassport.net/
${Dashboard_Url_eINT6}  https://navdashboard-frontend-int6.agencypub.countrypassport.net/
${Dashboard_Url_eQA}  https://navigatorqa.countrypassport.net
${Dashboard_Url_ePreProd}  https://navigatorqa2.countrypassport.net
${Dashboard_Url_Production}  https://navigator.countrypassport.com

${navwshandler_eINT1}  https://navwshandler-int1.agency.countrypassport.net
${navwshandler_eINT2}  https://navwshandler-int2.agency.countrypassport.net
${navwshandler_eINT3}  https://navwshandler-int3.agency.countrypassport.net
${navwshandler_eINT4}  https://navwshandler-int4.agency.countrypassport.net
${navwshandler_eINT5}  https://navwshandler-int5.agency.countrypassport.net
${navwshandler_eINT6}  https://navwshandler-int6.agency.countrypassport.net
${navwshandler_eQA}  https://navwshandler-qa.agency.countrypassport.net
${navwshandler_ePreProd}  https://navwshandler-qa2.agency.countrypassport.net
${navwshandler_Production}  https://navwshandler-prod.agency.countrypassport.com

${COOP_URL_eQA}  https://coopqa.countrypassport.net
${COOP_URL_eINT1}  https://coop-int1.marketing.countrypassport.net/coop   #https://coop-int1.intapps.cloud.countrypassport.net/coop
${COOP_URL_eINT3}  https://coop-int3.intapps.cloud.countrypassport.net/coop
${COOP_URL_Production}  https://coop.countrypassport.com


${Passport_URL_eINT1}  https://int.countrypassport.net/
${Passport_URL_eINT2}  https://int.countrypassport.net/
${Passport_URL_eINT3}  https://int.countrypassport.net/
${Passport_URL_eINT4}  https://int.countrypassport.net/
${Passport_URL_eINT5}  https://int.countrypassport.net/
${Passport_URL_eINT6}  https://int.countrypassport.net/
${Passport_URL_eQA}  https://qa.countrypassport.net/
${Passport_URL_ePreProd}  https://supp.countrypassport.net/CountryPassport/SiteController
${Passport_URL_Production}  https://qa.countrypassport.net/

${NAV_Search_URL_Production}  https://navigator.countrypassport.com/search?q=anderson&po=false
${NSF_Search_URL_Production}  https://navsearch-frontend-prod.apps.cloud.countrypassport.com/main?search=Anderson&po=

${AMS_Identifity_URL_eQA}  https://identity.countrypassport.com/login/default
${Identifity_URL_Production}  https://identity.countrypassport.com/login/default

${CompensationGridMetrics_Url}  https://tableau.countrypassport.com/t/agency/views/CompensationGridMetrics/LandingPage?iframeSizedToWindow=true&%3Aembed=yes&%3Atabs=no#1
${PremiumCommissionHistory_Url}  https://tableau.countrypassport.com/#/site/agency/views/PremiumCommissionReports/HomePage

#Valid values for browser (Please refer to https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Open%20Browser)
${browser}  chrome
${browserOptions}  None

#Valid values for environment -> DEV1, DEV2, eINT1, eINT2, eINT3, eINT4, eINT5, eINT6, eQA, ePreProd, Production
${gEnvironment}=  eINT1
#Valid values for environment Toggle -> Inactive  Active
${gEnvironment_Toggle}=  Active

#list of Environments with NavUI changes
@{NavUIChangeEnvironments}=   eINT1    eINT2    eINT6    eQA    eINT3    eINT4    eINT5    ePreProd
@{INT_Environments}=   eINT1    eINT3    eINT4    eINT5    eINT6
@{NonDashbaord_INT_Environments}=   eINT1   eINT2    eINT3    eINT4    eINT5
@{COOP_Test_Environments}=   eINT1    eINT3    eQA
@{NavWeb_Okta_Test_Environments}=   eINT1    eINT2    eINT6    eQA    eINT3     eINT5    ePreProd   eINT4

#Valid values for testing appraoch -> DirectLink, NavWeb, NavThick
${gTestingApproach}=  NavWeb

#timeout configs
${retry_times}    3 times
${retry_interval}    2s

### Support URLs to login to production
${urlWebProd_wiki}             https://wiki/mediawiki/index.php?title=AccessManagement_OpenAM_ProdAlternateCredentials
${urlWebProd_OpenAM}           https://access.countrypassport.com/sso/XUI/?goto=https%3A%2F%2Faccess.countrypassport.com%2Fsso%2FUI%2FLogin%3Fservice%3DldapService#logout/

# Navigator Web screen
${NavWeb_Login_CountryID}   //input[@id='idToken1']
${NavWeb_Login_Password}    //input[@id='idToken2']
${NavWeb_Login_LoginButton}   //input[@id='loginButton_0']

*** Keywords ***
Keyword_NavigatorWeb_Login
    [Documentation]  Logs in to NavWeb as Financial Rep
    Run Keyword If    '${gEnvironment}' == 'Production'     Keyword_Login_to_Production_as_Financial_Rep
    ...   ELSE
    ...   Run Keywords
    ...   Keyword_Setup_NavWeb_Link_In_Test_Environment
    ...   AND    Keyword_Enter_Login_Credentials_for_Initiator

Keyword_NavigatorWeb_Login_UW
    [Documentation]  Logs in to NavThin as a Underwriter
    Keyword_Setup_NavWeb_Link_In_Test_Environment
    Keyword_Enter_Login_Credentials_for_Underwriter


####--------------------------------------- Submodules ------------------------------------------------------------------

Keyword_Get_Environment_NavWeb_Link
    [Documentation]  Helper Keyword. Returns NavThin URL for respective environment. Valid arguments are eINT[1-5], eQA, ePreProd
    [Arguments]  ${env}
    Run Keyword If    '${gEnvironment_Toggle}' == 'Active'     Log To Console  Seting up Launching Active URL
    ...  ELSE  Log To Console  Setiing up Launching Inactive URL
    Run Keyword If    $env == 'eINT1'        Return From Keyword    ${urlWebeINT1_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'eINT2'        Return From Keyword    ${urlWebeINT2_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'eINT3'        Return From Keyword    ${urlWebeINT3_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'eINT4'        Return From Keyword    ${urlWebeINT4_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'eINT5'        Return From Keyword    ${urlWebeINT5_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'eINT6'        Return From Keyword    ${urlWebINT6_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'eQA'          Return From Keyword    ${urlWebeQA_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'ePreProd'     Return From Keyword    ${urlWebePreProd_${gEnvironment_Toggle}}
    ...    ELSE IF    $env == 'Production'     Return From Keyword    ${urlWebProd_OpenAM}

Keyword_Get_Environment_NavWeb_Link_old
    [Documentation]  Helper Keyword. Returns NavThin URL for respective environment. Valid arguments are eINT[1-5], eQA, ePreProd
    [Arguments]  ${env}
    Run Keyword If    $env == 'eINT1'        Return From Keyword    ${urlWebeINT1}
    ...    ELSE IF    $env == 'eINT2'        Return From Keyword    ${urlWebeINT2}
    ...    ELSE IF    $env == 'eINT3'        Return From Keyword    ${urlWebeINT3}
    ...    ELSE IF    $env == 'eINT4'        Return From Keyword    ${urlWebeINT4}
    ...    ELSE IF    $env == 'eINT5'        Return From Keyword    ${urlWebeINT5}
    ...    ELSE IF    $env == 'eINT6'        Return From Keyword    ${urlWebINT6}
    ...    ELSE IF    $env == 'eQA'          Return From Keyword    ${urlWebeQA}
    ...    ELSE IF    $env == 'ePreProd'     Return From Keyword    ${urlWebePreProd}
    ...    ELSE IF    $env == 'Production'     Return From Keyword    ${urlWebProd_OpenAM}

Keyword_Login_to_Production_as_Financial_Rep
    [Documentation]  Helper Keyword. This Keyword is used to Login to Production environment as Financial Rep (NavWeb)
    OPEN BROWSER   ${urlWebProd_wiki}  ${browser}   options=${browserOptions}
    maximize browser window
    Delete All Cookies
    Go To  ${urlWebProd_OpenAM}
    Keyword_Enter_Login_Credentials_for_Initiator
    Go To  ${urlWebProd}

Keyword_Setup_NavWeb_Link_In_Test_Environment
    [Documentation]  Helper Keyword. This Keyword is used to launch Navigator Web in terms of environments under test
    ${launch_url}=  Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    OPEN BROWSER  ${launch_url}  ${browser}   options=${browserOptions}
    maximize browser window

Keyword_Enter_Login_Credentials_for_Initiator
    [Documentation]  Helper Keyword. This Keyword is used to Enter login credentials for finantial reps
    Wait Until Element Is Visible  ${NavWeb_Login_CountryID}
    ${Login_Details}=  get from dictionary  ${MasterData}  Login_Details
    Input Text  ${NavWeb_Login_CountryID}  ${Login_Details}[initiate][DATA_LoginID]
    Input Text  ${NavWeb_Login_Password}  ${Login_Details}[initiate][DATA_Password]
    Click Button  ${NavWeb_Login_LoginButton}

Keyword_Enter_Login_Credentials_for_Underwriter
    [Documentation]  Helper Keyword. This Keyword is used to Enter login credentials for Underwriter
    Wait Until Element Is Visible  ${NavWeb_Login_CountryID}
    ${Login_Details}=  get from dictionary  ${MasterData}  Login_Details
    Input Text  ${NavWeb_Login_CountryID}  ${Login_Details}[approver][DATA_LoginID]
    Input Text  ${NavWeb_Login_Password}  ${Login_Details}[approver][DATA_Password]
    Click Button  ${NavWeb_Login_LoginButton}

Keyword_Launch_Passport_New
    [arguments]  ${User}  ${Passwd}
    # Launching Navigator Application
    Keyword_LaunchApplication  ${ApplicationURL}  ${User}  ${Passwd}
    Keyword_Launch_Passport_urls_New

Keyword_Launch_Passport_urls_New
    Go To    ${Passport_URL_${gEnvironment}}
    Log To Console    eForms- ${Passport_URL_${gEnvironment}}
#    Wait Until Element Is Visible   ${Loc_Passport_SiteMap_Header}  timeout=60  error=APassport_SiteMap_Header is not displayed
#    ${PrimaryNavigation_Table}=   Run Keyword And Return Status  Wait Until Element Is Visible  ${Loc_Passport_SiteMap_PrimaryNavigation_Table}  timeout=60
#    run keyword if  ${PrimaryNavigation_Table}
#    ...  run keywords
#    ...  log to console  Passport_SiteMap_PrimaryNavigation_Table displayed
#    ...  AND  Keyword_SaveScreenshot  Passport_SiteMap_PrimaryNavigation_Table
#    ...  ELSE  Fail  Passport_SiteMap_PrimaryNavigation_Table not displayed
    sleep   4
