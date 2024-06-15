param (
    [string]$gmsslPath = "D:\\a\\GmSSL\\GmSSL\\build\\bin\\gmssl.exe",
    [string]$arguments = "--help"
   # [string]$arguments = "tlcp_server -port 4433 -cert D:/a/GmSSL/GmSSL/build/tlcp_server_certs.pem -key D:/a/GmSSL/GmSSL/build/signkey.pem -pass P@ssw0rd -ex_key D:/a/GmSSL/GmSSL/build/enckey.pem -ex_pass P@ssw0rd",
  #  [string]$logFile = "tlcp_server.log"
)

try {
    # 启动进程并获取进程对象
    $process = Start-Process -FilePath $gmsslPath `
                            -NoNewWindow `
                            -ArgumentList $arguments `
                            #-RedirectStandardOutput $logFile `
                            -PassThru

    Start-Sleep -Seconds 5
    exit 0  # 正常退出
} catch {
    Write-Host "PowerShell script failed: $_"
    exit 1  # 异常退出
}
