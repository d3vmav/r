FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl shadow sudo

# Create a terminal user with password 'term69' and add to sudo group
RUN useradd -m terminal \
    && echo "terminal:term69" | chpasswd \
    && echo "terminal ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/terminal

# Download ttyd and make it executable
RUN curl -L -o /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 \
    && chmod +x /usr/local/bin/ttyd

# Expose port
EXPOSE 8080

# Run ttyd on startup
CMD ["/usr/local/bin/ttyd", "-p", "8080", "login"]
