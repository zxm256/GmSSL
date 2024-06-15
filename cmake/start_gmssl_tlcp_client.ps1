param (
    [string]$gmsslPath = "bin/gmssl.exe",
    [string]$arguments = "tlcp_server -port 4433 -cert tlcp_server_certs.pem -key signkey.pem -pass P@ssw0rd -ex_key enckey.pem -ex_pass P@ssw0rd",
    [string]$logFile = "tlcp_server.log"
)

# 启动进程并获取进程对象
$process = Start-Process -FilePath $gmsslPath `
                         -ArgumentList $arguments `
                         -NoNewWindow `
                         -RedirectStandardOutput $logFile `
                         -PassThru

Start-Sleep -Seconds 5  # 等待几秒钟以便服务器启动

if ($process.HasExited) {
    Write-Host "Process failed to start."
    exit 1
} else {
    Write-Host "Process started with ID: $($process.Id)"
    exit 0
}
