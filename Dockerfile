FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl

# Download ttyd and make it executable
RUN curl -L -o /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

# Expose port
EXPOSE 8080

# Run ttyd on startup
CMD ["/usr/local/bin/ttyd", "-p", "8080", "bash"]
