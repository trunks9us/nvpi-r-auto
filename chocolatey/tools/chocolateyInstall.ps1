$ErrorActionPreference = 'Stop'

$installDir = Join-Path $env:USERPROFILE 'NVPI-R'

$packageArgs = @{
    packageName   = 'nvpi-r'
    unzipLocation = $installDir
    url           = 'https://github.com/xHybred/NvidiaProfileInspectorRevamped/releases/download/v7.2.1.0/NVPI-R.zip'
    checksum      = '6f979a7f27cb9bb814b54e44e019b3cf1b649134dacf80bb762d054802966b51'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$nested = Join-Path $installDir 'NVPI-R'
if (Test-Path $nested) {
    Get-ChildItem $nested | Move-Item -Destination $installDir -Force
    Remove-Item $nested -Recurse -Force
}

$exe = Join-Path $installDir 'NVPI-R.exe'
Install-ChocolateyShortcut `
    -ShortcutFilePath (Join-Path ([Environment]::GetFolderPath('Desktop')) 'NVPI Revamped.lnk') `
    -TargetPath $exe `
    -WorkingDirectory (Split-Path $exe)

$startMenu = Join-Path ([Environment]::GetFolderPath('Programs')) 'NVPI Revamped.lnk'
Install-ChocolateyShortcut `
    -ShortcutFilePath $startMenu `
    -TargetPath $exe `
    -WorkingDirectory (Split-Path $exe)