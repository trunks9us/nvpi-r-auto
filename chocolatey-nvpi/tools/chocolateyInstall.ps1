$ErrorActionPreference = 'Stop'

$installDir = Join-Path $env:USERPROFILE 'NVPI'

$packageArgs = @{
    packageName   = 'nvpi'
    unzipLocation = $installDir
    url           = 'https://github.com/Orbmu2k/nvidiaProfileInspector/releases/download/v3.0.2.2/nvidiaProfileInspector.zip'
    checksum      = 'c23fa0e36ff7ef24154c9a69d7fe2098e51982d79085e249504f24c5086e2950'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$exe = Join-Path $installDir 'nvidiaProfileInspector.exe'
Install-ChocolateyShortcut `
    -ShortcutFilePath (Join-Path ([Environment]::GetFolderPath('Desktop')) 'NVIDIA Profile Inspector.lnk') `
    -TargetPath $exe `
    -WorkingDirectory $installDir

$startMenu = Join-Path ([Environment]::GetFolderPath('Programs')) 'NVIDIA Profile Inspector.lnk'
Install-ChocolateyShortcut `
    -ShortcutFilePath $startMenu `
    -TargetPath $exe `
    -WorkingDirectory $installDir