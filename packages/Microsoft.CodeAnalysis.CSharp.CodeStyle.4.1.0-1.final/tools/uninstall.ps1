param($installPath, $toolsPath, $package, $project)

if($project.Object.SupportsPackageDependencyResolution)
{
    if($project.Object.SupportsPackageDependencyResolution())
    {
        # Do not uninstall analyzers via uninstall.ps1, instead let the project system handle it.
        return
    }
}

$analyzersPaths = Join-Path (Join-Path (Split-Path -Path $toolsPath -Parent) "analyzers") * -Resolve

foreach($analyzersPath in $analyzersPaths)
{
    # Uninstall the language agnostic analyzers.
    if (Test-Path $analyzersPath)
    {
        foreach ($analyzerFilePath in Get-ChildItem -Path "$analyzersPath\*.dll" -Exclude *.resources.dll)
        {
            if($project.Object.AnalyzerReferences)
            {
                $project.Object.AnalyzerReferences.Remove($analyzerFilePath.FullName)
            }
        }
    }
}

# $project.Type gives the language name like (C# or VB.NET)
$languageFolder = ""
if($project.Type -eq "C#")
{
    $languageFolder = "cs"
}
if($project.Type -eq "VB.NET")
{
    $languageFolder = "vb"
}
if($languageFolder -eq "")
{
    return
}

