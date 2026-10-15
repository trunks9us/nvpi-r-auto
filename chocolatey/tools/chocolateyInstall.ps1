$ErrorActionPreference = 'Stop'

$installDir = Join-Path $env:USERPROFILE 'NVPI-R'

$packageArgs = @{
    packageName   = 'nvpi-r'
    unzipLocation = $installDir
    url           = 'https://github.com/xHybred/NvidiaProfileInspectorRevamped/releases/download/v7.3.0.0/NVPI-R.zip'
    checksum      = '1ac245f659d1c74b82bb09e49076b65d1b29e423d73e2860e357c0ed948b70ca'
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