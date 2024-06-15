param (
    [string]$gmsslPath = "D:\a\GmSSL\GmSSL\build\bin\gmssl.exe",
    [string]$arguments = "-help"
)

# 输出调试信息
#Write-Host "gmsslPath: $gmsslPath"
#Write-Host "arguments: $arguments"
#Write-Host "Current directory: $(Get-Location)"
#Write-Host "Files in directory: $(Get-ChildItem)"

# 启动进程并获取进程对象
$process = Start-Process -FilePath "$gmsslPath" `
                         -ArgumentList $arguments `
                         -NoNewWindow `
                         #-RedirectStandardOutput $logFile `
                         -PassThru#

Start-Sleep -Seconds 5  # 等待几秒钟以便服务器启动

# 结束脚本
exit 0
