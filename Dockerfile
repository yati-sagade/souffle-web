FROM python:3.7

RUN apt-get update

# Install Souffle dependencies

RUN apt-get install -y autoconf automake bison build-essential clang doxygen flex g++ git libncurses5-dev libtool libsqlite3-dev make mcpp sqlite zlib1g-dev

# Clone and build souffle

RUN git clone https://github.com/souffle-lang/souffle.git; \
    cd souffle; \
    ./bootstrap; \
    ./configure; \
    make -j"$(grep -c ^processor /proc/cpuinfo)"; \
    make install

# Copy over souffle-web files

RUN mkdir souffle-web
WORKDIR souffle-web

COPY server.py .
COPY www www

ENTRYPOINT ["python3", "-u", "server.py"]