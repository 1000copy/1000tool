

[Setup]
AppName=1000tool
AppVersion=1.5
DefaultDirName={pf}\1000tool
DefaultGroupName=1000tool
UninstallDisplayIcon={app}\r.exe
Compression=lzma2
SolidCompression=yes
OutputDir=.
OutputBaseFilename=1000setup
[Files]
Source: c.r; DestDir: {app}; 
Source: r.exe; DestDir: {app}; 
Source: procxp\*; DestDir: {app}\procxp;
Source: Everything\*; DestDir: {app}\Everything;
Source: npp\*; DestDir: {app}\npp; Flags: recursesubdirs; 
Source: usbeject\*; DestDir: {app}\usbeject;
[Icons]
Name: "{group}\1000tool"; Filename: {app}\r.exe; Parameters: "-s c.r"; 
Name: {group}\Uninstall; Filename: {app}\unins000.exe; 

[Run]
Filename: {app}\r.exe; Parameters: "-s c.r"; Flags: NoWait ShellExec PostInstall; Description: AppStarter; 
