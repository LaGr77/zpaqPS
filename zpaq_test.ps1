<#
.SYNOPSIS
    Test created archive by zpaq
.DESCRIPTION
    Test created archive by zpaq
.EXAMPLE
    .\zpaq_test.ps1
.NOTES
    Author:  Ladislav Grulich (LaGr77)
    Create:  25.03.2022
    Edited:  25.03.2022
    Version: 0.1.0
#>

## zapq path
$_TEST = $false;
$_ZPAQ = "$PSScriptRoot\_zpaq715\zpaq64.exe";
if ( ( Test-Path -Path $_ZPAQ -PathType "Leaf" ) -eq $false ) {
    do {
        $_ZPAQ = Read-Host "Path to zpaq64.exe";
        if ($_ZPAQ.EndsWith("\") ) {
            $_ZPAQ = $_ZPAQ -replace ".$";
        }
        $_ZPAQ = $_ZPAQ + "\zpaq64.exe"
        $_TEST = Test-Path -Path $_ZPAQ -PathType "Leaf"
    } while( $_TEST -eq $false )
}

## Input path
$_TEST = $false;
do {
    $_PATH_IN = Read-Host "Path to input directory (Enter = same as script home directory)";
    if ("" -eq $_PATH_IN) {
        $_PATH_IN = $PSScriptRoot;
    }
    $_TEST = Test-Path -Path $_PATH_IN -PathType "Container"
} while( $_TEST -eq $false )

if ($_PATH_IN.EndsWith("\") ) {
    $_PATH_IN = $_PATH_IN -replace ".$";
}

## Filename
do {
    $_FILENAME = Read-Host "Archive filename";
} while( ($_FILENAME -match "[^a-zA-Z0-9_]") -$false )

## test if archive file exists
if ( (Test-Path -Path "$_PATH_IN\$_FILENAME.zpaq") -eq $false ) {
    Write-Host "The file $_PATH_IN\$_FILENAME.zpaq does not exists";
    break;
}
if ( (Test-Path -Path "$_PATH_IN\$_FILENAME.ipaq") -eq $false ) {
    Write-Host "The file $_PATH_IN\$_FILENAME.ipaq does not exists";
    break;
}

## Password
$_PASS_1 = Read-Host -Prompt "Enter password" -AsSecureString;
$_BSTR_1 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PASS_1);

"Input path: $_PATH_IN" | Tee-Object "$_PATH_OUT\$_FILENAME.log";
"Filename: $_FILENAME" | Tee-Object "$_PATH_OUT\$_FILENAME.log" -Append;
""  | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;

$_RUN = "$_ZPAQ list $_PATH_IN\$_FILENAME.zpaq -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1))";
Invoke-Expression $_RUN | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;
Start-Sleep -Seconds 2;
Clear-Host;

$_RUN = "$_ZPAQ list $_PATH_IN\$_FILENAME.ipaq -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1))";
Invoke-Expression $_RUN | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;
Start-Sleep -Seconds 2;
Clear-Host;

$_RUN = "$_ZPAQ list $_PATH_IN\$_FILENAME.ipaq -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1)) -only *.log";
Invoke-Expression $_RUN | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;
Start-Sleep -Seconds 2;
Clear-Host;

$_RUN = "$_ZPAQ list $_PATH_IN\$_FILENAME.ipaq -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1)) -only *.pst";
Invoke-Expression $_RUN | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;
Start-Sleep -Seconds 2;
Clear-Host;

$_RUN = "$_ZPAQ list $_PATH_IN\$_FILENAME.ipaq -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1)) -only *.docx";
Invoke-Expression $_RUN | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;
Start-Sleep -Seconds 2;
Clear-Host;

# SIG # Begin signature block
# MIIGiwYJKoZIhvcNAQcCoIIGfDCCBngCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU2bBEZLcM5NRV7VEKyuXyXMNo
# jhygggPPMIIDyzCCArOgAwIBAgIQViGHnYe7vJpGUgpAqX3B/zANBgkqhkiG9w0B
# AQUFADBwMRUwEwYKCZImiZPyLGQBGRYFbG9jYWwxGDAWBgoJkiaJk/IsZAEZFghk
# ZHBvcnViYTEXMBUGA1UEAwwOZGRwb3J1YmEubG9jYWwxJDAiBgkqhkiG9w0BCQEW
# FWxncnVsaWNoQGRzcG9ydWJhLmNvbTAeFw0yMDA2MTcwODEwMzNaFw0zMDA2MTcw
# ODIwMzNaMHAxFTATBgoJkiaJk/IsZAEZFgVsb2NhbDEYMBYGCgmSJomT8ixkARkW
# CGRkcG9ydWJhMRcwFQYDVQQDDA5kZHBvcnViYS5sb2NhbDEkMCIGCSqGSIb3DQEJ
# ARYVbGdydWxpY2hAZHNwb3J1YmEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
# MIIBCgKCAQEAwBDuWaGtQ+DLvep5GfZueKeW5uK9sDCSKOgxicig5Ca7QK/U61qe
# s24XNu1r0xNcsHGHwXhviMXKYoIgnx4NoX4rXyETzNpAVHrFBOVncAsMMcQouNUo
# TiRGOcktXLG4iYawXTJa9nQzP73pEHqm17bwVE3lbcZANr2rX8U82spLCmTETdJQ
# Sn7yLwo88pWv6Ug3jW+N9GD4ganQcqv3AF8P/0ieOggEE02noApAuHPcoJpsuhhi
# ModqRedFVcUXwzgQm7bdN+A6UcCB6vMh2RK2HlaW0aRcX219dIFm/iY0cQSu0Bd0
# 4QUXZQXehKjJEtLpdTcfviWQWouPly0XRQIDAQABo2EwXzAOBgNVHQ8BAf8EBAMC
# B4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwGQYDVR0RBBIwEIIOZGRwb3J1YmEubG9j
# YWwwHQYDVR0OBBYEFAmwge0l28AM51uv3geLKcRHg7G7MA0GCSqGSIb3DQEBBQUA
# A4IBAQAO5gr4bFb1QTb9y0S9X6enyWPGFAFEFUdx+LCy2Va8n/9jcG6veMef5bBB
# xs/3M2mSR0WooG8wgXnvaKiRf19NBRjLw1M2h1uyKnwcUyudU+FM551Wzvqtrhnv
# EwtTPZHnIpJb+WfpGKsElQSmDfD4i4cIUI37F3ZJ+70heuBqpj/QclWtfrIhvKOf
# 2gQbigPMhhh54PrSho6Psyyfo4pEq5ZNxoyTtWoyGsKwqPvKAJI+vxlluPzoFLNl
# 1onRcci3ZDtszd//RofPO+EHDHBV0BSiyZcSsbFxQPSy9pUOPi46RqbhsPm0te+S
# 9Uw4nsXECZcI80zx9oZ1Dd0zLp5TMYICJjCCAiICAQEwgYQwcDEVMBMGCgmSJomT
# 8ixkARkWBWxvY2FsMRgwFgYKCZImiZPyLGQBGRYIZGRwb3J1YmExFzAVBgNVBAMM
# DmRkcG9ydWJhLmxvY2FsMSQwIgYJKoZIhvcNAQkBFhVsZ3J1bGljaEBkc3BvcnVi
# YS5jb20CEFYhh52Hu7yaRlIKQKl9wf8wCQYFKw4DAhoFAKB4MBgGCisGAQQBgjcC
# AQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYB
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFAzUJ9jCzyZ6
# AMbRP40LgK+2RQwAMA0GCSqGSIb3DQEBAQUABIIBAG7gL7WddLwCcbRLakOO9yUc
# o97Oq8D+O0/LFUY+zuaLOcvk477BX+uvCGaRep06NPW1w0VIgzebwkAhVUeKltpb
# vSbfXUU3riVxIjO4TQeCh6lW77XNcm0XkWA9gfCCGVjPneIxuh5672/81IEaUv9g
# 6oH4ycbJMGm39mhdJC4dyotu65PNBF9jAkK1ldm3SLMwMybX9HPv2PVsJCIc8XUq
# ERstx9I/SF7KGYru9RlGLV+xMMDObRHQMDMCYGlm9MsrpiDbh57rURcU8v8AlhFi
# wx3KQgbdT9W39iVIGWOfDn+qt9RN69j9xJYQmppLLVPy9Br6uVsG6zd70PpGGm4=
# SIG # End signature block
