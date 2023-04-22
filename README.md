# Start
docker-compose up -d
docker-compose logs -f display_plex_url

# Stop
docker-compose down

# Web url
http://<your_server_ip>:32400/web

<your_server_ip> = ipconfig IPv4 Address