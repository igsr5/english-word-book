# ==============================================================================
# env
# ==============================================================================
project_name='english-word-book'
alias docker-compose="docker-compose -p $project_name"
alias build="docker-compose build"
alias up="docker-compose up"
alias stop="docker-compose stop"
alias app="rm -f tmp/pids/server.pid && up app"
alias bundle="docker-compose run -e RAILS_ENV=development --rm web bundle"
alias rails="docker-compose run -e RAILS_ENV=development --rm web bundle exec rails"
alias rake="docker-compose run -e RAILS_ENV=development --rm web bundle exec rake"
alias seed_fu="rake db:seed_fu FIXTURE_PATH=db/seeds/development/"
alias rspec="docker-compose run -e RAILS_ENV=test --rm web bundle exec rspec"
alias rubocop="docker-compose run -e RAILS_ENV=development --rm web bundle exec rubocop -DESP"
alias rubocopa="docker-compose run -e RAILS_ENV=development --rm web bundle exec rubocop -a"
alias yarn="docker-compose run --rm app yarn"
alias npm="docker-compose run --rm app npm"
alias vue="docker-compose run --rm app vue"
