FROM FROM arm32v7/alpine:latest

# Install nginx and ffmpeg
RUN apk add --update nginx ffmpeg && rm -rf /var/cache/apk/* && mkdir /tmp/stream
COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY ./startup.sh /
COPY ./create_ffmpeg_cmd.sh /
RUN ["chmod", "+x", "/startup.sh"]
RUN ["chmod", "+x", "/create_ffmpeg_cmd.sh"]

CMD ["/startup.sh"]
