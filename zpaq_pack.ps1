<#
.SYNOPSIS
    Create archive by zpaq
.DESCRIPTION
    Create archive by zpaq
.EXAMPLE
    .\zpaq_pack.ps1
.NOTES
    Author:  Ladislav Grulich (LaGr77)
    Create:  25.03.2022
    Edited:  01.04.2022
    Version: 0.1.1
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
    $_PATH_IN = Read-Host "Path to input directory";
    $_TEST = Test-Path -Path $_PATH_IN -PathType "Container"
} while( $_TEST -eq $false )

if ($_PATH_IN.EndsWith("\") ) {
    $_PATH_IN = $_PATH_IN -replace ".$";
}

$_TEST = $false;
## Outputh path
do {
    $_PATH_OUT = Read-Host "Path to output directory (Enter = same as script home directory)";
    if ("" -eq $_PATH_OUT) {
        $_PATH_OUT = $PSScriptRoot;
    }
    $_TEST = Test-Path -Path $_PATH_OUT -PathType "Container"
    if ($_PATH_IN -eq $_PATH_OUT) {$_TEST = $false;}
} while( $_TEST -eq $false )

if ($_PATH_OUT.EndsWith("\") ) {
    $_PATH_OUT = $_PATH_OUT -replace ".$";
}

## Filename
do {
    $_FILENAME = Read-Host "Archive filename";
} while( ($_FILENAME -match "[^a-zA-Z0-9_]") -$false )

## Password
do {
    $_PASS_1 = Read-Host -Prompt "Enter password" -AsSecureString;
    $_PASS_2 = Read-Host -Prompt "Enter password again" -AsSecureString;
    $_BSTR_1 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PASS_1);
    $_BSTR_2 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PASS_2);
} while ( ([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1) -eq [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_2) ) -eq $false)

"Input path: $_PATH_IN" | Tee-Object "$_PATH_OUT\$_FILENAME.log";
"Outpu path: $_PATH_OUT" | Tee-Object "$_PATH_OUT\$_FILENAME.log" -Append;
"Filename: $_FILENAME" | Tee-Object "$_PATH_OUT\$_FILENAME.log" -Append;
""  | Tee-Object "$_PATH_OUT\$_FILENAME.log" -Append;

$_RUN = "$_ZPAQ add $_PATH_OUT\$_FILENAME.zpaq $_PATH_IN -method 5 -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1)) -index $_PATH_OUT\$_FILENAME.ipaq"
Invoke-Expression $_RUN | Tee-Object "$_PATH_OUT\$_FILENAME.log" -Append;


## $PSScriptRoot\7z\7za.exe a -t7z -mx=9 -ms=on -m0=PPMd %_sifruj% %_vystup%.7z %_vstup%
## $PSScriptRoot\7z\7za.exe a -t7z -m0=lzma2 -mmt=4 -mx=9 -mfb=64 -md=32m -ms=on %_sifruj% %_vystup%.7z %_vstup%
## $PSScriptRoot\7z\7za.exe a -t7z -m0=lzma2 -mmt=4 -mx=9 -mfb=64 -md=64m -ms=on %_sifruj% %_vystup%.7z %_vstup%
## $PSScriptRoot\7z\7za.exe a -t7z -m0=lzma2 -mmt=4 -mx=9 -mfb=64 -md=128m -ms=on %_sifruj% %_vystup%.7z %_vstup%
## $PSScriptRoot\7z\7za.exe a -t7z -m0=lzma2 -mmt=4 -mx=9 -mfb=64 -md=256m -ms=on %_sifruj% %_vystup%.7z %_vstup%
## $PSScriptRoot\7z\7za.exe a -t7z -m0=lzma2 -mmt=4 -mx=9 -mfb=64 -md=512m -ms=on %_sifruj% %_vystup%.7z %_vstup%
## $PSScriptRoot\7z\7za.exe a -t7z -m0=lzma2 -mmt=4 -mx=9 -mfb=64 -md=1024m -ms=on %_sifruj% %_vystup%.7z %_vstup%

## $PSScriptRoot\zpaq715\zpaq64.exe add %_vystup%.zpaq %_vstup% -method 0 -key %_Password%
## $PSScriptRoot\zpaq715\zpaq64.exe add %_vystup%.zpaq %_vstup% -method 1 -key %_Password%
## $PSScriptRoot\zpaq715\zpaq64.exe add %_vystup%.zpaq %_vstup% -method 2 -key %_Password% 
## $PSScriptRoot\zpaq715\zpaq64.exe add %_vystup%.zpaq %_vstup% -method 3 -key %_Password%
## $PSScriptRoot\zpaq715\zpaq64.exe add %_vystup%.zpaq %_vstup% -method 4 -key %_Password%
## $PSScriptRoot\zpaq715\zpaq64.exe add %_vystup%.zpaq %_vstup% -method 5 -key %_Password%


# SIG # Begin signature block
# MIIGiwYJKoZIhvcNAQcCoIIGfDCCBngCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUIhSzshe3QNs4ZCVgfRpSqsku
# xoqgggPPMIIDyzCCArOgAwIBAgIQViGHnYe7vJpGUgpAqX3B/zANBgkqhkiG9w0B
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFGIZ5VTD/9Ob
# 3jJqqv4aEHZvhsgLMA0GCSqGSIb3DQEBAQUABIIBAC3nJeaYxYFeIk1JNAAbUUQc
# fZlsu2bb1OxLjTyato5AWVkfprWylah0Yq0bB35acmV+pobmLZ5MFPKCb59KLKvo
# eNJKaWarAIc5JsUjZ5g20kSb2iivZHzasRoqWhOlEqPIuv+BfE982tGpUgG5YXkm
# 1YwpekDy3jgWEvTyuKena69U2duhbjgwW8vWKz1iWcGzJrSNFrmaFK6wd2On8H9y
# 8YezKt2UsJ2SeydIowP2ybVGeAIybx4Glo+mN0RmRvR05Iy4RTN60mdWZcm6A4lo
# b8cGkZYR6vZ5JSxi7tYiq2MwgxDoq6/Tno1pcgkyK4A3VNDRp/lEt53LQjknDWs=
# SIG # End signature block
