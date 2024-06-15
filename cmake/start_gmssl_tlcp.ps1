$process = Start-Process -FilePath "bin/gmssl.exe" `
                         -ArgumentList "tlcp_server -port 4433 -cert tlcp_server_certs.pem -key signkey.pem -pass P@ssw0rd -ex_key enckey.pem -ex_pass P@ssw0rd" `
                         -NoNewWindow `
                         -RedirectStandardOutput "tlcp_server.log" `
                         -PassThru

# 等待进程完成或超时
$timeout = 3 # 设置超时时间，单位为秒
$waitResult = $process.WaitForExit($timeout * 1000)  # 将超时时间转换为毫秒

if (-not $waitResult) {
    Write-Host "Process completed successfully."
    exit 0  # 返回零值，表示成功
} else {
    Write-Host "Process did not complete within $timeout seconds. Terminating."
    $process.Kill()  # 如果超时，终止进程
    $process.WaitForExit()  # 等待进程完全退出
    Write-Host "Process terminated due to timeout."
    exit 1  # 返回一个非零值，表示超时错误
}
