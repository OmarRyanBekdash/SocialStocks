docker build -t socialstocksapp .
docker tag socialstocksapp mbaduk3/socialstocksapp
docker login
docker push mbaduk3/socialstocksapp
