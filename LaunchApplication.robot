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
Resource    Common_ApplicationFlows_Imports.resource
########################################################################
*** Keywords ***
########################################################################
Keyword_LaunchApplication
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  --------------------------------------------------------------------------------------
    Log To Console  URL to be Launched for -${gEnvironment}-${gEnvironment_Toggle}-environment is -${url}
    Log To Console  --------------------------------------------------------------------------------------
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
#    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Open Browser  ${url}  headlesschrome  options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    Run Keyword If  '${gEnvironment}' != 'Production'  Keyword_Login_WorkAround
    Delete All Cookies
    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
    Keyword_Launch_OpenAM_Login  ${username}  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_Production_Identity_Login   ${username}  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_LaunchApplication_Production
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5
    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
    Run Keyword If  (($gEnvironment not in $NavWeb_Okta_Test_Environments) and ('${gEnvironment}' != 'Production'))  Keyword_Access_HomePage
    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}

Keyword_LaunchApplication_without_IdentityURL
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
#    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Open Browser  ${url}  headlesschrome  options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched
    Delete All Cookies
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5
    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
#    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN
    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${urlWebProd}
    ...  AND  sleep  10
    ...  AND  Log to Console  Launched Production Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication
#     Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    # comment out following steps for okta Login issue
#     Run Keyword If  '${gEnvironment}' != 'Production'  run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
#     Run Keyword If  '${gEnvironment}' != 'Production'  Keyword_Access_HomePage
    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
    Run Keyword If  (($gEnvironment not in $NavWeb_Okta_Test_Environments) and ('${gEnvironment}' != 'Production'))  Keyword_Access_HomePage
    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}

Keyword_Login_WorkAround
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched

Keyword_Production_Identity_Login
    [Arguments]    ${username}  ${password}
    Go To  ${Identifity_URL_${gEnvironment}}
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5
    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  Post_Identity_Login

Keyword_Launch_OpenAM_Login
    [Arguments]    ${username}  ${password}
   Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${urlWebProd_OpenAM}
    ...  AND  sleep  10
    ...  AND  Log to Console  Launched OpenAM Application for Prod User
    ...  AND  Keyword_SaveScreenshot  OpenAM_Application
    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
#    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN

Keyword_LaunchApplication_Production
    Log To Console  --------------------------------------------------------------------------------------
    Log To Console  URL to be Launched for -${gEnvironment}-${gEnvironment_Toggle}-environment is -${urlWebProd_${gEnvironment_Toggle}}
    Log To Console  --------------------------------------------------------------------------------------
    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${urlWebProd_${gEnvironment_Toggle}}
    ...  AND  sleep  10
    ...  AND  Log to Console  Launched Production Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication

Keyword_Launch_Dashboard_Production
    Log To Console  --------------------------------------------------------------------------------------
    Log To Console  URL to be Launched for -${gEnvironment}-${gEnvironment_Toggle}-environment is -${Dashboard_Url_Production_${gEnvironment_Toggle}}
    Log To Console  --------------------------------------------------------------------------------------
    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${Dashboard_Url_Production_${gEnvironment_Toggle}}
    ...  AND  sleep  10
    ...  AND  Log to Console  Launched Production Dashboard for Prod User
    ...  AND  Keyword_SaveScreenshot  LaunchedDashboardApplication

Keyword_LaunchApplication_OLD
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched
    Delete All Cookies
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5
    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN
    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${urlWebProd}
    ...  AND  sleep  5
    ...  AND  Log to Console  Launched Production Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication
    # comment out following steps for okta Login issue
     Run Keyword If  '${gEnvironment}' != 'Production'  run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
     Run Keyword If  '${gEnvironment}' != 'Production'  Keyword_Access_HomePage
    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}

