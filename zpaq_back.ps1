<#
.SYNOPSIS
    Create backup by zpaq
.DESCRIPTION
    Extracted created archive by zpaq
.EXAMPLE
    .\zpaq_extr.ps1
.NOTES
    Author:  Ladislav Grulich (LaGr77)
    Create:  18.01.2023
    Edited:  19.01.2023
    Version: 0.0.2
#>


$_TEST_PATH_OUT = "\\NAS\Backup\$([Environment]::UserName)";
$_TEST_ZPAQ = "\\w2012dc\NETLOGON\zpaq715\zpaq64.exe";

# documents
$_TEST_FILE_OUT = "docu????.zpaq"; 
$_TEST_FILE_OUT_T = "docu0000.log";
$_TEST_PATH_IN = [Environment]::GetFolderPath("MyDocuments");
$_TEST_RUN = "$_TEST_ZPAQ add $_TEST_PATH_OUT\$_TEST_FILE_OUT $_TEST_PATH_IN -method 1";
Invoke-Expression $_TEST_RUN | Tee-Object $_TEST_PATH_OUT\$_TEST_FILE_OUT_T;

# Desktop
$_TEST_FILE_OUT = "desk????.zpaq"; 
$_TEST_FILE_OUT_T = "desk0000.log";
$_TEST_PATH_IN = [Environment]::GetFolderPath("Desktop");
$_TEST_RUN = "$_TEST_ZPAQ add $_TEST_PATH_OUT\$_TEST_FILE_OUT $_TEST_PATH_IN -method 1";
Invoke-Expression $_TEST_RUN | Tee-Object $_TEST_PATH_OUT\$_TEST_FILE_OUT_T;

# MyVideos
$_TEST_FILE_OUT = "vide????.zpaq"; 
$_TEST_FILE_OUT_T = "vide0000.log";
$_TEST_PATH_IN = [Environment]::GetFolderPath("MyVideos");
$_TEST_RUN = "$_TEST_ZPAQ add $_TEST_PATH_OUT\$_TEST_FILE_OUT $_TEST_PATH_IN -method 1";
Invoke-Expression $_TEST_RUN | Tee-Object $_TEST_PATH_OUT\$_TEST_FILE_OUT_T;

# MyPictures
$_TEST_FILE_OUT = "pict????.zpaq"; 
$_TEST_FILE_OUT_T = "pict0000.log";
$_TEST_PATH_IN = [Environment]::GetFolderPath("MyPictures");
$_TEST_RUN = "$_TEST_ZPAQ add $_TEST_PATH_OUT\$_TEST_FILE_OUT $_TEST_PATH_IN -method 1";
Invoke-Expression $_TEST_RUN | Tee-Object $_TEST_PATH_OUT\$_TEST_FILE_OUT_T;
   
# SIG # Begin signature block
# MIIGiwYJKoZIhvcNAQcCoIIGfDCCBngCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUnAijluKPx+2ibaSzF66yvylu
# q/mgggPPMIIDyzCCArOgAwIBAgIQViGHnYe7vJpGUgpAqX3B/zANBgkqhkiG9w0B
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
# BAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFDd6JjNr76Nv
# uFchJ0BOesrwHSIAMA0GCSqGSIb3DQEBAQUABIIBAFgHa0JJaPRC8SNzzT2+W0rt
# rUygj+2qoHccOZ7h7j48/7TqR8Y4y61xX3dlXYYGhkNXsGO6r+/bIsnM6XeRVGm7
# 7VV8N1mQUGL5xeFcZMUniRl8qCzKRnw0qZXblgQOh6pH0TdMUNe1ENvTbDcecG3R
# tvnrdxzd02kQANVY2tOVtXl5nZ1g/fuHBU43Iy22R622GZ5GUNJVmrY+2VrNamCg
# PSEJFF0+LV5uqxQ0g+6kA5vubQRubP9DAX7ALArl7yGNHY0IC411ubZ4g1MDm12y
# +NOSQosyYBPJzeVsiOq60621ZpjW95njfofEgovRN4Uio4qVNxsM6fj/9Vqhz0o=
# SIG # End signature block