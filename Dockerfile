FROM python:3.11-slim-buster

# Install ffmpeg and git
RUN apt-get update && apt-get install -y ffmpeg git nodejs npm

# Copy the application
COPY . /app
WORKDIR /app

# Install Python requirements
RUN pip3 install -U pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Start the bot
CMD ["bash", "StartMusic"]

