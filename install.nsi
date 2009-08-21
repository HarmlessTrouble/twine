; Generated NSIS script file (generated by makensitemplate.phtml 0.21)
; by 68.48.123.220 on Dec 27 08 @ 17:56

; NOTE: this .NSI script is designed for NSIS v1.8+

Name "Twine 1.0"
OutFile "twine_10_windows.exe"

; Some default compiler settings (uncomment and change at will):
; SetCompress auto ; (can be off or force)
; SetDatablockOptimize on ; (can be off)
; CRCCheck on ; (can be off)
; AutoCloseWindow false ; (can be true for the window go away automatically at end)
; ShowInstDetails hide ; (can be show to have them shown, or nevershow to disable)
; SetDateSave off ; (can be on to have files restored to their orginal date)

InstallDir "$PROGRAMFILES\Twine"
InstallDirRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Twine" ""
;DirShow show ; (make this hide to not let the user change it)
DirText "Choose which folder to install Twine into:"

Section "" ; (default section)
SetOutPath "$INSTDIR"

; add files / whatever that need to be installed here.

File "*.pyd"
File "*.zip"
File "*.dll"
File "twine.exe"
File "w9xpopen.exe"
File /r "targets"
File /r "icons"

; add Start Menu entries

CreateDirectory "$SMPROGRAMS\Twine 1.0\"
CreateShortCut "$SMPROGRAMS\Twine 1.0\Twine.lnk" "$INSTDIR\twine.exe"
CreateShortCut "$SMPROGRAMS\Twine 1.0\Uninstall.lnk" "$INSTDIR\uninstalltwine.exe"

; add uninstall entry in Add/Remove Programs

WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Twine" "" "$INSTDIR"
WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\Twine" "DisplayName" "Twine 1.0 (remove only)"
WriteRegStr HKEY_LOCAL_MACHINE "Software\Microsoft\Windows\CurrentVersion\Uninstall\Twine" "UninstallString" '"$INSTDIR\uninstalltwine.exe"'

; write out uninstaller

WriteUninstaller "$INSTDIR\uninstalltwine.exe"
SectionEnd ; end of default section


; begin uninstall settings/section

UninstallText "This will uninstall Twine 1.0 from your system."

Section Uninstall

; add delete commands to delete whatever files/registry keys/etc you installed here.

Delete "$INSTDIR\uninstalltwine.exe"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Twine"
DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Twine"
RMDir /r "$SMPROGRAMS\Twine 1.0"
RMDir /r "$INSTDIR"
SectionEnd ; end of uninstall section

; eof