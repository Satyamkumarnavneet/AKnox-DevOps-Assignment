FROM ubuntu:latest

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd

COPY . .

RUN chmod +x wisecow.sh

EXPOSE 4499

# Run the wisecow.sh script
CMD ["./wisecow.sh"]
