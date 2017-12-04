release: bundle exec rails db:migrate && bundle exec figaro heroku:set -e production
web: bundle exec puma -C config/puma.rb
