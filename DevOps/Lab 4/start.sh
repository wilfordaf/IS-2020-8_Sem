docker build -t example:system --target system -f Dockerfile .
docker build -t example:build --target build --cache-from example:system -f Dockerfile .
docker build -t example:app --target app --cache-from example:build -f Dockerfile .
docker run --name example -p 8080:80 example:app