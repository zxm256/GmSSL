# 启动进程并获取进程对象
$process = Start-Process -FilePath "bin/gmssl.exe" `
                         -ArgumentList "tlcp_server -port 4433 -cert tlcp_server_certs.pem -key signkey.pem -pass P@ssw0rd -ex_key enckey.pem -ex_pass P@ssw0rd" `
                         -NoNewWindow `
                         -RedirectStandardOutput "tlcp_server.log" `
                         -PassThru

# 立即返回，不等待进程完成
Write-Host "Process started with ID: $($process.Id)"
exit 0
