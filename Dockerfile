FROM python:3.11-slim-bookworm

# Install ffmpeg, git, and nodejs
RUN apt-get update && apt-get install -y ffmpeg git nodejs npm

# Copy the application
COPY . /app
WORKDIR /app

# Install Python requirements
RUN pip3 install -U pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Run a dummy web server in the background on Render's port, then start the bot
CMD /bin/bash -c "python3 -m http.server ${PORT:-10000} & bash StartMusic"
