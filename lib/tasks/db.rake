namespace :db do

  desc 'drop, create and migrate a database'
  task :renew => [:environment, 'db:drop', 'db:create', 'db:migrate']

end