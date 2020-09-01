# Install gems
bundle check || bundle install

# Run puma server
bundle exec puma -C config/puma.rb
