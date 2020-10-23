echo $1
curl --resolve cafe.example.com:443:$1 https://cafe.example.com:443/coffee --insecure
