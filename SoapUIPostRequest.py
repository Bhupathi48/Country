import datetime
import uuid
import os
import requests
import xlrd
import xlwt
from xlutils.copy import copy
import json
from random import randint
import xml.dom.minidom
import csv

class SoapUIPostRequest():

  def performLogin(self, url, Hostname, agentid, agentpass):
      #url = 'https://amint.countrypassport.net/sso/json/authenticate?authIndexType=service&authIndexValue=ldapService'
      headers = {'content-type':'application/json', 'Host':Hostname, 'Expect':'100-continue', 'Connection':'keep-alive', 'X-OpenAM-Username':agentid, 'X-OpenAM-Password':agentpass}
      loginresponse = None
      try:
          loginresponse = requests.post(url, headers=headers, verify=False)
      except Exception as ins:
          print('Exception ', ins)
          print(loginresponse.content)
      else:
          print(loginresponse.content)
          print(loginresponse.text)
          print(loginresponse.status_code)
          print(loginresponse.request)
          print(loginresponse.url)
          jsonResponse = loginresponse.json()
          print("Entire JSON response")
          print(jsonResponse)
          print(jsonResponse['tokenId'])
          tokenId = (jsonResponse['tokenId'])
          #login_Response = json.loads(loginresponse.text)
          #print(json_format(login_Response)[0]['tokenId'])
          #loginresponse.close()
          return tokenId

  def sendXMLToSoap(self, token, eSignature_XML, Endpoint_Url):
      print('tokenId ', token)
      print('Endpoint_Url ', Endpoint_Url)
      #xmlData = open('eSignature_Samplerequest.xml', 'r')
      #xmlData = open(r'../SOAPUI_Automation/eSignature_Samplerequest.xml', 'r')
      #%filePath = r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\PolicyPro_XML_Request_OP.xml'
      #filePath = r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\eSignature_Samplerequest.XML'
      #%xmlData = open(filePath, 'r')
      #%xml = xmlData
      #cookiename = 'ObSSOCookie=3N0LYFHIIh_UmM44Bmdzq4NrYKM.*AAJTSQACMDIAAlNLABxWVlJlbEdsMnJ5Q0pKeWNzZU02NjF0dzArdjg9AAR0eXBlAANDVFMAAlMxAAIwNQ..*'
      #%cookiename = token
      #%print('cookiename ', cookiename)
      #url = 'https://navesig-int3.intapps.cloud.countrypassport.net/api/soap/signatureserviceSOAP'
      url = Endpoint_Url
      #headers = {'content-type':'text/xml;charset=UTF-8', 'Cookie':'ObSSOCookie=cookiename', 'SOAPAction':'execute', 'Connection':'Keep-Alive', 'Accept':'*/*', 'Accept-Encoding':'gzip,deflate', 'Accept-Language':'en-US,en;q=0.8', 'X-OpenAM-Username':'ID42062', 'X-OpenAM-Password':'KKkk9999'}
      headers = {'content-type': 'text/xml;charset=UTF-8', 'SOAPAction': 'execute',
                 'Connection': 'keep-alive', 'Accept': '*/*', 'Accept-Encoding': 'gzip,deflate',
                 'Accept-Language': 'en-US,en;q=0.8'}
      Cookies = {'ObSSOCookie': token}
      response = None
      try:
          #response = requests.post(url, data=xml, headers=headers, cookies=Cookies, verify=False)
          response = requests.post(url, data=eSignature_XML, headers=headers, cookies=Cookies, verify=False)
      except Exception as ins:
          print('Exception ', ins)
          print (response.status_code)
          print(response.content)
      else:
          print (response.content)
          print (response.text)
          print (response.status_code)
          print (response.request)
          print(response.url)
          response.close()
          return response.status_code

  def readfile(self):
      filePath = r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\PolicyPro_XML_Request_OP.xml'
      xmlData = open(filePath, 'r')
      xml = xmlData
      return xml

  def saveWorkSpace(self, File_Path, flow, name, environment, date, consumed):
      #rb = xlrd.open_workbook(r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\Output\Headless_eSignature_Flows.xls', formatting_info=True)
      # Get the current working directory
      cwd = os.getcwd()
      # Print the current working directory
      print("Current working directory: {0}".format(cwd))
      #rb = xlrd.open_workbook(r'../Resources/SOAPUI_Automation/Output/Headless_eSignature_Flows.xls', formatting_info=True)
      rb = xlrd.open_workbook(File_Path, formatting_info=True)
      r_sheet = rb.sheet_by_index(0)
      r = r_sheet.nrows
      wb = copy(rb)
      sheet = wb.get_sheet(0)
      sheet.write(r, 0, flow)
      sheet.write(r, 1, name)
      sheet.write(r, 2, environment)
      sheet.write(r, 3, date)
      sheet.write(r, 4, consumed)
      print('WB', wb)
      #wb.save(r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\Output\Headless_eSignature_Flows.xls')
      #wb.save(r'../Resources/SOAPUI_Automation/Output/Headless_eSignature_Flows.xls')
      wb.save(File_Path)
      print('Wrote Headless_eSignature_Flows.xls')

  def wipClosureForBilling(self, token, Endpoint_Url):
      print('tokenId ', token)
      #xmlData = open('eSignature_Samplerequest.xml', 'r')
      #xmlData = open(r'../SOAPUI_Automation/eSignature_Samplerequest.xml', 'r')
      #%filePath = r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\PolicyPro_XML_Request_OP.xml'
      #filePath = r'C:\Users\ID73414\PycharmProjects\TestProject\Resources\SOAPUI_Automation\eSignature_Samplerequest.XML'
      #%xmlData = open(filePath, 'r')
      #%xml = xmlData
      #cookiename = 'ObSSOCookie=3N0LYFHIIh_UmM44Bmdzq4NrYKM.*AAJTSQACMDIAAlNLABxWVlJlbEdsMnJ5Q0pKeWNzZU02NjF0dzArdjg9AAR0eXBlAANDVFMAAlMxAAIwNQ..*'
      #%cookiename = token
      #%print('cookiename ', cookiename)
      #url = 'https://navesig-int3.intapps.cloud.countrypassport.net/api/soap/signatureserviceSOAP'
      url = Endpoint_Url
      #headers = {'content-type':'text/xml;charset=UTF-8', 'Cookie':'ObSSOCookie=cookiename', 'SOAPAction':'execute', 'Connection':'Keep-Alive', 'Accept':'*/*', 'Accept-Encoding':'gzip,deflate', 'Accept-Language':'en-US,en;q=0.8', 'X-OpenAM-Username':'ID42062', 'X-OpenAM-Password':'KKkk9999'}
      Cookies = {'ObSSOCookie': token}
      headers = {'key': 'CFUSERID', 'type': 'text',
                 'value': 'ID42351'}
      Cookies = {'ObSSOCookie': token}
      response = None
      try:
          #response = requests.post(url, data=xml, headers=headers, cookies=Cookies, verify=False)
          response = requests.get(url, headers=headers, cookies=Cookies, verify=False)
      except Exception as ins:
          print('Exception ', ins)
          print (response.status_code)
          print(response.content)
      else:
          print (response.content)
          print (response.text)
          print (response.status_code)
          print (response.request)
          print(response.url)
          response.close()
          return response.status_code