Keyword_LaunchApplication_NonSSO
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
#    ...  Call Method    ${chrome_options}    add_argument    --incognito --headless=chrome
#    ...  Call Method    ${chrome_options}    add_argument    --headless=chrome
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched

    Delete All Cookies

    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5

    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN

    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${urlWebProd}
    ...  AND  sleep  5
    ...  AND  Log to Console  Launched Production Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication

    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}

Keyword_LaunchApplication_Dashboard
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  --------------------------------------------------------------------------------------
    Log To Console  URL to be Launched for -${gEnvironment}-${gEnvironment_Toggle}-environment is -${url}
    Log To Console  --------------------------------------------------------------------------------------
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    #    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Open Browser  ${url}  headlesschrome  options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    Run Keyword If  '${gEnvironment}' != 'Production'  Keyword_Login_WorkAround
    Delete All Cookies
    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
    Keyword_Launch_OpenAM_Login  ${username}  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_Production_Identity_Login   ${username}  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_Launch_Dashboard_Production
    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  AND  run keyword if  $gEnvironment in $NonDashbaord_INT_Environments  Keyword_Launch_Dashboard_Page
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}

Keyword_LaunchApplication_Dashboard_without_entityURL
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
#    run keyword if  (($gEnvironment not in $NonDashbaord_INT_Environments) and ('${gEnvironment}' != 'Production'))  set test variable  ${url}   ${Dashboard_Url_${gEnvironment}}
#    Run Keyword If  '${gEnvironment}' != 'Production'  set test variable  ${url}   ${Dashboard_Url_${gEnvironment}}
    Log To Console  ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    #    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Open Browser  ${url}  headlesschrome  options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched

    Delete All Cookies

    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5

    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN

    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
#    ...  Go To  ${urlWebProd}
    ...  Go To  ${Dashboard_Url_Production}
    ...  AND  sleep  5
    ...  AND  Log to Console  Launched Production Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication

    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}

    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  AND  run keyword if  $gEnvironment in $NonDashbaord_INT_Environments  Keyword_Launch_Dashboard_Page
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}

Keyword_LaunchApplication_With_New_Context
    [Arguments]    ${url}  ${username}  ${password}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}  httpCredentials={'username': 'ID42363', 'password': 'EBeb9999'}
    New Page       https://navigatorqa.countrypassport.net/home
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched

    Delete All Cookies

    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5

    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN

    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${urlWebProd}
    ...  AND  sleep  5
    ...  AND  Log to Console  Launched Production Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication

    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    #...  AND  Wait Until Element Is Visible  //*[@id="whatsNewModal"]/div[2]/div/div[1]/button  timeout=20  error= Pop up not visible
    #...  AND  Sleep  2
    #...  AND  Click Element  //*[@id="whatsNewModal"]/div[2]/div/div[1]/button
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  AND  run keyword if  $gEnvironment in $NonDashbaord_INT_Environments  Keyword_Launch_Dashboard_Page
    #...  ELSE  Fail  Login Failed
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}


Keyword_LogIn_Backup_Attempt
    [Arguments]    ${username}  ${password}
    log to console  Making Second Attempt for Log in in case of Login Failures
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    sleep  5
    Click Element  //*[@id="loginButton_0"]
    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful in Second Attempt
    ...  AND  Keyword_SaveScreenshot  Login_Successful_Second_Attempt
    ...  AND  run keyword if  $gEnvironment in $NonDashbaord_INT_Environments  Keyword_Launch_Dashboard_Page
    ...  ELSE  Fail  Login Failed

Keyword_LogIn
    [Arguments]    ${username}  ${password}
    log to console  LogIn Steps
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    sleep  5
    Click Element  //*[@id="loginButton_0"]


