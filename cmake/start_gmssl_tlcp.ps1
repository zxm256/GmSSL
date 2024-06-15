$process = Start-Process -FilePath "bin/gmssl.exe" `
                         -ArgumentList "tlcp_server -port 4433 -cert tlcp_server_certs.pem -key signkey.pem -pass P@ssw0rd -ex_key enckey.pem -ex_pass P@ssw0rd" `
                         -NoNewWindow `
                         -RedirectStandardOutput "tlcp_server.log" `
                         -PassThru

# 等待进程完成或超时
$timeout = 3 # 设置超时时间，单位为秒
$waitResult = $process.WaitForExit($timeout * 1000)  # 将超时时间转换为毫秒

exit 0
