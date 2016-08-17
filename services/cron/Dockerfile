FROM alpine

RUN apk add --no-cache docker

COPY reissue.sh /etc/periodic/daily/reissue
RUN chmod a+x /etc/periodic/daily/reissue

# Run the cron daemon with the following flags:
# -f: Foreground
# -d 8: Log to stderr, use default log level
CMD ["/usr/sbin/crond", "-f", "-d", "8"]
