param (
    [string]$gmsslPath = "D:\a\GmSSL\GmSSL\build\bin\gmssl.exe",
    [string]$arguments = "tlcp_server -port 4433 -cert D:\a\GmSSL\GmSSL\build\tlcp_server_certs.pem -key D:\a\GmSSL\GmSSL\build\signkey.pem -pass P@ssw0rd -ex_key D:\a\GmSSL\GmSSL\build\enckey.pem -ex_pass P@ssw0rd",
    [string]$logFile = "tlcp_server.log"
)

# 输出调试信息
Write-Host "gmsslPath: $gmsslPath"
Write-Host "arguments: $arguments"
Write-Host "Current directory: $(Get-Location)"
Write-Host "Files in directory: $(Get-ChildItem)"

# 启动进程并获取进程对象
$process = Start-Process -FilePath "$gmsslPath" `
                         -ArgumentList $arguments `
                         -NoNewWindow `
                         -RedirectStandardOutput $logFile `
                         -PassThru#

Start-Sleep -Seconds 5  # 等待几秒钟以便服务器启动

# 结束脚本
exit 0
