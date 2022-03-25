<#
.SYNOPSIS
    Extracted created archive by zpaq
.DESCRIPTION
    Extracted created archive by zpaq
.EXAMPLE
    .\zpaq_extr.ps1
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
} while( ($_FILENAME -match "[^a-zA-Z0-9]") -$false )

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

$_RUN = "$_ZPAQ extract $_PATH_IN\$_FILENAME.zpaq -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto($_BSTR_1))";
Invoke-Expression $_RUN | Tee-Object "$_PATH_IN\$_FILENAME.log" -Append;

# SIG # Begin signature block
# MIIGiwYJKoZIhvcNAQcCoIIGfDCCBngCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUVtLaW1B60Dhc6a5RWbN7q+hN
# KJegggPPMIIDyzCCArOgAwIBAgIQViGHnYe7vJpGUgpAqX3B/zANBgkqhkiG9w0B
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFGY5kgZw4DG3
# T+NpkKQ+L+Do98/AMA0GCSqGSIb3DQEBAQUABIIBAGuI8RuTiovwhJert1xV0d0d
# ifx830EfcLjnrgV3qDa2L64NSebTcoFoY5Z9ZvZQOgsYy6e9u4AHE1mgqIczEkqe
# AqyE1AYH89eYHHQGIrGIrD7KlAe6GgNk1cEELimqW8hAFbFJjNQGSubRGCWtbZIt
# PhTJDFfsdUiGZo+tpbtgCkHzHkymNKNHD2ev0qO7Ck1HdOm/2WcMPU+tUsx+M5Jv
# j6MhrOAzvfJMqtnSqYyHEczhfqOOwbNnQ1xA55wezAarXg0qG/9agtlvbHI7VxwL
# GRr3ElJuC6uN6B/vGhS4qqiBPWRpZy+G/Mc46LJzFLOy4K9l7KS7rQAVVVPf1c8=
# SIG # End signature block
