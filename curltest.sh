# curl http://localhost:3000/supplies -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d @data.json
# curl http://localhost:3000/supplies/11 -H "Accept: application/json" -H "Content-Type: application/json" -X PATCH -d @data.json
# curl http://localhost:3000/supplies/11 -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE -d @data.json
curl -X GET -H "Content-Type: application/json" "http://localhost:3000/pins"
