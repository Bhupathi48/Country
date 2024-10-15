########################################################################
*** Settings ***
########################################################################
#Library    Selenium2Library
Library    SeleniumLibrary  10  5  run_on_failure=None
Library    ExcelLibrary
Library    Collections
Library    robot.libraries.DateTime
Library    String
Library    SoapLibrary
Library    OperatingSystem
Library     urllib.request
Resource    ../CommonKeywords.robot
Resource    ../DataVariables/LNT_GlobalVariables.robot
Resource    ../DataVariables/BrainBox_GlobalVariables.robot
Resource    ../DataVariables/NAVengers_GlobalVariables.robot
Resource    ../Locators/LNT_ReUsableLocators.robot
Resource    ../Locators/BrainBox_ReUsableLocators.robot
Resource    ../Locators/NAVengers_ReUsableLocators.robot
Library    ../UserKeywordsPython.py
Resource    ../LNT_ApplicationFlows/LNT_Imports.resource
Resource    ../BrainBox_ApplicationFlows/BrainBox_Imports.resource
Resource    ../NAVengers_ApplicationFlows/NAVengers_Imports.resource
Resource    ../SOAPUI_Automation/SOAPUI_Imports.resource
Resource    ../Common_ApplicationFlows/Common_ApplicationFlows_Imports.resource
########################################################################
*** Keywords ***
########################################################################
Keyword_soapUI_Get_Request
    set local variable  ${Cookie_Header}  ObSSOCookie=E3KNdO3URuCMqQcwHB63S4KCRt4.*AAJTSQACMDIAAlNLABxsVlBTTXFRNndqSHN3MEo5MnowZXlWOWNjM2M9AAR0eXBlAANDVFMAAlMxAAIxMQ..*
    ${Header}=  create dictionary  cookie=${Cookie_Header}
    log to console  ${Header}
    #set local variable  ${filePath}  r'./Resources/TestData/SignatureService.wsdl'
    #SoapLibrary.Create Soap Client  https://gitlab.countrypassport.com/agency/navigator/services/navesig/-/blob/master/src/wsdl/SignatureService.wsdl  ssl_verify=False
    #Create Soap Client  ./Resources/TestData/SignatureService.wsdl
    SoapLibrary.Create Soap Client  ${CURDIR}\\SignatureService.wsdl  headers=${Header}
    #Create Soap Client  ${filePath}
    #${response}  Call SOAP Method With XML  ${CURDIR}/eSignature_Samplerequest.xml  headers=${Header}
    ${response}  SoapLibrary.Call SOAP Method With XML  ${CURDIR}\\eSignature_Samplerequest.xml  headers=${Header}
    log to console  Response-${response}
