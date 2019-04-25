; Script generated by the HM NIS Edit Script Wizard.

SetCompress force
SetCompressor /SOLID LZMA
  
; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "TRTCApp"
!define PRODUCT_VERSION "6.0.1.100"
!define PRODUCT_PUBLISHER "��Ѷ��"
!define PRODUCT_WEB_SITE "https://cloud.tencent.com/document/product/454/6555#Windows"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_NAME}.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "setup.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

;WorkPlus Setup Script
Unicode true

;Windows VistaϵͳΪӦ�ó�������Ȩ��
;RequestExecutionLevel admin
  
; Welcome page
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY ;����NSISѡ��Ŀ¼����
; License page
;!insertmacro MUI_PAGE_LICENSE "c:\path\to\licence\YourSoftwareLicence.txt"
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\TRTCApp.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "TRTCAppSetup32_6.0.1.100.exe"
InstallDir "$PROGRAMFILES\TRTCApp"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "MainSection" SEC01
  CreateDirectory "$INSTDIR\trtcres\"
  CreateDirectory "$INSTDIR\trtcskin\"
  CreateDirectory "$INSTDIR\trtcskin\bottom"
  CreateDirectory "$INSTDIR\trtcskin\common"
  CreateDirectory "$INSTDIR\trtcskin\login"
  CreateDirectory "$INSTDIR\trtcskin\menu"
  CreateDirectory "$INSTDIR\trtcskin\msgbox"
  CreateDirectory "$INSTDIR\trtcskin\setting"
  CreateDirectory "$INSTDIR\trtcskin\videoview"

  SetOverwrite on
  
  SetOutPath "$INSTDIR"
  File "..\Build\Bin\Win32\Release\*.dll"
  File "..\Build\Bin\Win32\Release\*.exe"
 
  SetOutPath "$INSTDIR\trtcskin"
  File "..\Build\Bin\Win32\Release\trtcskin\*.*"
  SetOutPath "$INSTDIR\trtcskin\bottom"
  File "..\Build\Bin\Win32\Release\trtcskin\bottom\*.*"
  SetOutPath "$INSTDIR\trtcskin\common"
  File "..\Build\Bin\Win32\Release\trtcskin\common\*.*"
  SetOutPath "$INSTDIR\trtcskin\login"
  File "..\Build\Bin\Win32\Release\trtcskin\login\*.*"
  SetOutPath "$INSTDIR\trtcskin\menu"
  File "..\Build\Bin\Win32\Release\trtcskin\menu\*.*"
  SetOutPath "$INSTDIR\trtcskin\msgbox"
  File "..\Build\Bin\Win32\Release\trtcskin\msgbox\*.*"
  SetOutPath "$INSTDIR\trtcskin\setting"
  File "..\Build\Bin\Win32\Release\trtcskin\setting\*.*"
  SetOutPath "$INSTDIR\trtcskin\videoview"
  File "..\Build\Bin\Win32\Release\trtcskin\videoview\*.*"

  SetOutPath "$INSTDIR\trtcres"
  File "..\Build\Bin\Win32\Release\trtcres\*.*"

  ;Exec "$INSTDIR\vc_redist.x86.exe /q" ;�������ڣ�ִ�о�Ĭ��װ
  
  CreateShortCut "$SMPROGRAMS\TRTCApp\${PRODUCT_NAME}.lnk" "$INSTDIR\TRTCApp.exe"
  
  ;WriteRegStr HKCR "TXCloudRoom" "" "TXCloudRoom Protocol"
  ;WriteRegStr HKCR "TXCloudRoom" "URL Protocol" "$INSTDIR\TXCloudRoom.exe"
  ;WriteRegStr HKCR "TXCloudRoom\DefaultIcon" "" "$INSTDIR\TXCloudRoom.exe,1"
  ;WriteRegStr HKCR "TXCloudRoom\shell\open\command" "" '"$INSTDIR\TXCloudRoom.exe","%1"'
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\TRTCApp\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\TRTCApp\Uninstall.lnk" "$INSTDIR\uninst.exe"
  CreateShortCut "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\TRTCApp.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\TRTCApp.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\TRTCApp.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
FunctionEnd

Function un.onInit
!verbose push
!verbose push
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���估���е������" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\*.exe"
  Delete "$INSTDIR\*.dll"

  Delete "$SMPROGRAMS\TRTCApp\Uninstall.lnk"
  Delete "$SMPROGRAMS\TRTCApp\Website.lnk"
  Delete "$SMPROGRAMS\TRTCApp\TRTCApp.lnk"
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk"

  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  
  Delete "$INSTDIR\trtcres\*.*"
  Delete "$INSTDIR\trtcskin\*.*"
  Delete "$INSTDIR\trtcskin\bottom\*.*"
  Delete "$INSTDIR\trtcskin\common\*.*"
  Delete "$INSTDIR\trtcskin\login\*.*"
  Delete "$INSTDIR\trtcskin\menu\*.*"
  Delete "$INSTDIR\trtcskin\msgbox\*.*"
  Delete "$INSTDIR\trtcskin\setting\*.*"
  Delete "$INSTDIR\trtcskin\videoview\*.*"

  RMDir "$SMPROGRAMS\TRTCApp"
  RMDir "$INSTDIR\trtcres"
  RMDir "$INSTDIR\trtcskin\bottom"
  RMDir "$INSTDIR\trtcskin\common"
  RMDir "$INSTDIR\trtcskin\login"
  RMDir "$INSTDIR\trtcskin\menu"
  RMDir "$INSTDIR\trtcskin\msgbox"
  RMDir "$INSTDIR\trtcskin\setting"
  RMDir "$INSTDIR\trtcskin\videoview"
  RMDir "$INSTDIR\trtcskin"
  RMDir "$INSTDIR"

  DeleteRegKey HKCR "TRTCApp"
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd