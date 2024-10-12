<#
.SYNOPSIS
    Create incremental backup by zpaq
.DESCRIPTION
    Create incremental backup by zpaq
.EXAMPLE
    .\zpaq_extr.ps1
.NOTES
    Author:  Ladislav Grulich (LaGr77)
    Create:  18.01.2023
    Edited:  12.10.2024
    Version: 0.1.1
#>
 
## \\192.168.10.3\Backup\ladislav.grulich\NB5012328\
$_PATH_OUT = "\\NAS\Backup\$([Environment]::UserName)\$env:COMPUTERNAME";
$_ZPAQ = "\\w2016dc\NETLOGON\zpaq715\zpaq64.exe";
## psw
$_PSW_TMP = Get-Content "\\w2016dc\NETLOGON\SKRIPTY\PasswordEncryptedFiles.txt" | ConvertTo-SecureString -Key (Get-Content ("\\w2016dc\NETLOGON\SKRIPTY\aes.key"));

# documents
$_FILE_OUT = "docu????.zpaq"; 
$_FILE_OUT_T = "docu0000.log";
$_PATH_IN = [Environment]::GetFolderPath("MyDocuments");
$_RUN = "$_ZPAQ add $_PATH_OUT\$_FILE_OUT $_PATH_IN -method 1 -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
Invoke-Expression $_RUN | Tee-Object $_PATH_OUT\$_FILE_OUT_T;

# Desktop
$_FILE_OUT = "desk????.zpaq"; 
$_FILE_OUT_T = "desk0000.log";
$_PATH_IN = [Environment]::GetFolderPath("Desktop");
$_RUN = "$_ZPAQ add $_PATH_OUT\$_FILE_OUT $_PATH_IN -method 1 -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
Invoke-Expression $_RUN | Tee-Object $_PATH_OUT\$_FILE_OUT_T;

# MyVideos
$_FILE_OUT = "vide????.zpaq"; 
$_FILE_OUT_T = "vide0000.log";
$_PATH_IN = [Environment]::GetFolderPath("MyVideos");
$_RUN = "$_ZPAQ add $_PATH_OUT\$_FILE_OUT $_PATH_IN -method 1 -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
Invoke-Expression $_RUN | Tee-Object $_PATH_OUT\$_FILE_OUT_T;

# MyPictures
$_FILE_OUT = "pict????.zpaq"; 
$_FILE_OUT_T = "pict0000.log";
$_PATH_IN = [Environment]::GetFolderPath("MyPictures");
$_RUN = "$_ZPAQ add $_PATH_OUT\$_FILE_OUT $_PATH_IN -method 1 -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
Invoke-Expression $_RUN | Tee-Object $_PATH_OUT\$_FILE_OUT_T;

# User
$_FILE_OUT = "user????.zpaq"; 
$_FILE_OUT_T = "user.log";
$_PATH_IN = "$env:USERPROFILE\*.doc $env:USERPROFILE\*docx $env:USERPROFILE\*.pdf $env:USERPROFILE\*.txt $env:USERPROFILE\*.xls $env:USERPROFILE\*.xlsx $env:USERPROFILE\*.xlm"
$_RUN = "$_ZPAQ add $_PATH_OUT\$_FILE_OUT $_PATH_IN -method 1 -key $([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_PSW_TMP)))";
Invoke-Expression $_RUN | Tee-Object $_PATH_OUT\$_FILE_OUT_T;

# SIG # Begin signature block
# MIIGiwYJKoZIhvcNAQcCoIIGfDCCBngCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU31z1NikEsWggP0qy+opzO6Ax
# BA6gggPPMIIDyzCCArOgAwIBAgIQViGHnYe7vJpGUgpAqX3B/zANBgkqhkiG9w0B
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFFUvh0EBfHQn
# CiUXuirVStzJWHnlMA0GCSqGSIb3DQEBAQUABIIBABujCAnTLXeRgQWtFyfN84AY
# MLJ8ulV62osERZJfJWWTdtssSmd+Pv0OqV7H7flNKcJuHiWGseq19+jugaFAIg/3
# wJvkkflgl/TDzsZZYh04T9HITwUXVEqOzFDj/CBAglnR35TCLLYB3kILPUrqOud0
# EqinWJV5zvErfqkE9e7PLmmk+irrsh9L6vM6OULvUlK0Q4o96TN9T3cKlGEvpixY
# c4iexu6oRqSlipUcipbS3N5eP2bL6CruR7+nxhG9n0sAbKNzrLt8Ki0thY80M7af
# qiUrNx/qJMIlLw2CTzkS41vfJe1pwvKCQuIrgACOXZIrEzMI/+1uOmNJV6Hjks8=
# SIG # End signature block
