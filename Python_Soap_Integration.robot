########################################################################
*** Settings ***
########################################################################
#Library    Selenium2Library
Library    SeleniumLibrary  10  5  run_on_failure=None
Library    ExcelLibrary
Library    Collections
Library    robot.libraries.DateTime
Library    String
Library    System.Web
Library    html
Library    SudsLibrary
Library    OperatingSystem
Library    Process
#Library    yieldfromUrllib2
#Library     urllib.request.pathname2url
#Library     future.moves.urllib.request.pathname2url
Library     urllib.request
Library     lxml
Library     XML
Library    sax
Library    sax.saxutils
Library    cgi
#Library     urllib.pathname2url
Resource    ../CommonKeywords.robot
Resource    ../DataVariables/LNT_GlobalVariables.robot
Resource    ../DataVariables/BrainBox_GlobalVariables.robot
Resource    ../DataVariables/NAVengers_GlobalVariables.robot
Resource    ../Locators/LNT_ReUsableLocators.robot
Resource    ../Locators/BrainBox_ReUsableLocators.robot
Resource    ../Locators/NAVengers_ReUsableLocators.robot
Library    ../UserKeywordsPython.py
Library    ../SOAPUI_Automation/SoapUIPostRequest.py
Resource    ../LNT_ApplicationFlows/LNT_Imports.resource
Resource    ../BrainBox_ApplicationFlows/BrainBox_Imports.resource
Resource    ../NAVengers_ApplicationFlows/NAVengers_Imports.resource
Resource    ../SOAPUI_Automation/SOAPUI_Imports.resource
Resource    ../Common_ApplicationFlows/Common_ApplicationFlows_Imports.resource

########################################################################
*** Keywords ***
########################################################################

Keyword_Python_soapUI_Get_Request
    log to console  Starting Python file Python_soapUI_Get_Request
    ${LogInResponse}=  SoapUIPostRequest.performLogin
    log to console  LogInResponse-${LogInResponse}
    log to console  sleeping for 10 seconds
    sleep  10
    ${SoapResponse}=   SoapUIPostRequest.sendXMLToSoap  ${LogInResponse}
    log to console  SoapResponse-${SoapResponse}

Keyword_Set_Environment_Specific_LogIN_Urls
    [arguments]     ${AgentID}  ${Agentnumber}
    log to console  setting up Endpoint URL for specific Environmet Needs
    run keyword if  '${gEnvironment}' in ${INT_Environments}  set test variable  ${Login_URL}  ${Int_LogIn_Url}
    ...  ELSE  set test variable  ${Login_URL}  ${NonInt_LogIn_Url}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Login_URL}  ${Production_LogIn_Url}
    log to console  Login_URL-${Login_URL}
    run keyword if  '${gEnvironment}' in ${INT_Environments}   set test variable  ${Host_Name}  ${Int_Host_Name}
    ...  ELSE  set test variable  ${Host_Name}  ${NonInt_Host_Name}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Host_Name}  ${Prod_Host_Name}
    log to console  Host_Name-${Host_Name}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_Agentnumber}  ${Data_ID46200_Agentnumber}
    ...  ELSE  set test variable  ${Data_Agentnumber}  ${Agentnumber}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_AgentID}  ${Prod_uname}
    ...  ELSE  set test variable  ${Data_AgentID}  ${AgentID}



Keyword_Environment_Specific_Headless_eSignature_Variables_MuleFlow
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    log to console  setting up Endpoint URL for specific Environmet Needs for esignature-${Flow_Old_New}-Flow
    run keyword if  '${Flow_Old_New}' == 'Old'  set test variable  ${eSignature_SoapEnpoint_URL}  ${Data_Old_eSignature_SoapEnpoint_URL_${gEnvironment}}
    ...  ELSE  set test variable  ${eSignature_SoapEnpoint_URL}  ${Data_New_eSignature_SoapEnpoint_URL_${gEnvironment}}
    log to console  eSignature_SoapEnpoint_URL-${eSignature_SoapEnpoint_URL}
    set test variable  ${eSignature_PolicyPro_Mule_Create_URL}   ${Data_eSignature_PolicyPro_Mule_Create_URL_${gEnvironment}}
    set test variable  ${eSignature_Billing_Mule_Create_URL}   ${Data_eSignature_Billing_Mule_Create_URL_${gEnvironment}}
    set test variable  ${eSignature_Life_Mule_Create_URL}   ${Data_eSignature_Life_Mule_Create_URL_${gEnvironment}}
    log to console  eSignature_PolicyPro_Mule_Create_URL-${eSignature_PolicyPro_Mule_Create_URL}
    log to console  eSignature_Billing_Mule_Create_URL-${eSignature_Billing_Mule_Create_URL}
    log to console  eSignature_Life_Mule_Create_URL-${eSignature_Life_Mule_Create_URL}
    run keyword if  ${gEnvironment} IN @{INT_Environments}  set test variable  ${Login_URL}  ${Int_LogIn_Url}
    ...  ELSE  set test variable  ${Login_URL}  ${NonInt_LogIn_Url}
    #run keyword if  '${gEnvironment}' == 'eINT3'  set test variable  ${Login_URL}  ${Int_LogIn_Url}
    #...  ELSE  set test variable  ${Login_URL}  ${NonInt_LogIn_Url}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Login_URL}  ${Production_LogIn_Url}
    log to console  Login_URL-${Login_URL}
    run keyword if  '${gEnvironment}' == 'eINT3'  set test variable  ${Host_Name}  ${Int_Host_Name}
    ...  ELSE  set test variable  ${Host_Name}  ${NonInt_Host_Name}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Host_Name}  ${Prod_Host_Name}
    log to console  Host_Name-${Host_Name}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_Agentnumber}  ${Data_ID46200_Agentnumber}
    ...  ELSE  set test variable  ${Data_Agentnumber}  ${Agentnumber}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_AgentID}  ${Prod_uname}
    ...  ELSE  set test variable  ${Data_AgentID}  ${AgentID}
    set test variable  ${Data_Life_Parent_WIP_Id}  ${gEnvironment}SoapReq

