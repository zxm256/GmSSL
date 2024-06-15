Start-Process -FilePath "bin/gmssl.exe" `
              -ArgumentList "tlcp_client -host localhost -port 4433 -cacert rootcacert.pem" `
              -NoNewWindow `
              -RedirectStandardOutput "tlcp_client.log"
