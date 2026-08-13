# Dev-only image for `docker compose up` — builds and serves the Jekyll site.
# Matches the Ruby version pinned by Gemfile.lock (BUNDLED WITH 4.0.6).
FROM ruby:4.0.6-trixie

# Native build deps for gems with C extensions (nokogiri, psych, etc.),
# git (jekyll-terser is sourced from a git repo in the Gemfile),
# imagemagick (jekyll-imagemagick shells out to `convert`),
# python3/pip (jekyll-jupyter-notebook shells out to `jupyter nbconvert`),
# node (jekyll-terser/jekyll-minifier need a JS runtime via ExecJS).
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    pkg-config \
    libyaml-dev \
    zlib1g-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    imagemagick \
    python3 \
    python3-pip \
    nodejs \
    npm \
  && pip install --break-system-packages --no-cache-dir jupyter nbconvert \
  && rm -rf /var/lib/apt/lists/*

RUN gem install bundler:4.0.6

WORKDIR /srv/jekyll

EXPOSE 4000 35730

# livereload-port is pinned to match the host port docker-compose.yml publishes
# (35730), since Jekyll embeds this port number in the client-side reload script.
CMD ["bash", "-c", "bundle install && bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload --livereload-port 35730 --force_polling"]