Keyword_Environment_Specific_Headless_eSignature_Variables
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    log to console  setting up Endpoint URL for specific Environmet Needs for esignature-${Flow_Old_New}-Flow
    #run keyword if  '${Flow_Old_New}' == 'Old'  set test variable  ${eSignature_SoapEnpoint_URL}  ${Data_Old_eSignature_SoapEnpoint_URL_${gEnvironment}}
    #...  ELSE  set test variable  ${eSignature_SoapEnpoint_URL}  ${Data_New_eSignature_SoapEnpoint_URL_${gEnvironment}}
    #log to console  eSignature_SoapEnpoint_URL-${eSignature_SoapEnpoint_URL}
    run keyword if      '${gEnvironment}' in ${INT_Environments}  set test variable  ${Login_URL}  ${Int_LogIn_Url}
    ...  ELSE  set test variable  ${Login_URL}  ${NonInt_LogIn_Url}
    #run keyword if  '${gEnvironment}' == 'eINT3'  set test variable  ${Login_URL}  ${Int_LogIn_Url}
    #...  ELSE  set test variable  ${Login_URL}  ${NonInt_LogIn_Url}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Login_URL}  ${Production_LogIn_Url}
    log to console  Login_URL-${Login_URL}
    run keyword if      '${gEnvironment}' in ${INT_Environments}   set test variable  ${Host_Name}  ${Int_Host_Name}
    ...  ELSE  set test variable  ${Host_Name}  ${NonInt_Host_Name}
    #run keyword if  '${gEnvironment}' == 'eINT3'  set test variable  ${Host_Name}  ${Int_Host_Name}
    #...  ELSE  set test variable  ${Host_Name}  ${NonInt_Host_Name}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Host_Name}  ${Prod_Host_Name}
    log to console  Host_Name-${Host_Name}
    #set test variable  ${Data_Agentnumber}  ${Agentnumber}
    #set test variable  ${Data_AgentID}  ${AgentID}
    #set test variable  ${Data_Life_Parent_WIP_Id}  ${gEnvironment}SoapReq
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_Agentnumber}  ${Data_ID46200_Agentnumber}
    ...  ELSE  set test variable  ${Data_Agentnumber}  ${Agentnumber}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_AgentID}  ${Prod_uname}
    ...  ELSE  set test variable  ${Data_AgentID}  ${AgentID}
    set test variable  ${Data_Life_Parent_WIP_Id}  ${gEnvironment}SoapReq

Keyword_Agent_Specific_Life_Headless_eSignature_Representative_Variables
    [arguments]     ${AgentID}
    log to console  AgentID-${AgentID}-Setting up Representitive Name variables to populate suap Request
    set test variable  ${Agent_First_Name}  Eric
    set test variable  ${Agent_Last_Name}  Blankenship
    run keyword if  '${AgentID}' == 'ID42363'
    ...  run keywords
    ...  set test variable  ${Agent_First_Name}  Eric
    ...  AND  set test variable  ${Agent_Last_Name}  Blankenship
    run keyword if  '${AgentID}' == 'ID42062'
    ...  run keywords
    ...  set test variable  ${Agent_First_Name}  Kent
    ...  AND  set test variable  ${Agent_Last_Name}  Kallander
    run keyword if  '${AgentID}' == 'ID42351'
    ...  run keywords
    ...  set test variable  ${Agent_First_Name}  Fred
    ...  AND  set test variable  ${Agent_Last_Name}  Witte
    run keyword if  '${AgentID}' == 'ID46200'
    ...  run keywords
    ...  set test variable  ${Agent_First_Name}  Bobtest
    ...  AND  set test variable  ${Agent_Last_Name}  Smithtest
    run keyword if  '${gEnvironment}' == 'Production'
    ...  run keywords
    ...  set test variable  ${Agent_First_Name}  Bobtest
    ...  AND  set test variable  ${Agent_Last_Name}  Smithtest
    log to console  Agent_First_Name-${Agent_First_Name} and Agent_Last_Name-${Agent_Last_Name}

Keyword_Document_Specific_Life_Headless_eSignature_FileInput_Locations
    log to console  Setting up environment specific FileInput_Locations
    set test variable  ${Life_Document1_FileInput_Location}  ${Data_Document1_FileInput_Location_${gEnvironment}}
    set test variable  ${Life_Document2_FileInput_Location}  ${Data_Document2_FileInput_Location_${gEnvironment}}
    set test variable  ${Life_Document3_FileInput_Location}  ${Data_Document3_FileInput_Location_${gEnvironment}}
    set test variable  ${Life_Document4_FileInput_Location}  ${Data_Document4_FileInput_Location_${gEnvironment}}
    set test variable  ${Life_Document5_FileInput_Location}  ${Data_Document5_FileInput_Location_${gEnvironment}}
    log to console  Life_Document1_FileInput_Location-${Life_Document1_FileInput_Location}
    log to console  Life_Document2_FileInput_Location-${Life_Document2_FileInput_Location}
    log to console  Life_Document3_FileInput_Location-${Life_Document3_FileInput_Location}
    log to console  Life_Document4_FileInput_Location-${Life_Document4_FileInput_Location}
    log to console  Life_Document5_FileInput_Location-${Life_Document5_FileInput_Location}




