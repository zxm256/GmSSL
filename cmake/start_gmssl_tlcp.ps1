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
                         -PassThru
# 等待进程完成或超时
$timeout = 3  # 设置超时时间，单位为秒
$waitResult = $process.WaitForExit($timeout * 1000)  # 将超时时间转换为毫秒

if (!$waitResult) {
    Write-Host "Process did not complete within $timeout seconds. Terminating."
    exit 0  # 返回一个非零值，表示超时错误
} else {
    Write-Host "Process completed successfully."
    exit 1  # 返回零值，表示成功
}
