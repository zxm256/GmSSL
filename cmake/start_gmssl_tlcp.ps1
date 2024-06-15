Start-Process -FilePath "bin/gmssl.exe" `
              -ArgumentList "tlcp_server -port 4433 -cert tlcp_server_certs.pem -key signkey.pem -pass P@ssw0rd -ex_key enckey.pem -ex_pass P@ssw0rd" `
              -NoNewWindow `
              -RedirectStandardOutput "tlcp_server.log"