Keyword_Python_WIP_Closure_Get_Request
    [arguments]     ${AgentID}  ${AgentPass}  ${Agentnumber}  ${Endpoint_Url}
    set global variable  ${TCExecutionStatus}  False
    Keyword_Set_Environment_Specific_LogIN_Urls  ${AgentID}  ${Agentnumber}
    log to console  Starting WIP Closure Get Request
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_AgentID}  ${Prod_uname}
    ...  ELSE  set test variable  ${Data_AgentID}  ${AgentID}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_Agent_PassWD}  ${Prod_password}
    ...  ELSE  set test variable  ${Data_Agent_PassWD}  ${AgentPass}
    ${LogInResponse}=  SoapUIPostRequest.performLogin  ${Login_URL}  ${Host_Name}  ${Data_AgentID}  ${Data_Agent_PassWD}
    log to console  LogInResponse-${LogInResponse}
    log to console  sleeping for 10 seconds
    sleep  10
    ${SoapResponse}=   SoapUIPostRequest.wipClosureForBilling  ${LogInResponse}  ${Endpoint_Url}
    log to console  SoapResponse-${SoapResponse}
    run keyword if  '${SoapResponse}' == '200'  log to console  Wip Closure request was successful
    ...  ELSE  Fail  Wip Closure request failed
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Python_soapUI_Post_Request
    [arguments]     ${eSignature_XML}  ${SoapEnpoint_URL}  ${AgentID}  ${AgentPass}
    set global variable  ${TCExecutionStatus}  False
    log to console  Starting Python file Python_soapUI_Get_Request
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_AgentID}  ${Prod_uname}
    ...  ELSE  set test variable  ${Data_AgentID}  ${AgentID}
    run keyword if  '${gEnvironment}' == 'Production'  set test variable  ${Data_Agent_PassWD}  ${Prod_password}
    ...  ELSE  set test variable  ${Data_Agent_PassWD}  ${AgentPass}
    ${LogInResponse}=  SoapUIPostRequest.performLogin  ${Login_URL}  ${Host_Name}  ${Data_AgentID}  ${Data_Agent_PassWD}
    log to console  LogInResponse-${LogInResponse}
    log to console  sleeping for 10 seconds
    sleep  10
    ${SoapResponse}=   SoapUIPostRequest.sendXMLToSoap  ${LogInResponse}  ${eSignature_XML}  ${SoapEnpoint_URL}
    log to console  SoapResponse-${SoapResponse}
    run keyword if  '${SoapResponse}' == '200'  log to console  eSignature Post request was successful
    ...  ELSE  Fail  eSignature Post request failed
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Format_PolicyPro_XML_OLD
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${PolicyPro_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  PolicyPro_Envelope_XML-${PolicyPro_Envelope_XML}
    ${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/PolicyPro_Request.xml   #keep_clark_notation=yes
    log to console  PolicyPro_XML-${PolicyPro_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Fetch_PolicyPro_XML_Values  ${PolicyPro_XML}
    Keyword_Update_PolicyPro_XML_Values  ${PolicyPro_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Format_PolicyPro_XML
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}  ${Life_Request_XML}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${PolicyPro_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  PolicyPro_Envelope_XML-${PolicyPro_Envelope_XML}
    ${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/${Life_Request_XML}   #keep_clark_notation=yes
    log to console  PolicyPro_XML-${PolicyPro_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Fetch_PolicyPro_XML_Values  ${PolicyPro_XML}
    Keyword_Update_PolicyPro_XML_Values  ${PolicyPro_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Format_Renters_XML
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${PolicyPro_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  PolicyPro_Envelope_XML-${PolicyPro_Envelope_XML}
    ${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/PolicyPro_Renters_Request.xml   #keep_clark_notation=yes
    log to console  Renters_XML-${PolicyPro_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Fetch_Renters_XML_Values  ${PolicyPro_XML}
    Keyword_Update_Renters_XML_Values  ${PolicyPro_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Format_PolicyPro_Billing_XML
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${PolicyPro_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  PolicyPro_Envelope_XML-${PolicyPro_Envelope_XML}
    #${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/PolicyPro_Request.xml   #keep_clark_notation=yes
    ${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/Billing_Request.xml   #keep_clark_notation=yes
    log to console  Billing_XML-${PolicyPro_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Fetch_Billing_XML_Values  ${PolicyPro_XML}
    Keyword_Update_Billing_XML_Values  ${PolicyPro_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Format_Org_Billing_XML
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${PolicyPro_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  PolicyPro_Envelope_XML-${PolicyPro_Envelope_XML}
    #${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/PolicyPro_Request.xml   #keep_clark_notation=yes
    ${PolicyPro_XML}  Parse Xml  ${CURDIR}/Input/Org_Billing_Request.xml   #keep_clark_notation=yes
    log to console  Billing_XML-${PolicyPro_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Fetch_Org_Billing_XML_Values  ${PolicyPro_XML}
    Keyword_Update_Org_Billing_XML_Values  ${PolicyPro_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Fetch_PolicyPro_XML_Values
    [arguments]     ${PolicyPro_XML}
    log to console  Fetching Policy Pro XML Values
    ${Client1_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_FirstName}
    log to console  Client1_FirstName-${Client1_FirstName}
    ${Client1_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_LastName}
    log to console  Client1_LastName-${Client1_LastName}
    ${Client1_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_Email}
    log to console  Client1_Email-${Client1_Email}
    ${ClientID1}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_Clientid}
    log to console  ClientID1-${ClientID1}
    #${Client2_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_FirstName}
    #log to console  Client2_FirstName-${Client2_FirstName}
    #${Client2_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_LastName}
    #log to console  Client2_LastName-${Client2_LastName}
    #${Client2_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_Email}
    #log to console  Client2_Email-${Client2_Email}
    #${ClientID2}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_Clientid}
    #log to console  ClientID1-${ClientID2}
    ${DisplayName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Displayname}
    log to console  DisplayName-${DisplayName}
    #${Description}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Description}
    #log to console  Description-${Description}
    ${Policynumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Policynumber}
    log to console  Policynumber-${Policynumber}
    ${Agentnumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Agentnumber}
    log to console  Agentnumber-${Agentnumber}
    ${Primarycontact_Id}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    log to console  Primarycontact_Id-${Primarycontact_Id}
    ${Primarycontact_PartyType}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Partytype}
    log to console  Primarycontact_PartyType-${Primarycontact_PartyType}
    ${Primarycontact_Clienttype}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Clienttype}
    log to console  Primarycontact_Clienttype-${Primarycontact_Clienttype}

Keyword_Fetch_Renters_XML_Values
    [arguments]     ${PolicyPro_XML}
    log to console  Fetching Policy Pro XML Values
    ${Client1_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_FirstName}
    log to console  Client1_FirstName-${Client1_FirstName}
    ${Client1_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_LastName}
    log to console  Client1_LastName-${Client1_LastName}
    #${Client1_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_Email}
    #log to console  Client1_Email-${Client1_Email}
    ${ClientID1}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_Clientid}
    log to console  ClientID1-${ClientID1}
    #${Client2_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_FirstName}
    #log to console  Client2_FirstName-${Client2_FirstName}
    #${Client2_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_LastName}
    #log to console  Client2_LastName-${Client2_LastName}
    #${Client2_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_Email}
    #log to console  Client2_Email-${Client2_Email}
    #${ClientID2}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_Clientid}
    #log to console  ClientID1-${ClientID2}
    ${DisplayName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Displayname}
    log to console  DisplayName-${DisplayName}
    #${Description}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Description}
    #log to console  Description-${Description}
    ${Policynumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Policynumber}
    log to console  Policynumber-${Policynumber}
    ${Agentnumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Agentnumber}
    log to console  Agentnumber-${Agentnumber}
    ${Primarycontact_Id}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    log to console  Primarycontact_Id-${Primarycontact_Id}
    ${Primarycontact_PartyType}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Partytype}
    log to console  Primarycontact_PartyType-${Primarycontact_PartyType}
    ${Primarycontact_Clienttype}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Clienttype}
    log to console  Primarycontact_Clienttype-${Primarycontact_Clienttype}

Keyword_Fetch_Billing_XML_Values
    [arguments]     ${PolicyPro_XML}
    log to console  Fetching Billing XML Values
    ${Client1_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_FirstName}
    log to console  Client1_FirstName-${Client1_FirstName}
    ${Client1_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_LastName}
    log to console  Client1_LastName-${Client1_LastName}
    ${Client1_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_Email}
    log to console  Client1_Email-${Client1_Email}
    ${ClientID1}=    Get Element Text    ${PolicyPro_XML}  ${Loc_Billing_Clientid}
    log to console  ClientID1-${ClientID1}
    #${Client2_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_FirstName}
    #log to console  Client2_FirstName-${Client2_FirstName}
    #${Client2_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_LastName}
    #log to console  Client2_LastName-${Client2_LastName}
    #${Client2_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_Email}
    #log to console  Client2_Email-${Client2_Email}
    #${ClientID2}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer2_Clientid}
    #log to console  ClientID1-${ClientID2}
    ${DisplayName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Displayname}
    log to console  DisplayName-${DisplayName}
    #${Description}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Description}
    #log to console  Description-${Description}
    ${Policynumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Policynumber}
    log to console  Policynumber-${Policynumber}
    ${Agentnumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Agentnumber}
    log to console  Agentnumber-${Agentnumber}
    ${Primarycontact_Id}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    log to console  Primarycontact_Id-${Primarycontact_Id}
    ${Primarycontact_PartyType}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Partytype}
    log to console  Primarycontact_PartyType-${Primarycontact_PartyType}
    ${Primarycontact_Clienttype}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Clienttype}
    log to console  Primarycontact_Clienttype-${Primarycontact_Clienttype}

Keyword_Fetch_Org_Billing_XML_Values
    [arguments]     ${PolicyPro_XML}
    log to console  Fetching Billing XML Values
    ${Client1_FirstName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_FirstName}
    log to console  Client1_FirstName-${Client1_FirstName}
    ${Client1_LastName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_LastName}
    log to console  Client1_LastName-${Client1_LastName}
    ${Client1_Email}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_Signer1_Email}
    log to console  Client1_Email-${Client1_Email}
    ${ClientID1}=    Get Element Text    ${PolicyPro_XML}  ${Loc_Org_Billing_Clientid}
    log to console  ClientID1-${ClientID1}
    ${DisplayName}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Displayname}
    log to console  DisplayName-${DisplayName}
    #${Description}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Description}
    #log to console  Description-${Description}
    ${Policynumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Policynumber}
    log to console  Policynumber-${Policynumber}
    ${Agentnumber}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Agentnumber}
    log to console  Agentnumber-${Agentnumber}
    ${Primarycontact_Id}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    log to console  Primarycontact_Id-${Primarycontact_Id}
    ${Primarycontact_PartyType}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Partytype}
    log to console  Primarycontact_PartyType-${Primarycontact_PartyType}
    ${Primarycontact_Clienttype}=    Get Element Text    ${PolicyPro_XML}  ${Loc_PolicyPro_ActivityData_Primarycontact_Clienttype}
    log to console  Primarycontact_Clienttype-${Primarycontact_Clienttype}

Keyword_Update_PolicyPro_XML_Values
    [arguments]     ${PolicyPro_XML}
    Set Element Text  ${PolicyPro_XML}  ${HouseHoldFirstName}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    XML.Element Text Should Be	${PolicyPro_XML}  ${HouseHoldFirstName}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    Set Element Text  ${PolicyPro_XML}  Robottest  xpath=${Loc_PolicyPro_Signer1_LastName}
    XML.Element Text Should Be	${PolicyPro_XML}  Robottest  xpath=${Loc_PolicyPro_Signer1_LastName}
    Set Element Text  ${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    ##########################  Updating Secondary Contact details ############################
    #Set Element Text  ${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #Set Element Text  ${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #XML.Element Text Should Be	${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #Set Element Text  ${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #Set Element Text  ${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    ##########################  Updating Misc Fields ############################
    Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    #Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    #XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    Set Element Text  ${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    Set Element Text  ${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    ${PolicyPro_XML}  element to string  ${PolicyPro_XML}
    ${tagged}  escape  ${PolicyPro_XML}  quote=False
    #log to console  PolicyPro_XML unescaped-${tagged}
    ${XML_File}  get file  ${CURDIR}/Input/eSignature_Request_Envelope.xml
    #log to console  XML_File-${XML_File}
    ${XML_String}=  String.Replace String  ${XML_File}  <request>ABC</request>  <request>&lt;?xml version=&#39;1.0&#39; encoding=&#39;UTF-8&#39;?&gt;${tagged}</request>
    create file  ${CURDIR}/Output/eSignature_PolicyPro_Post_Request.txt  ${XML_String}
    #log to console  XML_String-${XML_String}
    set test variable  ${XML_Updated_String}  ${XML_String}
    #Keyword_Python_soapUI_Post_Request  ${XML_String}

Keyword_Update_Renters_XML_Values
    [arguments]     ${PolicyPro_XML}
    Set Element Text  ${PolicyPro_XML}  ${HouseHoldFirstName}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    XML.Element Text Should Be	${PolicyPro_XML}  ${HouseHoldFirstName}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    Set Element Text  ${PolicyPro_XML}  Robottest  xpath=${Loc_PolicyPro_Signer1_LastName}
    XML.Element Text Should Be	${PolicyPro_XML}  Robottest  xpath=${Loc_PolicyPro_Signer1_LastName}
    #Set Element Text  ${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    ##########################  Updating Secondary Contact details ############################
    #Set Element Text  ${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #Set Element Text  ${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #XML.Element Text Should Be	${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #Set Element Text  ${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #Set Element Text  ${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    ##########################  Updating Misc Fields ############################
    Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    #Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    #XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    Set Element Text  ${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    Set Element Text  ${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    ${PolicyPro_XML}  element to string  ${PolicyPro_XML}
    ${tagged}  escape  ${PolicyPro_XML}  quote=False
    #log to console  PolicyPro_XML unescaped-${tagged}
    ${XML_File}  get file  ${CURDIR}/Input/eSignature_Request_Envelope.xml
    #log to console  XML_File-${XML_File}
    ${XML_String}=  String.Replace String  ${XML_File}  <request>ABC</request>  <request>&lt;?xml version=&#39;1.0&#39; encoding=&#39;UTF-8&#39;?&gt;${tagged}</request>
    create file  ${CURDIR}/Output/eSignature_PolicyPro_Post_Request.txt  ${XML_String}
    #log to console  XML_String-${XML_String}
    set test variable  ${XML_Updated_String}  ${XML_String}
    #Keyword_Python_soapUI_Post_Request  ${XML_String}

Keyword_Update_Billing_XML_Values
    [arguments]     ${PolicyPro_XML}
    Set Element Text  ${PolicyPro_XML}  ${Data_Callingapp_Billing}  xpath=${Loc_PolicyPro_callingapps}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Callingapp_Billing}  xpath=${Loc_PolicyPro_callingapps}
    Set Element Text  ${PolicyPro_XML}  ${Data_Submitrule_Autopay}  xpath=${Loc_PolicyPro_submitrule}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Submitrule_Autopay}  xpath=${Loc_PolicyPro_submitrule}
    Set Element Text  ${PolicyPro_XML}  ${HouseHoldFirstName}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    XML.Element Text Should Be	${PolicyPro_XML}  ${HouseHoldFirstName}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    Set Element Text  ${PolicyPro_XML}  Robottest  xpath=${Loc_PolicyPro_Signer1_LastName}
    XML.Element Text Should Be	${PolicyPro_XML}  Robottest  xpath=${Loc_PolicyPro_Signer1_LastName}
    Set Element Text  ${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_Billing_Clientid}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_Billing_Clientid}
    #Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    ##########################  Updating Secondary Contact details ############################
    #Set Element Text  ${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #Set Element Text  ${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #XML.Element Text Should Be	${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #Set Element Text  ${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #Set Element Text  ${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    ##########################  Updating Misc Fields ############################
    Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    #Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    #XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    #Set Element Text  ${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    Set Element Text  ${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    ${PolicyPro_XML}  element to string  ${PolicyPro_XML}
    ${tagged}  escape  ${PolicyPro_XML}  quote=False
    #log to console  PolicyPro_XML unescaped-${tagged}
    ${XML_File}  get file  ${CURDIR}/Input/eSignature_Request_Envelope.xml
    #log to console  XML_File-${XML_File}
    ${XML_String}=  String.Replace String  ${XML_File}  <request>ABC</request>  <request>&lt;?xml version=&#39;1.0&#39; encoding=&#39;UTF-8&#39;?&gt;${tagged}</request>
    create file  ${CURDIR}/Output/eSignature_Billing_Post_Request.txt  ${XML_String}
    #log to console  XML_String-${XML_String}
    set test variable  ${XML_Updated_String}  ${XML_String}
    #Keyword_Python_soapUI_Post_Request  ${XML_String}

Keyword_Update_Org_Billing_XML_Values
    [arguments]     ${PolicyPro_XML}
    Set Element Text  ${PolicyPro_XML}  ${Data_Callingapp_Billing}  xpath=${Loc_PolicyPro_callingapps}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Callingapp_Billing}  xpath=${Loc_PolicyPro_callingapps}
    Set Element Text  ${PolicyPro_XML}  ${Data_Submitrule_Autopay}  xpath=${Loc_PolicyPro_submitrule}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Submitrule_Autopay}  xpath=${Loc_PolicyPro_submitrule}
#   Documentation-commeting below so that first name will be stored as Signer for . example- Sbilnaelqfxv Organization Robottest, Signer for
#    Set Element Text  ${PolicyPro_XML}  ${AddProspect_Organization_Name}  xpath=${Loc_PolicyPro_Signer1_FirstName}
#    XML.Element Text Should Be	${PolicyPro_XML}  ${AddProspect_Organization_Name}  xpath=${Loc_PolicyPro_Signer1_FirstName}
    Set Element Text  ${PolicyPro_XML}  ${AddProspect_Organization_Name}  xpath=${Loc_PolicyPro_Signer1_LastName}
    XML.Element Text Should Be	${PolicyPro_XML}  ${AddProspect_Organization_Name}  xpath=${Loc_PolicyPro_Signer1_LastName}
    Set Element Text  ${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer1_Email}  xpath=${Loc_PolicyPro_Signer1_Email}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_Org_Billing_Clientid}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_Org_Billing_Clientid}
    #Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_Signer1_Clientid}
    ##########################  Updating Secondary Contact details ############################
    #Set Element Text  ${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Add_Spouse}  xpath=${Loc_PolicyPro_Signer2_FirstName}
    #Set Element Text  ${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #XML.Element Text Should Be	${PolicyPro_XML}  Contact  xpath=${Loc_PolicyPro_Signer2_LastName}
    #Set Element Text  ${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Signer2_Email}  xpath=${Loc_PolicyPro_Signer2_Email}
    #Set Element Text  ${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Secondary_Client_Id}  xpath=${Loc_PolicyPro_Signer2_Clientid}
    ##########################  Updating Misc Fields ############################
    Set Element Text  ${PolicyPro_XML}  ${AddProspect_Organization_Name}, Signer for  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    XML.Element Text Should Be	${PolicyPro_XML}  ${AddProspect_Organization_Name}, Signer for  xpath=${Loc_PolicyPro_ActivityData_Displayname}
    #Set Element Text  ${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    #XML.Element Text Should Be	${PolicyPro_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_PolicyPro_ActivityData_Description}
    #Set Element Text  ${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    #XML.Element Text Should Be	${PolicyPro_XML}  ${Data_PolicyPro_Existing_Policynumber}  xpath=${Loc_PolicyPro_ActivityData_Policynumber}
    Set Element Text  ${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Data_Agentnumber}  xpath=${Loc_PolicyPro_ActivityData_Agentnumber}
    Set Element Text  ${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    XML.Element Text Should Be	${PolicyPro_XML}  ${Primary_Client_Id}  xpath=${Loc_PolicyPro_ActivityData_Primarycontact_Id}
    ${PolicyPro_XML}  element to string  ${PolicyPro_XML}
    ${tagged}  escape  ${PolicyPro_XML}  quote=False
    #log to console  PolicyPro_XML unescaped-${tagged}
    ${XML_File}  get file  ${CURDIR}/Input/eSignature_Request_Envelope.xml
    #log to console  XML_File-${XML_File}
    ${XML_String}=  String.Replace String  ${XML_File}  <request>ABC</request>  <request>&lt;?xml version=&#39;1.0&#39; encoding=&#39;UTF-8&#39;?&gt;${tagged}</request>
    create file  ${CURDIR}/Output/eSignature_Billing_Post_Request.txt  ${XML_String}
    #log to console  XML_String-${XML_String}
    set test variable  ${XML_Updated_String}  ${XML_String}
    #Keyword_Python_soapUI_Post_Request  ${XML_String}

Keyword_Create_Log_Headless_eSignature
    [arguments]     ${Flow_Name}
    log to console  updating flow details in Excel
    ${Current_Date}  Keyword_CurrentDate_Required_Fromat  %m/%d/%Y
    run keyword if  '${RunfromGIT}'=='N'  set local variable  ${File_Path}  ./Resources/SOAPUI_Automation/Output/Headless_eSignature_Flows.xls
    ...  ELSE  set local variable  ${File_Path}  ../Resources/SOAPUI_Automation/Output/Headless_eSignature_Flows.xls
    log to console  File_Path-${File_Path}
    log to console  Flow_Name-${Flow_Name}
    log to console  HouseHoldFirstName-${HouseHoldFirstName} Robottest
    log to console  gEnvironment-${gEnvironment}
    log to console  Login User-${Data_AgentID}
    log to console  Current_Date-${Current_Date}
    saveWorkSpace  ${File_Path}  ${Flow_Name}  ${HouseHoldFirstName} Robottest  ${gEnvironment}  ${Current_Date}  N
    #saveWorkSpace  ${File_Path}  ${Flow_Name}  ProspectName Robottest  ${gEnvironment}  ${Current_Date}  N

Keyword_Customized_Create_Log_Headless_eSignature
    [arguments]     ${Flow_Name}  ${Client_Name}
    log to console  updating flow details in Excel
    ${Current_Date}  Keyword_CurrentDate_Required_Fromat  %m/%d/%Y
    run keyword if  '${RunfromGIT}'=='N'  set local variable  ${File_Path}  ./Resources/SOAPUI_Automation/Output/Headless_eSignature_Flows.xls
    ...  ELSE  set local variable  ${File_Path}  ../Resources/SOAPUI_Automation/Output/Headless_eSignature_Flows.xls
    log to console  File_Path-${File_Path}
    log to console  Flow_Name-${Flow_Name}
    log to console  Client/Prospect Name-${Client_Name}
    log to console  gEnvironment-${gEnvironment}
    log to console  Login User-${Data_AgentID}
    log to console  Current_Date-${Current_Date}
#    saveWorkSpace  ${File_Path}  ${Flow_Name}  ${Client_Name}  ${gEnvironment}  ${Current_Date}  N

Keyword_Fetch_Life_XML_Values
    [arguments]     ${Life_XML}
    log to console  Fetching Policy Pro XML Values
    ${Client1_FirstName}=    Get Element Text    ${Life_XML}  ${Loc_Life_Signer1_FirstName}
    log to console  Client1_FirstName-${Client1_FirstName}
    ${Client1_LastName}=    Get Element Text    ${Life_XML}  ${Loc_Life_Signer1_LastName}
    log to console  Client1_LastName-${Client1_LastName}
    ${Rep_FirstName}=    Get Element Text    ${Life_XML}  ${Loc_Life_Signer2_FirstName}
    log to console  RepClient1_FirstName-${Rep_FirstName}
    ${Rep_LastName}=    Get Element Text    ${Life_XML}  ${Loc_Life_Signer2_LastName}
    log to console  Rep_LastName-${Rep_LastName}
    ###### Fetch Document File input Location ##################################
    ${Document1_FileInput_Location}=    Get Element Text    ${Life_XML}  ${Loc_Life_Document1_FileInput_Location}
    log to console  Document1_FileInput_Location-${Document1_FileInput_Location}
    ${Document2_FileInput_Location}=    Get Element Text    ${Life_XML}  ${Loc_Life_Document2_FileInput_Location}
    log to console  Document1_FileInput_Location-${Document2_FileInput_Location}
    ${Document3_FileInput_Location}=    Get Element Text    ${Life_XML}  ${Loc_Life_Document3_FileInput_Location}
    log to console  Document1_FileInput_Location-${Document3_FileInput_Location}
    ${Document4_FileInput_Location}=    Get Element Text    ${Life_XML}  ${Loc_Life_Document4_FileInput_Location}
    log to console  Document1_FileInput_Location-${Document4_FileInput_Location}
    ${Document5_FileInput_Location}=    Get Element Text    ${Life_XML}  ${Loc_Life_Document5_FileInput_Location}
    log to console  Document1_FileInput_Location-${Document5_FileInput_Location}

    ${Parent_WIP_Id}=    Get Element Text    ${Life_XML}  ${Loc_Life_Parent_WIP_Id}
    log to console  Parent_WIP_Id-${Parent_WIP_Id}
    ${DisplayName}=    Get Element Text    ${Life_XML}  ${Loc_Life_ActivityData_Displayname}
    log to console  DisplayName-${DisplayName}
    ${Agentnumber}=    Get Element Text    ${Life_XML}  ${Loc_Life_ActivityData_Agentnumber}
    log to console  Agentnumber-${Agentnumber}
    ${Primarycontact_Id}=    Get Element Text    ${Life_XML}  ${Loc_Life_ActivityData_PrimaryContact_Id}
    log to console  Primarycontact_Id-${Primarycontact_Id}

Keyword_Update_Life_XML_Values
    [arguments]     ${Life_XML}
    Set Element Text  ${Life_XML}  ${HouseHoldFirstName}  xpath=${Loc_Life_Signer1_FirstName}
    XML.Element Text Should Be	${Life_XML}  ${HouseHoldFirstName}  xpath=${Loc_Life_Signer1_FirstName}
    Set Element Text  ${Life_XML}  Robottest  xpath=${Loc_Life_Signer1_LastName}
    XML.Element Text Should Be	${Life_XML}  Robottest  xpath=${Loc_Life_Signer1_LastName}
    Set Element Text  ${Life_XML}  ${Agent_First_Name}  xpath=${Loc_Life_Signer2_FirstName}
    XML.Element Text Should Be	${Life_XML}  ${Agent_First_Name}  xpath=${Loc_Life_Signer2_FirstName}
    Set Element Text  ${Life_XML}  ${Agent_Last_Name}  xpath=${Loc_Life_Signer2_LastName}
    XML.Element Text Should Be	${Life_XML}  ${Agent_Last_Name}  xpath=${Loc_Life_Signer2_LastName}
     ##########################  Updating Documents File Input location ############################
    Set Element Text  ${Life_XML}  ${Life_Document1_FileInput_Location}  xpath=${Loc_Life_Document1_FileInput_Location}
    XML.Element Text Should Be	${Life_XML}  ${Life_Document1_FileInput_Location}  xpath=${Loc_Life_Document1_FileInput_Location}
    Set Element Text  ${Life_XML}  ${Life_Document2_FileInput_Location}  xpath=${Loc_Life_Document2_FileInput_Location}
    XML.Element Text Should Be	${Life_XML}  ${Life_Document2_FileInput_Location}  xpath=${Loc_Life_Document2_FileInput_Location}
    Set Element Text  ${Life_XML}  ${Life_Document3_FileInput_Location}  xpath=${Loc_Life_Document3_FileInput_Location}
    XML.Element Text Should Be	${Life_XML}  ${Life_Document3_FileInput_Location}  xpath=${Loc_Life_Document3_FileInput_Location}
    Set Element Text  ${Life_XML}  ${Life_Document4_FileInput_Location}  xpath=${Loc_Life_Document4_FileInput_Location}
    XML.Element Text Should Be	${Life_XML}  ${Life_Document4_FileInput_Location}  xpath=${Loc_Life_Document4_FileInput_Location}
    Set Element Text  ${Life_XML}  ${Life_Document5_FileInput_Location}  xpath=${Loc_Life_Document5_FileInput_Location}
    XML.Element Text Should Be	${Life_XML}  ${Life_Document5_FileInput_Location}  xpath=${Loc_Life_Document5_FileInput_Location}

     ##########################  Updating Misc Fields ############################
    Set Element Text  ${Life_XML}  ${Data_Life_Parent_WIP_Id}  xpath=${Loc_Life_Parent_WIP_Id}
    XML.Element Text Should Be	${Life_XML}  ${Data_Life_Parent_WIP_Id}  xpath=${Loc_Life_Parent_WIP_Id}
    Set Element Text  ${Life_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_Life_ActivityData_Displayname}
    XML.Element Text Should Be	${Life_XML}  Robottest,${HouseHoldFirstName}  xpath=${Loc_Life_ActivityData_Displayname}
    Set Element Text  ${Life_XML}  ${Data_Agentnumber}  xpath=${Loc_Life_ActivityData_Agentnumber}
    XML.Element Text Should Be	${Life_XML}  ${Data_Agentnumber}  xpath=${Loc_Life_ActivityData_Agentnumber}
    Set Element Text  ${Life_XML}  ${Primary_Client_Id}  xpath=${Loc_Life_ActivityData_PrimaryContact_Id}
    XML.Element Text Should Be	${Life_XML}  ${Primary_Client_Id}  xpath=${Loc_Life_ActivityData_PrimaryContact_Id}
    ${Life_XML}  element to string  ${Life_XML}
    ${tagged}  escape  ${Life_XML}  quote=False
    #log to console  Life_XML unescaped-${tagged}
    ${XML_File}  get file  ${CURDIR}/Input/eSignature_Request_Envelope.xml
    #log to console  XML_File-${XML_File}
    ${XML_String}=  String.Replace String  ${XML_File}  <request>ABC</request>  <request>&lt;?xml version=&#39;1.0&#39; encoding=&#39;UTF-8&#39;?&gt;${tagged}</request>
    create file  ${CURDIR}/Output/eSignature_Life_Post_Request.txt  ${XML_String}
    #log to console  XML_String-${XML_String}
    set test variable  ${XML_Updated_String}  ${XML_String}
    #Keyword_Python_soapUI_Post_Request  ${XML_String}

Keyword_Format_Life_Suite_XML_OLD
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${Life_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  Life_Envelope_XML-${Life_Envelope_XML}
    ${Life_XML}  Parse Xml  ${CURDIR}/Input/Life_Request.xml   #keep_clark_notation=yes
    log to console  Life_XML-${Life_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Agent_Specific_Life_Headless_eSignature_Representative_Variables  ${AgentID}
    Keyword_Document_Specific_Life_Headless_eSignature_FileInput_Locations
    Keyword_Fetch_Life_XML_Values  ${Life_XML}
    Keyword_Update_Life_XML_Values  ${Life_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}

Keyword_Format_Life_Suite_XML
    [arguments]     ${Flow_Old_New}  ${AgentID}  ${Agentnumber}  ${Life_Request_XML}
    set global variable  ${TCExecutionStatus}  False
    log to console   Updating XML
    ${Life_Envelope_XML}  Parse Xml  ${CURDIR}/Input/eSignature_Request_Envelope.xml  #keep_clark_notation=yes
    log to console  Life_Envelope_XML-${Life_Envelope_XML}
    ${Life_XML}  Parse Xml  ${CURDIR}/Input/${Life_Request_XML}   #keep_clark_notation=yes
    log to console  Life_XML-${Life_XML}
    Keyword_Environment_Specific_Headless_eSignature_Variables  ${Flow_Old_New}  ${AgentID}  ${Agentnumber}
    Keyword_Agent_Specific_Life_Headless_eSignature_Representative_Variables  ${AgentID}
    Keyword_Document_Specific_Life_Headless_eSignature_FileInput_Locations
    Keyword_Fetch_Life_XML_Values  ${Life_XML}
    Keyword_Update_Life_XML_Values  ${Life_XML}
    set global variable  ${TCExecutionStatus}  True
    [return]  ${TCExecutionStatus}
#####################################################################################################################################################
# Sample codes may be used for future enhancements
#####################################################################################################################################################
Keyword_Update_eSignature_Envelope_Request
    [arguments]     ${PolicyPro_XML}  ${PolicyPro_Envelope_XML}
    log to console  PolicyPro_XML-${PolicyPro_XML}
    ${PolicyPro_XML_String}  convert to string  ${PolicyPro_XML}
    log to console  PolicyPro_XML_String-${PolicyPro_XML_String}
    ${PolicyPro_XML_String}  escape  ${PolicyPro_XML_String}  quote=False
    log to console  PolicyPro_XML-escaped-${PolicyPro_XML_String}
    #XML.Save XML  ${PolicyPro_XML_String}  ${CURDIR}/PolicyPro_XML_Request_String_OP.xml  encoding=UTF-8
    Set Element Text  ${PolicyPro_Envelope_XML}  &lt;![CDATA[${PolicyPro_XML_String}]&gt;  xpath=.//request
    XML.Element Text Should Be	${PolicyPro_Envelope_XML}  &lt;![CDATA[${PolicyPro_XML_String}]&gt;  xpath=.//request
    #Set Element Text  ${PolicyPro_Envelope_XML}  ${PolicyPro_XML_String}  xpath=.//request
    #XML.Element Text Should Be	${PolicyPro_Envelope_XML}  ${PolicyPro_XML_String}  xpath=.//request
    XML.Save XML  ${PolicyPro_Envelope_XML}  ${CURDIR}/Output/PolicyPro_Envelope_XML_OP.xml  encoding=UTF-8
    set test variable  ${PolicyPro_Envelope_XML_Embeded}  ${PolicyPro_Envelope_XML}
    #${XML_File}  get file  ${CURDIR}/eSignature_Request_Envelope.xml
    #log to console  XML_File-${XML_File}
    #${XML_String}=  String.Replace String  ${XML_File}  <request>ABC</request>  <request>&lt;?xml version=&#39;1.0&#39; encoding=&#39;UTF-8&#39;?&gt;${PolicyPro_XML_String}</request>
    #log to console  XML_String-${XML_String}
    #encoding=UTF-8
    [return]  ${PolicyPro_Envelope_XML}


Keyword_Update_eSignature_Content_Request
    log to console  PolicyPro_XML_Embeded-${PolicyPro_XML_String_Embeded}
    [string]$xmlBudgets = Get-Content "D:\Upload\TestData.xml"
    ${encoded}=  [System.Web.HttpUtility]::HtmlEncode(${PolicyPro_XML_String_Embeded})

    Set Element Text  ${PolicyPro_Envelope_XML}  ${PolicyPro_XML_String}  xpath=.//request
    XML.Element Text Should Be	${PolicyPro_Envelope_XML}  ${PolicyPro_XML_String}  xpath=.//request
    XML.Save XML  ${PolicyPro_Envelope_XML}  ${CURDIR}/PolicyPro_Envelope_XML_OP.xml  encoding=UTF-8
    #encoding=UTF-8
    [return]  ${PolicyPro_Envelope_XML}

Keyword_Update_XM_Tags
    ${PolicyPro_XML}  Parse Xml  ${CURDIR}/PolicyPro_Request.xml   #keep_clark_notation=yes
    ${PolicyPro_XML_String}  convert to string  ${PolicyPro_XML}
    log to console  PolicyPro_XML-${PolicyPro_XML}
    log to console  PolicyPro_XML_String-${PolicyPro_XML_String}
    set local variable  ${escaped}  """&lt;?xml version="1.0" encoding="UTF-8"?&gt;&lt;Response&gt;&lt;Data&gt;&lt;Company&gt;"""
    ${unescaped}  unescape  ${escaped}
    log to console  unescaped-${unescaped}
    ${tagged}  escape  ${unescaped}  quote=False
    log to console  tagged-${tagged}
    #${PolicyPro_XML_String}=   SoapUIPostRequest.readfile
    log to console  PolicyPro_XML_String-${PolicyPro_XML_String}
    #${encoded}=  System.Web.HttpUtility.HtmlEncode  ${PolicyPro_XML_String}
    #log to console  encoded-${encoded}
    ${tagged}  escape  ${PolicyPro_XML_String}  quote=False
    log to console  PolicyPro_XML_String_Tagged-${tagged}
    #${PolicyPro_XML_String}  Replace String  ${PolicyPro_XML_String}  <  &lt;
    #${PolicyPro_XML_String}  Replace String  ${PolicyPro_XML_String}  >  &gt;
    #log to console  PolicyPro_XML_String-${PolicyPro_XML_String}
    XML.Save XML  ${PolicyPro_XML}  ${CURDIR}/PolicyPro_Request_UpdatedTag.xml  encoding=UTF-8

Keyword_Update_XML_File
    ${XML_File}  get file  ${CURDIR}/PolicyProRequest_Input.xml
    log to console  XML_File-${XML_File}





