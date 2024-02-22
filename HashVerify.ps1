$ruta = Read-Host "Ingresa la ruta del archivo a comprobar"
Set-Location "$ruta"
Get-ChildItem

$paraVerificar = Read-Host "Nombre del archivo a verificar"
$hashObtenido = (Read-Host "Ingresa el Hash de comprobación").ToLower()

Write-Output "Ingresa el tipo de valor criptográfico a comprobar: "
Write-Output "Este programa puede comprobar: "
Write-Output ""
Write-Output MD5
Write-Output SHA1
Write-Output SHA256
Write-Output SHA384
Write-Output SHA512
Write-Output ""
$tipo = (Read-Host "Valor de Encriptamiento").ToUpper()

$md5 = New-Object -TypeName System.Security.Cryptography.md5CryptoServiceProvider
$sha1 = New-Object -TypeName System.Security.Cryptography.sha1CryptoServiceProvider
$sha256 = New-Object -TypeName System.Security.Cryptography.sha256CryptoServiceProvider
$sha384 = New-Object -TypeName System.Security.Cryptography.sha384CryptoServiceProvider
$sha512 = New-Object -TypeName System.Security.Cryptography.sha512CryptoServiceProvider

if($tipo -eq "MD5"){
    $verificarCon = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes("$PWD\$paraVerificar"))).ToLower() -replace '-', ''
}
if($tipo -eq "SHA1"){
    $verificarCon = [System.BitConverter]::ToString($sha1.ComputeHash([System.IO.File]::ReadAllBytes("$PWD\$paraVerificar"))).ToLower() -replace '-', ''
}
if($tipo -eq "SHA256"){
    $verificarCon = [System.BitConverter]::ToString($sha256.ComputeHash([System.IO.File]::ReadAllBytes("$PWD\$paraVerificar"))).ToLower() -replace '-', ''
}
if($tipo -eq "SHA384"){
    $verificarCon = [System.BitConverter]::ToString($sha384.ComputeHash([System.IO.File]::ReadAllBytes("$PWD\$paraVerificar"))).ToLower() -replace '-', ''
}
if($tipo -eq "SHA512"){
    $verificarCon = [System.BitConverter]::ToString($sha512.ComputeHash([System.IO.File]::ReadAllBytes("$PWD\$paraVerificar"))).ToLower() -replace '-', ''
}

Write-Output ""
Write-Output "Hash obtenido de la comprobación: "
Write-Output $verificarCon
Write-Output "Hash ingresado por el usuario"
Write-Output $hashObtenido
Write-Output ""

if($verificarCon -eq "$hashObtenido"){
    Write-Output " <Datos Integros>  "
}else {
    Write-Output " <Datos Corruptos> "
}
