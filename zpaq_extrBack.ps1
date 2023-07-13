<#
.SYNOPSIS
    Extract incremental backup by zpaq
.DESCRIPTION
    Extract incremental backup by zpaq to temp profile
.EXAMPLE
    .\zpaq_extr.ps1
.NOTES
    Author:  Ladislav Grulich (LaGr77)
    Create:  13.07.2023
    Edited:  13.07.2023
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
        $_PATH_IN_TMP = Read-Host "$PSScriptRoot\xxxxxx"
        $_PATH_IN = "$PSScriptRoot\$_PATH_IN_TMP";
    }
    $_TEST = Test-Path -Path $_PATH_IN -PathType "Container"
} while( $_TEST -eq $false )

if ($_PATH_IN.EndsWith("\") ) {
    $_PATH_IN = $_PATH_IN -replace ".$";
}

## Output path
if ( $( Read-Host "Rozpakovat do tmpProfilu (a), jinak do c:\temp" ) -eq "a" ) {
    $_PATH_OUT_TYPE = $true;
} else {
    $_PATH_OUT_TYPE = $false;
}

if ($_PATH_OUT_TYPE -eq $true) {
    $_PATH_OUT = $_PATH_IN;
    $_PATH_OUT = $_PATH_OUT.replace("Backup\_Pack", "BackupPack");
} else {
    $_PATH_OUT = "C:\temp";
}

if ( (Test-Path -Path $_PATH_OUT -PathType "Container") -eq $false ) {
    New-Item -ItemType directory -Path $_PATH_OUT
}

## jmeno profilu
if ($_PATH_OUT_TYPE -eq $true) {
    $_TMP_PROFILE_NAME = "C:\Users\$(Read-Host "Tmp profile name: ")";
    if ( !(Test-Path -Path $_TMP_PROFILE_NAME -PathType "Container") ) {
        New-Item -ItemType SymbolicLink -Path $_TMP_PROFILE_NAME -Target $_PATH_OUT
    }
}

## psw
$_PSW_TMP = Get-Content "\\W2012dc\NETLOGON\SKRIPTY\PasswordEncryptedFiles.txt" | ConvertTo-SecureString -Key (Get-Content ("\\W2012dc\NETLOGON\SKRIPTY\aes.key"));

## uncompress
## desk
$_FILENAME = "desk????.zpaq"
if ( (Test-Path -Path $_PATH_IN\$_FILENAME -PathType "Leaf") -eq $true ) {
    if ($_PATH_OUT_TYPE -eq $true) {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    } else {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -to $_PATH_OUT -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    }
}
Invoke-Expression $_RUN;

## docu
$_FILENAME = "docu????.zpaq"
if ( (Test-Path -Path $_PATH_IN\$_FILENAME -PathType "Leaf") -eq $true ) {
    if ($_PATH_OUT_TYPE -eq $true) {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    } else {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -to $_PATH_OUT -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    }
}
Invoke-Expression $_RUN;

## pict
$_FILENAME = "pict????.zpaq"
if ( (Test-Path -Path $_PATH_IN\$_FILENAME -PathType "Leaf") -eq $true ) {
    if ($_PATH_OUT_TYPE -eq $true) {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    } else {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -to $_PATH_OUT -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    }
}
Invoke-Expression $_RUN;

## user
$_FILENAME = "user????.zpaq"
if ( (Test-Path -Path $_PATH_IN\$_FILENAME -PathType "Leaf") -eq $true ) {
    if ($_PATH_OUT_TYPE -eq $true) {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    } else {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -to $_PATH_OUT -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    }
}
Invoke-Expression $_RUN;

## vide
$_FILENAME = "vide????.zpaq"
if ( (Test-Path -Path $_PATH_IN\$_FILENAME -PathType "Leaf") -eq $true ) {
    if ($_PATH_OUT_TYPE -eq $true) {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    } else {
        $_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME -to $_PATH_OUT -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
    }
}
Invoke-Expression $_RUN;

## test
Read-Host "Press ENTER to continue"

## \\192.168.10.3\Backup\_Pack\DaPaTest
if ($_PATH_OUT_TYPE -eq $true) {
    (Get-Item $_TMP_PROFILE_NAME).delete();
}



# SIG # Begin signature block
# MIIGiwYJKoZIhvcNAQcCoIIGfDCCBngCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUPjitKD8SCXnpNehmEY2D5ZmT
# wDWgggPPMIIDyzCCArOgAwIBAgIQViGHnYe7vJpGUgpAqX3B/zANBgkqhkiG9w0B
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFOyrv7dRcyp3
# pannHSDpN74lv8+cMA0GCSqGSIb3DQEBAQUABIIBAH2fT/dH/+XTlu8d6DQwH6e2
# CWk6jlEgxbmRfwJpF5W1K/8O2pjc9KXES8xjXk9Iqyx00VQXq5H6JkpkXR5rzqzx
# sAIbXP0w2pVIMQsKbU8WW0PNfYl17Z3rxtWfiIVTuv2RnQ5FzkSC62nKYmATUMc+
# lQWRR2InSDqQaAXvqM87rSxWTd8j+wcnkNs3DpMrdIDZtebesdfXxeSWMuXLWVBj
# vZYUqyVDaljk8+BbyOB5YJXYsQLOpLBsXI4n1ylHOaAqA+5PwSzu55Yxy9ItqSXp
# RbNbMTrjdy0+lBCR2eyhM7ChuiKyDqiJ4CMP0obDKlNoG2s97tIJoksAAJTY6ZE=
# SIG # End signature block