Keyword_LaunchApplication_Prod_Search
    [Arguments]    ${url}  ${username}  ${password}  ${Search_url}
    Log To Console  \nLaunching Application
    Close All Browsers
    ${url} =    run keyword     Keyword_Get_Environment_NavWeb_Link  ${gEnvironment}
    Log To Console  ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${prefs} =    Create Dictionary    download.default_directory=${downloadDir}
    run keyword if  '${RunfromGIT}'=='Y'
    ...  run keywords
    ...  Call Method    ${chrome_options}    add_argument    --headless
    ...  AND  Call Method    ${chrome_options}    add_argument    --no-sandbox
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --ignore-ssl-errors
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-infobars
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-browser-side-navigation
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-popup-blocking
    ...  AND  Call Method    ${chrome_options}    add_argument    --aggressive-cache-discard
    ...  AND  Call Method    ${chrome_options}    add_argument    --disable-cache
    ...  AND  Call Method    ${chrome_options}    add_argument    --kiosk-printing
    ...  AND  Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
#    ...  AND  Create Webdriver    Chrome    chrome_options=${chrome_options}
    ...  AND  Open Browser  ${url}  headlesschrome  options=${chrome_options}
    ...  AND  Set Window Size    1920    1080
    ...  AND   Go To    ${url}
    ...  AND  sleep  5
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchHeadless
    ...  ELSE  run keyword if  '${RunfromGIT}'=='N'
    ...  run keywords
    ...  log to console  UI mode
    ...  AND  Open Browser  ${url}  chrome
    ...  AND  Maximize Browser Window
    ...  AND  Keyword_SaveScreenshot  BrowserlaunchUIMode
    ...  ELSE  run keyword  FAIL  invalid input for RunHeadless variable = ${RunfromGIT} .Please give either Y or N in global variables file
    ${LoginScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20
    Log to Console  ${LoginScreen}
    run keyword if  '${LoginScreen}'=='False'
    ...  run keywords
    ...  log to console  Login Screen not displayed at first attempt hence refreshing
    ...  AND  reload page
    ...  ELSE  log to console  Login Screen loaded at first attempt.
    Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="idToken1"]  timeout=20  error=Login screen is not loaded after second attempt
    Log to Console  LoginScreen Loaded Successfully
    Keyword_SaveScreenshot  LogInPageLaunched
    Delete All Cookies
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  5
    ${username}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_uname}  ${username}
    ${password}=  set variable If  '${gEnvironment}' == 'Production'  ${Prod_password}  ${password}
    Log to Console  Logged on User-${username}
	Wait Until Element Is Visible    //*[@id="idToken1"]    timeout=60
    Input Text  //*[@id="idToken1"]  ${username}
    Input Text  //*[@id="idToken2"]  ${password}
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  LogInPageDetailes
    sleep  1
    Click Element  //*[@id="loginButton_0"]
    Run Keyword If  '${gEnvironment}' == 'Production'  sleep  10
    Run Keyword If  '${gEnvironment}' == 'Production'  Keyword_SaveScreenshot  OPenAMLogIN
    Run Keyword If    '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  Go To  ${Search_url}
    ...  AND  sleep  5
    ...  AND  Log to Console  Launched Production Search Application for BobSmith
    ...  AND  Keyword_SaveScreenshot  LaunchedProductionApplication
     Run Keyword If  '${gEnvironment}' == 'Production'  sleep  30
    # comment out following steps for okta Login issue
#     Run Keyword If  '${gEnvironment}' != 'Production'  run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
#     Run Keyword If  '${gEnvironment}' != 'Production'  Keyword_Access_HomePage
    run keyword and ignore error   Keyword_Detect_&_Perform_SingleSignOn_LogIn  ${username}  ${password}
    Keyword_Access_HomePage
    ${HomeScreen} =  Run Keyword And Return Status  Wait Until Element Is Visible  //*[@id="navCollapseMenu"]  timeout=60
    Log to Console  ${HomeScreen}
    run keyword if  ${HomeScreen}
    ...  run keywords
    ...  log to console  loginSuccessful
    ...  AND  Keyword_SaveScreenshot  Login_Successful
    ...  ELSE  Keyword_LogIn_Backup_Attempt  ${username}  ${password}