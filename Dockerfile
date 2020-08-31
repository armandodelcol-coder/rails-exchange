FROM ruby:2.7.1

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

# Installl bundler
RUN gem install bundler

# Set enviroment INSTALL_PATH
ENV INSTALL_PATH /rails-exchange

# Create directory with INSTALL_PATH name
RUN mkdir -p $INSTALL_PATH

# Set WORKDIR (main directory) with a INSTALL_PATH
WORKDIR $INSTALL_PATH

# Copy Gemfile to current container folder.
COPY Gemfile ./

# Set enviroment BUNDLE_PATH
ENV BUNDLE_PATH /gems

# COPY all files in current folder to container.
COPY . .