foreach($analyzersPath in $analyzersPaths)
{
    # Uninstall language specific analyzers.
    $languageAnalyzersPath = join-path $analyzersPath $languageFolder
    if (Test-Path $languageAnalyzersPath)
    {
        foreach ($analyzerFilePath in Get-ChildItem -Path "$languageAnalyzersPath\*.dll" -Exclude *.resources.dll)
        {
            if($project.Object.AnalyzerReferences)
            {
                try
                {
                    $project.Object.AnalyzerReferences.Remove($analyzerFilePath.FullName)
                }
                catch
                {

                }
            }
        }
    }
}
# SIG # Begin signature block
# MIIkjgYJKoZIhvcNAQcCoIIkfzCCJHsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBxLz6gpVxEewSL
# pfqhFUutWVQB7Siiaihr8zyg9M+SIqCCDfAwggZuMIIEVqADAgECAhMzAAACE4wM
# HDE1vNJfAAAAAAITMA0GCSqGSIb3DQEBDAUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjEwMjExMjAwOTUxWhcNMjIwMjEwMjAwOTUxWjBjMQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMQ0wCwYDVQQDEwQuTkVU
# MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAm1lwQt2sYeUcIXqfPhsf
# y9aXkzcZ9ch/sljs6i9HCDB5Om0lAZvLRgdn6IKtYgTt9Nz9z14Yoab4Sy5Yedqc
# Cb1GjsxKN0+xgFFqJ/Vjp3KEFxtvjiC5Q0qWmWrsvWTeV1cUXPIC367xTMIvlAXC
# JuDadaJCYKSglaGIDpHEQ+ARn+yzYgKmmAsebWjq/LU/hyLpoyROPazW5y3+gV+V
# jATQOwrU6sUftC+gipYIC5dReNk4qcWhGJrbb5yLajGz8tWSCpwzALfkoe9QHMJb
# cswT91IFYI5NXuCJ4b6BS3EGA+nOiZqTi2G2tAsxEBaXsA60jtC+xdoUTJCkCUNX
# PXZJrz0ok4sE+SwFEPDjChFkuUedSu3EVGkxmyv71x/bN9k8biJraINIEV9e7YF5
# euJ+RPhz9RXkjLeoQcLOHWMuY3vTWNQ6EXVA3UsQ+f5MK2HZvbf3/fj4HKZwgBwM
# /URaTwmh2xQN50qEr6UB580vSbNSshBzoPFvlyqZrL9BAgMBAAGjggF+MIIBejAf
# BgNVHSUEGDAWBgorBgEEAYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQU701pILfc
# jCxDQ4qlYedyWy17rTkwUAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29m
# dCBPcGVyYXRpb25zIFB1ZXJ0byBSaWNvMRYwFAYDVQQFEw00NjQyMjMrNDY0Mjkz
# MB8GA1UdIwQYMBaAFEhuZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBH
# oEWGQ2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNp
# Z1BDQTIwMTFfMjAxMS0wNy0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUF
# BzAChkVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0Nv
# ZFNpZ1BDQTIwMTFfMjAxMS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG
# 9w0BAQwFAAOCAgEAWIP5xHQrp68xR5SsEwCkuWNXrkYMNPOUPiOqvoy7U1N5m/kv
# 0gmVHoMsAQpomcFrt9ln8wT8VlqyZzjT5aKOEOa2H845zsil8ndFrVq4ogCDrzua
# j95aI+zScLjagJ1yHL1DkBLsrT4xSTtH+n14JM81gWNIwi2Iv5gVgLFpleoeLPB1
# dy8IisRKrgNfA35l1R4YEQ70XZKQxULrX/LbHBLBFaZ87+Xhi60pP51IqOV6ViLM
# UBBomsbM7lpznpL4r80yd08vs53eiGrEy7uCwVTKfFiX57IH1P0j0etRagePpx7i
# fM7EcL7INEPoyLYBpP4hsw5wa9Z4kLmJfe3Okyp3PQE4yXqNt9/634EtLtW1TokA
# UIx+TmH7Cog9aOife2lO4W0KQw5LMiiyjdTqR1fR+CuBec0omykFeR8ob2Uw8484
# rDO5rWqOCG+DM8x+2PXJmoWWMmZyMHGz8coDwnyy3UwpyCIEYNfnORywdga4CQhv
# Z9dC5hbLQbvwnPNK/W7QsAWPz9C3H0ebbB9zbT7DD4xgRD227UW4lkrY7v6nuJXO
# LBm+j5dXO4hTuxWNyYkfkaf+21+QtDfSO8z1DJX+VjC6uDgafkuL8hlI3npYYg+K
# VGRdRW6ulpVZ5gKN5QnMxjafa1UwWXqmCcaZoDZrS6IbfPQakw91tLVH+gQwggd6
# MIIFYqADAgECAgphDpDSAAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQg
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDla
# Fw0yNjA3MDgyMTA5MDlaMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEw
# ggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS6
# 8rZYIZ9CGypr6VpQqrgGOBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15
# ZId+lGAkbK+eSZzpaF7S35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+er
# CFDPs0S3XdjELgN1q2jzy23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVc
# eaVJKecNvqATd76UPe/74ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGM
# XeiJT4Qa8qEvWeSQOy2uM1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/
# U7qcD60ZI4TL9LoDho33X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwj
# p6lm7GEfauEoSZ1fiOIlXdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwC
# gl/bwBWzvRvUVUvnOaEP6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1J
# MKerjt/sW5+v/N2wZuLBl4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3co
# KPHtbcMojyyPQDdPweGFRInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfe
# nk70lrC8RqBsmNLg1oiMCwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAw
# HQYDVR0OBBYEFEhuZOVQBdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoA
# UwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQY
# MBaAFHItOgIxkEO5FAVO4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6
# Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1
# dDIwMTFfMjAxMV8wM18yMi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAC
# hkJodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1
# dDIwMTFfMjAxMV8wM18yMi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4D
# MIGDMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L2RvY3MvcHJpbWFyeWNwcy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBs
# AF8AcABvAGwAaQBjAHkAXwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcN
# AQELBQADggIBAGfyhqWY4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjD
# ctFtg/6+P+gKyju/R6mj82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw
# /WvjPgcuKZvmPRul1LUdd5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkF
# DJvtaPpoLpWgKj8qa1hJYx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3z
# Dq+ZKJeYTQ49C/IIidYfwzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEn
# Gn+x9Cf43iw6IGmYslmJaG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1F
# p3blQCplo8NdUmKGwx1jNpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0Qax
# dR8UvmFhtfDcxhsEvt9Bxw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AAp
# xbGbpT9Fdx41xtKiop96eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//W
# syNodeav+vyL6wuA6mk7r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqx
# P/uozKRdwaGIm1dxVk5IRcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIV9DCC
# FfACAQEwgZUwfjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEo
# MCYGA1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAhOM
# DBwxNbzSXwAAAAACEzANBglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYK
# KwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG
# 9w0BCQQxIgQgkfuVdUMRKiWO0b+xr2+VkHCt8RDulc+zudoXdlc6K3UwQgYKKwYB
# BAGCNwIBDDE0MDKgFIASAE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbTANBgkqhkiG9w0BAQEFAASCAYCLHfzU7ltFEIs8GK4RQcaj
# ro3NivrqmVY7gxaYJniARsXl5wmZfHyJREMvPWldjsxpw4kBONkCJQkK+gA0K53s
# r7PYMqCL0X3Zl+KiFzu18nubQpFVD4nUu/GXpNiVgyxdIdT9JVyixAjX+0gO1F77
# crGV+awe7bWdq5+qU3/peRWJglphkX6iUf9RBIdD9AS30uXQ7Qh/8W0vCQlSDDWw
# BegS1vdqSAMTUAYW8vvNYrtJ8EUYyL9UNJnWL3ygbOi5PlNeQvIJY0e3Zn4//IEJ
# 4xpaoPTURhXpevpaoXrZaW1zCx8gceOIsCAPOIRlp2OFFISzMlZelZGH6e68wFxJ
# f5gzGPsz9lgZlOhIM/HsYJGn+NCcfs04WlFhClwQzui83REUUgV1jPszJ4gQ4m5X
# PyfOO7XXuFCzgVNpGjCvnFJwJAyZ6jJ3wGzpMWcXrUfSXNZvktZYXzN4ygqCfAWj
# +T62ncjfxBq7prVxnVbUBHNp2ZybPC19VXp/sKMFKpChghL+MIIS+gYKKwYBBAGC
# NwMDATGCEuowghLmBgkqhkiG9w0BBwKgghLXMIIS0wIBAzEPMA0GCWCGSAFlAwQC
# AQUAMIIBWQYLKoZIhvcNAQkQAQSgggFIBIIBRDCCAUACAQEGCisGAQQBhFkKAwEw
# MTANBglghkgBZQMEAgEFAAQgrYxCWo+xixUIum6KOp/Puzgcjc+SVXrnOkVUqHsu
# 1PoCBmGDDAdSphgTMjAyMTExMTYyMDQ1MDguODMxWjAEgAIB9KCB2KSB1TCB0jEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWlj
# cm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFs
# ZXMgVFNTIEVTTjpEMDgyLTRCRkQtRUVCQTElMCMGA1UEAxMcTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgU2VydmljZaCCDk0wggT5MIID4aADAgECAhMzAAABQa9/Updc8txF
# AAAAAAFBMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
# YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAy
# MDEwMB4XDTIwMTAxNTE3MjgyN1oXDTIyMDExMjE3MjgyN1owgdIxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJ
# cmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBF
# U046RDA4Mi00QkZELUVFQkExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
# IFNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDyKsuovbx1
# qX48lSZQk7C9if+w4ITNDNnKP3hdsU+1GEOE+NqC+8o6/UaAyg65e+Skze4zkTru
# /I4I/GqFMDOrsCTfOQRdcG/smgzxebTHlRycCSlSISjR7JxGXpudggHcqVlbe7Pg
# lza/YVXQoIaQuu+p8o/xX+LaFXI3zng56NanHzAZRrMzgJhRWjByAQNzvo5j5drh
# bbsMJkmbZ/2iXgGNIv5vYv9Pyf8sQaSdpTHBJBM3UtAK364EMIBJ3pVBHkIsslW3
# owEvRbU2VpbEQAnCUh3IGdLWKEu9GDWNz8pRl7SxEV0Pd+EquM9pzeGjLTTsW+vo
# ajRYnimvasl1AgMBAAGjggEbMIIBFzAdBgNVHQ4EFgQULSg/LG4ukP1FcGv1zw07
# QQUSxsQwHwYDVR0jBBgwFoAU1WM6XIoxkPNDe3xGG8UzaFqFbVUwVgYDVR0fBE8w
# TTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVj
# dHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3JsMFoGCCsGAQUFBwEBBE4wTDBK
# BggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9N
# aWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcnQwDAYDVR0TAQH/BAIwADATBgNVHSUE
# DDAKBggrBgEFBQcDCDANBgkqhkiG9w0BAQsFAAOCAQEAUnrfIn3YKGoKCl7EPjyi
# S+Ia4LiKQ2y+bCUJJ63WwWm8kTMskHxxMXjPipBPPwCxC1x7DqYBWZAJgO71/l57
# XXFePUvAdixkadKz859G6XVUqZjnU5Cmq8rk78K3h+zQhuXOjx7I4snKBOT3tpdU
# DhTOrwZuUvstDleLABjjjow4Auc1cWj8qr22/OKnBjVhxGf+eUxD5v3Y6IsuYdUy
# LbABQ5GIoW9oB9haOFB37aocsyx2k2W7AFtZ7sUXkAGwOjQdE4xbIKDF0tDe+qvc
# MxIfdlYqKKsWy9YmZyF9k8ZE5vCqzO9Jc8WY8Fn2j56v7hSgtX7nQZaedCTLsdWA
# uTCCBnEwggRZoAMCAQICCmEJgSoAAAAAAAIwDQYJKoZIhvcNAQELBQAwgYgxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jv
# c29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTEwMDcwMTIx
# MzY1NVoXDTI1MDcwMTIxNDY1NVowfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldh
# c2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIw
# MTAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCpHQ28dxGKOiDs/BOX
# 9fp/aZRrdFQQ1aUKAIKF++18aEssX8XD5WHCdrc+Zitb8BVTJwQxH0EbGpUdzgkT
# jnxhMFmxMEQP8WCIhFRDDNdNuDgIs0Ldk6zWczBXJoKjRQ3Q6vVHgc2/JGAyWGBG
# 8lhHhjKEHnRhZ5FfgVSxz5NMksHEpl3RYRNuKMYa+YaAu99h/EbBJx0kZxJyGiGK
# r0tkiVBisV39dx898Fd1rL2KQk1AUdEPnAY+Z3/1ZsADlkR+79BL/W7lmsqxqPJ6
# Kgox8NpOBpG2iAg16HgcsOmZzTznL0S6p/TcZL2kAcEgCZN4zfy8wMlEXV4WnAEF
# TyJNAgMBAAGjggHmMIIB4jAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU1WM6
# XIoxkPNDe3xGG8UzaFqFbVUwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYD
# VR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxi
# aNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3Nv
# ZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMu
# Y3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNy
# b3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQw
# gaAGA1UdIAEB/wSBlTCBkjCBjwYJKwYBBAGCNy4DMIGBMD0GCCsGAQUFBwIBFjFo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vUEtJL2RvY3MvQ1BTL2RlZmF1bHQuaHRt
# MEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAFAAbwBsAGkAYwB5AF8AUwB0
# AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQAH5ohRDeLG4Jg/
# gXEDPZ2joSFvs+umzPUxvs8F4qn++ldtGTCzwsVmyWrf9efweL3HqJ4l4/m87WtU
# VwgrUYJEEvu5U4zM9GASinbMQEBBm9xcF/9c+V4XNZgkVkt070IQyK+/f8Z/8jd9
# Wj8c8pl5SpFSAK84Dxf1L3mBZdmptWvkx872ynoAb0swRCQiPM/tA6WWj1kpvLb9
# BOFwnzJKJ/1Vry/+tuWOM7tiX5rbV0Dp8c6ZZpCM/2pif93FSguRJuI57BlKcWOd
# eyFtw5yjojz6f32WapB4pm3S4Zz5Hfw42JT0xqUKloakvZ4argRCg7i1gJsiOCC1
# JeVk7Pf0v35jWSUPei45V3aicaoGig+JFrphpxHLmtgOR5qAxdDNp9DvfYPw4Ttx
# Cd9ddJgiCGHasFAeb73x4QDf5zEHpJM692VHeOj4qEir995yfmFrb3epgcunCaw5
# u+zGy9iCtHLNHfS4hQEegPsbiSpUObJb2sgNVZl6h3M7COaYLeqN4DMuEin1wC9U
# JyH3yKxO2ii4sanblrKnQqLJzxlBTeCG+SqaoxFmMNO7dDJL32N79ZmKLxvHIa9Z
# ta7cRDyXUHHXodLFVeNp3lfB0d4wwP3M5k37Db9dT+mdHhk4L7zPWAUu7w2gUDXa
# 7wknHNWzfjUeCLraNtvTX4/edIhJEqGCAtcwggJAAgEBMIIBAKGB2KSB1TCB0jEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWlj
# cm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFs
# ZXMgVFNTIEVTTjpEMDgyLTRCRkQtRUVCQTElMCMGA1UEAxMcTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgU2VydmljZaIjCgEBMAcGBSsOAwIaAxUAquW/KbUKq4ihByvOdwu+
# QPValQOggYMwgYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkq
# hkiG9w0BAQUFAAIFAOU+BDYwIhgPMjAyMTExMTYxODE5MzRaGA8yMDIxMTExNzE4
# MTkzNFowdzA9BgorBgEEAYRZCgQBMS8wLTAKAgUA5T4ENgIBADAKAgEAAgIcLgIB
# /zAHAgEAAgIRSTAKAgUA5T9VtgIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEE
# AYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBBQUAA4GB
# AFJY6kpQxk3S6md1OZVtHUkkc6R3PEJ0/uJ8uc54Gt0U4o70aqu12HZuc0HMHoJx
# r8ZZf2kF3Ko8nZ1kKeDelkfkMPenDr46Cej5Cbal9X4cIQPyw/MpyDs/MzJ6m+2Q
# qVjKimLrvTYpAj24vAVXwF1FPmEYP1fpBdSrhqtfxh1OMYIDDTCCAwkCAQEwgZMw
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAFBr39Sl1zy3EUAAAAA
# AUEwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRAB
# BDAvBgkqhkiG9w0BCQQxIgQgrSR0Q8hgHo/A+fQbHbS7K9wiU6oKw9W2cntkzhnR
# 0fkwgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCBRPwE8jOpzdJ5wdE8soG1b
# S846dP7vyFpaj5dzFV6t3jCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAABQa9/Updc8txFAAAAAAFBMCIEIAcdCyyIcrUOjnREUk3FLr+f
# /BqO+PYrb8MTQXyfarD+MA0GCSqGSIb3DQEBCwUABIIBAA2iM/23CFE/QBlw3NJb
# Vo+l1eNWu/kgnr7CpvQOzCJ3vs14QcjUfCgh2SHlSeuvQGTOh5AHejQ7spFOtnQ/
# QntmpIaTJg/HDg4t6FqN7roj2+FWP1oD+sYlnsirEHpw9P0+AAxZmekrj0w8TiB4
# XcAhgTA4lINqXF9JkE0VyytZNr71mHlkYy+2pdpX/s0jubKJBc4YOaIUOvasV3qa
# tcPSynhFJ8yj+HC8HCxxTKfc7gzpBlYXEIqkb3d0lqYR/bPYXykPj1+GETprNitX
# 1jQ8ATL6rWnBQOMvUpnXQJy8tWhH0c5EgTAjKTFinbq73IR5ptOTJAhINhJ84DUz
# /DM=
# SIG # End signature block
